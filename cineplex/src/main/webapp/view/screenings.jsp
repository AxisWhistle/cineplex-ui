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
<%@ include file="common/css.jsp"%>
<%@ include file="common/js.jsp"%>
<link href="screenings.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid" id="content">
		<div class="row">
			<div class="col-md-12" id="navigation"></div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 container" role="tabpanel">
				<div id="menu">
					<ul class="nav nav-pills" role="tablist" id="mytab">
						<li class="active" role="presentation"><a href="#t1"
							aria-controls="t1" role="tab" data-toggle="tab">6月29日 今天</a></li>
						<li role="presentation"><a href="#t2" aria-controls="t2"
							role="tab" data-toggle="tab">7月1日 周三</a></li>
						<li role="presentation"><a href="#t3" aria-controls="t3"
							role="tab" data-toggle="tab">7月2日 周四</a></li>
						<li role="presentation"><a href="#t4" aria-controls="t4"
							role="tab" data-toggle="tab">7月3日 周五</a></li>
						<li role="presentation"><a href="#t5" aria-controls="t5"
							role="tab" data-toggle="tab">7月4日 周六</a></li>
						<li role="presentation"><a href="#t6" aria-controls="t6"
							role="tab" data-toggle="tab">7月5日 周日</a></li>
						<li role="presentation"><a href="#t7" aria-controls="t7"
							role="tab" data-toggle="tab">6月30日 周二</a></li>
					</ul>
				</div>
				<div id="screens" class="tab-content">
					<c:forEach items="${schedulelist }" var="sl" varStatus="i">
						<div role="tabpanel" class="tab-pane " id="t${i.index+1 }">
							<table class="table schedule display"  cellspacing="0" width="100%">
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
									<c:forEach items="${sl}" var="si" varStatus="j">
										<tr>
											<td><p>${ j.index+1}</p></td>
											<td><p>${si.time }</p></td>
											<td><p>${si.hall }</p></td>
											<td><p>${si.remain }</p></td>
											<td><a href="buyTickets_${si.id}">选座购票</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
		$('.schedule').DataTable();
	}
	</script>
</body>

</html>