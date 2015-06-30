<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link href="assets/plugins/datetime/css/bootstrap-datetimepicker.css" rel="stylesheet">
<script src="assets/plugins/datetime/js/bootstrap-datetimepicker.js"></script>
				
<div role="tabpanel" class="container">
	<div class="space"></div>
  	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist" id="mytab">
		<li role="presentation"  class="active"><a href="#scheduleMng" aria-controls="scheduleMng" role="tab" data-toggle="tab">放映计划管理</a></li>
    	<li role="presentation"><a href="#movieMng" aria-controls="movieMngl" role="tab" data-toggle="tab">影片管理</a></li>
    	
    	<li role="presentation"><a href="#activityMng" aria-controls="activityMng" role="tab" data-toggle="tab">活动管理</a></li>
    	<li role="presentation"><a href="#memberInfo" aria-controls="memberInfo" role="tab" data-toggle="tab">会员信息</a></li>
  	</ul>

  	<!-- Tab panes -->
  	<div class="tab-content">
  	
  		<div role="tabpanel" class="tab-pane active" id="scheduleMng">
  	
  			<div class="space"></div>
    		<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#scheduleModal" data-action="ajax/addSchedule" data-ex="ok">新增放映计划</a>
    		<div class="space"></div>
    		<s:include value="scheduleList.jsp"></s:include>
    	</div>
  	
  	
    	<div role="tabpanel" class="tab-pane" id="movieMng">
    		<div class="space"></div>
    	
    		<a class="btn btn-primary" data-toggle="collapse" href="#movieTab" aria-expanded="false" aria-controls="collapseExample" data-ex="ok">
				  新增电影
			</a>
				
				<div class="collapse" id="movieTab">
				  <div class="well">
				    
					
					<form action="addMovie" method="post" enctype="multipart/form-data">
						<div class="form-group">
					    	<label for="name">名称</label>
					    	<input type="text" class="form-control" name="movie.name" 
					    	placeholder="电影名称" required="required">
					  	</div>
					  	
					  	<div class="form-group">
					    		<label for="image">封面</label>
					    		<input type="file" class="form-control" name="image">
					    		<s:fielderror></s:fielderror>
					  	</div>
					  	
					  	<div class="form-inline">
					  		
					  		<div class="form-group">
					    		<label for="type">类型</label>
					    		<input type="text" class="form-control" name="movie.type"
					    		placeholder="爱情片、惊悚片等" required="required">
					  		</div>
					  		<div class="form-group">
					    		<label for="duration">时长</label>
					    		<input type="number" class="form-control" name="movie.duration"
					    		placeholder=">0" required="required">
					  		</div>
					  		
					  		<div class="form-group">
								<label for="onTime">上线日期</label>
								<div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd">
						              <input class="form-control" name="movie.onTime" type="text" readonly>
						                
										<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						         </div>
													
							</div>
							<div class="form-group">
								<label for="offTime">下线日期</label>
								<div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd">
						              <input class="form-control" name="movie.offTime" type="text" readonly>
						                
										<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						         </div>
													
							</div>
					  		
					  	</div>
					  	<div class="form-group">
					    	<label for="actor">演员</label>
					    	<input type="text" class="form-control" name="movie.actor" 
					    	placeholder="演员名称">
					  	</div>
					  	<div class="form-group">
					    	<label for="introduction">简介</label>
					    	<textarea class="form-control" rows="8" name="movie.introduction" 
					    	placeholder="电影介绍"></textarea>
					    	
					  	</div>
					
					
						<input type="submit" class="btn btn-default" value="提交"/>
						
					
					</form>
					
					
					
				  </div>
				</div>
				
				<div class="space"></div>
				<table class="table-striped table-bordered movieTable display" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>名称</th>
            <th>封面</th>
            <th>类型</th>
            <th>上线</th>
            <th>下线</th>
            <th>时长</th>
            <th>演员</th>
                        
            <th>操作</th>
        </tr>
    </thead>
 
    <tfoot>
        <tr>
            <th>名称</th>
            <th>封面</th>
            <th>类型</th>
            <th>上线</th>
            <th>下线</th>
            <th>时长</th>
            <th>演员</th>
                        
            <th>操作</th>
        </tr>
    </tfoot>
 
    <tbody>
       
<s:iterator value="#request.movieMngList">
 		<tr>
            <td>${name}</td>
            <td><img class="cover" src="${cover}"/></td>
            <td>${type}</td>
            <td><s:date name="onTime" format="yyyy-MM-dd" /></td>
            <td><s:date name="offTime" format="yyyy-MM-dd" /></td>
            <td>${duration}</td>
            <td>${actor}</td>
            
            <td>
            
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#scheduleModal"
            	data-movie="${id}" data-action="ajax/addSchedule" data-ex="ok"
            >新增放映计划</button>
            
            
            </td>
        </tr>

