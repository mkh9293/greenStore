$(document).ready(function(){
			
		
			
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
					url:"http://localhost:8080/greenStore/json/regionReviewList",
					type: "POST",
					data: {"region": region},
					dataType: "json",
					success:function(data){
						$("#regionContent .row .reviewItem").remove();
						
						$.each(data, function(key, value){
								var content = 
								'<div class="reviewItem" data-id='+value.sh_id+'>' + 
		                		'	<div class="post clearfix">'+
		                		'		<div class="user-block">'+
		                    	'			<span style="font-size:25px;">'+
		                    	'			<a href="http://localhost:8080/greenStore/store/detail?id='+value.sh_id + '>'+ value.sh_name +'</a></span>' +
		                   		'		</div>'+ value.rcontent +
		                  		'			<ul class="list-inline">'+
		                    	'			<li>'+
		                    	'			<a href="#" class="link-black text-sm">'+
		                    	'			<i class="fa fa-thumbs-o-up margin-r-5"></i>Like</a></li>'+
		                 		'		</ul>'+
		                		'	</div>'+
		                		'</div>';
								$("#regionContent .row").append(content);	
						});
					}
				});
			});
	});

//동적 이벤트 연결
$(document).on("click","#regionContent .reviewItem",function(){
	var detailId = $(this).attr("data-id");
	$(location).attr("href","http://localhost:8080/greenStore/store/detail?id="+detailId);
});
