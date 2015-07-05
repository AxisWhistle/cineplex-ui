<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cineplex-choose-seat</title>

<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

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
</html>