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
		$(".btn-primary").on("click", function() {
			formObj.attr("action", "/greenStore/notice/update");
			formObj.attr("method", "post");
			formObj.submit();

		
		});

	})
</script>
<style type="text/css">

	.row {
		margin-top:50px;
	}
</style>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<form role="form" method="post">
			<input type="hidden" name="nkey" value="${notice.nkey}">
				<div>
					<label style="font-size: 18px;"></label>
					<input type="text" name="ntitle" style="width: 100%;" value="${notice.ntitle}"/>
				</div>
				<div class="contentDiv">
				<textarea id="txtContent"  name="ncontent" class="smarteditor2"  rows="30" style="width:100%;" >${notice.ncontent}</textarea>
				</div>
				<div class="buttonDiv">
				 <button type="submit" class="btn btn-primary" name="cmd" value="save">
		            <i class="icon-ok icon-white"></i> 저장하기
		        </button>
						<a href="listAll" class="btn"> <i class="icon-list"></i> 목록으로</a>
				</div>

			</form>

		</div>
	</div>
</div>