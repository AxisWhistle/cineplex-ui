<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<table class="table-striped table-bordered schedule display"  cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>电影名称</th>
            <th>放映厅</th>
            <th>放映时间</th>
            <th>片长</th>
            <th>票价</th>
            <th>操作</th>
        </tr>
    </thead>
 
    <tfoot>
        <tr>
            <th>电影名称</th>
            <th>放映厅</th>
            <th>放映时间</th>
            <th>片长</th>
            <th>票价</th>
            <th>操作</th>
        </tr>
    </tfoot>
 
    <tbody>
       
<s:iterator value="#request.movieList">
 		<tr>
            <td>${movie.name}</td>
            <td>${hall.name}</td>
            <td><s:date name="time.time" format="yyyy-MM-dd hh:mm" /></td>
            <td>${movie.duration}分钟</td>
            <td>${price}</td>
            
            <td>
           		<s:if test="#session.user==null">请登录后购票</s:if>
           		<s:else>
            		<a href="buyTickets_${id}" class="btn btn-default">选座购票</a>
            	</s:else>
            </td>
        </tr>

</s:iterator>
</tbody>
</table>


<script type="text/javascript">
$(document).ready(function() {
	
	$('.schedule').DataTable({
		'orders':[[2,'asc']]
	})
})
</script>