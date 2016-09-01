<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지도 </title>

<link rel="stylesheet" href="<c:url value="/resources/css/daumMap.css"/>" type="text/css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=76d0dfe96fd493ccedbee52792d36e32"></script>
<script type="text/javascript">
var sh_photo = "<c:out value="${store.sh_photo}"/>";
var sh_name = "<c:out value="${store.sh_name}"/>";
var sh_addr = "<c:out value="${store.sh_addr}"/>";
var sh_way = "<c:out value="${store.sh_way}"/>";

var pointX = ${pointX};
var pointY = ${pointY};

var map;
var overlay;

$(document).ready(function(){
	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new daum.maps.LatLng(pointY, pointX), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    }; 

    map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도에 마커를 표시합니다 
	var marker = new daum.maps.Marker({
    	map: map, 
    	position: new daum.maps.LatLng(pointY, pointX)
	});

	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + sh_name + 
            '            <div class="close" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src='+sh_photo+' width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">'+sh_addr+'</div>' + 
            '                <div class="jibun ellipsis">'+sh_way+'</div>' + 
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
		 overlay.setMap(null);   
	});
	
});
</script>
</head>
<body>
	<div id="map" style="width:100%;height:350px;"></div>
	<div>
		<h2>Store정보 </h2>
		<p>${store.sh_name }</p>
		<p>${store.sh_photo }</p>
	</div>
	<a href="http://map.daum.net/link/to/${store.sh_name },${pointY },${pointX }">길찾기 </a>
</body>
</html>