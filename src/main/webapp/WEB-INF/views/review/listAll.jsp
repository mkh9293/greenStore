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
<link rel="stylesheet" href="<c:url value="/resources/dist/css/skins/_all-skins.min.css"/>" type="text/css">
<script src="<c:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"/>"></script>
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>

<!-- Home -->
<link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>" type="text/css">
<script src="<c:url value="/resources/js/home.js"/>"></script>

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
		margin-top: 100px;
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


<div class="container">


	<div class="row">
	
	        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">'좋아요'한 리뷰</a></li>
              <li><a href="#timeline" data-toggle="tab">'좋아요'한 스토어</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
			    <!-- Post -->
                <div class="post clearfix">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="../resources/dist/img/user7-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">글쓴이</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">날짜</span>
                  </div>
                  <!-- /.user-block -->
                  <p>
                    	리뷰내용
                  </p>
                  <ul class="list-inline">
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                    </li>
                  </ul>
                </div>
                <!-- /.post -->


<!--                 Post
                <div class="post">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="../resources/dist/img/user6-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Adam Jones</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">Posted 5 photos - 5 days ago</span>
                  </div>
                  /.user-block
                  <div class="row margin-bottom">
 
                    /.col
                    <div class="col-sm-6">
                      <div class="row">
                        <div class="col-sm-6">
                          <img class="img-responsive" src="../resources/dist/img/photo2.png" alt="Photo">
                          <br>
                          <img class="img-responsive" src="../resources/dist/img/photo3.jpg" alt="Photo">
                        </div>
                        /.col
                        <div class="col-sm-6">
                          <img class="img-responsive" src="../resources/dist/img/photo4.jpg" alt="Photo">
                          <br>
                          <img class="img-responsive" src="../resources/dist/img/photo1.png" alt="Photo">
                        </div>
                        /.col
                      </div>
                      /.row
                    </div>
                    /.col
                  </div>
                  /.row

                  <ul class="list-inline">
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                    </li>
                    <li class="pull-right">
                      <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments
                        (5)</a></li>
                  </ul>

   
                </div> -->
                <!-- /.post -->
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
               
           <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
                <img class="img-circle" src="../resources/dist/img/user1-128x128.jpg" alt="User Image">
                <span class="username"><a href="#">글쓴이</a></span>
                <span class="description">날짜</span>
              </div>
             
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Mark as read">
                  <i class="fa fa-circle-o"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
     
            </div>
 
            <div class="box-body">
              <img class="img-responsive pad" src="../resources/dist/img/photo2.png" alt="Photo">

              <p>스토어정보</p>

              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> Like</button>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> 리뷰가기</button>
            </div>
            </div>
               
               

              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
	
	
	
	</div>
	
<!-- 		<div class="col-md-12">
          Box Comment
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
                <img class="img-circle" src="../resources/dist/img/user1-128x128.jpg" alt="User Image">
                <span class="username"><a href="#">Jonathan Burke Jr.</a></span>
                <span class="description">Shared publiFcly - 7:30 PM Today</span>
              </div>
              /.user-block
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Mark as read">
                  <i class="fa fa-circle-o"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
              /.box-tools
            </div>
            /.box-header
            <div class="box-body">
              <img class="img-responsive pad" src="../resources/dist/img/photo2.png" alt="Photo">

              <p>I took this photo this morning. What do you guys think?</p>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> Share</button>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> Like</button>
              <span class="pull-right text-muted">127 likes - 3 comments</span>
            </div>
            /.box-body
           
          /.box
          
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
                <img class="img-circle" src="../resources/dist/img/user1-128x128.jpg" alt="User Image">
                <span class="username"><a href="#">Jonathan Burke Jr.</a></span>
                <span class="description">Shared publicly - 7:30 PM Today</span>
              </div>
              /.user-block
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Mark as read">
                  <i class="fa fa-circle-o"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
              /.box-tools
            </div>
            /.box-header
            <div class="box-body">
              post text
              <p>Far far away, behind the word mountains, far from the
                countries Vokalia and Consonantia, there live the blind
                texts. Separated they live in Bookmarksgrove right at</p>

              <p>the coast of the Semantics, a large language ocean.
                A small river named Duden flows by their place and supplies
                it with the necessary regelialia. It is a paradisematic
                country, in which roasted parts of sentences fly into
                your mouth.</p>

              Attachment
              <div class="attachment-block clearfix">
                <img class="attachment-img" src="../resources/dist/img/photo1.png" alt="Attachment Image">

                <div class="attachment-pushed">
                  <h4 class="attachment-heading"><a href="http://www.lipsum.com/">Lorem ipsum text generator</a></h4>

                  <div class="attachment-text">
                    Description about the attachment can be placed here.
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry... <a href="#">more</a>
                  </div>
                  /.attachment-text
                </div>
                /.attachment-pushed
              </div>
              /.attachment-block

              Social sharing buttons
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> Share</button>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> Like</button>
              <span class="pull-right text-muted">45 likes - 2 comments</span>
            </div>
          </div>
        </div>
	</div> -->
</div>
</div>


