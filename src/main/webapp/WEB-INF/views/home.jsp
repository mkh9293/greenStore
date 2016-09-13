<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
=======

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	
	<!-- bootstrap css import -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
>>>>>>> origin/master

<!-- bootstrap css import -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- sidebar menu css -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"
	type="text/css">

<!-- jQuery UI css import -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">

<!-- jQuery js import -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<!-- jQuery UI js import-->
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<!-- sidebar menu js -->
<script src="<c:url value="/resources/js/index.js"/>"></script>

<!-- bootstrap js import -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
html, body {
	background-color: #f6f6f6;
	font-family: 'NanumBarunGothic';
}

#location, #category, #searchStore, .storeItem :hover {
	cursor: pointer;
}

.storeItem #storeImg {
	overflow: hidden;
}

.storeItem img {
	-webkit-transition: all .3s ease-out;
	-moz-transition: all .3s ease-out;
	-o-transition: all .3s ease-out;
	transition: all .3s ease-out;
}

.storeItem img:hover {
	-moz-transform: scale(1.1);
	-webkit-transform: scale(1.1);
	-o-transform: scale(1.1);
	-ms-transform: scale(1.1);
	transform: scale(1.1);
}

#locationDiv, #locationDiv div, #categoryDiv, #categoryDiv div {
	clear: both;
	display: inline-block;
	height: 30px;
	margin-bottom: 10px;
}

#locationDiv label, #categoryDiv label {
	width: 200px;
	border-radius: 3px;
	border: 1px solid #D1D3D4
}
/* hide input */
#locationDiv input.radio:empty, #categoryDiv input.cateradio:empty {
	margin-left: -999px;
}

/* style label */
#locationDiv input.radio:empty ~ label, #categoryDiv input.cateradio:empty 
	~ label {
	position: relative;
	float: left;
	line-height: 2.5em;
	text-indent: 3.25em;
	margin-top: 2em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

#locationDiv input.radio:empty ~ label:before, #categoryDiv input.cateradio:empty 
	~ label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 2.5em;
	background: #D1D3D4;
	border-radius: 3px 0 0 3px;
}

/* toggle hover */
#locationDiv input.radio:hover:not (:checked ) ~ label:before,
	#categoryDiv input.cateradio:hover:not (:checked ) ~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #C2C2C2;
}

#locationDiv input.radio:hover:not (:checked ) ~ label, #categoryDiv input.cateradio:hover:not
	(:checked ) ~ label {
	color: #888;
}

/* toggle on */
#locationDiv input.radio:checked ~ label:before, #categoryDiv input.cateradio:checked 
	~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #9CE2AE;
	background-color: #4DCB6D;
}

#locationDiv input.radio:checked ~ label, #categoryDiv input.cateradio:checked 
	~ label {
	color: #777;
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 999;
    top: 0;
    right: 0;
    background-color: #F6F6F6;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a :not(1) {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    background-color:#fff;
    color: #000;
    display: block;
    transition: 0.3s
}
.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin: 0;
    padding:0;
    background-color: none;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.navbar-header {
  float: none;
}
.navbar-toggle {
  display: none;
}
.navbar-collapse.collapse {
  display: none!important;
}
.navbar-nav {
  float: none!important;
}
.navbar-nav>li {
  float: none;
}
.navbar-collapse.collapse.in{
  display:none !important;
}

#mask {  
  position:absolute;  
  left:0;
  top:0;
  z-index:9000;  
  background-color:#000;  
  display:none;  
}
</style>

