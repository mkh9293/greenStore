<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- sidebar menu css -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"
	type="text/css">

<!-- common css import -->
<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>"
	type="text/css">

<!-- DaumMap css import -->
<link rel="stylesheet" href="<c:url value="/resources/daumMap.css"/>"
	type="text/css">

<!-- DaumMap js import  -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=76d0dfe96fd493ccedbee52792d36e32"></script>

<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=39f45150-43d1-386e-9557-cd82ccc3e59e
"></script>
<script type="text/javascript">
	var startX = "<c:out value="${startX}"/>"; var startY = "<c:out value="${startY}"/>";
	var endX = "<c:out value="${endX}"/>"; var endY = "<c:out value="${endY}"/>";
	var startName = "<c:out value="${startName}"/>"; var endName = "<c:out value="${endName}"/>";
	
	var startLoc;
	var endLoc;
	
	$(document).ready(function(){
		//pr_3857 인스탄스 생성.
		var pr_3857 = new Tmap.Projection("EPSG:3857");
		 
		//pr_4326 인스탄스 생성.
		var pr_4326 = new Tmap.Projection("EPSG:4326");
		 
		function get3857LonLat(coordX, coordY){
		    return new Tmap.LonLat(coordX, coordY).transform(pr_4326, pr_3857);
		}
		
		//초기화 함수
        function initTmap(){
        	startLoc = get3857LonLat(startX, startY);
        	endLoc = get3857LonLat(endX, endY);
        	
        	centerLL = new Tmap.LonLat(startLoc.lon, startLoc.lat);
            map = new Tmap.Map({div:'map_div',
                                width:'100%', 
                                height:'400px',
                                transitionEffect:"resize",
                                animation:true
                            });
            map.setCenter(centerLL, 13);
            
            searchRoute();
        };
        
        //경로 정보 로드
        function searchRoute(){
            var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true});
            
            var startX = startLoc.lon;
            var startY = startLoc.lat;
            var endX = endLoc.lon;
            var endY = endLoc.lat;
            
            var urlStr = "https://apis.skplanetx.com/tmap/routes/pedestrian?version=1&format=xml";
                urlStr += "&startX="+startX;
                urlStr += "&startY="+startY;
                urlStr += "&endX="+endX;
                urlStr += "&endY="+endY;
                urlStr += "&startName="+encodeURIComponent(startName);
                urlStr += "&endName="+encodeURIComponent(endName);
                urlStr += "&appKey=39f45150-43d1-386e-9557-cd82ccc3e59e";
                     
            var prtcl = new Tmap.Protocol.HTTP({
                                                url: urlStr,
                                                format:routeFormat
                                                });
            var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
            routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
            map.addLayer(routeLayer);
        }
        //경로 그리기 후 해당영역으로 줌
        function onDrawnFeatures(e){
            map.zoomToExtent(this.getDataExtent());
        }
        
        initTmap();
	});
</script>
<img alt="detailImage" src="${playInfo.firstimage }"
	onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
	style="width: 100%; height: 250px;" />
<br />
<div class="container">
	<h3 style="font-size: 30px; font-weight: 600; margin-top: 10;">${playInfo.title }</h3>
	<!-- <img alt="storeDetailImg" src="${store.sh_photo }" style="width:400px;height:500px"/>  -->
	<hr />
	<div class="intro">
		<table>
			<tr>
				<th style="width: 100px;"><span
					class="glyphicon glyphicon-circle-arrow-right"></span> <label>주소:
				</label></th>
				<td><span style="text-decoration: underline;">${addr }</span></td>
			</tr>
			<tr>
				<th style="width: 100px;"><span
					class="glyphicon glyphicon-circle-arrow-right"></span> <label>전화번호:</label>
				</th>
				<td><span>${playInfo.tel }</span></td>

			</tr>
		</table>
	</div>
	<hr />

	<%-- <div class="daumBlog">
				<h4>블로그</h4>
				<c:forEach items="${daumBlogList }" var="daumBlog" varStatus="i">
					<c:if test="${i.index < 3 }">
						<div class="daumBlogItem">
							<a href="${daumBlog.link }" target="_blank">${daumBlog.title }</a>
							<p>${daumBlog.description }</p>
							<p>${daumBlog.author }</p>
						</div>
						<hr />
					</c:if>
				</c:forEach>
			</div> --%>

</div>

<div class="container" style="width: 100%; height: 140px;">
	<div class="col-md-8">
		<span style="margin-top: 1%; font-size: 22px; font-weight: 600;">경로안내</span>
		<h3 style="margin-top: 2%;font-size: 35px; text-align: center;">
			<strong style="color: #1abc9c;">${startName} → ${endName}</strong>
		</h3>
	</div>
</div>
<hr style="margin: 2;" />

<div id="map_div"></div>
<hr />

