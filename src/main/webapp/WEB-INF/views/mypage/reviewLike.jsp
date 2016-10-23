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

<!-- session -->
<jsp:useBean id="loginBean" class="petBean.LoginInfoBean"/>
<%
	request.setCharacterEncoding("UTF-8");
	String idNum = request.getParameter("idNum");
	String nick="";
	String img="#";
	
	if(idNum!=null){
		loginBean.setId(request.getParameter("idNum"));
		loginBean.setNick(request.getParameter("nickName"));
		loginBean.setImgUrl(request.getParameter("profile_img"));
		session.setAttribute("LOGININFO", loginBean);
	}
	
	loginBean = (petBean.LoginInfoBean)session.getAttribute("LOGININFO");
%>
<!-- ./session -->
<!-- style -->
<style>

	.row {
		margin-top: 50px;
	}
	.input-group {
		margin-top: 80px;
	}
	.box-title {
		padding: 5px;
	}

</style>
<div class="container">
	<div class="row">
	      <div class="col-md-12">
          <div class="nav-tabs-custom">
            <div class="tab-content" style="padding:50px;">
              <div class="active tab-pane" id="activity">
              
			   <!-- Post -->
			    <c:forEach var="reviewLike" items="${ reviewlike }">
                <div class="post clearfix">
                  <div class="user-block">
                  
                   <%= loginBean.getNick() %>님이 좋아요를 누르신 <span style="font-size:25px;"> <a href="http://localhost:8080/greenStore/store/detail?id=${reviewLike.sh_id}">${ reviewLike.sh_name }</a></span> 리뷰입니다.

 		             		</a>
                          <a href="#" class="pull-right btn-box-tool"></a>
                   <!--  <img class="img-circle img-bordered-sm" src="../resources/img/iseoul.jpg" alt="User Image"> -->
                      <!--   <span class="username"> -->
                          <%-- <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ reviewLike.rdate }" />에 <%= loginBean.getNick() %>님이 남기신 ${ reviewLike.sh_name } 리뷰입니다.
                          <a href="http://localhost:8080/greenStore/store/detail?id=${reviewLike.sh_id}"><button type="button" class="btn btn-default btn-xs" style="margin-left:20px;"><i class="fa fa-share"></i> 이 스토어 더보기</button>
 		             		</a>
                          <a href="#" class="pull-right btn-box-tool"></a> --%>
                      <!--   </span> -->
                    <span class="description"></span>
                  </div>
                  <!-- /.user-block -->
                  
                  <p>
                  
                  ${ reviewLike.rcontent }
                  </p>
                  <ul class="list-inline">
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                    </li>
                  </ul>
                </div>
                 </c:forEach>
                <!-- /.post -->
                </div>
              </div>
           </div>
        </div>
	</div>
</div>



