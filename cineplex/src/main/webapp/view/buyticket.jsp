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
												<li class="active"><a href="index#movie">正在热映</a></li>
												<li><a href="index#future">即将上映</a></li>
												
												
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

		

		<!-- footer start -->
		<!-- ================ -->
		<footer id="footer">

			<!-- .footer start -->
			<!-- ================ -->
			<div class="footer section">
			
			<div class="container">
			
					<div class="space"></div>
					<h2 class="text-center">选座购票</h2>
					
					<div class="row">
					<div class="col-sm-offset-3">
					
					<form action="ajax/buyTicket" method="post" id="buyForm">
						<div class="form-inline">
						<div class="form-group">
							<label>电影名称</label>
							<span >${sessionScope.schedule.movie.name}</span>
						</div>
						<div class="form-group">
							<label>放映厅</label>
							<span>${sessionScope.schedule.hall.name}</span>
						</div>
						<div class="form-group">
							<label>放映时间</label>
							<span><s:date name="#session.schedule.time.time" format="yyyy-MM-dd hh:mm" /></span>~<span><s:date name="#session.schedule.end.time" format="yyyy-MM-dd hh:mm" /></span>
						</div>
						<div class="form-group">
							<label>单价</label>
							<span>${sessionScope.schedule.price}</span>
						</div>
						</div>
						<div class="form-group">
							<label class="control-label">行号</label>
							<s:iterator value="#request.seat">
						
							
							<div class="form-inline">
							<label class="col-md-1 control-label">${row}</label>
							
							
								<s:iterator value="seats">
									<s:if test="avail==false">
										<input type="checkbox" class="seatbox inverse" name="cell" id="${rownum}-${colnum}" value="${rownum}-${colnum}" disabled>
										
									</s:if>
									<s:else>
								
									<input type="checkbox" class="seatbox" name="cell" id="${rownum}-${colnum}" value="${rownum}-${colnum}">
									</s:else>
								
								</s:iterator>
							</div>
					
							</s:iterator>
							
							<div class="form-inline">
							<label class="col-md-1 control-label">列号</label>
							<c:forEach var="j" begin="1" end="${requestScope.column}">
								<label class="check_row_num">
									${j}
								</label>
							</c:forEach>
							</div>
					
						</div>
						
						<div class="seatlist clear">
						<div class="form-inline">
								<div class=form-group>
								<label for="price">总价</label>
									<input type="text" name="price" class="form-control" id="price" value="0" disabled>
									
								</div>
								
								
								<s:if test="#session.user.gid=='2'">
									<div class=form-group>
									<label> 折后价</label>
									<span class="discount">0</span>
									</div>
									
									
									<div class=form-group>
										<label>卡余额</label>
										<span>${sessionScope.user.member.balance}</span>
									</div> 
								</s:if>
								
							</div>
							<div class="row">
							<s:if test="#session.user.gid<'2'">
								<div class="col-sm-4">
									<h4>支付方式</h4>
									<div class="radio">
						                 <label>
						                 	 
						                      <input type="radio" class="gender" name="cash" value="1" checked/> 现金
						                 </label>
						              </div>
						              <div class="radio">
						                 <label>
						                      <input type="radio" class="gender" name="cash" value="0"/> 会员卡
						                 </label>
						       			</div>
						       		<div style="display: none;" data-topic="0">
									<div class="well">
										<div class="form-group">
											<label class="control-label">账号</label>
											<input type="text" class="form-control" name="id" />
										</div>
										<div class="form-group">
											<label class="control-label">密码</label>
											<input type="password" class="form-control" name="password" />
										</div>
									</div>
								</div>
								</div>
								
							</s:if>
							
							<div class="col-sm-4">
								<h4>选座情况</h4>
								
								<ul></ul>
							</div>
							
							</div>
							
							
							
						</div>
					
						
					  	<div class="col-sm-offset-6">
					  	<input type="submit" class="btn btn-default" value="确认选购"/>
					  	</div>
					  	
					</form>
					</div>
					</div>
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
		<s:if test="#session.user.gid=='2'"><input type="hidden" value="${sessionScope.user.member.disaccount.disaccount}" id="dis"/></s:if>
		<s:else><input type="hidden" value="1" id="dis"/></s:else>
		
		
	
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
          	var price=0;
          	var $discount=$('#dis').val();
            var callbacks_list = $('.seatlist ul');
            $('.seatbox').on('ifChecked', function(event){
            	var seatinfo=this.id.split("-");
            	var seatdetail=seatinfo[0]+"排"+seatinfo[1]+"座";
              callbacks_list.append('<li class="help-block seat'+this.id+'"><span class="seat">' + seatdetail + '</span>已锁定</li>');
              price+=${sessionScope.schedule.price};
             
              
              $('#price')[0].value=price;
              $('.discount').html($discount*price);
            });
            $('.seatbox').on('ifUnchecked', function(event){
              $('.seat'+this.id).remove();
              price-=${sessionScope.schedule.price};
            
              $('#price')[0].value=price;
              $('.discount').html($discount*price);
            });
          $('.seatbox').iCheck({
              checkboxClass: 'icheckbox_square-red',
              radioClass: 'iradio_square-red',
              increaseArea: '20%'
            });
          
          $('#buyForm')
          .bootstrapValidator({
              message: 'This value is not valid',
              feedbackIcons: {
                  valid: 'glyphicon glyphicon-ok',
                  invalid: 'glyphicon glyphicon-remove',
                  validating: 'glyphicon glyphicon-refresh'
              }
          })
          .on('success.form.bv', function(e) {
              // Prevent form submission
              e.preventDefault();

              // Get the form instance
              var $form = $(e.target);

              // Get the BootstrapValidator instance
              var bv = $form.data('bootstrapValidator');

              // Use Ajax to submit form data
              $.ajax({
              	url:$form.attr('action'),
              	type:'POST',
              	dataType:'json',
              	data: $form.serialize(),
              	success:function(data){
              		$form.find(":submit").removeAttr("disabled");
              		if(data.msg=="1")
              			window.location.href="index#movie";
              		else
              			alert(data.msg);
              		}
              })
             
          });
          
          
          $('.seatlist .gender').on('ifChecked', function() {
                  var $container = $('[data-topic="0"]');
                  $container.toggle();

                  var display = $container.css('display');
                  
                          $('#buyForm').bootstrapValidator('addField', 'id', {
                              validators: {
                                  notEmpty: {
                                      message: '请输入会员卡号'
                                  }
                              }
                          });
	                      $('#buyForm').bootstrapValidator('addField', 'password', {
	                          validators: {
	                              notEmpty: {
	                                  message: '请输入会员卡密码'
	                              }
	                          }
	                      });
                         
              });
          
          
          
         
          });
</script>




</body>
</html>