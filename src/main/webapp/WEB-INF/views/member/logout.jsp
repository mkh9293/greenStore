<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	session.invalidate();
%>
<script>
Kakao.init('4b3b220c10e2e6f8e2cdd525a58d76ea');
 
Kakao.Auth.logout(function(data){
    if(data){//정상적으로 로그아웃이 되면 true를 반환
       location.href="/greenStore";
    }
});
</script>