</s:iterator>
</tbody>
</table>
    	
    	

    	</div>
    	
    	<div role="tabpanel" class="tab-pane" id="activityMng">
    		<div class="space"></div>
    	
    		<a class="btn btn-primary" data-toggle="collapse" href="#activityTab" aria-expanded="false" aria-controls="collapseExample" data-ex="ok">
				  新增活动
			</a>
				
				<div class="collapse" id="activityTab">
				  <div class="well">
				  
				  <form action="addActivity" method="post">
	

					<div class="form-group">
						<label for="movieId">电影名称</label>
					    <select class="form-control" name="movieId" id="movieAcId" onchange="loadSchedule()">
					
						<option value="">请选择计划上映的电影</option>
					
					  <s:iterator value="#request.movieAcList">
					  	
					  		<option value="${id}">${name}</option>
					  	
					  	
					  </s:iterator>
					</select>
					</div>
					
					<div class="form-group">
						<label for="scheduleId">可匹配放映计划</label>
						 <s:iterator value="#request.scheduleAcList">
					  		
					  	
					  		<div style="display:none" class="movieAc movieAc${movie.id } form-group">
					  			<input type="checkbox" name="scheduleId" value="${id}" class="checkSchedule">
					  				<label for="schedule"><s:date name="time.time" format="yyy-MM-dd hh:mm" ></s:date>在${hall.name}播映，售价${price } </label>	
					  			</div>
					  		</s:iterator>
						
					   
					</div>
					
					
					  <div class="form-group">
					  <label for="question">问题</label>
					  <input type="text" class="form-control" name="question" placeholder="问题描述"
					   required="required">
					  </div>
					   <div class="form-group">
					  <label for="credit">奖励积分</label>
					  <input type="number" class="form-control" name="credit" placeholder="填写积分值（正整数）"
					   required="required">
					  </div>
					  <div class="form-group" id="option-field">
					  <label for="options">问题选项</label>
					  <input type="button" class="btn btn-default" onclick="addOption()" value="添加选项">
					  
					  <div class="form-group">
					  <input type="text" class="form-control" name="options" placeholder="请填写问题选项" required="required">
					  </div>
					  <div class="form-group">
					  <input type="text" class="form-control" name="options" placeholder="请填写问题选项" required="required">
					  </div>
					
					  </div>
					  
					  
					  	<button type="submit" class="btn btn-default">新增活动</button>
					  	
					  	
					</form>
				  </div>
				</div>
    	
    			<div class="space"></div>
    			<table class="table-striped table-bordered activity display"  cellspacing="0" width="100%">
				    <thead>
				        <tr>
				            <th>电影名称</th>
				            <th>匹配放映计划</th>
				            <th>活动问题</th>
				            <th>问题选项</th>
				            <th>奖励积分</th>
				            
				        </tr>
				    </thead>
				 
				    <tfoot>
				        <tr>
				            <th>电影名称</th>
				            <th>匹配放映计划</th>
				            <th>活动问题</th>
				            <th>问题选项</th>
				            <th>奖励积分</th>
				        </tr>
				    </tfoot>
				 
				    <tbody>
				       
				<s:iterator value="#request.questionList">
				 		<tr>
				            
				            <td>${movie.name}</td>
				            <td>
					            <s:iterator value="schedules">
					            	<p>放映厅：${hall.name} 场次： <s:date name="time.time" format="yyyy-MM-dd HH:mm"/></p>
					            
					            </s:iterator>
				            </td>
				            
				            <td>${ques}</td>
				            <td>
				            	<s:iterator value="options">
					            	<p>${flag} ${content }</p>
					            
					            </s:iterator>
				            </td>
				            <td>${credit}</td>
				            
				        </tr>
				
				</s:iterator>
				</tbody>
				</table>
    	</div>
    	<div role="tabpanel" class="tab-pane" id="memberInfo">
    		
    		<div class="space"></div>
    			 <table class="table-striped table-bordered member display"  cellspacing="0" width="100%">
				    <thead>
				        <tr>
				            <th>会员账号</th>
				            <th>姓名</th>
				            <th>性别</th>
				            <th>城市</th>
				            <th>生日</th>
				            <th>操作</th>
				            
				        </tr>
				    </thead>
				 
				    <tfoot>
				        <tr>
				            <th>会员账号</th>
				            <th>姓名</th>
				            <th>性别</th>
				            <th>城市</th>
				            <th>生日</th>
				            <th>操作</th>
				        </tr>
				    </tfoot>
				 
				    <tbody>
				       
				<s:iterator value="#request.memberList">
				 		<tr>
				            
				            <td>${user.id}</td>
				            <td>
					            ${name}
				            </td>
				            
				            <td>
				            <s:if test="gender='m'">
				            	男
				            </s:if>
				            <s:else>女</s:else>
				            </td>
				            <td>
				            ${city.name}
				            </td>
				            <td>
				            	<s:date name="birthday" format="yyyy-mm-dd"/>
				            </td>
				            <td>
				            <a href="member_${user.id}" class="btn btn-default">详细记录</a>
							</td>
				            
				        </tr>
				
				</s:iterator>
				</tbody>
				</table>
    		
    	</div>
  	</div>
  	
  	
  	

