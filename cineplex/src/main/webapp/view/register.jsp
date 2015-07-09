<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>



    <form action="register" method="post" id="registerForm">
					<div class="form-group">
						<label class="control-label">姓名</label>
						<input type="text" class="form-control" name="member.name" required/>
					</div>
					<div class="form-group">
						<label class="control-label">密码</label>
						<input type="password" class="form-control" name="password" required/>
					</div>
					<div class="form-group">
						<label class="control-label">确认密码</label>
						<input type="password" class="form-control" name="confirm" required/>
					</div>
					<div class="form-group">
			          <label>性别</label>
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
   					</div>
  
  
     
				    <div class="form-group">
						<label for="city">居住地</label>
    					<select class="form-control" name="city">

							<option value="">请选择居住地</option>
							 

  						<s:iterator value="#request.cityList">
  	
  								<option value="${id}">${name}</option>  	
  						</s:iterator>
						</select>
					</div>
    

					
				    
				    <div class="form-group">
       					<label for="member.birthday">生日</label>
				         <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd">
				              <input class="form-control" id="birth" name="member.birthday" value="1990-01-01" type="text" readonly>
				                
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				         </div>
				
    				</div>
				    
				

 
					
					<div class="text-center">
						<input type="submit" class="btn btn-primary" value="注册"/>
					</div>
				</form>
				

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
   
<script type="text/javascript">
$(document).ready(function(){
  	
  $('.gender').iCheck({
      
      radioClass: 'iradio_square-blue',
      increaseArea: '20%'
    });
  });
</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#registerForm').bootstrapValidator({
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
            },
            password:{
            	validators:{
            		notEmpty: {
                   	 message: '密码不能为空'
                	},
            		stringLength:{
            			min:6,
            			message:'密码至少6位'
            		}
            	}
            },
            confirm: {
                validators: {
                    notEmpty: {
                        message: '请重复输入密码'
                    },
                    identical: {
                        field: 'password',
                        message: '两次密码不一致'
                    }
                }
            },
            'member.gender': {
            	validators: {
                    notEmpty: {
                        message: '请选择性别'
                    }
                }
            },
            city:{
            	validators: {
                    notEmpty: {
                        message: '请选择城市'
                    }
                }
            },
            'member.birthday': {
            	validators: {
                    notEmpty: {
                        message: '请选择生日'
                    }
                }
            },
            
        }
    })
});
</script>
