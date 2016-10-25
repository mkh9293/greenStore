<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>" type="text/css">
<script src="<c:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"/>"></script>
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">

<style type="text/css">
	.row {
		margin-top:50px;
	}
</style>

<div class="container">
	<div class="row">
		<div class="col-md-12">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h2 class="box-title" style="margin:20px;">GreenStore 공지사항을 알려드립니다!</h2>
              <c:if test="${not empty member }"> 
              <c:if test="${ member.mname == admin }"> 
              	<a href="http://localhost:8080/greenStore/notice/write" class="btn">글쓰기</a>
			  	</c:if> 
			  </c:if> 
            </div>
            <c:forEach var="notice" items="${ list }">
	            <div class="box-body">
	              <div class="box-group" id="accordion">
	                <div class="panel box box-success">
	                  <div class="box-header with-border">
	                    <h4 class="box-title">
	                      <a data-toggle="collapse" data-parent="#accordion" href="#${ notice.nkey }">
	                        	Q${ notice.nkey }.  ${ notice.ntitle }     
					        <div style="font-size:13px; padding-top:10px; color: #9e9e9e;">
	                       		<span class="date">마지막 수정날짜: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ notice.ndate }" /></span>
							</div>
	                      </a>
	                    </h4> 
	                  </div>
	                  <div id="${ notice.nkey }" class="panel-collapse collapse">
	                    <div class="box-body">
							${ notice.ncontent }
	                    </div>
	                    		<div class="pull-right">
	                    		<c:if test="${not empty member }"> 
	                    		<c:if test="${ member.mname == admin }">
									<a href="update?nkey=${notice.nkey}" class="btn" id="btn-primary"> <i class="icon-list"></i> 수정</a>
									<a href="delete?nkey=${notice.nkey}" class="btn" data-confirm="삭제하시겠습니까?"> <i class="icon-remove"></i>삭제</a>
								 	</c:if>
								</c:if> 
								<a href="listAll" class="btn"> <i class="icon-list"></i> 목록으로</a> 
							</div>
	                  </div>
	                </div>
	              </div>
	            </div>
            </c:forEach>
          </div>
        </div>
	</div>
</div>

