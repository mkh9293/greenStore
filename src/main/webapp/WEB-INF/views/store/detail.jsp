<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<c:url value="/resources/se2/js/jindo.min.js" />"></script>
<script src="<c:url value="/resources/se2/js/HuskyEZCreator.js" />"></script> 

<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

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
	var sh_photo = "<c:out value="${store.sh_photo}"/>";
	var sh_name = "<c:out value="${store.sh_name}"/>";
	var sh_addr = "<c:out value="${store.sh_addr}"/>";
	var sh_way = "<c:out value="${store.sh_way}"/>";
	var sh_id = "<c:out value="${store.sh_id}"/>";
	
	var pointX = ${pointX};
	var pointY = ${pointY};
	
	var map;
	var overlay;
	
	$(document).ready(function(){
		var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	    
		mapOption = { 
	        center: new daum.maps.LatLng(pointY, pointX), // 지도의 중심좌표
	        level: 5, // 지도의 확대 레벨
	        draggable: false,
	        scrollwheel: false,
	        disableDoubleClick: false,
	        disableDoubleClickZoom: false,
	        keyboardShortcuts: false
	    }; 
		var mb_mapContainer = document.getElementById('mb_map'), // 지도의 중심좌표
		
		mb_mapOption = { 
	        center: new daum.maps.LatLng(pointY, pointX), // 지도의 중심좌표
	        level: 4, // 지도의 확대 레벨
	        draggable: false,
	        scrollwheel: false,
	        disableDoubleClick: false,
	        disableDoubleClickZoom: false,
	        keyboardShortcuts: false
	    }; 
		
	    map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    map.setZoomable(false);
	    
	    mb_map = new daum.maps.Map(mb_mapContainer, mb_mapOption);
	    mb_map.setZoomable(false);
	    
		// 지도에 마커를 표시합니다 
		var marker = new daum.maps.Marker({
	    	map: map, 
	    	position: new daum.maps.LatLng(pointY, pointX)
		});
		
		// 모바일 지도에 마커를 표시합니다 
		var mb_marker = new daum.maps.Marker({
	    	map: mb_map, 
	    	position: new daum.maps.LatLng(pointY, pointX)
		});
		
		$("#map").click(function(){
			window.open('', 'map', 'width=900, height=700,top=200,left=200');
			$("#storeInfo").attr("target","map");
			$("#storeInfo").submit();
		});
		
		$(".playItem").on("click",function(){
			var contentId = $(this).attr("data-id");
			var addr1 = $(this).find(".addr1").text();
			var title = $(this).find(".title").text();
		
			window.open("http://localhost:8080/greenStore/store/detail/play/"+contentId+"/"+sh_name+"/"+sh_addr+"/"+title+"/"+addr1,"_blank","toolbar=no,scrollbars=yes,resizable=no,top=200,left=200,width=800,height=600");
			
			//$(location).attr("href","http://localhost:8080/greenStore/store/detail/play?contentId="+contentId);
		});
		
		$(".mb_playItem").on("click",function(){
			var contentId = $(this).attr("data-id");
			var addr1 = $(this).find(".addr1").text();
			var title = $(this).find(".title").text();
			
			$(location).attr("href","http://localhost:8080/greenStore/store/mb/detail/play/"+contentId+"/"+title+"/"+addr1);
		});
		
		var likeBtn = false;//나중에 디비에서 받아야된다.
		$("#likeBtn").on("click",function(){
			
			if(likeBtn == false){
	        	$("#likeBtn").removeClass();
	        	$("#likeBtn").addClass("glyphicon glyphicon-heart");
	            $("#likeBtn").css("color","#1abc9c");
	            likeBtn = true;
	            
	            $.ajax({
	            	url:"http://localhost:8080/greenStore/json/likePlus",
	            	data:{"sh_id":sh_id},
	            	method:"post",
	            	success:function(data){
	            		$.each(data, function(key, value){
	            			alert("좋아요를 눌렀습니다.");
	            		});
	            	}
	            });
	        }
	        else{
	        	$("#likeBtn").removeClass();
	        	$("#likeBtn").addClass("glyphicon glyphicon-heart-empty");
	            $("#likeBtn").css("color","#BDBDBD");
	            likeBtn = false;
	            
	            $.ajax({
	            	url:"http://localhost:8080/json/likeMin",
	            	data:{"sh_id":sh_id},
	            	method:"post",
	            	success:function(data){
	            		$.each(data, function(key, value){
	            			alert("좋아요를 취소헸습니다.");
	    				});
	            	}
	            });
	        }
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
		
		
/* 		$(function() {
			  $('#add-button').on("click", function() {
			      var rcontent = $('form[name=rcontent]').val();
			      var mkey = 1;
			      
					 $.ajax({
							url:"http://localhost:8080/greenStore/json/write",
							type:"post",
							data:{"meky": mkey ,"sh_id": sh_id, "rcontent": rcontent},
							success:function(data){
								alert(data);
							}
						 });
			});
		 */

	});
</script>

<style type="text/css">
	body span{
		font-size:12px;
	}
	#map, #likeBtn, .playItem:hover{
		cursor:pointer;
	}
</style>
<div class="hidden-xs hidden-sm">		
		
	    <div class="container">
	    <img alt="detailImage" src="${store.sh_photo }" style="width:100%; height:500px;"/><br/>
	    	<div class="row">
                <div class="col-md-8" id="mainContent">
                    <div>
                        <h3>${store.sh_name }<small style="color:#16a085;">${store.sh_rcmn }</small>
                        <span id="likeBtn" style="float:right; font-size:30px;color:#BDBDBD;" class="glyphicon glyphicon-heart-empty"></span>
        			  </h3>
                    </div>
                    <hr/>
                    <div class="intro">
                        <table>
                        	<tr>
                        		<th style="width:100px;"><span class="glyphicon glyphicon-circle-arrow-right"/><label>주소: </label></th>
                        		<td><span style="text-decoration:underline;">${store.sh_addr }</span></td>
                        	</tr>
                        	<tr>
                        		<th style="width:100px;"><span class="glyphicon glyphicon-circle-arrow-right"/><label>전화번호: </label></th>
                        		<td><span>${store.sh_phone }</span></td>
                        	</tr>
                        </table>
                     </div><hr/>
                    
                   <div class="review">
                   <h4>리뷰</h4>
                 <!--   <form role="form" method="post" action="review/reviewWrite">
                   		<input type="hidden" name="sh_id" value="2350">
                   		<input type="hidden" name="mkey" value="2">
	                    <textarea style="width:85%;" name="rcontent" id="rontent"></textarea>
	                    <a href="http://localhost:8080/greenStore/review/reviewWrite" class="btn"> <i class="icon-list"></i>추가</a>
	                    <button type="submit" class="btn btn-primary" onclick="onWrite()">
		           		<i class="icon-ok icon-white"></i> 추가
		       	   		</button>
                   </form> -->
                   
                   
                   
                   
                   <!-- 리뷰작성 -->
								
                    </div><hr/>
                    
                    <div class="daumBlog">
                    	<h4>블로그</h4>
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
                
                <div class="col-md-4" id="sideMenu" style="position:relative; margin-top:2px;"> 
                    <form action="detail/navi" method="get" id="storeInfo" target="">
						<input type=hidden name="endPointX" value="${pointX }">
						<input type=hidden name="endPointY" value="${pointY }">
		
						<input type=hidden name="sh_id" value="${store.sh_id }">
						<input type=hidden name="sh_name" value="${store.sh_name }">
						<input type=hidden name="sh_photo" value="${store.sh_photo }">
						<input type=hidden name="sh_addr" value="${store.sh_addr }">
						<input type=hidden name="sh_way" value="${store.sh_way }">
						<input type=hidden name="sh_phone" value="${store.sh_phone }">
						<input type=hidden name="sh_info" value="${store.sh_info }">
				
						<div id="map" style="width:365px;height:300px;"></div>
                    </form>
					
                    <h5 style="font-size:25px;margin-bottom:30px;">주변 놀거리</h5>
                    <div id="play">
                        <c:forEach items="${playList }" var="play" varStatus="i">
                        	<c:if test="${i.index < 3 }">
								<div class="playItem" data-id="${play.contentid }">
									<div class="row">
										<div class="col-md-5" >
											<img src="${play.firstimage }" alt="playImage" onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'" style="width:120%;height:150px;"/>
										</div>
										<div class="col-md-7" >
											<b class="title">${play.title }</b><br/>
											<span style="color:gray;">위치: </span><span class="addr1">${play.addr1 }</span><br/>
											<span style="color:gray;">분류: </span><span>${play.cat1 }</span><br/>
										</div>
									</div>
									<span style="display:block; height:20px; margin-top:5px; white-space: nowrap; text-overflow:ellipsis;overflow:hidden;">${overviewList[i.index] }</span>
								</div><hr/>
							</c:if>
						</c:forEach>
                    </div>
                </div>
            </div>
        </div>   
</div>
<div class="visible-xs visible-sm">
	
	    <div class="container">
	    <img alt="detailImage" src="${store.sh_photo }" style="width:100%;height:200px;"/><br/>
	    	<div class="row">
                <div class="col-md-8" id="mainContent">
                    <div>
                        <h5>${store.sh_name }<small style="color:#16a085">&nbsp;${store.sh_rcmn }</small>
                        	<span id="mb_likeBtn" style="float:right; font-size:30px;color:#BDBDBD;" class="glyphicon glyphicon-heart-empty"></span>
        			  	</h5>
                    </div>
                    <hr/>
                    <div class="intro">
                        <table>
                        	<tr>
                        		<th style="width:100px;"><span class="glyphicon glyphicon-circle-arrow-right"/><label>주소: </label></th>
                        		<td><span style="text-decoration:underline;">${store.sh_addr }</span></td>
                        	</tr>
                        	<tr>
                        		<th style="width:100px;"><span class="glyphicon glyphicon-circle-arrow-right"/><label>전화번호: </label></th>
                        		<td><span>${store.sh_phone }</span></td>
                        	</tr>
                        </table>
                    </div><hr/>
                    
                    <div class="review">
                    	<h5 style="font-size:25px;">리뷰 (2) </h5>
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
						<img src="${store.sh_photo }" alt="storeImage" class="img-circle" width=120px; height=120px;/>
					</div>
					<div style="display:inline-block; margin-top:5px; width:65%;">
						<h5 style="font-size:20px;margin:0;">${store.sh_name } </h5>
						<p>${store.sh_addr }</p>
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
						
                <div class="col-md-4" id="mb_sideMenu" style="position:relative; margin-top:2px;"> 
                    <h5 style="font-size:25px;margin-bottom:30px;">주변 놀거리</h5>
                    <div id="mb_play">
                        <c:forEach items="${playList }" var="play" varStatus="i">
                        	<c:if test="${i.index < 4 }">
								<div class="mb_playItem" data-id="${play.contentid }" style="width:45%;">
									<div id="mb_playImg">
										<img src="${play.firstimage }" alt="playImage" onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'" />
									</div>
									<div id="mb_playContent">
										<span style="font-size:14px;font-weight:600" class="title">${play.title }</span><br/>
										<span style="color:gray;">${localList[i.index] } - ${play.cat1 }</span><br/>
										<span style="display:hidden" class="addr1">${play.addr1 }</span><br/>
									</div>
								</div>
							</c:if>
						</c:forEach>
                    </div>
                </div>
            </div>
        </div><br/>
</div>
