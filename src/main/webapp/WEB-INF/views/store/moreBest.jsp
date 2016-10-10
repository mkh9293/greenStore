<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- bootstrap js import -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- sidebar menu css -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"
	type="text/css">

<!-- Common css import -->
<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>"
	type="text/css">

<!-- searchResult css import  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/searchResult.css"/>" type="text/css">

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<style>
	.bestList ul li{
		display: inline-block; margin: 20; width: 45%; height: 230px; background-size: 100%;
	}

</style>
<div class="hidden-xs">
	<div style="width:100%; height:390px; background-size:100%; background-image: url(https://scloud.pstatic.net/20160804_227/1470286733316zWDy3_JPEG/top_01.jpg?type=f1158_367)">
		<figure style="margin:0;">
			<figcaption>
				<div style="text-align: center; line-height: 3;">
					<span style="font-size: 50px; font-weight:600; color: #fff;">서울시 추천 리스트</span>
					<span style="display:block;font-size: 20px; font-weight:600; color: #FFD014;  text-decoration: underline;">업종별 베스트</span>
				</div>
			</figcaption>
		</figure>
	</div>
	<div style="width:100%; height:40px;"></div>
	<div style="width: 100%; background-color: #ffffff;">
			<div class="bestList">
					<ul style="list-style: none; margin:0;">
						<li style="background-size: 100%; background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/eexfpmvgj6iq-m2m.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg');">
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
							style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/184699_1425200192391'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
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

						<li style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/ayrwtxnvv7ckdczu.jpg'), url('https://d1jrqqyoo3n46w.cloudfront.net/web/resources/e9gxebutnk5mil1k.jpg')">
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
						
						<li style=" background-image: url('http://mulga.seoul.go.kr/photo/20151126102205.jpg'), url('http://mulga.seoul.go.kr/photo/20151126102205.jpg')">
							<a href="/store/best/5">
								<figure>
									<figcaption>
										<div style="text-align: center; line-height: 5;">
											<span style="font-size: 30px; color: #fff;">미용실 베스트</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</li>
						
						<li style=" background-image: url('http://mulga.seoul.go.kr/photo/SDC10302.JPG'), url('http://mulga.seoul.go.kr/photo/SDC10302.JPG')">
							<a href="/store/best/7">
								<figure>
									<figcaption>
										<div style="text-align: center; line-height: 5;">
											<span style="font-size: 30px; color: #fff;">세탁소 베스트</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</li>
						
						<li style="background-size: 100%; background-image: url('http://mulga.seoul.go.kr/photo/20111104140652.jpg'), url('http://mulga.seoul.go.kr/photo/20111104140652.jpg')">
							<a href="/store/best/8">
								<figure>
									<figcaption>
										<div style="text-align: center; line-height: 5;">
											<span style="font-size: 30px; color: #fff;">숙박 베스트</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</li>
					</ul>
			</div>
			<br/>
	</div>
</div>
<div class="visible-xs">
	<div class="container"
		style="width: 100%; height: 100px; border-bottom: 1px solid #EAEAEA;">
		<h3 style="margin-top: 6%; font-size: 25px; text-align: center;">
			<strong style="color: #6d3afb;">${cate} 베스트 10곳 </strong>
		</h3>
	</div>
	<div style="width: 100%; background-color: #ffffff;">
		<div class="container"></div>
	</div>
</div>