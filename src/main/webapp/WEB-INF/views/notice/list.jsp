<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>
<style type="text/css">
.pc .header {
    width: 100%;
    min-width: 768px;
    height: 67px;
    top: 0;
    z-index: 50;
    background: #ffd014;
    color: #000;
    text-align: center;
    font-size: 16px;
}
.header {
    position: fixed;
    height: 46px;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 50;
    background: #ffd014;
    color: #000;
    text-align: center;
    z-index: 100;
    font-size: 16px;
    line-height: 0;
}

.pc .box_search {
    position: relative;
    padding: 30px;
    border: 4px solid #704de4;
    background: #fff;
}
.box_search {
    position: relative;
    padding: 15px 14px;
    border: 3px solid #704de4;
    background: #fff;
}


</style>
</head>
<body>
<!-- 임시 검색 바 -->
<header class="header header_sub"></header>
<!-- 검색 -->

<div class="box_search">
	            <div class="box_inner">
	                <div class="half_search">
	                    <div class="flex_wrap">
							<dl class="flex_box">
							</dl>
							<dl class="flex_box">
								<dt class="flex tit">
									<label for="notice_txt">공지사항 검색</label>
								</dt>
								<dd class="flex">
									<div class="input">
										<input type="text" id="notice_txt" class="_searchText" placeholder="검색어를 입력해주세요." value="">
									</div>
								</dd>
							</dl>
						</div>
	                    <a href="javascript:void(0);" class="_search btn btn_full btn_default"><i class="sp_icon ico_btn_search"></i>검색</a>
	                </div>
	            </div>
	        </div>
<!-- 아코디언 게시판 -->


</body>
</html>