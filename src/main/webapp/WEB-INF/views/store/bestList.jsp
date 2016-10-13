<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/dist/css/skins/_all-skins.min.css"/>" type="text/css">

<!-- bootstrap js import -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- sidebar menu css -->  
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">

<!-- Common css import -->
<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>" type="text/css">

<!-- searchResult css import  -->
<link rel="stylesheet" href="<c:url value="/resources/css/searchResult.css"/>" type="text/css">

<script type="text/javascript">
	$(document).ready(function(){
		//스토어 상세페이지로 이동
		$(".storeItem").click(function(){
			var detailId = $(this).attr("data-id");
			$(location).attr("href","http://localhost:8080/store/detail?id="+detailId);
		});
		
		//모바일 스토어 상세페이지로 이동
		$(".mb_storeItem").click(function(){
			var detailId = $(this).attr("data-id");
			$(location).attr("href","http://localhost:8080/store/detail?id="+detailId);
		});
		 
		$("#linkUrl span").on("click", function(){
			var currentUrl = "<c:out value="${pageContext.request.scheme}"/>" +
							  '://' +
							  "<c:out value="${pageContext.request.serverName}"/>" + ':' +
							  "<c:out value="${pageContext.request.serverPort}"/>" +
							  "<c:out value="${pageContext.request.contextPath}"/>" + 
							  "<c:out value="${requestScope['javax.servlet.forward.servlet_path']}"/>";
			
			var IE = (document.all) ? true : false;
	        if (IE) {
	            window.clipboardData.setData("Text", currentUrl);
	            alert("이 글의 단축url이 클립보드에 복사되었습니다.");
	        }else{
	        	var person = prompt("이 글의 단축url입니다. Ctrl+C를 눌러 클립보드로 복사하세요.", currentUrl);
	        	/* //승인 버튼을 눌렀을 때 
				if (person != null && person != "") {
					//clipboardData.setData("Text", currentUrl);
				
				} */		
	        }
		});

		$(".stItem").on("click",function(){
			var detailId = $(this).attr("data-id");
			$(location).attr("href","http://localhost:8080/store/detail?id="+detailId);
		});
		$(".stItem #detailStore").on("click",function(){
			var detailId = $(this).attr("data-id");
			$(location).attr("href","http://localhost:8080/store/detail?id="+detailId);
		});
	});
	</script>
	<style>
			#linkUrl span:hover{
				cursor: pointer;
			}
		    #detailStore:hover{
				cursor:pointer;
				color:#16a085;
			}
			.stItem h4:hover{
				cursor:pointer;
				color:#16a085;
			}
			
	</style>
