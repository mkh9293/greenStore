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
<script src="<c:url value="/resources/js/home.js"/>"></script>

<!-- style -->
<style>
/*  	.navbar-header{
		background-color: #1ABC9c;
		width: 100%;
	} */
	.navbar-brand {
		font-family : SpoquHanSans-Reqular, sans-serif;
		font-size: 25px;
	} 
	.col-md-12{
		margin-top: 80px;
	}
	.input-group {
		margin-top: 80px;
	}
	.box-title {
		padding: 5px;
	}


</style>
<jsp:include page="../include/sideMenu.jsp"/>

<div class="container">
	      <!-- search form -->
<%--       <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="공지사항을 검색하세요!">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form> --%>
	<!-- Store Row -->
	<div class="row">
		<div class="col-md-12">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">공지사항을 알려드립니다!</h3>
              
             <a href="write" class="btn btn-primary">글작성하기</a>
			<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">글작성하기</button> -->

            </div>
            <!-- /.box-header -->
            <c:forEach var="notice" items="${ list }">
	            <div class="box-body">
	            
	              <div class="box-group" id="accordion">
	                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
	                <div class="panel box box-success">
	                  <div class="box-header with-border">
	                    <h4 class="box-title">
	                      <a data-toggle="collapse" data-parent="#accordion" href="#${ notice.nkey }">
	                        	<%-- <span style="margin-right:10px;"> ${ notice.nkey }번 </span> --%> ${ notice.ntitle }     
	                        	
	                        	<!-- <span style="margin-right:800px;">   -->  
	                        	
	                        	           	
						        <!-- <a href="update" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-cloud-upload"></i></a> -->
						      		<%-- 	<!-- Modal -->
								    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								      <div class="modal-dialog modal-lg">
								        <div class="modal-content">
								          <div class="modal-header">
								            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								            <h4 class="modal-title" id="myModalLabel">공지사항을 수정중입니다.</h4>
								          </div>
								          <div class="modal-body">
						        	        <div class="form-group">
							                  <input type="email" class="form-control" name="ntitle" placeholder="${ notice.ntitle } ">
							                </div>
								            <div id="edit" style="margin-top: 30px;">
								          <p>${ notice.ncontent } 
								      </div>
								          </div>
								          <div class="modal-footer">
								            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								            <button type="submit" class="btn btn-primary">Submit</button>
								          </div>
								        </div>
								      </div>
								    </div>
								    <!--  --> --%>
						      <%-- 
							    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							      <div class="modal-dialog modal-lg">
							        <div class="modal-content">
							          <div class="modal-header">
							            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							            <h4 class="modal-title" id="myModalLabel">공지사항을 수정중입니다.</h4>
							          </div>
							          <div class="modal-body">
					        	        <div class="form-group">
						                  <input type="email" class="form-control" name="ntitle" placeholder="${ notice.ntitle }">
						                </div>
							            <div id="edit" style="margin-top: 30px;">
							          <p>${ notice.ncontent }    
							      </div>
							          </div>
							          <div class="modal-footer">
							            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							            <button type="button" class="btn btn-primary">Save changes</button>
							          </div>
							        </div>
							      </div>
							    </div>
						    <!-- ./modal  --> --%>
									   	
							   <!-- 	</span> -->
					        <div style="font-size:13px; padding-top:10px; color: #9e9e9e;">
	                       		<span class="date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ notice.ndate }" /></span>
							</div>

	                      </a>
	                    </h4> 
    
	                  </div>
	                 
	                  <div id="${ notice.nkey }" class="panel-collapse collapse in">

	                    <div class="box-body">
							${ notice.ncontent }
	                    </div>
							<div class="box-body" style="position:right;">
							 <a data-toggle="collapse" data-parent="#accordion" href="#${ notice.nkey }">글접기</a></p>
							 <a href="update" class="btn btn-primary">글수정하기</a>
							 <a href="remove" class="btn btn-primary">글삭제하기</a> 
	                    </div> 
	                  </div>
	                  
	                </div>
		                      	
	              </div>
	           
	            </div>
            
            </c:forEach>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
	</div>
</div>


