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
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">

<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>
<script src="<c:url value="/resources/dist/js/demo.js"/>"></script>
<script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>"></script>
<script src="<c:url value="/resources/js/modal.js"/>"></script>
<script src="<c:url value="/resources/js/home.js"/>"></script>

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

<!-- sideMenu -->
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
			<strong style="margin-left:10px;line-height:6em;color:#000">로그인 필요합니다.</strong>		
		</div>
	</div>
	<%} %>	
	<div style="height:180px;"></div>
	<nav>
		<ul style="list-style: none; margin: 0;padding: 0; position: absolute; width: 360px;">
			<li style="display: inline-block; line-height: 20px; position: relative; width: 100%;">
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="../greenStore" style="color: #f47721;text-decoration: none; margin-left:2%;">그린스토어 홈</a> 
					<span class="css-arrow" ></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px; border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<%if(loginBean!=null){ %>
					<a href="../greenStore/member/logout" style="color: #0d2474;text-decoration: none; margin-left:2%;">로그아웃</a> 
					<span class="css-arrow"></span>
					<%}else{ %>			
					<a href="../greenStore/member/login" style="color: #0d2474;text-decoration: none; margin-left:2%;">로그인</a> 
					<span class="css-arrow"></span>
					<%} %>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="../greenStore/notice/listAll" style="color: #0d2474;text-decoration: none; margin-left:2%; ">공지사항</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="#" style="color: #0d2474;text-decoration: none; margin-left:2%;">서비스 소개</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="../greenStore/review/listAll" style="color: #0d2474;text-decoration: none; margin-left:2%;">마이페이지</a> 
					<span class="css-arrow"></span>
				</div>
				<br/><br/>
				<div style="display:block;position: relative; width:100%; height:60px; text-align:center; line-height:3em;padding-left:10px; background-color:#f47721;">
					<a href="../greenStore" style="color:#fff;">
						그린스토어로 이동
					</a>
				</div>
			</li>
		</ul>
	</nav>
</div>

<header id="header">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" style="color: #ffffff;">GreenStore</a>
			<span class="openbtn">&#9776;</span>
		</div>
	</nav>
</header>

<header id="header2" style="display:none;">	
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<a class="navbar-brand" href="" style="color: #ffffff;">GreenStore</a>
			<form id="searchFrm" class="navbar-form navbar-left" action="" method="post">
				<div class="form-group">
					<input type="text" id="searchText" name="searchText" class="form-control" placeholder="Search">
				</div>
			</form>
			<span class="openbtn">&#9776;</span>
		</div>
	</nav>
</header>	
<!-- ./sideMenu -->