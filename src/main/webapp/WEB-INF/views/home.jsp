<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"
	type="text/css">

<!-- Common css import -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/common.css"/>">

<!-- Home css import -->
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">

<!-- Home js import -->
<script src="<c:url value="/resources/js/home.js"/>"></script>

<div id="mask"></div>
<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" style="color: #fff;">&times;</a>
	<div id="profile">
		<div
			style="position: absolute; width: 340px; height: 200px; top: 40px; left: 25px;">
			<img src="<c:url value="/resources/img/iseoul.jpg"/>" alt="..."
				class="img-circle"
				style="display: inline-block; width: 105px; height: 110px;" /> <strong
				style="margin-left: 10px; line-height: 6em; color: #000">로그인
				필요합니다.</strong>

		</div>
	</div>
	<div style="height: 180px;"></div>

	<nav>
		<ul
			style="list-style: none; margin: 0; padding: 0; position: absolute; width: 360px;">
			<li
				style="display: inline-block; line-height: 20px; position: relative; width: 100%;">
				<div
					style="display: block; position: relative; width: 100%; height: 60px; border: 0.1em solid #F6F6F6; line-height: 3em; padding-left: 10px; background-color: #ffffff;">
					<a href=""
						style="color: #f47721; text-decoration: none; margin-left: 2%;">그린스토어
						홈</a> <span class="css-arrow"></span>
				</div>
				<div
					style="display: block; position: relative; width: 100%; height: 60px; border: 0.1em solid #F6F6F6; line-height: 3em; padding-left: 10px; background-color: #ffffff;">
					<a href="/login"
						style="color: #0d2474; text-decoration: none; margin-left: 2%;">로그인/로그아웃</a>
					<span class="css-arrow"></span>
				</div>
				<div
					style="display: block; position: relative; width: 100%; height: 60px; border: 0.1em solid #F6F6F6; line-height: 3em; padding-left: 10px; background-color: #ffffff;">
					<a href="/notice"
						style="color: #0d2474; text-decoration: none; margin-left: 2%;">공지사항</a>
					<span class="css-arrow"></span>
				</div>
				<div
					style="display: block; position: relative; width: 100%; height: 60px; border: 0.1em solid #F6F6F6; line-height: 3em; padding-left: 10px; background-color: #ffffff;">
					<a href="/service"
						style="color: #0d2474; text-decoration: none; margin-left: 2%;">서비스
						소개</a> <span class="css-arrow"></span>
				</div>
				<div
					style="display: block; position: relative; width: 100%; height: 60px; border: 0.1em solid #F6F6F6; line-height: 3em; padding-left: 10px; background-color: #ffffff;">
					<a href="/mypage"
						style="color: #0d2474; text-decoration: none; margin-left: 2%;">마이페이지</a>
					<span class="css-arrow"></span>
				</div> <!-- <div style="display:block;position: relative; width:100%; height:100px; line-height:5em; text-align:center;">
						<span>GreenStore</span>
					</div> --> <br />
			<br />
				<div
					style="display: block; position: relative; width: 100%; height: 60px; text-align: center; line-height: 3em; padding-left: 10px; background-color: #f47721;">
					<a href="/" style="color: #fff;"> 그린스토어로 이동 </a>
				</div>
			</li>
		</ul>
	</nav>