</div>

<div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog" aria-labelledby="scheduleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="buyModalLabel">放映计划表单</h4>
      </div>
      <div class="modal-body">
        <form method="post" id="scheduleForm">
	

			<div class="form-group">
				<label for="movieId">电影名称</label>
			    <select class="form-control movieId" name="movieId">
			
				<option value="">请选择计划上映的电影 </option>
				
			
			  <s:iterator value="#request.movieMngList">
			  	<s:if test="#request.movieSelect==id">
			  		<option value="${id}" selected>${name}</option>
			  	</s:if>
			  	<s:else>
			  		<option value="${id}">${name}</option>
			  	</s:else>
			  	
			  	
			  	
			  </s:iterator>
			</select>
			<input type="hidden" class="help_" value=''>
			<s:iterator value="#request.movieMngList">
			  	<input type="hidden" class="help_${id}" value='影片上映时间：<s:date name="onTime" format="yyyy-MM-dd" />~<s:date name="offTime" format="yyyy-MM-dd" />'>
			  	
			</s:iterator>
			
			
			
			<p class="help-time"></p>
			</div>

			
			<div class="form-group">
				<label for="hallId">放映厅</label>
			    <select class="form-control hallId" name="hallId">
			
				<option value="">请选择放映厅</option>
			
			  <s:iterator value="#request.hallList">
			  	
			  		<option value="${id}">${name}</option>  	
			  </s:iterator>
			</select>
			</div>
			
			<div class="form-group">
			       <label for="time">放映时间</label>
			         
			         <div class="input-group date form_datetime" data-date="" data-date-format="yyyy-mm-dd hh:ii">
						              <input class="form-control time" name="time" type="text" readonly>
						                
										<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						         </div>
			         <s:actionerror/>
							
			</div>
			  <div class="form-group">
			  <label for="price">票价</label>
			  <input type="text" class="form-control price" name="price" placeholder=">0.00"
			   required="required">
			  </div>
			<div class="text-center">
			  	
			  	<button type="submit" class="btn btn-default">提交</button>
			  	
			  	</div>
			</form>
        
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">
$(document).ready(function() {
	
	$('#scheduleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  if(button.data('ex')=="ok"){
		  	//var movieId = button.data('movie') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  	var modal = $(this)
		  
		  
		    modal.find('.modal-body .movieId').val(button.data('movie'));
		  	modal.find('.modal-body form').attr("action",button.data('action') );
		 	modal.find('.modal-body .hallId').val(button.data('hall'));
		  	modal.find('.modal-body .time').val(button.data('time'));
		  	modal.find('.modal-body .price').val(button.data('price'));
		  	
		  
		  }
		});
	
	$('.movieId').change(function(){
		var $sel=$(this),
			$id=$sel.val();
		
		$('.help-time').html($('.help_'+$id).val());
		
		
	})
	
	$('.movieTable').DataTable();
	$('.activity').DataTable();
	$('.member').DataTable();
	
	$('#scheduleForm')
    .bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields:{
        	movieId:{
        		validators:{
        			notEmpty:{
        				message:"请选择一个影片"
        			}
        		}
        	},
        	hallId:{
        		validators:{
        			notEmpty:{
        				message:"请选择一个放映厅"
        			}
        		}
        	},
        	price:{
        		validators:{
        			notEmpty:{
        				message:"请输入票价"
        			},
        			numeric:{
        				message:"票价应为数字"
        			},
        			greaterThan:{
        				value:0,
        				message:"票价必须为正数"
        			}
        		}
        	}
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
        		if(data.msg=="1"){
        			
        			window.location.reload();
        		}
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
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 0,
		forceParse: 1,
		pickerPosition:'top-right'
    });

</script>
<script type="text/javascript">
  function addOption(){
	  var text='<div class="form-group"><input type="text" class="form-control" name="options" placeholder="请填写问题选项" required="required"></div>';
		$("#option-field").append(text);
		
  };
  function loadSchedule(){
			var mid=$("#movieAcId").val();
			$('.movieAc').css("display","none");
			$('.movieAc'+mid).css("display","block");
			
		
	};
	
	$(document).ready(function(){
      	
      $('.checkSchedule').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%'
        });
      });
	
  </script>