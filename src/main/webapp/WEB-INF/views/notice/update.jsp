<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/resources/se/js/jindo.min.js" />"></script>
<script src="<c:url value="/resources/se/js/HuskyEZCreator.js" />"></script> 

<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<style type="text/css">
	.row {
		margin-top:50px;
	}
	
</style>

<div class="container">
	<div class="row">
		<div class="col-md-12">
		<div class="nav-tabs-custom">
        <div class="tab-content" style="padding:50px;">
        <div class="active tab-pane" id="activity">
			<form role="form" method="post">
			<input type="hidden" name="nkey" value="${notice.nkey}">
				<div>
					<label style="font-size: 18px;"></label>
					<input type="text" name="ntitle" id="ntitle" style="width: 100%;" value="${board.ntitle}"/>
				</div>
				<div class="contentDiv">
				<textarea id="ncontent"  name="ncontent" rows="30" style="width:100%;" >${board.ncontent}</textarea>
				</div>
				<div class="buttonDiv">
				 <button type="submit" class="btn btn-primary"  onclick="onModify()">
		            <i class="icon-ok icon-white"></i> 저장하기
		        </button>
						<a href="listAll" class="btn"> <i class="icon-list"></i> 목록으로</a>
				</div>

			</form>
			</div>
			</div>
			</div>
			
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
        var title = '${board.ntitle}';               
        var contents = '${board.ncontent}';     
        document.getElementById("ntitle").value = title;     
        oEditors.getById["ncontent"].exec("PASTE_HTML", [ncontent]); 
    },
     fCreator: "createSEditor2"
 });

var onModify = function(){
	oEditors.getById["ncontent"].exec("UPDATE_CONTENTS_FIELD", [ ]); 
	var boardWriteForm = document.getElementById("boardWriteForm");  
	boardWriteForm.action ="notice/update";              
	boardWriteForm.submit();  
};

var pasteHTML = function(filename){
	var sHTML = '<img src="/resources/upload/'+filename+'">';
    oEditors.getById["ncontent"].exec("PASTE_HTML", [sHTML]);
};
</script>

<%-- var onWrite = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var boardWriteForm = document.getElementById("boardWriteForm");  
	boardWriteForm.action ="writeSubmit";              
	boardWriteForm.submit();  
};

var onModify = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var boardWriteForm = document.getElementById("boardWriteForm");  
	boardWriteForm.action ="modifySubmit";              
	boardWriteForm.submit();  
};

var pasteHTML = function(filename){
    var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/'+filename+'">';
    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]); --%>