<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cineplex-Manager</title>
<%@ include file="common/css.jsp"%>
<%@ include file="common/js.jsp"%>
</head>
<body class="no-trans">

<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"><i class="icon-up-open-big"></i></div>

		<!-- header start -->
		<!-- ================ --> 
		<header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-4">

						<!-- header-left start -->
						<!-- ================ -->
						<div class="header-left clearfix">

							<!-- logo -->
							<div class="logo smooth-scroll">
								<a href="#banner"><img id="logo" src="assets/images/logo.png" alt="Worthy"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="#banner">Cineplex</a></div>
								<div class="site-slogan">多放映厅影院——在线购票管理</div>
							</div>

						</div>
						<!-- header-left end -->

					</div>
					<div class="col-md-8">

						<!-- header-right start -->
						<!-- ================ -->
						<div class="header-right clearfix">

							<!-- main-navigation start -->
							<!-- ================ -->
							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">

										<!-- Toggle get grouped for better mobile display -->
										<div class="navbar-header">
											<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
												<span class="sr-only">Toggle navigation</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
											</button>
										</div>

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav">
												<li class="active"><a href="#banner">首页</a></li>
												<li><a href="#movie">正在热映</a></li>
												<li><a href="#future">即将上映</a></li>
												<li>
											</ul>
											<form class="navbar-form navbar-left" role="search">
													<div class="form-group">
												    	<input type="text" class="form-control" placeholder="Search">
												  	</div>
											</form>
											<ul class="nav navbar-nav navbar-right">
												<s:if test="#session.user==null">
													<li><a href="#" data-toggle="modal" data-target="#login">登录</a></li>
													<li><a href="#" data-toggle="modal" data-target="#register">注册</a></li>
												</s:if>
												<s:elseif test="#session.user.gid=='2'">
													<li><a href="manage">个人后台</a></li>
													
												</s:elseif>
												<s:elseif test="#session.user.gid=='1'">
													<li><a href="manage">服务后台</a></li>
													
												</s:elseif>
												<s:elseif test="#session.user.gid=='0'">
													<li><a href="manage">经理后台</a></li>
													
												</s:elseif>
												<s:else><li><a>未知人员</a></li></s:else>
												
												<s:if test="#session.user!=null">
													<li><a href="logout">登出</a>
												</s:if>
												
											</ul>
										</div>

									</div>
								</nav>
								<!-- navbar end -->

							</div>
							<!-- main-navigation end -->

						</div>
						<!-- header-right end -->

					</div>
				</div>
			</div>
		</header>
		<!-- header end -->

		<!-- banner start -->
		<!-- ================ -->
		<div id="banner" class="banner">
			<div class="banner-image"></div>
			<div class="banner-caption">
				<div class="container">
					<div class="row">
						<div class="flexslider">
							<ul class="slides">
								<li>
						        	<img src="assets/images/s1.jpg" alt="" />
									<div class="slides_info">
										<h4>FlexSlider!</h4>
										<p>多功能图片切换效果</p>
									</div>
								</li>
								<li>
									<img src="assets/images/sc2.jpg" alt="" />
									<div class="slides_info">
										<h4>jquery flexslider滑块幻灯片插件图片和文字结合焦点图片切换</h4>
									</div>
								</li>
								<li>
									<img src="assets/images/s3.jpg" alt="" />
									<div class="slides_info">
										<h4>FlexSlider</h4>
										<p>FlexSlider是一款基于的jQuery内容滚动插件。它能让你轻松的创建内容滚动的效果，具有非常高的可定制性。它是将UL列表转换成内容滚动的列表，可以自动播放，或者使用导航按钮和键盘来控制。<a href="http://www.woothemes.com/flexslider/" target="_blank" rel="nofollow">FlexSlider官网</a> <a href="http://www.helloweba.com/view-blog-265.html" target="_blank">中文使用教程</a></p>
									</div>
								</li>
								<li>
									<img src="assets/images/s4.jpg" alt="" />
									<div class="slides_info">

										<h4>FlexSlider</h4>
										<p>FlexSlider is a free responsive jQuery slider toolkit. Supported in all major browsers with custom navigation options and touch swipe support.</p>
									</div>
								</li>
							</ul>
						</div>		
											
					</div>
				</div>
			</div>
		</div>
		<!-- banner end -->


		<!-- section start -->
		<!-- ================ -->
		<div class="section">
			<div class="container">
				<h1 class="text-center title" id="movie">正在热映</h1>
				<div class="separator"></div>
				
				<s:include value="movieList.jsp"></s:include>
				
			</div>
		</div>
		<!-- section end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="section translucent-bg bg-image-2 pb-clear">
			<div class="container object-non-visible" data-animation-effect="fadeIn">
				<h1 id="future" class="title text-center">即将上映</h1>
				<div class="space"></div>
				<s:include value="futureList.jsp"></s:include>
			</div>
			<!-- section end -->
		</div>
		<!-- section end -->

		

		<!-- footer start -->
		<!-- ================ -->
		<footer id="footer">


			<!-- .subfooter start -->
			<!-- ================ -->
			<div class="subfooter">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">Copyright © 2015 Cineplex by <a target="_blank" href="#">Jane-121250043</a>.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- .subfooter end -->

		</footer>
		
		
		<!-- Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="loginLabel">登录</h4>
      </div>
      <div class="modal-body">
        <s:include value="login.jsp"></s:include>
      </div>
      
    </div>
  </div>
</div>

<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="registerLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="registerLabel">注册</h4>
      </div>
      <div class="modal-body">
        <s:include value="register.jsp"></s:include>
      </div>
      
    </div>
  </div>
</div>





</body>
</html>