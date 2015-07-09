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
												<li><a href="index#banner">首页</a></li>
												<li><a href="index#movie">正在热映</a></li>
												<li><a href="index#future">即将上映</a></li>
												</ul>
											
											<ul class="nav navbar-nav navbar-right">
												<s:if test="#session.user==null">
													<li><a href="#" data-toggle="modal" data-target="#login">登录</a></li>
													<li><a href="#" data-toggle="modal" data-target="#register">注册</a></li>
												</s:if>
												<s:elseif test="#session.user.gid=='2'">
													<li  class="active"><a href="manage">个人后台</a></li>
													
												</s:elseif>
												<s:elseif test="#session.user.gid=='1'">
													<li  class="active"><a href="manage">服务后台</a></li>
													
												</s:elseif>
												<s:elseif test="#session.user.gid=='0'">
													<li  class="active"><a href="manage">经理后台</a></li>
													
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

		

		<!-- footer start -->
		<!-- ================ -->
		<footer id="footer">

			<!-- .footer start -->
			<!-- ================ -->
			<div class="footer section">
												<s:if test="#session.user==null">
												</s:if>
												<s:elseif test="#session.user.gid=='2'">
													<s:include value="member.jsp"></s:include>
													
												</s:elseif>
												<s:elseif test="#session.user.gid=='1'">
													<s:include value="clerk.jsp"></s:include>
													
												</s:elseif>
												<s:elseif test="#session.user.gid=='0'">
													<s:include value="manager.jsp"></s:include>
													
												</s:elseif>
												
				
			</div>
			<!-- .footer end -->

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