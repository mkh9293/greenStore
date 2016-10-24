<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/resources/se/js/jindo.min.js" />"></script>
<script src="<c:url value="/resources/se2/js/HuskyEZCreator.js" />"></script> 
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">

<style type="text/css">
	.row {
		margin-top:50px;
	}
	
</style>
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
				<textarea id="ncontent"  name="ncontent" rows="30" style="width:100%;" >${notice.ncontent}</textarea>
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
<script type="text/javascript">
var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: document.getElementById('ncontent'), 
	sSkinURI: "../resources/se/SmartEditor2Skin.html",  
	fOnAppLoad: function () { 
        
         var ntitle = localStorage.getItem("ntitle");            
         var ncontent = localStorage.getItem("ncontent");       
         document.getElementById("ntitle").value = ntitle;     
         oEditors.getById["ncontent"].exec("PASTE_HTML", [ncontent]); 
     },
     fCreator: "createSEditor2"
 });

var onWrite = function(){
	oEditors.getById["ncontent"].exec("UPDATE_CONTENTS_FIELD", []); 
	
	 var ncontent = document.getElementById("ncontent").value;
	 var title = document.getElementById("ntitle").value;
	 localStorage.setItem("ncontent", ncontent);
	 localStorage.setItem("ntitle", ntitle);             
	 
	var boardWriteForm = document.getElementById("boardWriteForm");  
	boardWriteForm.action ="writeSubmit";			             
	boardWriteForm.submit();  
};

var pasteHTML = function(filename){
	var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/'+filename+'">';
/*     var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/'+filename+'">'; */
    oEditors.getById["ncontent"].exec("PASTE_HTML", [sHTML]);
};
</script>