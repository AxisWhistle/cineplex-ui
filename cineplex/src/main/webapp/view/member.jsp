<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

				
<div role="tabpanel" class="container">
	<div class="space"></div>
  	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
    	<li role="presentation" class="active"><a href="#personInfo" aria-controls="personInfo" role="tab" data-toggle="tab">个人信息</a></li>
    	<li role="presentation"><a href="#cardInfo" aria-controls="cardInfo" role="tab" data-toggle="tab">卡信息</a></li>
    	<li role="presentation"><a href="#ticketInfo" aria-controls="ticketInfo" role="tab" data-toggle="tab">电影票</a></li>
    	<li role="presentation"><a href="#activityInfo" aria-controls="activityInfo" role="tab" data-toggle="tab">活动信息</a></li>
  	</ul>

  	<!-- Tab panes -->
  	<div class="tab-content">
  	
    	<div role="tabpanel" class="tab-pane active" id="personInfo">
    		<div class="space"></div>

			<form class="form-horizontal" id="personForm" action="ajax/updateMember">
				<div class="form-group">
					<label class="col-sm-2 control-label">会员号</label>
					<div class="col-sm-4">
						<input class="form-control" value="${sessionScope.user.id}" name="id" readonly>
					</div>
				</div>
				
				
				<div class="form-group">
					<label class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-4">
						<input class="form-control" value="${sessionScope.user.member.name}" name="member.name">
					</div>
				</div>
				
				<div class="form-group">
			          <label class="col-sm-2 control-label">性别</label>
			          <s:if test="#session.user.member.gender=='m'">
			          <div class="radio-inline">
		                 <label>
		                 	  
		                      <input type="radio" class="gender" name="member.gender" value="m" checked/> 男
		                      
		                 </label>
		              </div>
		              <div class="radio-inline">
		                  <label>
		                       <input type="radio" class="gender" name="member.gender" value="f" /> 女
		                  </label>
		              </div>
		              </s:if>
		              <s:else>
		              <div class="radio-inline">
		                 <label>
		                 	  
		                      <input type="radio" class="gender" name="member.gender" value="m"/> 男
		                      
		                 </label>
		              </div>
		              <div class="radio-inline">
		                  <label>
		                       <input type="radio" class="gender" name="member.gender" value="f" checked /> 女
		                  </label>
		              </div>
		              </s:else>
   				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">城市</label>
					<div class="col-sm-4">
					
						<select class="form-control" name="city">
  						<s:iterator value="#request.cityList">
  							<s:if test="#session.user.member.city.id==id"><option value="${id}" selected>${name}</option></s:if>
  							<s:else><option value="${id}">${name}</option></s:else>
  								  	
  						</s:iterator>
						</select>
					</div>
				</div>
				
				
				
				<div class="form-group">
       					<label class="col-sm-2 control-label">生日</label>
       					<div class="col-sm-4">
				         <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd">
				              <input class="form-control" name="member.birthday" value="${sessionScope.user.member.birthday }" type="text" readonly>				                
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				         </div>
				         </div>
				
    			</div>
    			
    			<div class="col-sm-offset-2">
    			<input type="submit" class="btn btn-default" value="提交信息"/>
    			</div>
			
			</form>
		
			

    	</div>
    
    	<div role="tabpanel" class="tab-pane" id="cardInfo">
    		<div class="space"></div>
    		
    		<div class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label">卡状态</label>
					<div class="col-sm-4">
						<s:if test="#session.user.member.state==0"><p>未激活</p>
    					</s:if>
    					<s:elseif test="#session.user.member.state==1"><p>已激活</p>
    						
    					</s:elseif>
    					<s:elseif test="#session.user.member.state==2"><p>已暂停</p>
    					</s:elseif>
    					<s:elseif test="#session.user.member.state==3"><p>已停止</p>
    					</s:elseif>
    					<s:else><p>已取消</p>	
    					</s:else>
    				</div>	
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">卡余额</label>
					<div class="col-sm-2">
					<p>${sessionScope.user.member.balance}</p>
					</div>
					<div class="col-sm-2">
						<a class="btn btn-primary" data-toggle="collapse" href="#rechargeTab" aria-expanded="false" aria-controls="collapseExample">充值缴费</a>
					</div>
				</div>
				
				<div class="collapse" id="rechargeTab">
				  <div class="well">
				
					<form action="ajax/recharge"method="post" id="rechargeForm">
						<div class="form-group">
					    	<label for="bankId" class="col-sm-2 control-label">银行卡号</label>
					    	<div class="col-sm-4">
					    	<input type="text" class="form-control" name="bankId" 
					    	placeholder="请输入银行卡号" required>
					    	</div>
					  	</div>
					  	
					  
					  	
					  	<div class="form-group">
					    	<label for="password" class="col-sm-2 control-label">银行密码</label>
					    	<div class="col-sm-4">
					    	<input type="password" class="form-control" name="password" 
					    	placeholder="请输入密码" required>
					    	</div>
					  	</div>
					  	<div class="form-group">
					    	<label for="duration" class="col-sm-2 control-label">充值</label>
					    	<div class="col-sm-4">
					    	<input type="text" class="form-control" name="price"
					    		placeholder=">0" required>
					    	<p class="help-block"><s:if test="#session.user.member.state==0">(一次缴纳200以上可以激活会员资格)</s:if></p>
					    	</div>
					  	</div>
					  	<div class="col-sm-offset-2">
					  	<input type="submit" class="btn btn-default" value="提交充值">
					  	</div>
					  	
					  	
					</form>
				  </div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">卡积分</label>
					<div class="col-sm-2">
					<p>${sessionScope.user.member.credit}</p>
					</div>
					<div class="col-sm-2">
						<a class="btn btn-primary" data-toggle="collapse" href="#creditToMoney" aria-expanded="false" aria-controls="collapseExample">兑换积分</a>
					</div>
					
				</div>
				<div class="collapse" id="creditToMoney">
				  <div class="well">
				
					<form action="ajax/convert"method="post" id="convertForm">
						<div class="form-group">
					    	<label for="money" class="col-sm-2 control-label">兑换现金</label>
					    	<div class="col-sm-4">
					    	<input type="text" class="form-control" name="money" 
					    	placeholder="请输入金额" required>
					    	</div>
					  	</div>
					  	
					  
					  	<div class="col-sm-offset-2">
					  	<input type="submit" class="btn btn-default" value="提交兑换">
					  	</div>
					  	
					  	
					</form>
				  </div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">卡级别</label>
					<div class="col-sm-2">
					<p>${sessionScope.user.member.disaccount.title}</p>
					</div>
					<div class="col-sm-2">
						<a class="btn btn-primary" data-toggle="collapse" href="#upDiscount" aria-expanded="false" aria-controls="collapseExample">会员升级</a>
					</div>
					
				</div>
				
				<div class="collapse" id="upDiscount">
				  <div class="well">
				  
				  	<s:include value="discount.jsp"></s:include>						
						  	
					  
					
				  </div>
				</div>
				
				<div class="form-group">
					<label for="bankId" class="col-sm-2 control-label">可享折扣</label>
					<div class="col-sm-4">
						${sessionScope.user.member.disaccount.disaccount}
					</div>
				</div>
						  	
				<div class="form-group">
					<label for="bankId" class="col-sm-2 control-label">积分加倍</label>
					<div class="col-sm-4">
						  ${sessionScope.user.member.disaccount.muticredit}
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
			
			<div class="space"></div>
			
			
		
		
    		
    		
    	
    	</div>
    	
    	<div role="tabpanel" class="tab-pane" id="ticketInfo">
    	<div class="space"></div>
    	
    	<table class="table-striped table-bordered ticketTable display"  cellspacing="0">
    <thead>
        <tr>
            <th>编号</th>
            <th>电影</th>
            <th>放映厅</th>
            <th>放映时间</th>
            <th>时长</th>
            <th>票价</th>
            <th>座位</th>
            <!-- th>操作</th-->
        </tr>
    </thead>
 
    <tfoot>
        <tr>
            <th>编号</th>
            <th>电影</th>
            <th>放映厅</th>
            <th>放映时间</th>
            <th>时长</th>
            <th>票价</th>
            <th>座位</th>
            <!-- th>操作</th-->
        </tr>
    </tfoot>
 
    <tbody>
       
	<s:iterator value="#request.ticketList">
	 		<tr>
	            <td>${id}</td>
	            <td>${schedule.movie.name}</td>
	            <td>${schedule.hall.name}</td>
	            <td><s:date name="schedule.time"/></td>
	            <td>${schedule.movie.duration}</td>
	            <td>${price}</td>
	            <td>${rownum}排${colnum}座
	            <!-- td><a href="#" class="btn btn-default">修改</a></td-->
	        </tr>
	
	</s:iterator>
	</tbody>
	</table>
    	
		</div>
		
    	<div role="tabpanel" class="tab-pane" id="activityInfo">
    		<div class="space"></div>
    		<s:if test="#request.questionList.size==0">
    		<h3 class="text-center">暂时没有可以参加的活动</h3>
    		</s:if>
    		
    			<s:iterator value="#request.questionList">
    				<form class="form-horizontal attendForm" action="ajax/attendActivity" method="POST">
    					
    					<div class="form-group">
				          <label class="col-sm-offset-2 control-label">电影${movie.name}:  ${ques}</label>
				        </div>
				        <div class="form-group">
				        
				          <s:iterator value="options">
					          <div class="radio">
				                 <label class="col-sm-offset-2">
				                 
				                      <input type="radio" class="gender" name="oid" value="${id}"/> ${content}
				                 </label>
				              </div>
			              </s:iterator>
			             
	   					</div>
	   					<div class="col-sm-offset-2">
	   						<input type="submit" class="btn btn-default" value="提交回答"/>
	   					</div>
    				</form>
    				<div class="space"></div>
    			</s:iterator>
    		
    	</div>
  	</div>

