<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">

<!-- Common css import -->
<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">

<!-- Home css import -->
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">

<!-- Home js import -->
<script src="<c:url value="/resources/js/home.js"/>"></script>

<div id="mask"></div>
<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" style="color:#fff;">&times;</a>
	<div id="profile">
		<div style="position:absolute; width:340px;height:200px; top:40px; left:25px;">
			<img src="<c:url value="/resources/img/iseoul.jpg"/>" alt="..." class="img-circle" style="display:inline-block;width:105px;height:110px;"/>
			<strong style="margin-left:10px;line-height:6em;color:#000">로그인 필요합니다.</strong>
			
		</div>
	</div>
	<div style="height:180px;"></div>
	<nav>
		<ul style="list-style: none; margin: 0;padding: 0; position: absolute; width: 360px;">
			<li style="display: inline-block; line-height: 20px; position: relative; width: 100%;">
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="#" style="color: #f47721;text-decoration: none; margin-left:2%;">그린스토어 홈</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px; border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="#" style="color: #0d2474;text-decoration: none; margin-left:2%;">로그인/로그아웃</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="#" style="color: #0d2474;text-decoration: none; margin-left:2%; ">공지사항</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="#" style="color: #0d2474;text-decoration: none; margin-left:2%;">서비스 소개</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="#" style="color: #0d2474;text-decoration: none; margin-left:2%;">마이페이지</a> 
					<span class="css-arrow"></span>
				</div>
				<!-- <div style="display:block;position: relative; width:100%; height:100px; line-height:5em; text-align:center;">
					<span>GreenStore</span>
				</div> -->
			<br/><br/>
				<div style="display:block;position: relative; width:100%; height:60px; text-align:center; line-height:3em;padding-left:10px; background-color:#f47721;">
					<a style="color:#fff;">
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

<div id="mainImage">
	<div>
		<div id="searchKeyward">
			<a id="location">전체지역 </a><span>에 있는 </span><br /> 
			<span>서울시에서 추천하는 </span><a id="category">전체 유형 </a>
			<span>스토어 </span>
			<br /> <br />
		</div>
		<div id="searchStore">
			위 조건으로 스토어검색<span class="glyphicon glyphicon-circle-arrow-right"> </span>
		</div>
	</div>
	<img /><br />
</div>

<div id="locationDiv" title="공간을 선택해주세요 ">
	<c:forEach items="${areaList }" var="area" varStatus="i">
		<div>
			<input type="radio" class="radio" id="radio${i.index }" name="radio"
				value="${area }"> <label for="radio${i.index }">${area }
			</label>
		</div>
	</c:forEach>
	<br /> <br /> <br />
	<button class="btn btn-primary btn-block" id="locationBtn">확인</button>
</div>

<div id="categoryDiv" title="공간 유형을 선택해주세요 ">
	<c:forEach items="${cateMap }" var="category" varStatus="i">
		<div>
			<input type="radio" class="cateradio" id="cateradio${i.index }"
				name="cateradio" value="${category.key }"> <label
				for="cateradio${i.index }">${category.value } </label>
		</div>
	</c:forEach>
	<br /> <br /> <br />
	<button class="btn btn-primary btn-block" id="categoryBtn">확인</button>
</div>

<div class="container">
	<!-- Store Row -->
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
					<span style="color: #16a085;">${storeList.price }~ </span><span
						style="font-size: 13px;">원</span> <span
						style="font-size: 13px; color: #9b9b9b;">/${storeList.menu }
					</span>

					<div id="likeShowDiv"
						style="float: right; margin-right: 15px; bottom: 0; font-size: 15px;">
						<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" /><span
							style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
						<span class="glyphicon glyphicon-heart-empty" style="margin: 0;" /><span
							style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
					</div>
				</div>
			</div>
		</c:forEach>
		<br />
	</div>
</div><br/>