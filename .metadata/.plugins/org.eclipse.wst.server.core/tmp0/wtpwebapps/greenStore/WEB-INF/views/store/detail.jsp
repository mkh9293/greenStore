<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
var param = "<c:out value="${store.sh_addr}"/>";
	
$(document).ready(function(){
	$("#popBtn").click(function(){
		var x, y;
		
		$.ajax({
			type:"POST",
			dataType:"jsonp",
			url:"https://apis.daum.net/local/geo/addr2coord",
			data:{
				apikey:"76d0dfe96fd493ccedbee52792d36e32",
				q: param,
				output:"json"
			},
			success:function(data){
				data = data.channel;
				alert(data.totalCount);
				
				$.each(data.item, function(k,v){
					x=v.point_x;
					y=v.point_y;
				});
				
			}
		});
	});
});
</script>
<body>
	<p>${store.sh_id }</p>
	<p>${store.sh_name }</p>
	<p>${store.sh_addr }</p>
	<p>${store.sh_way }</p>
	<div id="local">
	</div>
	<button id="popBtn">pop up</button>
</body>
</html>