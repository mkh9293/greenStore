<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Daum Map css import -->
<link rel="stylesheet" href="<c:url value="/resources/css/daumMap.css"/>" type="text/css">

<!-- Daum Map js import -->
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
	
	$("#findRoad").on("click",function(){
		$(location).attr("href","http://map.daum.net/link/to/"+sh_name+","+pointY+","+pointX);
	});
});
</script>
<style type="text/css">
	#callStore, #findRoad :hover{
		cursor:pointer;
	}
</style>
	<!-- store image, name, addr -->
	<div style="display:inline-block; margin:1px 10px 2px 40px;">
		<img src="${store.sh_photo }" alt="storeImage" class="img-circle" width=120px; height=120px;/>
	</div>
	<div style="display:inline-block; margin-top:5px;">
		<h2>${store.sh_name }</h2>
		<p>${store.sh_addr }</p>
	</div>	
	<hr/>
	<!-- end store image, name, addr -->
	
	<!-- 전화 걸기, 길찾기  -->
	<div id="callStore" data-toggle="modal" data-target="#myModal" style="margin:5px 20px 20px 100px;text-align:center;display:inline-block;border:2px solid #2F9D27;border-radius:20px;width:300px; height:45px;">
		<h4 style="color:#2F9D27"><span class="glyphicon glyphicon-earphone"></span>전화걸기</h4>
	</div>
	<div id="findRoad" style="margin:5px 20px 20px 40px; text-align:center;display:inline-block;border:2px solid #2F9D27;border-radius:20px;width:300px; height:45px;">
		<h4 style="color:#2F9D27"><span class="glyphicon glyphicon-share-alt"></span>길찾기</h4>
	</div>
	<!-- end 전화 걸기, 길찾기  -->
	
	<div id="map" style="width:100%;height:400px;"></div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top:100px;">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body" style="text-align:center">
	       	<h2>${store.sh_name }</h2>
	       	<h3 style="color:#2F9D27">${store.sh_phone}</h3>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary btn-lg btn-block" data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- end Modal -->