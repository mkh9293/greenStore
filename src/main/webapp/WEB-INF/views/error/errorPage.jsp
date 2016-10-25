<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style type="text/css">
	body{
		background-color:#fff;
	 	font-family: NanumBarunGothic,'나눔바른고딕',NanumGothic,'돋움',Dotum,Helvetica,'Aspple SD Gothic Neo',Sans-serif!important;
	}
	.error_wrap{
		width: 100%; height: 100%; background-color: #fff; text-align: center;
	}
	.error_content{
		background-color:#fff;
		font-size: 20px; font-weight: 570; padding: 4%;
	}
	.error_detail{
		color: #949494;
	}
	.error_detail  b{
		color:#1abc9c;
	}
	
	#div_line{
		width: 80px; border-top: 2px solid #d2d2d2; margin-bottom: 20px;
		margin-left:45%;
	}
	#otherwise_title{
		font-size:30px;
		font-weight:600;
		margin:10%;
	}
	.error_otherwise b{
		color:#1abc9c;
	}
	.error_btn div{
		display:inline-block;
		width:300px;
		height:50px;
		margin:3%;
		border-radius:3px;
		line-height:45px;
	}
	.goBack{
		background-color: #4d4d4d;
	}
	.goHome{
		background-color: #1abc9c;
	}
	.error_btn div a{
		color:#fff;
		font-size:20px;
	}
</style>	
<div class="error_wrap">
	<div class="error_content">
		<div class="error_detail">
			<b style="font-size: 40px; color:#34495e;">요청하신 페이지를 찾을 수 없습니다.</b><br />
			<br /> <span>이용에 불편을 드려 죄송합니다.</span><br /> 찾으시는 페이지는 주소를 <b>잘못
				입력</b>하였거나 <b>삭제</b>된 페이지입니다.<br /> <br />
		</div><br/>

		<div id="div_line"></div>
		<div class="error_otherwise">
			<span id="otherwise_title">다른 방법을 안내해 드릴게요!!</span><br/><br/>
				<span>1.주소를 다시 한 번 확인해서 시도해 주세요.</span><br/> 
				<span>2.아래 버튼을 눌러 <b>이전</b> 또는 <b>메인페이지</b>로 돌아가주세요.</span><br />
		</div>

		<div class="error_btn">
			<div class="goBack">
				<a href="javascript:history.back()" style="color:#fff;">이전 페이지</a>
			</div>

			<div class="goHome">
				<a href="/greenStore">그린스토어 홈</a>
			</div>
		</div>
	</div>
</div>