<script type="text/javascript">
		$(document).ready(function(){
			$("#search").click(function(){
				$("#searchDiv").show(200);
				$("#wrapper").hide();
				$("#search").hide();
				$("#searchText").focus();
			});
			
			$("#searchBtn").click(function(){
				var searchText = $("#searchText").val();
				$(location).attr("href","http://localhost:8080/greenStore/store/search/"+searchText);
				
			});
			
			$("#removeBtn").click(function(){
				$("#searchDiv").hide();
				$("#wrapper").show();
				$("#search").show(300);
			});
			
			$("#searchText").focusout(function(){
				setTimeout(function(){
					$("#searchDiv").hide();
					$("#wrapper").show();
					$("#search").show(300);
				},200);
			});
			
			//지역 선택 dialog
			$("#locationDiv").dialog({
			    autoOpen: false,
			    width: 700,
			    resizable:false,
			    show: {
			        duration: 1000
			    },
			    hide: {
			        duration: 1000
			    },
			   
			});
			$("#location").click(function(){
				$("#categoryDiv").dialog("close");
				$("#locationDiv").dialog("open");
			});
			$("#locationBtn").click(function(){
				var choiceLoc = $("input:radio[name='radio']:checked").val();
				
				$("#locationDiv").dialog("close");
				$("#location").text(choiceLoc);
			});
			//지역 선택 dialog 끝 
			
			//카테고리 선택 dialog
			$("#categoryDiv").dialog({
			    autoOpen: false,
			    width: 700,
			    resizable:false,
			    show: {
			        duration: 1000
			    },
			    hide: {
			        duration: 1000
			    }
			});
			$("#category").click(function(){
				$("#locationDiv").dialog("close");
				$("#categoryDiv").dialog("open");
			});
			$("#categoryBtn").click(function(){
				var choiceLoc = $("input:radio[name='cateradio']:checked").parent().children("label").text();
				
				$("#categoryDiv").dialog("close");
				if(choiceLoc == ''){
					$("#category").text("전체유형");
				}else{
					$("#category").text(choiceLoc);
				}
				
				$("#category").attr("value",$("input:radio[name='cateradio']:checked").val());
				
			});
			//카테고리 선택 dialog 끝 
			
			//스토어 상세페이지로 이동
			$(".storeItem").click(function(){
				var detailId = $(this).attr("data-id");
				$(location).attr("href","http://localhost:8080/greenStore/store/detail?id="+detailId);
			});
			
			//조건으로 검색 
			$("#searchStore").click(function(){
				var area = $("#location").text();
				var cate = $("#category").attr("value");
				$(location).attr("href","http://localhost:8080/greenStore/store/search/"+area+"/"+cate);
			});
			
			$("#mainImage").on("mousewheel",function(e){
				$("#header2").hide();
				$("#header").show();
			});
			
			$(".container").on("mousewheel",function(e){
				$("#header").hide();
				$("#header2").show();
			});
			
			$(".openbtn").on("click",function(){
				$(this).css("display","none");
				
				var maskHeight = $(document).height();  
		        var maskWidth = $(window).width();  
		        
		        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		        $('#mask').css({'width':maskWidth,'height':maskHeight,'display':'block','z-index':'980','opacity':'.6','filter':'alpha(opacity=80)'});  
		        
				$("#mySidenav").css("width","360px");
			});
			$(".closebtn").on("click",function(){
				$("#mySidenav").css("width","0px");
				
				$('#mask').css('display','none');
				setTimeout(function(){
					$(".openbtn").css("display","");
				},400);
			});
			$("#mask").on("click",function(){
				$("#mySidenav").css("width","0px");
				
				$('#mask').css('display','none');
				setTimeout(function(){
					$(".openbtn").css("display","");
				},400);
			});
		});
		
	</script>
