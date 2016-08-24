<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지 </title>
</head>
<body>
	<form action="detail/navi" method="get" id="storeInfo">
		<input type=hidden name="endPointX" value="${pointX }">
		<input type=hidden name="endPointY" value="${pointY }">
		
		<input type=hidden name="sh_id" value="${store.sh_id }">
		<input type=hidden name="sh_name" value="${store.sh_name }">
		<input type=hidden name="sh_photo" value="${store.sh_photo }">
		<input type=hidden name="sh_addr" value="${store.sh_addr }">
		<input type=hidden name="sh_way" value="${store.sh_way }">
		
		<button type="submit" id="naviBtn">지도 </button>
	</form>
	
	<h2>스토어 정보 </h2>
	<div>
		<p>${store.sh_id }</p>
		<p>${store.sh_name }</p>
		<p>${store.sh_addr }</p>
		<p>${store.sh_way }</p>
	</div>
	
	<h2>놀거리 정보 </h2>
	<div>
		<c:forEach items="${playList }" var="play">
			<p>${play.title }</p>
			<p>${play.mapx }</p>
			<p>${play.mapy }</p>
			
			<p>${play.addr1 }</p>
			<p>${play.addr2 }</p>
			<p>${play.readcount }</p>
			<img src="${play.firstimage }" alt="playImage"/>
		</c:forEach>
	</div>	
</body>
</html>