</div>
<div class="hidden-xs">
	<header id="header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="navbar-header">
				<a class="navbar-brand" href="#" style="color: #ffffff;">GreenStore</a>
				<span class="openbtn">&#9776;</span>
			</div>
		</nav>
	</header>
	<header id="header2" style="display: none;">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="navbar-header">
				<a class="navbar-brand" href="" style="color: #ffffff;">GreenStore</a>
				<form id="searchFrm" class="navbar-form navbar-left" action=""
					method="post">
					<div class="form-group">
						<input type="text" id="searchText" name="searchText"
							class="form-control" placeholder="Search">
					</div>
				</form>
				<span class="openbtn">&#9776;</span>
			</div>
		</nav>
	</header>

	<div id="mainImage">
		<div>
			<div id="searchKeyward">
				<a id="location">전체지역 </a><span>에 있는 </span><br /> <span>서울시에서
					추천하는 </span><a id="category">전체 유형 </a> <span>스토어 </span> <br /> <br />
			</div>
			<div id="searchStore">
				위 조건으로 스토어검색<span class="glyphicon glyphicon-circle-arrow-right">
				</span>
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
	<br />
	<div class="container">
		<div>
			<span style="font-size: 25px; font-weight: 600;">식당 추천 리스트</span>
			<div class="bestList">
				<ul style="list-style: none;">
					<li
						style="display: inline-block; margin: 15; width: 45%; height: 260px; background-size: 500px; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/eexfpmvgj6iq-m2m.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg');">
						<a href="/store/best/1">
							<figure>
								<figcaption>
									<div style="text-align: center; line-height: 5;">
										<span style="font-size: 30px; color: #fff;">한식 베스트 10곳</span>
									</div>
								</figcaption>
							</figure>
						</a>
					</li>
					<li
						style="display: inline-block; margin: 15; width: 45%; height: 260px; background-size: 500px; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/184699_1425200192391'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
						<a href="/store/best/2">
							<figure>
								<figcaption>
									<div style="text-align: center; line-height: 5;">
										<span style="font-size: 30px; color: #fff;">중식 베스트 10곳</span>
									</div>
								</figcaption>
							</figure>
					</a>
					</li>

					<li
						style="display: inline-block; margin: 15; width: 45%; height: 260px; background-size: 500px; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/ayrwtxnvv7ckdczu.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
						<a href="/store/best/3">
							<figure>
								<figcaption>
									<div style="text-align: center; line-height: 5;">
										<span style="font-size: 30px; color: #fff;">일식 베스트 10곳</span>
									</div>
								</figcaption>
							</figure>
					</a>
					</li>
					<li
						style="display: inline-block; margin: 15; width: 45%; height: 260px; background-size: 500px; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/-x08y8zjwpcdu5d-.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
						<div
							style="display: inline-block; position: absolute; width: 39%; height: 260px; background-color: #000; opacity: 0.8; padding:5% 12%;">
							<a href="/store/moreBest"
						style="display: inline-block; position: absolute; color: #fff; font-size: 30px; z-index: 5;">리스트
							더보기 </a>	
						</div>
						<a>
							<figure style="margin:20;">
								<figcaption>
									<div style="text-align: center; line-height: 5;">
										<span style="font-size: 30px; color: #fff;">서울시 추천 베스트</span>
									</div>
								</figcaption>
							</figure>
					</a>
					</li>
				</ul>
			</div>
		</div>
		<hr />

		<!-- Store Row -->
		<span style="font-size: 25px; font-weight: 600;">서울시 추천 리스트</span>
		<div class="region" style="display: inline-block; float: right; margin-right: 5%;">
			<nav class="nav nav-inline">
				<div class="regionNav" style="display:inline-block;">
					<button style="color:#16a085">전체</button>
					<button>강북구</button>
					<button>강남구</button>
					<button>마포구</button>
					<button>종로구</button>
				</div>
				<div class="regionMore">
					<button class="regionMorebtn">
						더보기 <span class="glyphicon glyphicon-chevron-right" style="font-size: 13px; margin-left: 1px;"></span>
					</button>
					<div id="myDropdown" class="regionMore-content" style="bacground-color:#fff;">
						<a>강동구</a><a>강서구</a><a>관악구</a> 
						<a>광진구</a><a>구로구</a><a>금천구</a> 
						<a>노원구</a><a>도봉구</a><a>동대문구</a>
						<a>동작구</a><a>마포구</a><a>서대문구</a> 
						<a>서초구</a><a>성동구</a><a>성북구</a> 
						<a>송파구</a><a>양천구</a><a>영등포구</a> 
						<a>용산구</a><a>은평구</a><a>중구</a><a>중랑구</a>
					</div>
				</div>
			</nav>
		</div>
		<div id="regionContent" class="nav-content">
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
								<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;"></span>
								<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
								<span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>
								<span style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<br />
</div>

