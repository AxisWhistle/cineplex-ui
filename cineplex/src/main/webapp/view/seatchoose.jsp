<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cineplex-choose-seat</title>

<%@ include file="common/css.jsp"%>
<%@ include file="common/js.jsp"%>
<link href="assets/css/square/red.css" rel="stylesheet">

<link href="seatchoose.css" rel="stylesheet">

</head>
<body>
	<div class="container-fluid" id="content">
		<div class="row">
			<div class="col-md-12" id="navigation"></div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<form>
					<div class="form-group">
						<label class="control-label">行号</label>
						<s:iterator value="#request.seat">
							<div class="form-inline">
								<label class="col-md-1 control-label">${row}</label>
								<s:iterator value="seats">
									<s:if test="avail==false">
										<input type="checkbox" class="seatbox inverse" name="cell"
											id="${rownum}-${colnum}" value="${rownum}-${colnum}" disabled>
									</s:if>
									<s:else>
										<input type="checkbox" class="seatbox" name="cell"
											id="${rownum}-${colnum}" value="${rownum}-${colnum}"
											onclick="chooseseat(${rownum}-${colnum})">
									</s:else>
								</s:iterator>
							</div>
						</s:iterator>
						<div class="form-inline">
							<label class="col-md-1 control-label">列号</label>
							<c:forEach var="j" begin="1" end="${requestScope.column}">
								<label class="check_row_num"> ${j} </label>
							</c:forEach>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-5">
						<img alt="Bootstrap Image Preview"
							src="http://lorempixel.com/140/140/" />
					</div>
					<div class="col-md-7">
						<h3>横冲直撞好莱坞</h3>
						<p>语言版本：国语2D</p>
						<p>时长：1小时58分钟</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<p>影院：SFC上影永华店</p>
						<p>影厅：9号厅</p>
						<p>场次：06-29（周一）12：50</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<em>座位：</em>
						<div id="seats">
							<p>还未选择座位</p>
						</div>
						<div id="commit">
							<button onclick="buy()">购买</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="bottombar">
			<div class="col-md-12">
				<h>使用说明：</h>
				<ul>
					<li>1、每笔订单最多可选购5张电影票，情侣座不单卖；</li>
					<li>2、选座时，请尽量选择相邻座位，不要留下单个座位；</li>
					<li>3、点击“完成选座”后，请在15分钟内完成支付，超时系统将释放你选定的座位。</li>
				</ul>
			</div>
		</div>
	</div>
</body>



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
<script type="text/javascript" href="seatchoose.js"></script>
</html>