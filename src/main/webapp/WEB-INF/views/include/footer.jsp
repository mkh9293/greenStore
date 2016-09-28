<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
		$(document).ready(function(){
			$(".gs_ios").on("click",function(){
				 window.open("https://itunes.apple.com/us/app/dainingkodeu-bigdeiteo-masjibgeomsaeg/id1042893804?l=ko&ls=1&mt=8");
			});
			
			$(".gs_android").on("click",function(){
				window.open("https://play.google.com/store/apps/details?id=com.diningcode");
			});
			
		});	
</script>
<style type="text/css">
	.footer{
		height: 150px; 
		background-color: #3e3e3e; 
		font-family:SpoqaHanSans-Regular, sans-serif;
	}
	.footer .gs_inner{
		position:relative; 
		margin-left:5%;
	}
	.footer .gs_inner .gs_in_inner{
		position:absolute;
		top:20px; 
		width:100%; 
		heigth:100%;
	}
	.footer .gs_inner .gs_in_inner .gs_greenStore{
		display:inline-block;
	}
	.footer .gs_inner .gs_in_inner .gs_greenStore a{
		font-size:30px; 
		padding:0;
	}
	
	.gs_link{
		display:inline-block;
		position:absolute; 
		right:0; 
		top:10px;
	}
	
	.gs_appStore{
		display:inline-block;
	}
	.gs_ios{
		display:inline-block; 
		text-align:center;
		background-color:#ffffff;
		border-radius:20px;width:80px; 
		height:35px; 
		text-align:center;
		vertical-align: middle;
	}
	.gs_android{
		display:inline-block; 
		text-align:center;
		background-color:#ffffff;
		border-radius:20px;width:100px; 
		height:35px; 
		text-align:center;
		vertical-align: middle;
	}
	.gs_ios,.gs_android{
		line-height:2.4em;
	}
	.gs_ios img, .gs_android img{
		width:20px;
		height:20px;
	}
	.gs_ios span, .gs_android span{
		font-size:15px;
		color:#000;
	}
	.gs_ios:hover{
		cursor:pointer;
	}
	.gs_android:hover{
		cursor:pointer;
	}
	
	.gs_social{
		display:inline-block;
	}
	.gs_social a{
		margin-left:23px;
	}
	.gs_social a img{
		width:20px;
		heigth:20px;
	}
	.gs_copyright{
		display:relative;
		width:97%;
	}
	
</style>
<footer class="footer">
	<div class="gs_inner">
   		<div class="gs_in_inner">
	   		<div class="gs_greenStore">
	   			<a href="">GreenStore</a>
	   		</div>
	   		<div class="gs_link">
		   		<div class="gs_appStore">
		   			<div class="gs_ios" >
			   			<img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160720/img/main/main_install_iOS.png"/>
			   			<span>iOS</span>
		   			</div>
		   			<div class="gs_android">
			   			<img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160720/img/main/main_install_android.png"/>
			   			<span>Android</span>
		   			</div>
		   		</div>
		   		
		   		<div class="gs_social">
		   			<a href="http://www.facebook.com/diningcode" target="_blank">
		   				<img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160720/img/main/main_sns_facebook.png"/>
		   			</a>
		   			<a href="https://twitter.com/diningcode" target="_blank">
		   				<img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160720/img/main/main_sns_twitter.png"/>
		   			</a>
		   			<a href="https://www.instagram.com/diningcode/" target="_blank" style="margin-right:20px;">
		   				<img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160720/img/main/main_sns_insta.png"/>
		   			</a>
		   		</div>
	   		</div>
	   		<div class="gs_copyright">
	   			<span>© 2016 GreenStore, Inc. All rights reserved.</span>
		   	</div>
	   	</div>
   	</div>	   
</footer>