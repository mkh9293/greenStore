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
	</style>
	
	<script type="text/javascript">
	
	var map;
	var overlay;
	
	$(document).ready(function(){
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markList = [];
		
		$.ajax({
			url:"http://localhost:8080/greenStore/store/searchJson",
			dataType:"json",
			success:function(data){
				$.each(data, function(key, value){
					markList.push(value);
				});
				
				var mapContainer = document.getElementById('map'), // 지도의 중심좌표
			    mapOption = { 
					center:new daum.maps.LatLng(markList[0].pointY, markList[0].pointX),
			        level: 5 // 지도의 확대 레벨
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
	});
	</script>
</head>
<body>
	<div id="searchResultMap" style="height:400px;">
       	 <div id="map" style="height:400px;"></div><hr/>
    </div> 
	   	
	<div class="container">
	    <!-- Store Row -->
         <div class="row">
            <c:forEach items="${store }" var="storeList" varStatus="i">
                  	<div class="storeItem" data-id="${storeList.sh_id }" style="display:inline-block; margin:2%; background-color:#ffffff; box-shadow: 1px 1px 2px 3px #ccc;">
	    				<img src="${storeList.sh_photo }" alt="storeImage" width="300px" height="200px"/>
	    				<div style="margin-left:10px;">
	    					<h3 style="font-size:21px;">${storeList.sh_name }</h3>
	    					<p style="font-size:15px;">${storeList.sh_addr }</p>
	    					<p>${storeList.price }</p>
	    				</div>
	    			</div>
	    	</c:forEach><br/>
        </div>
     </div>	
</body>
</html>