</head>
<body>
	<div id="mask"></div>
	
	<div id="mySidenav" class="sidenav">
	  <a href="javascript:void(0)" class="closebtn" style="position:absolute; z-index:2;">&times;</a>
	  <div style="width:100%; height:200px; top:0; position:absolute; z-index:1; background-color:#3CC864;"></div>
	  <a href="#">About</a>
	  <a href="#">Services</a>
	  <a href="#">Clients</a>
	  <a href="#">Contact</a>
	</div>
	
	<div id="searchDiv" style="display: none; position: fixed; height: 50px;">
		<input class="form-control" id="searchText" type="text"
			name="searchText" placeholder="검색어를 입력하세요." style="height: 50px;" />
		<div
			style="position: absolute; right: 0; top: 0; margin-top: 10px; margin-right: 4%; font-size: 20px;">
			<span class="glyphicon glyphicon-search" id="searchBtn"
				style="margin-right: 10px;"></span> <span
				class="glyphicon glyphicon-remove" id="removeBtn"></span>
		</div>
	</div>

	<div id="mainImage" style="position: relative;">
		<nav id="header" class="navbar navbar-default navbar-fixed-top"
			style="background: transparent none;">
			  <div class="navbar-header">
			    <a class="navbar-brand" href="#" style="color: #ffffff;">GreenStore</a>
			    <span style="font-size:30px;cursor:pointer; color:#ffffff; float:right; margin-right:5%;" class="openbtn" >&#9776;</span>
			  </div>
		</nav>
		<nav id="header2" class="navbar navbar-default navbar-fixed-top"
			style="display: none; background-color: #16a085; z-index: 990;">
			<div class="navbar-header">
			    <a class="navbar-brand" href="#" style="color: #ffffff;">GreenStore</a>
			    <form class="navbar-form navbar-left" action="" role="search">
					<div class="form-group">
						<input type="text" name="searchText" class="form-control" placeholder="Search">
					</div>
				</form>
			    <span style="font-size:30px;cursor:pointer; color:#ffffff; float:right; margin-right:5%;" class="openbtn" >&#9776;</span>
			  </div>
		</nav>

		<div style="z-index: 20; position: absolute; margin: 10%;">
			<div style="font-size: 35px;" id="searchKeyward">
				<a id="location" style="text-decoration: underline;">전체지역 </a><span
					style="color: #ffffff;">에 있는 </span><br /> <span
					style="color: #ffffff;">서울시에서 추천하는 </span><a id="category"
					style="text-decoration: underline;">전체 유형 </a><span
					style="color: #ffffff;">스토어 </span><br />
				<br />
			</div>
			<div style="color: #FFD014; width: 200px;" id="searchStore">
				<span>위 조건으로 스토어검색 </span><span
					class="glyphicon glyphicon-circle-arrow-right"></span>
			</div>
		</div>
<<<<<<< HEAD
		<img
			style="width: 100%; height: 500px; background-image: url(https://scloud.pstatic.net/20160405_149/1459823688590GWVfp_JPEG/01_main_top_1920x630_02.jpg);" /><br />
	</div>

	<div id="locationDiv" title="공간을 선택해주세요 ">
		<c:forEach items="${areaList }" var="area" varStatus="i">
			<div>
				<input type="radio" class="radio" id="radio${i.index }" name="radio"
					value="${area }"> <label for="radio${i.index }">${area }
				</label>
			</div>
		</c:forEach>
		<br />
		<br />
		<br />
		<button class="btn btn-primary btn-block" id="locationBtn"
			style="background-color: #A566FF">확인</button>
=======
	    
	    <div class="container">
	    <!-- Store Row -->
         <div class="row">
            <c:forEach items="${store }" var="storeList" varStatus="i">
                  	<div class="storeItem" data-id="${storeList.sh_id }" style="display:inline-block; margin:2%; background-color:#ffffff; box-shadow: 1px 1px 2px 3px #ccc;">
	    				<img src="${storeList.sh_photo }" alt="storeImage" width="300px" height="200px"/>
	    				<div style="margin-left:10px;">
	    					<h3 style="font-size:21px;">${storeList.sh_name }</h3>
	    					<p style="font-size:15px;">${storeList.sh_addr }</p>
	    					<p>${storeList.price }</p>
	    				</div>
	    			</div>
	    	</c:forEach><br/>
            <div class="col-md-10" style="margin-left:30px;">
            	<a class="btn btn-primary btn-lg btn-block" href="store/search" >더보기</a>
            </div>
      	</div>
     </div>	
</body>
</html>
<!-- 

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
	<title></title>
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

