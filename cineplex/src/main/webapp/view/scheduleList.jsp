<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<table class="table-striped table-bordered schedule display"  cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>编号</th>
            <th>电影名称</th>
            <th>放映厅</th>
            <th>放映时间</th>
            <th>片长</th>
            <th>票价</th>
            <th>审核状态</th>            
            <th>操作</th>
        </tr>
    </thead>
 
    <tfoot>
        <tr>
            <th>编号</th>
            <th>电影名称</th>
            <th>放映厅</th>
            <th>放映时间</th>
            <th>片长</th>
            <th>票价</th>
            <th>审核状态</th>            
            <th>操作</th>
        </tr>
    </tfoot>
 
    <tbody>
       
<s:iterator value="#request.scheduleList">
 		<tr>
            <td>${id}</td>
            <td>${movie.name}</td>
            <td>${hall.name}</td>
            <td><s:date name="time.time" format="yyyy-MM-dd HH:mm" /></td>
            <td>${movie.duration}分钟</td>
            <td>${price}</td>
            <td id="g${id}">
            <s:if test="granted==0">未审核</s:if>
            <s:elseif test="granted==1">已批准</s:elseif>
            <s:else>未通过</s:else>
            
            </td>
            <td id="e${id}">
            <s:if test="session.user.gid=='0'">
            	<s:if test="granted==0">
            		<button class="btn btn-default" onclick="update(${id},1)">批准</button>
            		<button class="btn btn-default" onclick="update(${id},2)">驳回</button>
            	</s:if>
            </s:if>
            
            <s:elseif test="session.user.gid=='1'">
             	<s:if test="granted!=1">
            		<a href="#" class="btn btn-default" data-toggle="modal" data-target="#scheduleModal" data-ex="ok"
            		data-movie="${movie.id}" data-hall="${hall.id}" data-time='<s:date name="time.time" format="yyyy-MM-dd HH:mm"/>' data-price="${price }" data-action="ajax/updateSchedule_${id}" >修改放映计划</a>
            	</s:if>
            </s:elseif>	
            </td>
        </tr>

</s:iterator>
</tbody>
</table>

<script>

function update(id,g){
   
    $.ajax({
      url: 'ajax/checkSchedule',
      type: 'post',
      dataType: 'json',
      data: {
    	  checkId:id,
    	  granted:g
      },
      success: function(data){
    	  if(data.msg=="1"){
    	  if(g==1)
    	  	$("#g"+id).html("已批准");
    	  else
    		$("#g"+id).html("未通过");
    	  $("#e"+id).empty();
    	  }else
    		  alert(data.msg);
    	  
      },
      error:function(){
    	  alert("与现有放映计划冲突，不能批准!");
      }
    });
  }

$(document).ready(function() {
	$('.schedule').DataTable({
		"order": [[7,"desc"],[6,"asc"],[ 3, "asc" ]]
	
	})
}
)
</script>