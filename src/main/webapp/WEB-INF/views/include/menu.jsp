<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%-- 
<script src="<c:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"/>"></script> 
--%>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>" type="text/css">

<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>
<script src="<c:url value="/resources/dist/js/demo.js"/>"></script>
<script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>"></script>
<script src="<c:url value="/resources/js/modal.js"/>"></script>

<!-- session -->
<jsp:useBean id="loginBean" class="petBean.LoginInfoBean"/>
<%
	request.setCharacterEncoding("UTF-8");
	String idNum = request.getParameter("idNum");
	String nick="";
	String img="#";
	
	if(idNum!=null){
		loginBean.setId(request.getParameter("idNum"));
		loginBean.setNick(request.getParameter("nickName"));
		loginBean.setImgUrl(request.getParameter("profile_img"));
		session.setAttribute("LOGININFO", loginBean);
	}
	
	loginBean = (petBean.LoginInfoBean)session.getAttribute("LOGININFO");
%>
<!-- ./session -->
    
<script type="text/javascript">
	$(document).ready(function(){
		$(".openbtn").on("click",function(){
			$(this).css("display","none");
			
			var maskHeight = $(document).height();  
	        var maskWidth = $(window).width();  
	        
	        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	        $('#mask').css({'width':maskWidth,'height':maskHeight,'display':'block','z-index':'999','opacity':'.6','filter':'alpha(opacity=80)'});  
	        
			$("#mySidenav").css("width","360px");
		});
		$(".closebtn").on("click",function(){
			$("#mySidenav").css("width","0px");
			
			$('#mask').css('display','none');
			setTimeout(function(){
				$(".openbtn").css("display","");
			},400);
		});
		$("#mask").on("click",function(){
			$("#mySidenav").css("width","0px");
			
			$('#mask').css('display','none');
			setTimeout(function(){
				$(".openbtn").css("display","");
			},400);
		});
		//검색어로 검색
		$("#searchForm").on("submit",function(e){
			e.preventDefault();
			$(location).attr("href","http://localhost:8080/store/search/"+$("#searchTxt").val());
		});
		
		//모바일 검색어로 검색
		$("#mb_searchFrm").on("submit",function(e){
			e.preventDefault();
			$(location).attr("href","http://localhost:8080/store/search/"+$("#mb_searchTxt").val());
		});
		
	});
</script> 
<style type="text/css">
	/* 헤더(메뉴바) css */
	.navbar-header{
		width:100%;
	}
	#header2 nav{
		background-color: #1abc9c; 
		z-index: 990;
	}
	#header2 nav span{
		font-size: 30px; 
		cursor: pointer; 
		color: #ffffff; 
		float: right; 
		margin-right: 5%;
	}
	#header2 input{
		width:450px;
	}
	/* End 헤더(메뉴바) css */
	
	/* 모바일 헤더(메뉴바) css */
	#mb_header nav{
		background-color: #1abc9c; 
		z-index: 990;
	}
	#mb_header input{
		width:100%;
	}
	#mb_header nav span{
		font-size: 30px; 
		cursor: pointer; 
		color: #ffffff; 
		float: right; 
		margin-right: 5%;
	}
	/* End 모바일 헤더(메뉴바) css */
</style>    
<div class="hidden-xs">
	<header id="header2">	
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="navbar-header">
				<a class="navbar-brand" href="/" style="color: #ffffff;">GreenStore</a>
				<form id="searchForm" class="navbar-form navbar-left" action="" role="search">
					<div class="form-group">
						<input type="text" id="searchTxt" name="searchText" class="form-control" placeholder="Search">
					</div>
				</form>
				<span class="openbtn">&#9776;</span>
			</div>
		</nav>
	</header>
</div>

<div class="visible-xs">
	<header id="mb_header">
		<nav class="navbar navbar-default navbar-fixed-top">
				<div class="navbar-header">
					<a class="navbar-brand" href="/" style="color: #ffffff;">GS</a>
					<form id="mb_searchFrm" class="navbar-form navbar-left" action="" role="search" style="display:inline-block;width:65%;">
						<div class="form-group" style="width:110%">
							<input type="text" id="mb_searchTxt" name="searchText" class="form-control" placeholder="Search">
						</div>
					</form>
					<span class="openbtn">&#9776;</span>
			</div>
		</nav>
	</header>
