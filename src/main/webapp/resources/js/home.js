$(document).ready(function(){
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
				$(location).attr("href","http://localhost:8080/store/detail?id="+detailId);
			});
			
			//검색어로 검색
			$(".navbar-form").on("submit",function(e){
				e.preventDefault();
				$(location).attr("href","http://localhost:8080/store/search/"+$("#searchText").val());
			});
			
			//조건으로 검색 
			$("#searchStore").click(function(){
				var area = $("#location").text();
				var cate = $("#category").attr("value");
				$(location).attr("href","http://localhost:8080/store/search/"+area+"/"+cate);
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
			
			var lastY;
			$(".visible-xs").on("touchmove",function(e){
				 var currentY = e.originalEvent.touches[0].clientY;
				 if(currentY < lastY){
					 alert("up");
				 }
				 lastY = currentY;
			});
			
			$(".tab_content").hide();
		    $(".tab_content:first").show();

		    $("ul.tabs li").click(function () {
		        $("ul.tabs li").removeClass("active").css("color", "#1abc9c");
		        $(this).addClass("active").css("color", "#fff");
		        $(".tab_content").hide()
		        var activeTab = $(this).attr("rel");
		        $("#" + activeTab).fadeIn()
		    });
		  
		    //모바일 스토어 상세페이지로 이동
			$(".mb_storeItem").click(function(){
				var detailId = $(this).attr("data-id");
				$(location).attr("href","http://localhost:8080/store/detail?id="+detailId);
			});
		});