<div class="hidden-xs">
	<div style="width:1300px; height:100%; background-size:100%; background-image: url(https://scloud.pstatic.net/20160901_105/1472693529319VGBIU_JPEG/160901_curation_thumb.jpeg?type=f1158_367)"></div>
	<div class="container" style="width: 100%; height: 200px; border-bottom:1px solid #EAEAEA;">
		<h3 style="margin-top: 4%;  font-size: 45px; text-align:center;">
			<strong style="color: #6d3afb;">${cate} 베스트 </strong>
		</h3>
	</div>
		<div style="width:100%; background-color: #ffffff;">
			<br/>
			<div class="container">
				<!-- Store Row -->
				<div class="row">
						<c:forEach items="${store }" var="storeList" varStatus="i">
							<div class="stItem" data-id="${storeList.sh_id }"  style="padding:10px;">
								<div class="row">
									<div class="col-md-3" id="stImg">
											<img src="${storeList.sh_photo }"
												onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
												alt="storeImage"  style="width:250px;height:250px;"/>
										</div>
										<div class="col-md-6" id="stContent" style="height:250px;">
											<h4 style="display:inline-block;">${storeList.sh_name }</h4>
											
											<div id="likeShowDiv" style="display:inline-block; margin-left: 1%; font-size: 15px;">
												<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" ></span>
												<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
												<span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>
												<span style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
											</div>
											<p><b>${localList[i.index] }</b> - ${storeList.induty_code_se_name }</p>
											
											<div class="review">
						                    	<!-- Post -->
								                <div class="post clearfix">
								                  <div class="user-block">
								                    <img class="img-circle img-bordered-sm" src="<c:url value="/resources/img/iseoul.jpg"/>" alt="User Image" style="width:90px;height:90px;"/>
								                    
								                    <div style="display:inline-block;margin-left: 10;">
									                    <span class="username" style="margin:0;">
									                          <a href="#">글쓴이</a>
									                    </span>
									                    <span class="description" style="margin:0;">날짜</span>
									                  	<p>리뷰내용 </p>
									                 </div>
								                  </div>
								                </div>
								                <!-- /.post -->
								           </div>	
								           									
										   <span id="detailStore" style="font-weight:600;float:right">${storeList.sh_name } 더보기<span class="glyphicon glyphicon-chevron-right"></span></span>									
									</div>
								</div>
							</div><hr style="width:100%;"/>
						</c:forEach>
						<br />
					</div>

					<div id="copyUrl">
						<div id="linkUrl" style="margin:5px 20px 20px 100px;text-align:center;display:inline-block;border:2px solid #2F9D27;border-radius:20px;width:100px; height:45px;">
							<span style="font-size:20px; font-weight:600; color:#2F9D27">공유하기</span>
						</div>
					</div>
					
				<hr />
			</div>
		</div>	
	</div>

<div class="visible-xs">
	<div class="container" style="width: 100%; height: 100px; border-bottom:1px solid #EAEAEA;">
		<h3 style="margin-top: 6%;  font-size: 25px; text-align:center;">
			<strong style="color: #6d3afb;">${cate} 베스트 10곳  </strong>
		</h3>
	</div>
		<div style="width:100%; background-color: #ffffff;">
			<div class="container">
				<!-- Store Row -->
				<c:forEach items="${store }" var="storeList" varStatus="i">
							<div class="stItem" data-id="${storeList.sh_id }"  style="padding:10px; width:99%;height:45%;">
								<div class="row">
									<div class="col-md-3" id="stImg">
											<img src="${storeList.sh_photo }"
												onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
												alt="storeImage"  style="width:100%;height:180px;"/>
										</div>
										<div class="col-md-6" id="stContent">
											<h4 style="font-size:20px; display:inline-block; margin:0;">${storeList.sh_name }</h4>
											
											<div id="likeShowDiv" style="display:inline-block; margin-left: 1%; font-size: 15px;">
												<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" ></span>
												<span style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
												<span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>
												<span style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
											</div>
											<p style="font-size:13px;margin-left:10;"><b>${localList[i.index] }</b> - ${storeList.induty_code_se_name }</p>
											
											<div class="review">
						                    	<!-- Post -->
								                <div class="post clearfix">
								                  <div class="user-block">
								                    <img class="img-circle img-bordered-sm" src="<c:url value="/resources/img/iseoul.jpg"/>" alt="User Image" style="width:10%;"/>
								                    
								                    <div style="display:inline-block;margin-left: 10;">
									                    <span class="username" style="margin:0;font-size:13;">
									                          <a href="#">글쓴이</a>
									                    </span>
									                    <span class="description" style="margin:0;font-size:13;">날짜</span>
									                  	<p style="font-size:15;">리뷰내용 </p>
									                 </div>
								                  </div>
								                </div>
								                <!-- /.post -->
								           </div>	
								           									
										   <span id="detailStore" style="font-size:13px;font-weight:600;float:right">${storeList.sh_name } 더보기<span class="glyphicon glyphicon-chevron-right"></span></span>									
									</div>
								</div>
							</div><hr style="width:100%;"/>
						</c:forEach>
			</div>
		</div>
</div>