</div>


<div id="mask"></div>
	
	<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" style="color:#fff;">&times;</a>
	<%if(loginBean!=null){ %>
	<div id="profile">
		<div style="position:absolute; width:340px;height:200px; top:40px; left:25px;">
			<img src="<c:url value="<%=loginBean.getImgUrl() %>"/>" alt="profile" class="img-circle" style="display:inline-block;width:105px;height:110px;"/>
			<strong style="margin-left:10px;line-height:6em;color:#000"><%=loginBean.getNick() %><font color="blue">(<%=loginBean.getId() %>)</font></strong>			
		</div>
	</div>
	<%}else{ %>
	<div id="profile">
		<div style="position:absolute; width:340px;height:200px; top:40px; left:25px;">
			<img src="<c:url value="/resources/img/iseoul.jpg"/>" alt="iseoul" class="img-circle" style="display:inline-block;width:105px;height:110px;"/>
			<strong style="margin-left:10px;line-height:6em;color:#fff">로그인 필요합니다.</strong>		
		</div>
	</div>
	<%} %>	
	<div style="height:180px;"></div>
	<nav>
		<ul style="list-style: none; margin: 0;padding: 0; position: absolute; width: 360px;">
			<li style="display: inline-block; line-height: 20px; position: relative; width: 100%;">
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="http://localhost:8080/greenStore" style="color: #f47721;text-decoration: none; margin-left:2%;">그린스토어 홈</a> 
					<span class="css-arrow" ></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px; border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<%if(loginBean!=null){ %>
					<a href="http://localhost:8080/greenStore/member/logout" style="color: #0d2474;text-decoration: none; margin-left:2%;">로그아웃</a> 
					<span class="css-arrow"></span>
					<%}else{ %>			
					<a href="http://localhost:8080/greenStore/member/login" style="color: #0d2474;text-decoration: none; margin-left:2%;">로그인</a> 
					<span class="css-arrow"></span>
					<%} %>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="http://localhost:8080/greenStore/notice/listAll" style="color: #0d2474;text-decoration: none; margin-left:2%; ">공지사항</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="http://localhost:8080/greenStore/notice/service" style="color: #0d2474;text-decoration: none; margin-left:2%;">서비스 소개</a> 
					<span class="css-arrow"></span>
				</div>
					<%if(loginBean!=null){ %>
					<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
						<a href="http://localhost:8080/greenStore/mypage/storeLike?mid=<%=loginBean.getId()%>" style="color: #0d2474;text-decoration: none; margin-left:2%;">좋아요스토어</a> 
						<span class="css-arrow"></span>
					</div>
					<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
						<a href="http://localhost:8080/greenStore/mypage/reviewLike?mid=<%=loginBean.getId()%>" style="color: #0d2474;text-decoration: none; margin-left:2%;">좋아요리뷰</a> 
						<span class="css-arrow"></span>
					</div>
					<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
						<a href="http://localhost:8080/greenStore/review/myReview?mid=<%=loginBean.getId()%>" style="color: #0d2474;text-decoration: none; margin-left:2%;">나의리뷰보기</a> 
						<span class="css-arrow"></span>
					</div>
					<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
						<a href="http://localhost:8080/greenStore/review/listAll" style="color: #0d2474;text-decoration: none; margin-left:2%;">리뷰전체보기</a> 
						<span class="css-arrow"></span>
					</div>
					<%}else{ %>
					<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
						<a href="http://localhost:8080/greenStore/review/listAll" style="color: #0d2474;text-decoration: none; margin-left:2%;">리뷰전체보기</a> 
						<span class="css-arrow"></span>
					</div>
					<%} %>	
				
				<br/><br/>
				<div style="display:block;position: relative; width:100%; height:60px; text-align:center; line-height:3em;padding-left:10px; background-color:#f47721;">
					<a href="http://localhost:8080/greenStore" style="color:#fff;">
						그린스토어로 이동
					</a>
				</div>
			</li>
		</ul>
	</nav>
</div>
<div style="height:54spx;"></div>
