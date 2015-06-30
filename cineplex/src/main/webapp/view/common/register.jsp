<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<s:include value="../common/css.jsp"></s:include>
<link href="assets/css/style_v2.css" rel="stylesheet">
<link href="assets/css/square/blue.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<div id="page-login" class="row">
		<div class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
			<div class="text-right">
				<a href="login" class="txt-default">已有账号?</a>
			</div>
			<div class="box">
				<form class="box-content" action="member_register" method="post">
					<div class="text-center">
						<h3 class="page-header">CINEPLEX 注册页面</h3>
					</div>
					<div class="form-group">
						<label class="control-label">姓名</label>
						<input type="text" class="form-control" name="name" required="required" />
					</div>
					<div class="form-group">
						<label class="control-label">密码</label>
						<input type="password" class="form-control" name="password" required="required" />
					</div>
					<div class="form-group">
						<label class="control-label">确认密码</label>
						<input type="password" class="form-control" name="confirm" required="required" />
					</div>
					<div class="form-group">
			          <label>性别</label>
			          <div class="radio-inline">
		                 <label>
		                      <input type="radio" class="gender" name="gender" value="m" checked/> 男
		                 </label>
		              </div>
		              <div class="radio-inline">
		                  <label>
		                       <input type="radio" class="gender" name="gender" value="f" /> 女
		                  </label>
		              </div>
   					</div>
  
  
     
				    <div class="form-group">
						<label for="hallId">居住地</label>
    					<select class="form-control" name="hallId">

							<option value="">请选择居住地</option>

  						<s:iterator value="#request.cityList">
  	
  								<option value="${id}">${name}</option>  	
  						</s:iterator>
						</select>
					</div>
    

					<div class="form-group">
				       <label for="birthday">生日</label>
				         <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd">
				              <input class="form-control" size="16" name="birthday" type="date"/>
				         </div>
								
				    </div>
 
					
					<div class="text-center">
						<input type="submit" class="btn btn-primary" value="注册"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<s:include value="../common/js.jsp"></s:include>
<script src="assets/js/icheck.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  	
  $('.gender').iCheck({
      
      radioClass: 'iradio_square-blue',
      increaseArea: '20%'
    });
  });
</script>
</body>
</html>