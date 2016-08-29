<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
	</div>
	<hr/>

	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
	</fb:login-button>
	<input type="button" value="logout" onclick="FB.logout()"/>
<!-- 	<a href="#" onclick="FB.logout();">[logout]</a><br> -->
	<div id="status">
	</div>
	
 
</body>
</html> 

