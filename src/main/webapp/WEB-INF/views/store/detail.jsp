<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지 </title>

<!-- bootstrap css import -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 

<!-- sidebar menu css -->  
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">


<!-- jquery import -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<!-- sidebar menu js -->
<script src="<c:url value="/resources/js/index.js"/>"></script>

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

var pointX = ${pointX};
var pointY = ${pointY};

var map;
var overlay;

$(document).ready(function(){
	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new daum.maps.LatLng(pointY, pointX), // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨
        draggable: false,
        scrollwheel: false,
        disableDoubleClick: false,
        disableDoubleClickZoom: false,
        keyboardShortcuts: false
    }; 

    map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	map.setZoomable(false);
    
	// 지도에 마커를 표시합니다 
	var marker = new daum.maps.Marker({
    	map: map, 
    	position: new daum.maps.LatLng(pointY, pointX)
	});
    
	$("#map").click(function(){
		window.open('', 'map', 'width=900, height=700,top=200,left=200');
		$("#storeInfo").attr("target","map");
		$("#storeInfo").submit();
	});
	
	$(".playItem").on("click",function(){
		var contentId = $(this).attr("data-id");
		window.open("http://localhost:8080/greenStore/store/detail/play?contentId="+contentId,"_blank","toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=200,width=800,height=600");
		//$(location).attr("href","http://localhost:8080/greenStore/store/detail/play?contentId="+contentId);
	});
	
	
	var likeBtn = false;//나중에 디비에서 받아야된다.
	$("#likeBtn").on("click",function(){
        if(likeBtn == false){
            $("#likeBtn").css("color","#F361A6");
            likeBtn = true;
            alert("좋아요를 눌렀습니다.");
        }
        else{
            $("#likeBtn").css("color","");
            likeBtn = false;
            alert("좋아요를 취소헸습니다.");
        }
	});
});
</script>

<style>
	body span{
		font-size:12px;
	}
	.playItem, #likeBtn{
		cursor:pointer;
	}
	
</style>
</head>
<body>
		<div id="wrapper">
    
        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                      	GreenStore
                    </a>
                </li>
                <li>
                	<div style="text-align:center;background-color:yellow;">
                    	<img class="img-circle" src="${store.sh_photo }" alt="" width=60px; height=60px;/>
                    	<span>로그인이 필요합니다.</span>
                    </div>
                </li>
                <li>
                    <a href="#">로그인</a>
                </li>
                <li>
                    <a href="#">공지사항 </a>
                </li>
                <li>
                    <a href="#">서비스 소개 </a>
                </li>
             </ul>
        </nav>
        <!-- /#sidebar-wrapper -->
        <!-- Page Content -->
        <div>
          <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
          </button>
          </div>
          </div>
          
		<img alt="detailImage" src="${store.sh_photo }" style="width:100%;height:400px;"/><br/>
	    <div class="container">
	    	<div class="row">
                <div class="col-md-8" id="mainContent">
                    <div>
                        <h3>${store.sh_name }<small>${store.sh_rcmn }</small>
                        <span id="likeBtn" style="float:right; font-size:30px;" class="glyphicon glyphicon-heart">
                        	   <span class="inside glyphicon glyphicon-heart" style="position:absolute;font-size:15px;left:8px;top:6px;color:white;"></span>
                        </span>
        			  </h3>
                    </div>
                    <!-- <img alt="storeDetailImg" src="${store.sh_photo }" style="width:400px;height:500px"/>  -->
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
                    	<h4>리뷰 </h4>
                    </div><hr/>
                    
                    <div class="blog">
                    	<h4>블로그</h4>
                    	<c:forEach items="${blogList }" var="blog" varStatus="i">
                        	<c:if test="${i.index < 3 }">
								<div class="blogItem">
									<a href="${blog.link }" target="_blank">${blog.title }</a>
									<p>${blog.description }</p>
								</div><hr/>
							</c:if>
						</c:forEach>
                    </div>
                    
                    <div class="daumBlog">
                    	<h4>다음 블로그</h4>
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
				
						<div id="map" style="width:420px;height:300px;"></div>
                    </form><br/>
					
                    <h6 style="color:#16a085;margin-bottom:30px;">주변 놀거리 소개</h6>
                    <div id="play">
                        <c:forEach items="${playList }" var="play" varStatus="i">
                        	<c:if test="${i.index < 3 }">
								<div class="playItem" data-id="${play.contentid }">
									<div class="row">
										<div class="col-md-5" >
											<img src="${play.firstimage }" alt="playImage" onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'" style="width:150px;height:150px;"/>
										</div>
										<div class="col-md-7" >
											<b>${play.title }</b><br/>
											
											<span style="color:gray;">위치: </span><span>${play.addr1 }</span><br/>
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
</body>
</html>