</div>
<script type="text/javascript">
$(document).ready(function() {
	var tHall=$('.hallTable').DataTable();
	$('#hallForm')
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
        		//$form[0].reset();
        		$form.find(":submit").removeAttr("disabled");     		
        		if(data.msg=="1")
        			tHall.row.add([data.hall.id,data.hall.name,data.hall.seatrow,data.hall.seatcolumn]).draw();  			
        		else
        			alert("出错了");
        		
        		}
        })
       
    });
	
	$('#personForm').bootstrapValidator({
        message: '无效值',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'member.name': {
                validators: {
                    notEmpty: {
                        message: '姓名不能为空'
                    }
                }
            }
        }
    }).on('success.form.bv', function(e) {
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
        		if(data.msg=="1")
        			window.location.reload();
        		else
        			alert(data.msg);
        		}
        })
       
    });
	
	$(".rechargeTable").DataTable({
		"order":[[0,"desc"]]
	});
	$(".ticketTable").DataTable({
		"order":[[3,"desc"]]
	});
	$(".consumeTable").DataTable({
		"order":[[0,"desc"]]
	});
	
	$('#rechargeForm').bootstrapValidator({
        message: '无效值',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            bankId: {
                validators: {
                    notEmpty: {
                        message: '银行卡号不能为空'
                    }
                }
            },
            password:{
            	validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }
                }
            },
            price:{
            	validators: {
                    notEmpty: {
                        message: '金额不能为空'
                    },
                    digits:{
                    	message: '请正确输入金额'
                    }
                }
            }
        }
    }).on('success.form.bv', function(e) {
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
        		if(data.msg=="1")
        			window.location.reload();
        		else
        			alert(data.msg);
        		}
        })
       
    });
	
	
	
	$('#convertForm').bootstrapValidator({
        message: '无效值',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            
            money:{
            	validators: {
                    notEmpty: {
                        message: '金额不能为空'
                    },
                    digits:{
                    	message: '请正确输入金额'
                    }
                }
            }
        }
    }).on('success.form.bv', function(e) {
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
        		if(data.msg=="1")
        			window.location.reload();
        		else
        			alert(data.msg);
        		}
        })
       
    });
	

	
	$('#levelForm').bootstrapValidator({
        message: '无效值',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            
            level:{
            	validators: {
                    notEmpty: {
                        message: '请选择级别'
                    }
                }
            }
        }
    }).on('success.form.bv', function(e) {
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
        		if(data.msg=="1")
        			window.location.reload();
        		else
        			alert(data.msg);
        		}
        })
       
    });
	
	
	$('.attendForm').bootstrapValidator({
        message: '无效值',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        
        },
       
    }).on('success.form.bv', function(e) {
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
        		if(data.msg=="1")
        			$form.remove();
        		else
        			alert(data.msg);
        		}
        })
       
    });
	
    
        
    
});
</script>
<script type="text/javascript">
   
    $('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 4,
		minView: 2,
		forceParse: 1,
		pickerPosition:'top-right'
    });

</script>
