<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- 리뷰 js import -->
<script src="<c:url value="/resources/js/rv.js"/>"></script>


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
<script type="text/javascript">
	var session = "<c:out value="${member}"/>";
	
	$(document).ready(function(){
		$(".link-black").on("click",function(){
			var likeBtn = $(this).parent().find("#isLike");//나중에 디비에서 받아야된다.
			var rk = $(this).parent().attr("data-id");
			var mk = "<c:out value="${member.mkey}"/>";
			
			if(session==null || session==''){
				var maskHeight = $(document).height(); 
				$('#myModal1').css({'height':maskHeight,'display':'block'});  
			}else{
				if(likeBtn.val() == 0){
		        	$("#rvLike").css("color","#1abc9c");
		            
		            $.ajax({
		            	url:"http://localhost:8080/greenStore/json/rvlikePlus",
		            	data:{"rk":rk,"mk":mk},
		            	method:"post",
		            	success:function(data){
		            		$.each(data, function(key, value){
		            			alert("좋아요를 눌렀습니다.");
		            		});
		            		likeBtn.val(1);
		            	}
		            });
		        }
		        else{
		        	$("#rvLike").css("color","#BDBDBD");
		            
		            $.ajax({
		            	url:"http://localhost:8080/greenStore/json/rvlikeMin",
		            	data:{"rk":rk,"mk":mk},
		            	method:"post",
		            	success:function(data){
		            		$.each(data, function(key, value){
		            			alert("좋아요를 취소했습니다.");
		    				});
		            		likeBtn.val(0);
		            	}
		            });
		        }
			}
		});
		
		$("#loginCancel").on("click",function(){
			$("#myModal1").css("display","none");
		});
		
		$("#myModal1 .close").on("click",function(){
			$("#myModal1").css("display","none");
		});
		
		

	});
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
<style>
	.row{
		margin-top: 50px;
	}
	.box-title {
		padding: 5px;
	}
	#rvLike:hover{
		cursor:pointer;
	}
	.modal{
		display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	.modal-content {
		top:150;
		left:100;
	    background-color: #fefefe;
	    margin: 1%; /* 15% from the top and centered */
	    padding: 20px;
	    border: 1px solid #888;
	    width: 80%; /* Could be more or less, depending on screen size */
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

			                  	<ul class="list-inline">
				                    <li data-id="${reviewList.rkey }">
				                    <input id="isLike" type="hidden" value="${reviewList.isLike}"/> 
					                     <c:if test="${reviewList.isLike == 0}">
												<a id="rvLike" class="link-black text-sm" style="color:#BDBDBD;"><span class="fa fa-thumbs-o-up margin-r-5"></span>Like</a>
						              	</c:if>
					                    <c:if test="${reviewList.isLike == 1}">
												<a id="rvLike" class="link-black text-sm" style="color:#1abc9c;"><span class="fa fa-thumbs-o-up margin-r-5"></span>Like</a>
						              	</c:if>
						            </li>
			                  	</ul>
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
<!-- Modal -->
		<div class="modal" id="myModal1">
		  <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body" style="text-align:center">
		       	<h2 style="font-size:20px;">로그인 하시면 가고싶은 식당을 편하게 저장해서 내 프로필 페이지에서 볼 수 있어요! :)</h2>
		      </div>
		      <div class="modal-footer" style="text-align:center;">
		        <button type="button" id="loginCancel" class="btn btn-default btn-lg" style="width:30%;">취소</button>
		      	<a class="btn btn-success btn-lg" href="http://localhost:8080/greenStore/oauth/login?snsname=kakao" style="width:30%; margin-left:7%">로그인</a>
		      </div>
		    </div>
		</div>
<!-- end Modal -->