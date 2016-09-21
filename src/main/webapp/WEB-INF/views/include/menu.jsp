<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$(".openbtn").on("click",function(){
			$(this).css("display","none");
			
			var maskHeight = $(document).height();  
	        var maskWidth = $(window).width();  
	        
	        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	        $('#mask').css({'width':maskWidth,'height':maskHeight,'display':'block','z-index':'999','opacity':'.6','filter':'alpha(opacity=80)'});  
	        
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
<style type="text/css">
	/* 헤더(메뉴바) css */
	#header2 nav{
		background-color: #7ac143; 
		z-index: 990;
	}
	#header2 nav span{
		font-size: 30px; 
		cursor: pointer; 
		color: #ffffff; 
		float: right; 
		margin-right: 5%;
	}
	#header2 input{
		width:500px;
	}
	/* End 헤더(메뉴바) css */
</style>    

<header id="header2">	
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" style="color: #ffffff;">GreenStore</a>
			<form class="navbar-form navbar-left" action="" role="search">
				<div class="form-group">
					<input type="text" name="searchText" class="form-control" placeholder="Search">
				</div>
			</form>
			<span class="openbtn">&#9776;</span>
		</div>
	</nav>
</header>
	<div id="mask"></div>
	
	<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" style="position: absolute; z-index: 2;">&times;</a>
	<div style="width: 100%; height: 200px; top: 0; position: absolute; z-index: 1; background-color: #7ac143;"></div>
		<a href="#">About</a> <a href="#">Services</a> <a href="#">Clients</a>
		<a href="#">Contact</a>
	</div>
	
	<div style="height:50px;"></div>