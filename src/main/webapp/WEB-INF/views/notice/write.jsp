<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- notice -->
<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/dist/css/skins/_all-skins.min.css"/>" type="text/css">
<script src="<c:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"/>"></script>
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>


  <link rel="stylesheet" href="<c:url value="/resources/plugins/iCheck/flat/blue.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/plugins/morris/morris.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/plugins/datepicker/datepicker3.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/plugins/daterangepicker/daterangepicker.css"/>" type="text/css"> 
  <link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>" type="text/css">
  

<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="<c:url value="/resources/plugins/morris/morris.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/sparkline/jquery.sparkline.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"/>"></script>
<script src="<c:url value="/resources/plugins/knob/jquery.knob.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="<c:url value="/resources/plugins/daterangepicker/daterangepicker.js"/>"></script>
<script src="<c:url value="/resources/plugins/datepicker/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/pages/dashboard.js"/>"></script>
<script src="<c:url value="/resources/dist/js/demo.js"/>"></script>
  
  

<!-- Home -->
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>" type="text/css">
<script src="<c:url value="/resources/js/home.js"/>"></script>



<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>
<!-- style -->
<style>
	.navbar-header{
		background-color: #1ABC9c;
	}
	.navbar-brand {
		font-family : SpoquHanSans-Reqular, sans-serif;
		font-size: 25px;
	}
	.col-md-12{
		margin-top: 120px;
		margin-bottom: 50px;
	}
	form {
		margin-top: 80px;
		margin-bottom: 30px;
	}
	.input-group {
		margin-top: 80px;
	}
	.box-title {
		padding: 5px;
	}


</style>

<div id="mask"></div>
<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn">&times;</a>
	<div></div>
	<a href="#">About</a> <a href="#">Services</a> <a href="#">Clients</a>
	<a href="#">Contact</a>
</div>

<header id="header">
	<nav class="navbar navbar-default navbar-fixed-top">
			<div class="navbar-header">
				<a class="navbar-brand" href="#" style="color: #ffffff;">GreenStore</a>
				<span class="openbtn">&#9776;</span>
		</div>
	</nav>
</header>

<header id="header2" style="display:none;">	
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
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- notice -->
<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>" type="text/css">
<%-- <script src="<c:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"/>"></script> --%>
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>

<script src="<c:url value="/resources/dist/js/demo.js"/>"></script>
<!--  <script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script> -->
<script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>"></script>

<script src="<c:url value="/resources/js/modal.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" type="text/css">

<!-- Home -->
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<script src="<c:url value="/resources/js/home.js"/>"></script>

<!-- style -->
<style>
  	.navbar-header{
		background-color: #1ABC9c;
		width: 100%;
	}
	.navbar-brand {
		font-family : SpoquHanSans-Reqular, sans-serif;
		font-size: 25px;
	}  
	.box-body{
		margin-top: 80px;
	}
	.input-group {
		margin-top: 80px;
	}
	.box-title {
		padding: 5px;
	}


</style>

<div id="mask"></div>
<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" style="color:#fff;">&times;</a>
	<div id="profile">
		<div style="position:absolute; width:340px;height:200px; top:40px; left:25px;">
			<img src="<c:url value="/resources/img/iseoul.jpg"/>" alt="..." class="img-circle" style="display:inline-block;width:105px;height:110px;"/>
			<strong style="margin-left:10px;line-height:6em;color:#000">로그인 필요합니다.</strong>
			
		</div>
	</div>
	<div style="height:180px;"></div>
	<nav>
		<ul style="list-style: none; margin: 0;padding: 0; position: absolute; width: 360px;">
			<li style="display: inline-block; line-height: 20px; position: relative; width: 100%;">
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="/" style="color: #f47721;text-decoration: none; margin-left:2%;">그린스토어 홈</a> 
					<span class="css-arrow" ></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px; border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="member/login" style="color: #0d2474;text-decoration: none; margin-left:2%;">로그인/로그아웃</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="notice/listAll" style="color: #0d2474;text-decoration: none; margin-left:2%; ">공지사항</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">
					<a href="/service" style="color: #0d2474;text-decoration: none; margin-left:2%;">서비스 소개</a> 
					<span class="css-arrow"></span>
				</div>
				<div style="display:block;position: relative; width:100%; height:60px;border: 0.1em solid #F6F6F6;line-height:3em;padding-left:10px; background-color:#ffffff;">

					<a href="review/listAll" style="color: #0d2474;text-decoration: none; margin-left:2%;">마이페이지</a> 

					<span class="css-arrow"></span>
				</div>
				<!-- <div style="display:block;position: relative; width:100%; height:100px; line-height:5em; text-align:center;">
					<span>GreenStore</span>
				</div> -->
			<br/><br/>
				<div style="display:block;position: relative; width:100%; height:60px; text-align:center; line-height:3em;padding-left:10px; background-color:#f47721;">
					<a href="/" style="color:#fff;">
						그린스토어로 이동
					</a>
				</div>
			</li>
		</ul>
	</nav>
</div>

<header id="header">
	<nav class="navbar navbar-default navbar-fixed-top">
			<div class="navbar-header">
				<a class="navbar-brand" href="#" style="color: #ffffff;">GreenStore</a>
				<span class="openbtn">&#9776;</span>
		</div>
	</nav>
</header>

<header id="header2" style="display:none;">	
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<a class="navbar-brand" href="" style="color: #ffffff;">GreenStore</a>
			<form id="searchFrm" class="navbar-form navbar-left" action="" method="post">
				<div class="form-group">
					<input type="text" id="searchText" name="searchText" class="form-control" placeholder="Search">
				</div>
			</form>
			<span class="openbtn">&#9776;</span>
		</div>
	</nav>
</header>	



<div class="container">

<form role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label>
				<input type="text" name="ntitle" class="form-control" placeholder="Enter Title">
			</div>
			
			
			<div class="form-group">
				<label for="exampleInputPassword1">Content</label>
				<textarea class="form-control" name="ncontent" rows="3" placeholder="Enter Contents...">
				</textarea>
			</div>
			
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>	
		</div>
	</form>



<%-- 	<!-- Store Row -->
	 <div class="row">
		<div class="col-md-12">
            <div class="box box-info">
            <div class="box-header">
              <i class="fa fa-bullhorn"></i>

              <h3 class="box-title">공지사항 글 작성하기</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <div class="box-body">
              <form role="form" method="post">
                <div class="form-group">
                  <input type="email" class="form-control" name="ntitle" placeholder="제목">
                </div>
                <div>
                  <textarea class="textarea" name="ncontent" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                </div>
              </form>
            </div>
            <div class="box-footer clearfix">
             <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </div>
          </div>
          <!-- /.box -->
        </div> --%>
	</div>



