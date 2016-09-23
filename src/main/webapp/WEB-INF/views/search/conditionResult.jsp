<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
	
	<!-- Condition css import -->   
	<link rel="stylesheet" href="<c:url value="/resources/css/condition.css"/>" type="text/css">
	
	<!-- Common css import -->   
	<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>" type="text/css">
	
	<!-- DaumMap css import -->   
	<link rel="stylesheet" href="<c:url value="/resources/css/daumMap.css"/>" type="text/css">
	
	<!-- DaumMap js import  -->
	<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=76d0dfe96fd493ccedbee52792d36e32"></script>
	
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
	
	<c:if test="${storeListSize != 0 }">
		<div id="searchResultMap">
	       	 <div id="map"></div><hr/>
	    </div>
    </c:if>
    
	<div class="container" id="resultText">
			<h3 style="margin-top:3%;margin-left:7%;font-size:30px;"><strong style="color:#6d3afb;">${area }</strong>에서 </h3>
			<h3 style="margin-top:1%;margin-left:10%;font-size:30px;"><strong style="color:#6d3afb;">${cate }</strong>유형 검색 결과입니다.</h3>   	
	</div>
	<div class="container">
		<!-- Store Row -->
         <div id="storeRow" class="row">
           <c:if test="${storeListSize == 0 }">
	            <div>
		            <div>
		            	<h3>검색 결과가 없습니다.</h3>
		            </div>
		        </div><hr/>
	       </c:if>
            
            <c:if test="${storeListSize != 0 }">
	            <div class="row">
					<c:forEach items="${store }" var="storeList" varStatus="i">
						<div class="storeItem" data-id="${storeList.sh_id }">
							<div id="storeImg">
								<img src="${storeList.sh_photo }"
									onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
									alt="storeImage"/>
							</div>
							<div id="storeContent">
								<h4>${storeList.sh_name }</h4>
								<p>
									<b>${localList[i.index] }</b> - ${storeList.induty_code_se_name }
								</p>
								<span id="minPrice">${storeList.price }~ </span>
								<span>원</span> 
								<span>/${storeList.menu }</span>
			
								<div id="likeShowDiv" style="float: right; margin-right: 15px; bottom: 0; font-size: 15px;">
									<span class="glyphicon glyphicon-thumbs-up"></span>
									<span>${storeList.sh_rcmn }</span>
									<span class="glyphicon glyphicon-heart-empty"></span>
									<span>${storeList.sh_like }</span>
								</div>
							</div>
						</div>
					</c:forEach>
					<br />
				</div>
	    	</c:if>
	    	<br/>
        </div>
     </div>	