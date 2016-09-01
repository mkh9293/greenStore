<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	
	<!-- bootstrap css import -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 

	<!-- sidebar menu css -->  
	<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
	
	<!-- jQuery UI css import -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
	
	<!-- jQuery js import -->
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	
	<!-- jQuery UI js import-->
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	
	<!-- sidebar menu js -->
	<script src="<c:url value="/resources/js/index.js"/>"></script>
	
	<style type="text/css">
		html, body{
			background-color:#f6f6f6;
			font-family : 'NanumBarunGothic';
		}
		#location, #category, #searchStore, .storeItem :hover{
			cursor: pointer;
		}
		
		#locationDiv ,#locationDiv div, #categoryDiv, #categoryDiv div{
			clear: both;
			display: inline-block;
			height:30px;
			margin-bottom:10px;
		}
		
		#locationDiv label ,#categoryDiv label{
		  width: 200px;
		  border-radius: 3px;
		  border: 1px solid #D1D3D4
		}
		/* hide input */
		#locationDiv input.radio:empty, #categoryDiv input.cateradio:empty{
			margin-left: -999px;
		}

		/* style label */
		#locationDiv input.radio:empty ~ label, #categoryDiv input.cateradio:empty ~ label {
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

		#locationDiv input.radio:empty ~ label:before, #categoryDiv input.cateradio:empty ~ label:before {
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
		#locationDiv input.radio:hover:not(:checked) ~ label:before, #categoryDiv input.cateradio:hover:not(:checked) ~ label:before {
			content:'\2714';
			text-indent: .9em;
			color: #C2C2C2;
		}
		
		#locationDiv input.radio:hover:not(:checked) ~ label, #categoryDiv input.cateradio:hover:not(:checked) ~ label {
			color: #888;
		}
		
		/* toggle on */
		#locationDiv input.radio:checked ~ label:before, #categoryDiv input.cateradio:checked ~ label:before {
			content:'\2714';
			text-indent: .9em;
			color: #9CE2AE;
			background-color: #4DCB6D;
		}
		
		#locationDiv input.radio:checked ~ label, #categoryDiv input.cateradio:checked ~ label {
			color: #777;
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
				$(location).attr("href","http://localhost:8080/greenStore/search2/"+searchText);
				
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
				$("#category").text(choiceLoc);
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
				alert("area: "+area + " cate: "+cate);
				$(location).attr("href","http://localhost:8080/greenStore/search2/"+area+"/"+cate);
				
			});
			
		});
	</script>
</head>
<body>
	<div id="wrapper">
    	<!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                      	GreenStore
                    </a>
                </li>
                <li>
                    <a href="#">로그인</a>
                </li>
                <li>
                    <a href="#">공지사항 </a>
                </li>
                <li>
                    <a href="#">서비스 소개 </a>
                </li>
             </ul>
        </nav>
       	<!-- /#sidebar-wrapper -->
            <!-- Page Content -->
        <div>
          <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
          </button>
          
        </div>
      </div>
      <div id="searchDiv" style="display:none; height:50px;" >
      		<input class="form-control" id="searchText" type="text" name="searchText"  placeholder="검색어를 입력하세요." style="height:50px;"/>
      		<div style="position:absolute;right:0;top:0;margin-top:10px; margin-right:4%; font-size:20px;">
      			<span class="glyphicon glyphicon-search" id="searchBtn" style="margin-right:10px;"></span>
      			<span class="glyphicon glyphicon-remove" id="removeBtn"></span>
      		</div>
      </div>
     <span id="search" class="glyphicon glyphicon-search" style="position:fixed; font-size:26px; top:4%; left:5%; color:#EAEAEA; margin-left:5px;"></span> 
     
      <div id="mainImage">
       	 <div style="z-index:20; position:absolute; margin:10%;">
	   			<div style="font-size:35px;" id="searchKeyward">
	   				<a id="location" style="text-decoration:underline;">전체지역 </a><span style="color:#ffffff;">에 있는 </span><br/>
	   				<span style="color:#ffffff;">서울시에서 추천하는  </span><a id="category" style="text-decoration:underline;">전체 유형 </a><span style="color:#ffffff;">스토어 </span><br/><br/>
	   			</div>
	   			<div style="color:#FFD014; width:200px;" id="searchStore">
	   				<span>위 조건으로 스토어검색 </span><span class="glyphicon glyphicon-circle-arrow-right"></span>
	   			</div>
	   		</div>
	   		<img style="width:100%; height:400px; background-image: url(https://scloud.pstatic.net/20160405_149/1459823688590GWVfp_JPEG/01_main_top_1920x630_02.jpg);"/><br/>
	   	</div> 
	   	
	   	<div id="locationDiv" title="공간을 선택해주세요 ">
		   <c:forEach items="${areaList }" var="area" varStatus="i">
		   		<div>
		   			<input type="radio" class="radio" id="radio${i.index }" name="radio" value="${area }">
		   			<label for="radio${i.index }">${area } </label>
		  		</div>
		   </c:forEach>
			<br/><br/><br/>
			<button class="btn btn-primary btn-block" id="locationBtn" style="background-color:#A566FF">확인 </button>
		</div>
	   
	   	<div id="categoryDiv" title="공간 유형을 선택해주세요 ">
	   		<c:forEach items="${cateMap }" var="category" varStatus="i">
		   		<div>
		   			<input type="radio" class="cateradio" id="cateradio${i.index }" name="cateradio" value="${category.key }">
		   			<label for="cateradio${i.index }">${category.value } </label>
		  		</div>
		   </c:forEach>
			<br/><br/><br/>
			<button class="btn btn-primary btn-block" id="categoryBtn" style="background-color:#A566FF">확인 </button>
		</div>
	    
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
<!-- =======
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
	</div>
	<hr/>

	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
	</fb:login-button>
	<input type="button" value="logout" onclick="FB.logout()"/>
	<a href="#" onclick="FB.logout();">[logout]</a><br>
	<div id="status">
	</div>
	
 
</body>
</html> 


 -->