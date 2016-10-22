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
		display: inline-block; margin: 20; width: 45%; /* height: 230px; */ background-size: 100%;
	}
	#bestTitle{
		position:absolute; width:100%; top:130;
	}
	#bestTitle h4{
		font-size:50px;color:#fff;
	}
	#bestTitle span{
		font-size:20px;font-weight:600;color:#f47721;text-decoration: underline;
	}
</style>
<div class="hidden-xs">
	<div style="width:100%; height:600px; text-align:center;">
		<img src="<c:url value="/resources/img/o-morelist.jpeg"/>" alt="" style="width:100%; height:100%; opacity:0.9;"/>
		<div id="bestTitle">
			<h4>서울시 추천 리스트</h4>	
			<span>업종별 베스트</span>
		</div>
	</div>
	<div style="width:100%; height:40px;"></div>
	<div style="width: 100%; background-color: #ffffff;">
			<div class="bestList">
					<ul style="list-style: none; margin:0;">
						<li style="height:300px;">
							<a href="/store/best/1">
								<img src="<c:url value="/resources/img/kfood.png"/>" style="width:100%;height:100%;"/>
							</a>
						</li>
						<li style="height:300px;">
							<a href="/store/best/2">
									<img src="<c:url value="/resources/img/cfood.png"/>" style="width:100%;height:100%;"/>
							</a>
						</li>
						<li style="height:300px;">
							<a href="/store/best/3">
								<img src="<c:url value="/resources/img/jfood.png"/>" style="width:100%;height:100%;"/>
							</a>
						</li>
						
						<li style=" height:300px; background-image: url('http://mulga.seoul.go.kr/photo/20151126102205.jpg'), url('http://mulga.seoul.go.kr/photo/20151126102205.jpg')">
							<a href="/store/best/5">
								<figure style="margin:0;">
									<figcaption style="margin:0;">
										<div style="text-align: center; line-height: 9.5;">
											<span style="font-size: 30px; font-weight:600; color: #fff;">미용실 베스트</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</li>
						
						<li style=" height:300px; background-image: url('http://mulga.seoul.go.kr/photo/SDC10302.JPG'), url('http://mulga.seoul.go.kr/photo/SDC10302.JPG')">
							<a href="/store/best/7">
								<figure>
									<figcaption>
										<div style="text-align: center; line-height: 10;">
											<span style="font-size: 30px; font-weight:600; color: #fff;">세탁소 베스트</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</li>
						
						<li style="height:300px;  background-size: 100%; background-image: url('http://mulga.seoul.go.kr/photo/20111104140652.jpg'), url('http://mulga.seoul.go.kr/photo/20111104140652.jpg')">
							<a href="/store/best/8">
								<figure>
									<figcaption>
										<div style="text-align: center; line-height: 10;">
											<span style="font-size: 30px; font-weight:600; color: #fff;">숙박 베스트</span>
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
	<div style="width:100%; height:110px;">
		<h3 style="margin-top: 7%;  font-size: 30; text-align:center;">
			<strong style="color: #16a085;">서울시 추천 리스트 </strong>
			<span style="display:block; font-size:15;text-decoration:underline;margin-top:2%;color:#f47721;">업종별 베스트</span>
		</h3>
	</div>
	<div style="width: 100%; background-color: #ffffff;">
			<div class="bestList">
					<ul style="list-style: none; margin:0; padding:0;">
						<li style="display: inline-block; margin: 2%; width: 96%; height: 270px;">
							<a href="/store/best/1">
								<img src="<c:url value="/resources/img/kfood.png"/>" style="width:100%;height:100%;"/>
							</a>
						</li>
						<li
							style="display: inline-block; margin: 2%; width: 96%; height: 270px;">
							<a href="/store/best/2">
									<img src="<c:url value="/resources/img/cfood.png"/>" style="width:100%;height:100%;"/>
							</a>
						</li>

						<li style="display: inline-block; margin: 2%; width: 96%; height: 270px;">
							<a href="/store/best/3">
								<img src="<c:url value="/resources/img/jfood.png"/>" style="width:100%;height:100%;"/>
							</a>
						</li>
						
						<li style="display: inline-block; margin: 2%; width: 96%; height: 270px; background-image: url('http://mulga.seoul.go.kr/photo/20151126102205.jpg'), url('http://mulga.seoul.go.kr/photo/20151126102205.jpg')">
							<a href="/store/best/5">
								<figure>
									<figcaption>
										<div style="text-align: center; line-height:8;">
											<span style="font-size: 30px;font-weight:600;color: #fff;">미용실 베스트</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</li>
						
						<li style="display: inline-block; margin: 2%; width: 96%; height: 270px; background-image: url('http://mulga.seoul.go.kr/photo/SDC10302.JPG'), url('http://mulga.seoul.go.kr/photo/SDC10302.JPG')">
							<a href="/store/best/7">
								<figure>
									<figcaption>
										<div style="text-align: center; line-height: 8;">
											<span style="font-size: 30px; font-weight:600;color: #fff;">세탁소 베스트</span>
										</div>
									</figcaption>
								</figure>
							</a>
						</li>
						
						
						<li style="display: inline-block; margin: 2%; width: 96%; height: 270px; background-size: 100%; background-image: url('http://mulga.seoul.go.kr/photo/20111104140652.jpg'), url('http://mulga.seoul.go.kr/photo/20111104140652.jpg')">
							<a href="/store/best/8">
								<figure>
									<figcaption>
										<div style="text-align: center; line-height: 8;">
											<span style="font-size: 30px; font-weight:600; color: #fff;">숙박 베스트</span>
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