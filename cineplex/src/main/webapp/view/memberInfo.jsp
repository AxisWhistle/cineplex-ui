<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cineplex-Manager</title>
<%@ include file="common/css.jsp"%>
<%@ include file="common/js.jsp"%>
<link href="assets/css/square/red.css" rel="stylesheet">
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
												<li><a href="index#banner">首页</a></li>
												<li><a href="index#movie">正在热映</a></li>
												<li><a href="index#future">即将上映</a></li>
												
												
												<s:if test="#session.user==null">
													<li><a href="#" data-toggle="modal" data-target="#login">登录</a></li>
													<li><a href="#" data-toggle="modal" data-target="#register">注册</a></li>
												</s:if>
												<s:elseif test="#session.user.gid=='2'">
													<li><a href="manage">个人后台</a></li>
													
												</s:elseif>
												<s:elseif test="#session.user.gid=='1'">
													<li  class="active"><a href="manage">服务后台</a></li>
													
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

		

		<!-- footer start -->
		<!-- ================ -->
		<footer id="footer">

			<!-- .footer start -->
			<!-- ================ -->
			<div class="footer section">
			
			<div class="container">
			
					<div class="space"></div>
					<h2 class="text-center">会员信息</h2>
					
					<s:if test="#request.member==null">
						<h4 class="text-center">会员账号错误</h4>
					</s:if>
					<s:else>
						<h4 class="text-center">卡号 ${id}</h4>
					
					
					<div class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">卡状态</label>
							<div class="col-sm-4">
								<s:if test="#request.member.state==0"><p>未激活</p>
		    					</s:if>
		    					<s:elseif test="#request.member.state==1"><p>已激活</p>
		    						
		    					</s:elseif>
		    					<s:elseif test="#request.member.state==2"><p>已暂停</p>
		    					</s:elseif>
		    					<s:elseif test="#request.member.state==3"><p>已停止</p>
		    					</s:elseif>
		    					<s:else><p>已取消</p>	
		    					</s:else>
		    				</div>	
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">卡余额</label>
							<div class="col-sm-2">
							<p>${requestScope.member.balance}</p>
							</div>
							
						</div>
				
				
				
						<div class="form-group">
							<label class="col-sm-2 control-label">卡积分</label>
							<div class="col-sm-2">
							<p>${requestScope.member.credit}</p>
							</div>
							
							
						</div>
				
				
						<div class="form-group">
							<label class="col-sm-2 control-label">卡级别</label>
							<div class="col-sm-2">
							<p>${requestScope.member.disaccount.title}</p>
							</div>
							
							
						</div>
				
				
				
						<div class="form-group">
							<label for="bankId" class="col-sm-2 control-label">可享折扣</label>
							<div class="col-sm-4">
								${requestScope.member.disaccount.disaccount}
							</div>
						</div>
						  	
						<div class="form-group">
							<label for="bankId" class="col-sm-2 control-label">积分加倍</label>
							<div class="col-sm-4">
								  ${requestScope.member.disaccount.muticredit}
							</div>
						</div>
				
				
						<div class="space"></div>
				
				<h3>充值记录</h3>
			<table class="table-striped table-bordered rechargeTable display"  cellspacing="0">
    <thead>
        <tr>
            
            <th>时间</th>
            <th>金额</th>
            <th>银行卡号</th>
            <!-- th>操作</th-->
        </tr>
    </thead>
 
    <tfoot>
        <tr>
            
            <th>时间</th>
            <th>金额</th>
            <th>银行卡号</th>
            <!-- th>操作</th-->
        </tr>
    </tfoot>
 
    <tbody>
       
	<s:iterator value="#request.rechargeList">
	 		<tr>
	            
	            <td><s:date name="date"/></td>
	            <td>${money}</td>
	            <td>${bank.id}</td>
	            <!-- td><a href="#" class="btn btn-default">修改</a></td-->
	        </tr>
	
	</s:iterator>
	</tbody>
	</table>
	
	
	<div class="space"></div>
				
				<h3>消费记录</h3>
			<table class="table-striped table-bordered consumeTable display"  cellspacing="0">
    <thead>
        <tr>
            
            <th>时间</th>
            <th>金额</th>
            <th>获得积分</th>
            <th>消费信息</th>
            <!-- th>操作</th-->
        </tr>
    </thead>
 
    <tfoot>
        <tr>
            <th>时间</th>
            <th>金额</th>
            <th>获得积分</th>
            <th>消费信息</th>
            <!-- th>操作</th-->
        </tr>
    </tfoot>
 
    <tbody>
       
	<s:iterator value="#request.consumeList">
	 		<tr>
	            
	            <td><s:date name="date"/></td>
	            <td>${money}</td>
	            <td>${credit}</td>
	            <td>${info}</td>
	            <!-- td><a href="#" class="btn btn-default">修改</a></td-->
	        </tr>
	
	</s:iterator>
	</tbody>
	</table>
				
				
			</div>
			
			</s:else>
					</div>								
												
												
				
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


<script>
          $(document).ready(function(){
        	  $(".rechargeTable").DataTable({
        			"order":[[0,"desc"]]
        		});
        		
        		$(".consumeTable").DataTable({
        			"order":[[0,"desc"]]
        		});
          
          
         
          });
</script>




</body>
</html>