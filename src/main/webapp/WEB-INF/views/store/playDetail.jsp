<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지 </title>

<!-- bootstrap css import -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 

<!-- sidebar menu css -->  
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">


<!-- jquery import -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<!-- sidebar menu js -->
<script src="<c:url value="/resources/js/index.js"/>"></script>

<!-- DaumMap css import -->   
<link rel="stylesheet" href="<c:url value="/resources/daumMap.css"/>" type="text/css">

<!-- DaumMap js import  -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=76d0dfe96fd493ccedbee52792d36e32"></script>
		
<script type="text/javascript">

</script>

<style>
	body span{
		font-size:12px;
	}
	.playItem{
		cursor:pointer;
	}
</style>
</head>
<body>
		<img alt="detailImage" src="${playInfo.firstimage }" onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'" style="width:40%;height:300px;display:inline-block;"/>
	    <img alt="detailImage" src="${playInfo.firstimage }" onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'" style="width:40%;height:300px;display:inline-block;"/><br/>
	    
	    <div class="container">
	    		<div class="row">
					<div class="col-md-8" >
						<div class="intro">
	                        <span class="glyphicon glyphicon-circle-arrow-right" /><label style="margin-right:20px;">상호명: </label><span style="text-decoration:underline;">${playInfo.title }</span><br/>
	                        <span class="glyphicon glyphicon-circle-arrow-right"/><label style="margin-right:20px;">전화번호: </label><span>${playInfo.tel }</span><br/>
                    	    <span class="glyphicon glyphicon-circle-arrow-right"/><label style="margin-right:20px;">소개: </label><br/><span>${playInfo.overview }</span><br/>
                    	</div>
					</div>
			</div><hr/>
       </div>   
</body>
</html>