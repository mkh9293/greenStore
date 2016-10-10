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

<style>
/*   	.navbar-header{
		background-color: #1ABC9c;
		width: 100%;
	}  */
	.navbar-brand {
		font-family : SpoquHanSans-Reqular, sans-serif;
		font-size: 25px;
	} 
	.col-md-12{
		margin-top: 80px;
	}

	.box-title {
		padding: 5px;
	}
</style>

<jsp:include page="include/sideMenu.jsp"/>

<div id="mainImage">
	<div>
		<div id="searchKeyward">
			<a id="location">전체지역 </a><span>에 있는 </span><br /> 
			<span>서울시에서 추천하는 </span><a id="category">전체유형</a>
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
	<br/>
<div class="container">
		<div>
			<span style="font-size:25px;font-weight:600;">식당 추천 리스트</span>
			<div class="bestList">
				<ul style="list-style:none;">
					<li style="display: inline-block; margin:15; width:500px; height:260px; background-size: 500px; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/eexfpmvgj6iq-m2m.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg');">
						<a href="/store/food/1">
							<figure>
								<figcaption>
									<div style="text-align:center;line-height:5;">
										<span style="font-size:30px;color:#fff;">한식 베스트 10곳</span>
									</div>
								</figcaption>
							</figure>
						</a>
					</li>
					<li style="display: inline-block; margin:15; width:500px; height:260px; background-size: 500px; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/184699_1425200192391'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
						<a href="/store/food/2">
							<figure>
								<figcaption>
									<div style="text-align:center;line-height:5;">
										<span style="font-size:30px;color:#fff;">중식 베스트 10곳</span>
									</div>
								</figcaption>
							</figure>
						</a>
					</li>
					
					<li style="display: inline-block; margin:15; width:500px; height:260px; background-size: 500px; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/ayrwtxnvv7ckdczu.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
						<a href="/store/food/3">
							<figure>
								<figcaption>
									<div style="text-align:center;line-height:5;">
										<span style="font-size:30px;color:#fff;">일식 베스트 10곳</span>
									</div>
								</figcaption>
							</figure>
						</a>
					</li>
					<li style="display: inline-block; margin:15; width:500px; height:260px; background-size: 500px; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/-x08y8zjwpcdu5d-.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
						<a href="/store/bestFood" style="display:inline-block; position:absolute; color:#fff; font-size:30px; z-index:5; margin:7% 13%;">리스트 더보기 </a>
						<div style="display:inline-block; position:absolute; width:500px; height:260px;background-color:#000; opacity:0.8;"></div>
						<a>
							<figure>
								<figcaption>
									<div style="text-align:center;line-height:5;">
										<span style="font-size:30px;color:#fff;">서울시 추천 베스트</span>
									</div>
								</figcaption>
							</figure>
						</a>
					</li>
				</ul>
			</div>
		</div><hr/>
		
		<!-- Store Row -->
		<span style="font-size:25px;font-weight:600;">서울시 추천 리스트</span>
		<div class="region" style="display:inline-block; float:right; margin-right:5%;">
			<nav class="nav nav-inline">
			  <a class="nav-link active" rel="regionTab1" style="margin:20;">전체</a>
			  <a class="nav-link"  rel="regionTab2" style="margin:20; color:#A6A6A6;">강북구</a>
			  <a class="nav-link"  rel="regionTab3" style="margin:20; color:#A6A6A6;">강남구</a>
			  <a class="nav-link"  rel="regionTab4" style="margin:20; color:#A6A6A6;">마포구</a>
			  <a class="nav-link"  rel="regionTab5" style="margin:20; color:#A6A6A6;">종로구</a>
			  <a class="nav-link"  href="/store/listAll" id="regionMore" style="margin:20;">더보기 <span class="glyphicon glyphicon-chevron-right" style="font-size:13px;margin-left:1px;"></span></a>
			</nav>
		</div>
		<div class="nav-contents">
				<div id="regionTab1" class="nav-content">
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
											<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" ></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
											<span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
										</div>
									</div>
								</div>
							</c:forEach>
							<br />
						</div>
				</div>
				
				<div id="regionTab2" class="nav-content">
					<div class="row">
							<c:forEach items="${region1 }" var="storeList" varStatus="i">
								<div class="storeItem" data-id="${storeList.sh_id }">
									<div id="storeImg">
										<img src="${storeList.sh_photo }"
											onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
											alt="storeImage"/>
									</div>
									<div id="storeContent">
										<h4>${storeList.sh_name }</h4>
										<p>
											<b>${regionLocal[0] }</b> - ${storeList.induty_code_se_name }
										</p>
										<span style="color: #16a085;">${storeList.price }~ </span><span
											style="font-size: 13px;">원</span> <span
											style="font-size: 13px; color: #9b9b9b;">/${storeList.menu }
										</span>
					
										<div id="likeShowDiv"
											style="float: right; margin-right: 15px; bottom: 0; font-size: 15px;">
											<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" ></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
											<span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
										</div>
									</div>
								</div>
							</c:forEach>
							<br />
						</div>
				</div>
				
				<div id="regionTab3" class="nav-content">
					<div class="row">
							<c:forEach items="${region2 }" var="storeList" varStatus="i">
								<div class="storeItem" data-id="${storeList.sh_id }">
									<div id="storeImg">
										<img src="${storeList.sh_photo }"
											onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
											alt="storeImage"/>
									</div>
									<div id="storeContent">
										<h4>${storeList.sh_name }</h4>
										<p>
											<b>${regionLocal[1] }</b> - ${storeList.induty_code_se_name }
										</p>
										<span style="color: #16a085;">${storeList.price }~ </span><span
											style="font-size: 13px;">원</span> <span
											style="font-size: 13px; color: #9b9b9b;">/${storeList.menu }
										</span>
					
										<div id="likeShowDiv"
											style="float: right; margin-right: 15px; bottom: 0; font-size: 15px;">
											<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" ></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
											<span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
										</div>
									</div>
								</div>
							</c:forEach>
							<br />
						</div>
				</div>
				
				<div id="regionTab4" class="nav-content">
					<div class="row">
							<c:forEach items="${region3 }" var="storeList" varStatus="i">
								<div class="storeItem" data-id="${storeList.sh_id }">
									<div id="storeImg">
										<img src="${storeList.sh_photo }"
											onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
											alt="storeImage"/>
									</div>
									<div id="storeContent">
										<h4>${storeList.sh_name }</h4>
										<p>
											<b>${regionLocal[2] }</b> - ${storeList.induty_code_se_name }
										</p>
										<span style="color: #16a085;">${storeList.price }~ </span><span
											style="font-size: 13px;">원</span> <span
											style="font-size: 13px; color: #9b9b9b;">/${storeList.menu }
										</span>
					
										<div id="likeShowDiv"
											style="float: right; margin-right: 15px; bottom: 0; font-size: 15px;">
											<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" ></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
											<span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
										</div>
									</div>
								</div>
							</c:forEach>
							<br />
						</div>
				</div>
				
				<div id="regionTab5" class="nav-content">
					<div class="row">
							<c:forEach items="${region4 }" var="storeList" varStatus="i">
								<div class="storeItem" data-id="${storeList.sh_id }">
									<div id="storeImg">
										<img src="${storeList.sh_photo }"
											onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
											alt="storeImage"/>
									</div>
									<div id="storeContent">
										<h4>${storeList.sh_name }</h4>
										<p>
											<b>${regionLocal[3] }</b> - ${storeList.induty_code_se_name }
										</p>
										<span style="color: #16a085;">${storeList.price }~ </span><span
											style="font-size: 13px;">원</span> <span
											style="font-size: 13px; color: #9b9b9b;">/${storeList.menu }
										</span>
					
										<div id="likeShowDiv"
											style="float: right; margin-right: 15px; bottom: 0; font-size: 15px;">
											<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" ></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
											<span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>
											<span style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
										</div>
									</div>
								</div>
							</c:forEach>
							<br />
						</div>
				</div>
			</div>
		
