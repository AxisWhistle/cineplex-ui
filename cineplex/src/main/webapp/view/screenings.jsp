<%@page import="edu.nju.cineplex.vo.ScheduleInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cineplex-Screen-choose</title>

<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<link href="screenings.css" rel="stylesheet">
<script src="screenings.js"></script>

</head>
<body onload="change(1)">
	<div class="container-fluid" id="content">
		<div class="row">
			<div class="col-md-12" id="navigation"></div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div id="menu">
					<ul class="nav nav-pills">
						<li class="active"><a onclick="change(1)">6月29日 今天</a></li>
						<li><a onclick="change(2)">6月30日 周二</a></li>
						<li><a onclick="change(3)">7月1日 周三</a></li>
						<li><a onclick="change(4)">7月2日 周四</a></li>
						<li><a onclick="change(5)">7月3日 周五</a></li>
						<li><a onclick="change(6)">7月4日 周六</a></li>
						<li><a onclick="change(6)">7月5日 周日</a></li>
					</ul>
				</div>
				<div id="screens">
				<c:forEach items="${schedulelist }" var="sl"  varStatus="i">
					<table id="table${i.index}" class="table table-hover "contenteditable="true">
					<thead>
							<tr>
								<th>#</th>
								<td>放映时间</td>
								<td>放映厅</td>
								<td>剩余票数</td>
								<td>选座购票</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sl}" var="si">
							<td><p>${ si.movie.name}</p></td>
								<td><p>${si.time }</p></td>
								<td><p>${si.hall }</p></td>
								<td><p>${si.remain }</p></td>
								<td><a href="buyTickets_${si.id}">选座购票</a></td>
							</c:forEach>
						</tbody>
					</table>
				</c:forEach>
					

				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>