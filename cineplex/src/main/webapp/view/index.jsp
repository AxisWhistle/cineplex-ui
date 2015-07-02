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
											<ul class="nav navbar-nav navbar-right">
												<li class="active"><a href="#banner">首页</a></li>
												<li><a href="#movie">正在热映</a></li>
												<li><a href="#future">即将上映</a></li>
												
												
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
						<div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
							<h1 class="text-center">欢迎来到 <span>Cineplex</span></h1>
							
												<s:if test="#session.user==null">
													<p class="lead text-center">你可以在此了解最近上映的电影，成为会员即可随时订票购票，更有精彩活动不容错过.</p>
												</s:if>
												<s:elseif test="#session.user.gid=='2'">
													<p class="lead text-center">您的会员账号为${sessionScope.user.id},我们将竭诚为您服务</p>
													
												</s:elseif>
												<s:elseif test="#session.user.gid=='1'">
													<p class="lead text-center">您可以通过此平台进行影院的影片管理和销售.</p>
													
												</s:elseif>
												<s:elseif test="#session.user.gid=='0'">
													<p class="lead text-center">您可以通过此平台管理影院统计信息.</p>
													
												</s:elseif>
												<s:else><p class="lead text-center">很抱歉未能识别您的信息，请联系管理员.</p></s:else>
												
												
							
							
							
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
				
				<s:include value="features.jsp"></s:include>
				
				<%-- <s:include value="movieList.jsp"></s:include> --%>
				
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