<div class="visible-xs">
	<div style="height: 55px;"></div>
	<header id="mb_header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="navbar-header">
				<a class="navbar-brand" href="/" style="color: #ffffff;">GS</a>
				<form id="mb_searchFrm" class="navbar-form navbar-left" action=""
					style="display: inline-block; width: 65%;">
					<div class="form-group" style="width: 110%">
						<input type="text" id="mb_searchTxt" name="searchText"
							class="form-control" placeholder="Search">
					</div>
				</form>
				<span class="openbtn">&#9776;</span>
			</div>
		</nav>
	</header>

	<img id="mbMainImage"
		style="width: 100%; height: 300px; background-image: url(https://scloud.pstatic.net/20160405_149/1459823688590GWVfp_JPEG/01_main_top_1920x630_02.jpg); background-size: 1000px;" />
	<br />
	<br />
	
	<div>
		<span style="font-size: 25px; font-weight: 600; margin:2%;">식당 추천 리스트</span>
		<div class="bestList">
			<ul style="list-style: none; padding: 0;">
				<li
					style="display: inline-block; margin: 2%; width: 96%; height: 220px; background-size: 100%; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/eexfpmvgj6iq-m2m.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg');">
					<a href="/store/best/1">
						<figure>
							<figcaption>
								<div style="text-align: center; line-height: 5;">
									<span style="font-size: 30px; color: #fff;">한식 베스트 10곳</span>
								</div>
							</figcaption>
						</figure>
				</a>
				</li>
				<li
					style="display: inline-block; margin: 2%; width: 96%; height: 220px; background-size: 100%; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/184699_1425200192391'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
					<a href="/store/best/2">
						<figure>
							<figcaption>
								<div style="text-align: center; line-height: 5;">
									<span style="font-size: 30px; color: #fff;">중식 베스트 10곳</span>
								</div>
							</figcaption>
						</figure>
				</a>
				</li>

				<li
					style="display: inline-block; margin: 2%; width: 96%; height: 220px; background-size: 100%; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/ayrwtxnvv7ckdczu.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
					<a href="/store/best/3">
						<figure>
							<figcaption>
								<div style="text-align: center; line-height: 5;">
									<span style="font-size: 30px; color: #fff;">일식 베스트 10곳</span>
								</div>
							</figcaption>
						</figure>
				</a>
				</li>
				<li
					style="display: inline-block; margin: 2%; width: 96%; height: 220px; background-size: 100%; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/-x08y8zjwpcdu5d-.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
					<a href="/store/moreBest"
					style="display: inline-block; position: absolute; color: #fff; font-size: 30px; z-index: 5; margin: 12% 30%;">리스트
						더보기 </a>
					<div
						style="display: inline-block; position: absolute; width: 96%; height: 220px; background-color: #000; opacity: 0.8;"></div>
					<a>
						<figure>
							<figcaption>
								<div style="text-align: center; line-height: 5;">
									<span style="font-size: 30px; color: #fff;">서울시 추천 베스트</span>
								</div>
							</figcaption>
						</figure>
				</a>
				</li>
			</ul>
		</div>
		<hr />
		<ul class="tabs">
			<li class="active" rel="tab1">추천순</li>
			<li rel="tab2">좋아요순</li>
		</ul>
		<div class="tab_container">
			<!-- #tab1 -->
			<div id="tab1" class="tab_content">
				<div class="container">
					<!-- Store Row -->
					<div class="row">
						<c:forEach items="${store }" var="storeList" varStatus="i">
							<div class="mb_storeItem" data-id="${storeList.sh_id }"
								style="width: 45%;">
								<div id="mb_storeImg">
									<img src="${storeList.sh_photo }"
										onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
										alt="storeImage" style="width: 100% height: 218px;" />
								</div>
								<div id="mb_storeContent">
									<span id="mb_storeName"><b>${storeList.sh_name }</b></span>
									<div id="mb_likeShowDiv"
										style="float: right; margin-right: 5px; bottom: 0; font-size: 15px;">
										<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;"></span>
										<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
									</div>
									<p>${localList[i.index] }- ${storeList.induty_code_se_name }</p>
								</div>
							</div>
						</c:forEach>
						<br />
					</div>
				</div>
			</div>
			<!-- #tab2 -->
			<div id="tab2" class="tab_content">
				<div class="container">
					<!-- Store Row -->
					<div class="row">
						<c:forEach items="${likeList }" var="likeList" varStatus="i">
							<div class="mb_storeItem" data-id="${likeList.sh_id }"
								style="width: 45%;">
								<div id="mb_storeImg">
									<img src="${likeList.sh_photo }"
										onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
										alt="storeImage" style="width: 100%; height: 218px;" />
								</div>
								<div id="mb_storeContent">
									<span id="mb_storeName"><b>${likeList.sh_name }</b></span>
									<div id="mb_likeShowDiv"
										style="float: right; margin-right: 5px; bottom: 0; font-size: 15px;">
										<span class="glyphicon glyphicon-heart-empty"
											style="margin: 0;"></span> <span
											style="color: #16a085; margin-left: 4px;">${likeList.sh_like }</span>
									</div>
									<p>${localList[i.index] }- ${likeList.induty_code_se_name }</p>
								</div>
							</div>
						</c:forEach>
						<br />
					</div>
				</div>
			</div>
		</div>
		<div style="height: 910px;"></div>
	</div>
</div>