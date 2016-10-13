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
			
			//검색어로 검색
			$("#searchFrm").on("submit",function(e){
				e.preventDefault();
				$(location).attr("href","http://localhost:8080/store/search/"+$("#searchText").val());
			});
			
			//조건으로 검색 
			$("#searchStore").click(function(){
				var area = $("#location").text();
				var cate = $("#category").attr("value");
				$(location).attr("href","http://localhost:8080/store/search/"+area+"/"+cate);
			});
			
//			$("#mainImage").on("mousewheel",function(e){
//				$("#header2").hide();
//				$("#header").show();
//			});
			
//			$(".container").on("mousewheel",function(e){
//				$("#header").hide();
//				$("#header2").show();
//			});
			
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
			
			
			$(".tab_content").hide();
		    $(".tab_content:first").show();

		    $("ul.tabs li").click(function () {
		        $("ul.tabs li").removeClass("active").css("color", "#1abc9c");
		        $(this).addClass("active").css("color", "#fff");
		        $(".tab_content").hide();
		        var activeTab = $(this).attr("rel");
		        $("#" + activeTab).fadeIn();
		    });
		  
		    //모바일 스토어 상세페이지로 이동
			$(".mb_storeItem").click(function(){
				var detailId = $(this).attr("data-id");
				$(location).attr("href","http://localhost:8080/store/detail?id="+detailId);
			});
			
			//모바일 검색어로 검색
			$("#mb_searchFrm").on("submit",function(e){
				e.preventDefault();
				$(location).attr("href","http://localhost:8080/store/search/"+$("#mb_searchTxt").val());
			});
			
			$(window).scroll(function() { 
				if ($(window).scrollTop()>460)
				{ 
					$("#header").hide();
					$("#header2").show();
				}
				if($(window).scrollTop()>0 && $(window).scrollTop()<460)
				{
					$("#header").show();
					$("#header2").hide();
				}
			}); 
			
			$(".nav-inline .regionNav button").on("click",function(e){
				var region = $(this).text();
				$(this).parent().find("button").css("color","#A6A6A6");
				$(this).css("color","#16a085");
				
				$.ajax({
					url:"http://localhost:8080/json/regionBestList",
					type: "POST",
					data: {"region": region},
					dataType: "json",
					success:function(data){
						$("#regionContent .row .storeItem").remove();
						
						$.each(data, function(key, value){
							var content = 
							'<div class="storeItem" data-id='+value.sh_id+'>' + 
				            '    <div id="storeImg">' + 
				            '        <img src='+value.sh_photo+' alt="storeImage"/>' +  
				            '    </div>'+ 
				            '    <div id="storeContent">' + 
				            '            <h4>' + value.sh_name +'</h4>' +
				            '           <p>' +  
				            '				<b>' + region + '</b> - '+ value.induty_code_se_name +'</p>' +
				            '                <span style="color:#16a085;">'+value.price+'~ </span>' + 
				            '                <span style="font-size:13px;">원</span>' +
				            '                <span style="font-size:13px; color: #9b9b9b;"">/'+value.menu+'</span>' +
				            '            <div id="likeShowDiv" style="float:right; margin-right:15px; bottom:0; font-size:15px;">' +
				            '                <span class="glyphicon glyphicon-thumbs-up" style="margin: 0;"></span>' + 
				            '                <span style="color: #16a085; margin-left: 4px;">'+value.sh_rcmn+'</span>' + 
				            '                <span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>' + 
				            '                <span style="color: #16a085; margin-left: 4px;">'+value.sh_like+'</span>' + 
				            '        	</div>' + 
				            '    </div>' +    
				            '</div>';
							
							$("#regionContent .row").append(content);	
						});
					}
				});
			});
			
			$(".regionMorebtn").on("click",function(){
				$("#myDropdown").toggleClass("show");
			});
			
			$("#myDropdown a").on("click",function(e){
				var region = $(this).text();
				$(this).parent().parent().parent().find("button").css("color","#A6A6A6");
				$(this).parent().find("a").css("color","#A6A6A6");
				
				$(this).css("color","#16a085");
				
				$(".regionMorebtn").click();
				
				$.ajax({
					url:"http://localhost:8080/json/regionBestList",
					type: "POST",
					data: {"region": region},
					dataType: "json",
					success:function(data){
						$("#regionContent .row .storeItem").remove();
						
						$.each(data, function(key, value){
							var content = 
							'<div class="storeItem" data-id='+value.sh_id+'>' + 
				            '    <div id="storeImg">' + 
				            '        <img src='+value.sh_photo+' alt="storeImage"/>' +  
				            '    </div>'+ 
				            '    <div id="storeContent">' + 
				            '            <h4>' + value.sh_name +'</h4>' +
				            '           <p>' +  
				            '				<b>' + region + '</b> - '+ value.induty_code_se_name +'</p>' +
				            '                <span style="color:#16a085;">'+value.price+'~ </span>' + 
				            '                <span style="font-size:13px;">원</span>' +
				            '                <span style="font-size:13px; color: #9b9b9b;"">/'+value.menu+'</span>' +
				            '            <div id="likeShowDiv" style="float:right; margin-right:15px; bottom:0; font-size:15px;">' +
				            '                <span class="glyphicon glyphicon-thumbs-up" style="margin: 0;"></span>' + 
				            '                <span style="color: #16a085; margin-left: 4px;">'+value.sh_rcmn+'</span>' + 
				            '                <span class="glyphicon glyphicon-heart-empty" style="margin: 0;"></span>' + 
				            '                <span style="color: #16a085; margin-left: 4px;">'+value.sh_like+'</span>' + 
				            '        	</div>' + 
				            '    </div>' +    
				            '</div>';
							
							$("#regionContent .row").append(content);	
				});
			}
		});
	});
});

//동적 이벤트 연결
$(document).on("click","#regionContent .storeItem",function(){
	var detailId = $(this).attr("data-id");
	$(location).attr("href","http://localhost:8080/store/detail?id="+detailId);
});