</div>
<br/>
<div class="visible-xs">
	
	<div style="height:55px;"></div>
	<header id="mb_header">
		<nav class="navbar navbar-default navbar-fixed-top">
				<div class="navbar-header">
					<a class="navbar-brand" href="#" style="color: #ffffff;">GS</a>
					<form id="mb_searchFrm" class="navbar-form navbar-left" action="" style="display:inline-block;width:65%;">
						<div class="form-group" style="width:110%">
							<input type="text" id="mb_searchTxt" name="searchText" class="form-control" placeholder="Search">
						</div>
					</form>
					<span class="openbtn">&#9776;</span>
			</div>
		</nav>
	</header>
	
	<img id="mbMainImage" style="width: 100%; height: 300px; 
	background-image: url(https://scloud.pstatic.net/20160405_149/1459823688590GWVfp_JPEG/01_main_top_1920x630_02.jpg);
	background-size:1000px;"/>
	<br /><br/>
	
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
						<div class="mb_storeItem" data-id="${storeList.sh_id }" style="width: 45%;">
							<div id="mb_storeImg">
								<img src="${storeList.sh_photo }"
									onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
									alt="storeImage" style="width: 100% height: 218px;"/>
							</div>
							<div id="mb_storeContent">
								<span id="mb_storeName"><b>${storeList.sh_name }</b></span>
								<div id="mb_likeShowDiv"
									style="float: right; margin-right: 5px; bottom: 0; font-size: 15px;">
									<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" ></span>
									<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
								</div>
								<p>${localList[i.index] } - ${storeList.induty_code_se_name }</p>
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
						<div class="mb_storeItem" data-id="${likeList.sh_id }" style="width: 45%;">
							<div id="mb_storeImg">
								<img src="${likeList.sh_photo }"
									onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
									alt="storeImage" style="width: 100%; height: 218px;"/>
							</div>
							<div id="mb_storeContent">
								<span id="mb_storeName"><b>${likeList.sh_name }</b></span>
								<div id="mb_likeShowDiv"
									style="float: right; margin-right: 5px; bottom: 0; font-size: 15px;">
									<span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>
							<span style="color: #16a085; margin-left: 4px;">${likeList.sh_like }</span>
								</div>
								<p>${localList[i.index] } - ${likeList.induty_code_se_name }</p>
							</div>
						</div>
					</c:forEach>
					<br />
				</div>

			</div>
	</div>
</div><br/> 

</div> 
		
