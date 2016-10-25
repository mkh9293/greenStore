<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- 아이콘 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<!-- 리뷰 css -->
<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" type="text/css">

<!-- sidebar css -->
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">

<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>
<script src="<c:url value="/resources/dist/js/demo.js"/>"></script>

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
          
            <span style="font-size: 25px; font-weight: 600;"><b>${member.mname }</b>님이 <b>좋아요</b>를 누른 스토어</span>
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
				    <c:forEach items="${ storelike }" var="storeLike">
			           <div class="tab-pane" id="timeline">
			           <div class="box box-widget">
			           <div class="box-header with-border">
	 		           <div class="user-block">
	 		           <h4 style="color:#16a085;">${ storeLike.sh_name } 
	 		           <a href="http://localhost:8080/greenStore/store/detail?id=${storeLike.sh_id}">
	 		           <button type="button" class="btn btn-default btn-xs" style="margin-left:20px;">
	 		           <i class="fa fa-share"></i> 이 스토어 더보기</button>
	 		           </a></h4>
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
			           <p></p>
			           </div>
			           </div>
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
      


