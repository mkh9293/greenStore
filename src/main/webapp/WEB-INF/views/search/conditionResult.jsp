<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지 </title>
	<!-- bootstrap css import -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
	
	<!-- jQuery js import -->
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	
	<!-- DaumMap css import -->   
	<link rel="stylesheet" href="<c:url value="/resources/css/daumMap.css"/>" type="text/css">
	
	<!-- DaumMap js import  -->
	<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=76d0dfe96fd493ccedbee52792d36e32"></script>
	
	<style type="text/css">
		html, body{
			background-color:#f6f6f6;
			font-family : 'NanumBarunGothic';
		}
		.storeItem :hover{
			cursor:pointer;
		}
		.storeItem #storeImg{
			overflow: hidden;
		}
		.storeItem img{ 
			-webkit-transition: all .3s ease-out;
			-moz-transition: all .3s ease-out;
			-o-transition: all .3s ease-out;
			transition: all .3s ease-out;
		} 
		.storeItem img:hover {
			-moz-transform: scale(1.1);
			-webkit-transform: scale(1.1);
			-o-transform: scale(1.1);
			-ms-transform: scale(1.1);
			transform: scale(1.1);
		} 
	</style>
	
	<script type="text/javascript">
	
	var map;
	var overlay;
	
	var cate = ${cateJson};
	var area= "<c:out value="${area}"/>";
	
	$(document).ready(function(){
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markList = [];
		
		$.ajax({
			url:"http://localhost:8080/greenStore/json/searchConditionJson",
			dataType:"json",
			data:{"area": area, "cate": cate},
			success:function(data){
				$.each(data, function(key, value){
					markList.push(value);
				});
				
				var mapContainer = document.getElementById('map'), // 지도의 중심좌표
			    mapOption = { 
					center:new daum.maps.LatLng(markList[0].pointY, markList[0].pointX),
			        level: 9 // 지도의 확대 레벨
			    }; 
			
			    map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				map.setZoomable(true);
			    
			     // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
			    $.each(markList, function(index, value){
			    	
			    	// 마커를 생성합니다
			        var marker = new daum.maps.Marker({
			            position: new daum.maps.LatLng(value.pointY, value.pointX)
			        });

			        // 마커가 지도 위에 표시되도록 설정합니다
			        marker.setMap(map);
			        
			    	// 커스텀 오버레이에 표시할 컨텐츠 입니다
			    	var content = '<div class="wrap">' + 
			                '    <div class="info">' + 
			                '        <div class="title">' + value.sh_name + 
			                '            <div class="close" title="닫기"></div>' + 
			                '        </div>' + 
			                '        <div class="body">' + 
			                '            <div class="img">' +
			                '                <img src='+value.sh_photo+' width="73" height="70">' +
			                '           </div>' + 
			                '            <div class="desc">' + 
			                '                <div class="ellipsis">'+value.sh_addr+'</div>' + 
			                '                <div class="jibun ellipsis">'+value.sh_way+'</div>' + 
			                '            </div>' + 
			                '        </div>' + 
			                '    </div>' +    
			                '</div>';

			    	// 마커 위에 커스텀오버레이를 표시합니다
			    	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			        overlay = new daum.maps.CustomOverlay({
			        	content: content,
			        	map: map,
			        	position: marker.getPosition()       
			    	});

			    	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			    	daum.maps.event.addListener(marker, 'click', function() {
			        	overlay.setMap(map);
			    	});

			    	//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			    	$(".close").on("click",function(){
			    		 $(this).overlay.setMap(null);   
			    	});
			    });
			}
		});	
		//스토어 상세페이지로 이동
		$(".storeItem").click(function(){
			var detailId = $(this).attr("data-id");
			$(location).attr("href","http://localhost:8080/greenStore/store/detail?id="+detailId);
		});
	});
	</script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" style="background-color:#16a085;">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					
				</button>
				<a class="navbar-brand" href="#" style="color:#ffffff;">GreenStore</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse in" aria-expanded="true">
				<ul class="nav navbar-nav">
					<li><a href="#" style="color:#ffffff;">home</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" style="color:#ffffff;">right</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div style="height:50px;"></div>
	<c:if test="${storeListSize != 0 }">
		<div id="searchResultMap" style="height:400px; margin-bottom:1px;">
	       	 <div id="map" style="height:400px;"></div><hr/>
	    </div>
    </c:if>
	<div class="container" style="width:100%; height:150px; background-color:#ffffff; box-shadow: 0px 0px 1px 0px #ccc;">
			<h3 style="margin-top:3%;margin-left:7%;"><strong style="color:#6d3afb;">${area }</strong>에서 </h3>
			<h3 style="margin-top:1%;margin-left:10%;"><strong style="color:#6d3afb;">${cate }</strong>유형 검색 결과입니다.</h3>   	
	</div>
	<div class="container">
		
	    <!-- Store Row -->
         <div class="row">
           <c:if test="${storeListSize == 0 }">
	            <div style="display:table;width:100%;height:200px;">
		            
		            	<div style="display:table-cell;text-align:center; vertical-align: middle;">
		            		<h3>검색 결과가 없습니다.</h3>
		            	</div>
		        </div><hr/>
	       </c:if>
            
            <c:if test="${storeListSize != 0 }">
	            <div class="row">
		           <c:forEach items="${store }" var="storeList" varStatus="i">
                  	<div class="storeItem" data-id="${storeList.sh_id }" style="display:inline-block; margin:15px; background-color:#ffffff; box-shadow: 1px 1px 2px 2px #ccc;">
	    				<div id="storeImg">
	    					<img src="${storeList.sh_photo }" onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'" alt="storeImage" width="340px" height="200px"/>
	    				</div>
	    				<div style="margin-left:10px;">
	    					<h3 style="font-size:21px;">${storeList.sh_name }</h3>
	    					<p style="font-size:15px;">${storeList.sh_addr }</p>
	    					<p>${storeList.sh_rcmn }</p>
	    				</div>
	    			</div>
	    			</c:forEach><br/>
		    	</div>
	    	</c:if>
	    	<br/>
        </div>
     </div>	
</body>
</html>