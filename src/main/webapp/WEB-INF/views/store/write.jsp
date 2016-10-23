<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/resources/se2/init.js" />"></script>
<script src="<c:url value="/resources/se2/js/HuskyEZCreator.js" />"></script>

<link rel="stylesheet"
	href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"
	type="text/css">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/common.css"/>">

<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">



 <div class="container">
	<form role="form" method="post">
	<input type="hidden" name="sh_id" value="${store.sh_id}">
	<input type="hidden" name="mid" value="1"> 
		<div class="contentDiv">
		 	<textarea id="txtContent" class="smarteditor2" name="rcontent" rows="30" style="width:100%;"></textarea>
		</div>
		<div class="buttonDiv">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>
</div>
 
