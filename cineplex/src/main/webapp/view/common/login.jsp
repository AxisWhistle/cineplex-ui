<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<s:include value="css.jsp"></s:include>
<link href="assets/css/style_v2.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<div id="page-login" class="row">
		<div class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
			<div class="text-right">
				<a href="register" class="txt-default">没有帐号?</a>
			</div>
			<div class="box">
				<form class="box-content" action="login" method="post">
					<div class="text-center">
						<h3 class="page-header">CINEPLEX 登录页面</h3>
					</div>
					<div class="form-group">
						<label class="control-label">账号</label>
						<input type="text" class="form-control" name="id" required="required" />
					</div>
					<div class="form-group">
						<label class="control-label">密码</label>
						<input type="password" class="form-control" name="password" required="required" />
					</div>
					<s:actionerror/>
					<div class="text-center">
						<input type="submit" class="btn btn-primary" value="登录"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<s:include value="js.jsp"></s:include>
</body>
</html>