<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/resources/se2/init.js" />"></script>
<script src="<c:url value="/resources/se2/js/HuskyEZCreator.js" />"></script> 

<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">

<style type="text/css">

	.container {
		margin-top:50px;
	}
	
</style>

<div class="container">
	<div class="row">
		<div class="col-md-12">
 			<form role="form" method="post">
				<div>
					<label style="font-size: 18px;"></label>
					<input type="text" name="ntitle" style="width: 100%;" />
				</div>
				<div class="contentDiv">
					<textarea id="txtContent" class="smarteditor2" name="ncontent" rows="30" style="width:100%;"></textarea>
				</div>
				<div class="buttonDiv">
					<button type="submit" class="btn btn-primary">글쓰기</button>
				</div>
			</form> 
		</div>
	</div>
</div> 