<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/dist/css/skins/_all-skins.min.css"/>" type="text/css">

<!-- sidebar menu css -->  
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">

<!-- common css import -->   
<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>" type="text/css">

<!-- DaumMap css import -->   
<link rel="stylesheet" href="<c:url value="/resources/daumMap.css"/>" type="text/css">

<!-- DaumMap js import  -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=76d0dfe96fd493ccedbee52792d36e32"></script>
			
<script type="text/javascript">
	var pointX = ${pointX};
	var pointY = ${pointY};
	
	var mb_map;
	
	$(document).ready(function(){
		
		var mb_mapContainer = document.getElementById('mb_map'), // 지도의 중심좌표
		
		mb_mapOption = { 
	        center: new daum.maps.LatLng(pointY, pointX), // 지도의 중심좌표
	        level: 5, // 지도의 확대 레벨
	        draggable: false,
	        scrollwheel: false,
	        disableDoubleClick: false,
	        disableDoubleClickZoom: false,
	        keyboardShortcuts: false
	    }; 
		
	    mb_map = new daum.maps.Map(mb_mapContainer, mb_mapOption);
	    mb_map.setZoomable(false);
	   
		// 모바일 지도에 마커를 표시합니다 
		var mb_marker = new daum.maps.Marker({
	    	map: mb_map, 
	    	position: new daum.maps.LatLng(pointY, pointX)
		});
		
		$("#mb_likeBtn").on("click",function(){
	        if(likeBtn == false){
	        	$("#mb_likeBtn").removeClass();
	        	$("#mb_likeBtn").addClass("glyphicon glyphicon-heart");
	            $("#mb_likeBtn").css("color","#1abc9c");
	            likeBtn = true;
	            alert("좋아요를 눌렀습니다.");
	        }
	        else{
	        	$("#mb_likeBtn").removeClass();
	        	$("#mb_likeBtn").addClass("glyphicon glyphicon-heart-empty");
	            $("#mb_likeBtn").css("color","#BDBDBD");
	            likeBtn = false;
	            alert("좋아요를 취소헸습니다.");
	        }
		});
		
		$("#callStore").on("click",function(){
				
		});
		
		$("#findRoad").on("click",function(){
			$(location).attr("href","http://map.daum.net/link/to/"+sh_name+","+pointY+","+pointX);
		});
	});
</script>

<style>
	body span{
		font-size:12px;
	}
</style>
<div class="visible-xs visible-sm">
	<img alt="detailImage" src="${playInfo.firstimage }" style="width:100%;height:200px;"/><br/>
	    <div class="container">
	    	<div class="row">
                <div class="col-md-8" id="mainContent">
                    <div>
                        <h5>${playInfo.title }</h5>
                    </div>
                    <!-- <img alt="storeDetailImg" src="${store.sh_photo }" style="width:400px;height:500px"/>  -->
                    <hr/>
                    <div class="intro">
                        <table>
                        	<tr>
                        		<th style="width:100px;"><span class="glyphicon glyphicon-circle-arrow-right"/><label>주소: </label></th>
                        		<td><span style="text-decoration:underline;">${addr }</span></td>
                        	</tr>
                        	<tr>
                        		<th style="width:100px;"><span class="glyphicon glyphicon-circle-arrow-right"/><label>전화번호: </label></th>
                        		<td><span>${playInfo.tel }</span></td>
                        	</tr>
                        </table>
                    </div><hr/>
                    
                    <div class="daumBlog">
                    	<h5 style="font-size:25px;">블로그</h5>
                    	<c:forEach items="${daumBlogList }" var="daumBlog" varStatus="i">
                        	<c:if test="${i.index < 3 }">
								<div class="daumBlogItem">
									<a href="${daumBlog.link }" target="_blank">${daumBlog.title }</a>
									<p>${daumBlog.description }</p>
									<p>${daumBlog.author }</p>
								</div><hr/>
							</c:if>
						</c:forEach>
                    </div>
                </div>
                
                <!-- store image, name, addr -->
				<div class="row" style="margin-left:2%;">
					<div style="display:inline-block; margin:1px 10px 2px 10px;">
						<img src="${playInfo.firstimage }" alt="storeImage" class="img-circle" width=120px; height=120px;/>
					</div>
					<div style="display:inline-block; margin-top:5px; width:65%;">
						<h5 style="font-size:20px;margin:0;">${playInfo.title } </h5>
						<p>${addr }</p>
					</div><hr style="width:90%;text-align:center;"/>	
				</div>
				<!-- end store image, name, addr -->
						
				<!-- 전화 걸기, 길찾기  -->
				<div id="callStore" data-toggle="modal" data-target="#myModal" style="margin:0px 20px 20px 50px;text-align:center;display:inline-block;border:2px solid #2F9D27;border-radius:20px;width:35%; height:35px;">
					<h4 style="color:#2F9D27;margin:2;font-size:15px;"><span class="glyphicon glyphicon-earphone" style="font-size:19px;"></span>전화걸기</h4>
				</div>
				<div id="findRoad" style="margin:5px 20px 20px 20px; text-align:center;display:inline-block;border:2px solid #2F9D27;border-radius:20px;width:35%; height:35px;">
					<h4 style="color:#2F9D27;margin:2;font-size:15px;"><span class="glyphicon glyphicon-share-alt" style="font-size:19px;"></span>길찾기</h4>
				</div>
				<!-- end 전화 걸기, 길찾기  -->
						
				<div id="mb_map" style="width:100%;height:400px;"></div>
				<hr/>
			</div>
        </div><br/>
</div>