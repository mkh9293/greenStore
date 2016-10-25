<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<script src="<c:url value="/resources/js/rv.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>
<script src="<c:url value="/resources/dist/js/demo.js"/>"></script>
<style>
	.row{
		margin-top: 50px;
	}
	.box-title {
		padding: 5px;
	}
</style>
<style>
	.row{
		margin-top: 50px;
	}
	.accordion_sub { display: none; }
	.accordion_banner {
		margin-bottom:20px;
	}
	
</style>
<script type="text/javascript">
    $(document).ready(function() {
        $(".accordion_banner .accordion_title").click(function() {
            if($(this).next("div").is(":visible")){
            $(this).next("div").slideUp("fast");
            } else {
                $(".accordion_banner .accordion_sub").slideUp("fast");
                $(this).next("div").slideToggle("fast");
            }
        });
    });
</script>

<div class="container">
	<div class="row">
	      <div class="col-md-12" >
          <div class="nav-tabs-custom">
          <div class="tab-content" style="padding:50px;">
          <div class="active tab-pane" id="activity">
              
            <span style="font-size: 25px; font-weight: 600;"><b>리뷰 전체보기</b></span>
			<div class="region" style="display: inline-block; float: right; margin-right: 5%;">
				<nav class="nav nav-inline">
					<div class="regionNav" style="display:inline-block;">
						<button style="color:#16a085">전체</button>
					</div>
					<div class="regionMore">
						<button class="regionMorebtn">
							지역별 <span class="glyphicon glyphicon-chevron-right" style="font-size: 13px; margin-left: 1px;"></span>
						</button>
						<div id="myDropdown" class="regionMore-content" style="bacground-color:#fff;">
							<a>전체</a><a>강북구</a><a>강남구</a>
							<a>강동구</a><a>강서구</a><a>관악구</a> 
							<a>광진구</a><a>구로구</a><a>금천구</a> 
							<a>노원구</a><a>도봉구</a><a>동대문구</a>
							<a>동작구</a><a>마포구</a><a>서대문구</a> 
							<a>서초구</a><a>성동구</a><a>성북구</a><a>마포구</a>
							<a>송파구</a><a>양천구</a><a>영등포구</a><a>종로구</a> 
							<a>용산구</a><a>은평구</a><a>중구</a><a>중랑구</a>
						</div>
					</div>
				</nav>
				</div>
				<div id="regionContent" class="nav-content">
					<div class="row">
					    <c:forEach items="${ review }" var="reviewList" >
		                <div class="post clearfix">
		                	<span style="font-size:25px;margin-right:10px;"><a href="http://localhost:8080/greenStore/store/detail?id=${reviewList.sh_id}">${ reviewList.sh_name }</a></span>
		                	<span><i class="fa fa-thumbs-o-up margin-r-5"></i>  ${reviewList.relike}</span>
		                  	<div class="user-block">
		                    <img class="img-circle img-bordered-sm" src="${reviewList.mphoto }"/>
		                        <span class="username">
		                          <a href="#">${ reviewList.mname }</a>
		                          <a href="#" class="pull-right btn-box-tool"></a>
		                        </span>
		                    <span class="description">
		                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ reviewList.rdate }" /></span>
		                   	</div>
		                    <div style="margin-bottom:15px;">
                  			${ reviewList.rcontent }
                  			</div>
		                	</div>
		                 </c:forEach>
                	</div>
               </div>
          </div>
       	  </div>
		  </div>
		  </div> 
	</div>
</div>

