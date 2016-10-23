

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css">
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
<script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>"></script>
<script src="<c:url value="/resources/js/modal.js"/>"></script>

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
	.login-box {
		margin-top: 80px;
	}

	.box-title {
		padding: 5px;
	}
	.login-box-body {
		margin-top:40px;
	}


</style>

<div class="container">
<div class="login-box">
  <div class="login-logo">
  </div>
  <div class="login-box-body">
    <p class="login-box-msg">

    <form action="../../index2.html" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="관리자로그인">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
          <label>
          </label>
          </div>
        </div>
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
        </div>
      </div>
    </form>

    <div class="social-auth-links text-center">
        <a id="kakao-login-btn"></a>
        <a href="http://localhost:8080/greenStore/oauth/login?snsname=kakao"><img src="/resources/img/greenStore.png" width="50" height="50"></a>
    </div>

  </div>
</div>
</div>

<!-- Kakao -->
<script>
  // 사용할 앱의 Javascript 키를 설정해 주세요.
  Kakao.init('4b3b220c10e2e6f8e2cdd525a58d76ea');
  // 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    size:'large',//로그인버튼크기 small,medium,large/디폴트는 medium
    //fall://로그인실패할경우
    //persistAccessToken : false,
    persistRefreshToken : true,
    success: function(authObj) {
      // 로그인 성공시 API를 호출합니다.
      Kakao.API.request({
        url: '/v1/user/me',
        success: function(res) {
        	
        	
        	
          var str = JSON.stringify(res);
          var id = str.substring(str.indexOf('id'),str.length);
          var start_id = id.indexOf(':');
		  var end_id = id.indexOf(',');
		  var idNum = id.substring(start_id+1,end_id);
		  
          var nickEnd = str.substring(str.indexOf('nickname'),str.length);
          var start_nick = nickEnd.indexOf(':');
          var end_nick = nickEnd.indexOf(',');
          var nickname = nickEnd.substring(start_nick+2,end_nick-1);
          
          var img = str.substring(str.indexOf('thumbnail_image'),str.length);
          var start_img = img.indexOf(':');
          var end_img = img.indexOf(',');
          var img_url = img.substring(start_img+2,end_img-1);
          
          document.frm.idNum.value=idNum;
          document.frm.nickName.value=nickname;
          document.frm.profile_img.value=img_url;
          document.frm.submit();

        }
      
        
      });
      
    }
  });
</script>


<form action="index" method="post" name="frm">
<input type="hidden" name="idNum">
<input type="hidden" name="nickName">
<input type="hidden" name="profile_img">
</form>