<a id="kakao-login-btn"></a>
<a href="http://alpha-developers.kakao.com/logout"></a>

   <script type='text/javascript'>
  
   		Kakao.init('4b3b220c10e2e6f8e2cdd525a58d76ea');
   		
   		Kakao.Auth.createLoginButton({
   			container: '#kakao-login-btn',
   			success: function(authObj) {
   				//로그인 성공시 api 호출
   				Kakao.API.request({
   					url: '/v1/user/me',
   					success: function(res){
   						 document.getElementById('status2').innerHTML = 
   					         'Thanks for logging in, ' + res.properties.nickname+ '/' + res.id + '/' + res.properties.thumbnail_image;
   						 //* alert(res.properties.nickname); */
   						 $.ajax({
   							url:'/greenStore/join',
   							type:'post',
   							data:{"mname":res.properties.nickname,"mid":res.id,"mphoto":res.properties.thumbnail_image},
   							success:function(data){
   								alert(data);
   							}
   						 });
   					},
   					fail: function(error){
   						document.getElementById('status2').innerHTML =
   							JSON.stringify(error);
   						/* alert(JSON.stringify(error)); */
   					}
   				});
   			},
   			fail: function(err) {
   				document.getElementById('status2').innerHTML =
						JSON.stringify(err);
   				/* alert(JSON.stringify(err)); */
   			}
   		});
   		
   		
		function ktout(){
			Kakao.Auth.logout(function () {
				setTimeout(function(){
					location.href="http://localhost:8080/greenStore/"
				},1000);
				});
		} 
	</script>
</head>
<body>
	<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1192802990783359',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.7' // use graph api version 2.5
    
  });
  
  FB.Event.subscribe('auth.logout', function(response) {
	    document.location.reload();
	});

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '/' +response.id;
    });
  }
  
</script>
	
	<a id="kakao-login-btn"></a>
	<input type="button" value="logout" onclick="ktout()"/>
	<div id="status2">
>>>>>>> origin/master
	</div>

<<<<<<< HEAD
	<div id="categoryDiv" title="공간 유형을 선택해주세요 ">
		<c:forEach items="${cateMap }" var="category" varStatus="i">
			<div>
				<input type="radio" class="cateradio" id="cateradio${i.index }"
					name="cateradio" value="${category.key }"> <label
					for="cateradio${i.index }">${category.value } </label>
			</div>
		</c:forEach>
		<br />
		<br />
		<br />
		<button class="btn btn-primary btn-block" id="categoryBtn"
			style="background-color: #A566FF">확인</button>
=======
	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
	</fb:login-button>
	<input type="button" value="logout" onclick="FB.logout()"/>
	<a href="#" onclick="FB.logout();">[logout]</a><br>
	<div id="status">
>>>>>>> origin/master
	</div>

<<<<<<< HEAD
	<div class="container">
		<!-- Store Row -->
		<div class="row">
			<c:forEach items="${store }" var="storeList" varStatus="i">
				<div class="storeItem" data-id="${storeList.sh_id }"
					style="display: inline-block; margin: 15px; background-color: #ffffff; box-shadow: 0px 0px 1px 0px #ccc;">
					<div id="storeImg">
						<img src="${storeList.sh_photo }"
							onerror="this.src='<c:url value="/resources/img/iseoul.jpg"/>'"
							alt="storeImage" width="340px" height="200px" />
					</div>
					<div style="margin-left: 20px; height: 90px;">
						<h4 style="font-size: 21px; margin: 15px 0 3px 0;">${storeList.sh_name }</h4>
						<p style="font-size: 13px; color: #9b9b9b; margin: 0 0 9px 0;">
							<b>${localList[i.index] }</b> - ${storeList.induty_code_se_name }
						</p>
						<span style="color: #16a085;">${storeList.price }~ </span><span
							style="font-size: 13px;">원</span> <span
							style="font-size: 13px; color: #9b9b9b;">/${storeList.menu }
						</span>

						<div id="likeShowDiv"
							style="float: right; margin-right: 15px; bottom: 0; font-size: 15px;">
							<span class="glyphicon glyphicon-thumbs-up" style="margin: 0;" /><span
								style="color: #16a085; margin-left: 4px;">${storeList.sh_rcmn }</span>
							<span class="glyphicon glyphicon-heart-empty" style="margin: 0;" /><span
								style="color: #16a085; margin-left: 4px;">${storeList.sh_like }</span>
						</div>
					</div>
				</div>
			</c:forEach>
			<br />
			<!--  <div class="col-md-10" style="margin-left:30px;">
            	<a class="btn btn-primary btn-lg btn-block" href="store/search" >더보기</a>
            </div> -->
		</div>
	</div>
</body>
</html>
=======

 -->
>>>>>>> origin/master
