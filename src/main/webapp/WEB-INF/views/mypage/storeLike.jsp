<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- notice -->
<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>" type="text/css">
<%-- <script src="<c:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"/>"></script> --%>
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>

<script src="<c:url value="/resources/dist/js/demo.js"/>"></script>
<!--  <script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script> -->
<script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>"></script>

<script src="<c:url value="/resources/js/modal.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" type="text/css">

<!-- Home -->
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">


<!-- style -->
<style>
/* 	.navbar-header{
		background-color: #1ABC9c;
		width: 100%;
	}*/
	.row{
		margin-top: 50px;
	}
	.input-group {
		margin-top: 80px;
	}
	.box-title {
		padding: 5px;
	}

</style>
<jsp:include page="../include/menu.jsp"/>
<div class="container">
	<div class="row">
	      <div class="col-md-12">
          <div class="nav-tabs-custom">
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
              
			    <!-- Post -->
			    <c:forEach var="storeLike" items="${ storelike }">
		           <!-- storeLike -->
		           <div class="tab-pane" id="timeline">
		           <div class="box box-widget">
		            <div class="box-header with-border">
 		              <div class="user-block">
 		              <h4>${ storeLike.sh_name } 
 		             <a href="http://localhost:8080/greenStore/store/detail?id=${storeLike.sh_id}"><button type="button" class="btn btn-default btn-xs" style="margin-left:20px;"><i class="fa fa-share"></i> 이 스토어 더보기</button>
 		             </a></h4>
 		              
		                <%-- <img class="img-circle" src="../resources/dist/img/user1-128x128.jpg" alt="User Image">
		                <span class="username"><a href="#">${ storeLike.mname }</a></span> --%>
		              </div> 
		              <div class="box-tools">
<!-- 		                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
		            </div>
		            <div class="box-body">
		            	
		              <img alt="detailImage" src="${storeLike.sh_photo }" style="width:100%;height:400px;"/><br/>
		              <p></p>
		              <table>
                        	<tr>
                        		<th style="width:100px;"><span class="glyphicon glyphicon-circle-arrow-right"/><label>주소: </label></th>
                        		<td><span style="text-decoration:underline;">${ storeLike.sh_addr }</span></td>
                        	</tr>
                        	<tr>
                        		<th style="width:100px;"><span class="glyphicon glyphicon-circle-arrow-right"/><label>전화번호: </label></th>
                        		<td><span>${ storeLike.sh_phone }</span></td>
                        	</tr>
                        </table>
		              <p> </p>

<!-- 		              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> Like</button>
		              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> 이 스토어 더보기</button> -->
		            </div>
		            </div>
		            </div>
		            </div>
		            <!-- /.storeLike -->
                 </c:forEach>
                <!-- /.post -->

                </div>
              </div>
           </div>
        </div>
	</div>
</div>



