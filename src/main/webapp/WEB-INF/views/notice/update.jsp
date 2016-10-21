<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="<c:url value="/resources/se2/init.js" />"></script>
<script src="<c:url value="/resources/se2/js/HuskyEZCreator.js" />"></script>

<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']"); //role form 인 Element를 가지고 오겠다
		$(".btn-warning").on("click", function() {
			formObj.attr("action", "/greenStore/notice/update")
			formObj.submit();
		});
		$(".btn-danger").on("click", function() {
			self.location = "/skhu/book/listAll";
		});

	})
</script>
<style type="text/css">

	.container {
		margin-top:50px;
	}
</style>

<div class="container">
	<div class="row">
		<div class="col-md-12">
		
		
		<form role="form" method="post">

	<input type="hidden" name="nkey" value="${notice.nkey}">

	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail">Title</label> <input type="text"
				name="ntitle" class="form-control" value="${notice.ntitle}">
		</div>

		<div class="form-group">
			<label for="exampleInputPassword1">Contents</label>
			<textarea id="body" name="ncontent" class="smarteditor2">${notice.ncontent}</textarea>
		</div>
	</div>

	<div class="box-footer">
		<button type="submit" class="btn btn-success">SAVE</button>
		<button type="submit" class="btn btn-danger">CANCLE</button>
	</div>
</form>
<%-- 		<form:form method="post" modelAttribute="notice" enctype="multipart/form-data">
		    <div>
		        <span>제목:</span>
		        <form:input path="title" />
		    </div>
		    <form:textarea path="body" class="smarteditor2" />
		    
		    <
		    <div>
		        <button type="submit" class="btn btn-primary" name="cmd" value="save">
		            <i class="icon-ok icon-white"></i> 저장하기
		        </button>
		        <a href="article.do?id=" class="btn">
		            <i class="icon-ban-circle"></i> 취소
		        </a>
		    </div>
		</form:form> --%>
		
			<%-- <form role="form" method="post">
			<input type="hidden" name="nkey" value="${notice.nkey }">
				<div>
					<label style="font-size: 18px;"></label>
					<input type="text" name="ntitle" value="${ notice.ntitle}" style="width: 100%;" />
				</div>
				<div class="contentDiv">
					<textarea id="txtContent" class="smarteditor2" name="ncontent" rows="30" style="width:100%;">${notice.ncontent}</textarea>
				</div>
				<div class="buttonDiv">
					<button type="submit" class="btn btn-primary">글쓰기</button>
				</div>
			</form> --%>
		</div>
	</div>
</div>