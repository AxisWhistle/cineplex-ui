<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

				
<div role="tabpanel" class="container">
	
	<div class="space"></div>
  	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
	<li role="presentation" class="active"><a href="#scheduleMng" aria-controls="scheduleMng" role="tab" data-toggle="tab">放映计划管理</a></li>
    	<li role="presentation" ><a href="#hallMng" aria-controls="hallMng" role="tab" data-toggle="tab">放映厅管理</a></li>
    	
    	<li role="presentation"><a href="#clerkMng" aria-controls="clerkMng" role="tab" data-toggle="tab">添加服务员</a></li>
    	<li role="presentation"><a href="#analysis" aria-controls="analysis" role="tab" data-toggle="tab">统计信息</a></li>
  	</ul>

  	<!-- Tab panes -->
  	<div class="tab-content">
    	
    	
    	
    	<div role="tabpanel" class="tab-pane active" id="scheduleMng">
    	<div class="space"></div>
			<s:include value="scheduleList.jsp"></s:include>
		</div>
		
		<div role="tabpanel" class="tab-pane" id="hallMng">
    	
    	<a class="btn btn-primary" data-toggle="collapse" href="#hallTab" aria-expanded="false" aria-controls="collapseExample">
		  新增放映厅
		</a>
		
		<div class="collapse" id="hallTab">
		  <div class="well">
		    
			
			<form action="ajax/addHall" method="post" id="hallForm">
				<div class="form-inline">
					<div class="form-group">
						<label>名称</label>
						<input type="text" class="form-control" name="hallName" required/>
					</div>
					<div class="form-group">
						<label>行数</label>
						<input type="number" class="form-control" name="seatRow" required/>
					</div>
					<div class="form-group">
						<label>列数</label>
						<input type="number" class="form-control" name="seatColumn" required/>
					</div>
					<input type="submit" class="btn btn-default" value="提交"/>
				
				</div>
			  	
			  	
			  	
			  	
			</form>
		  </div>
		</div>

			
			
			<div class="space"></div>
			
			<table class="table-striped table-bordered hallTable display"  cellspacing="0">
    <thead>
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>行数</th>
            <th>列数</th>
            <!-- th>操作</th-->
        </tr>
    </thead>
 
    <tfoot>
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>行数</th>
            <th>列数</th>
            <!-- th>操作</th-->
        </tr>
    </tfoot>
 
    <tbody>
       
<s:iterator value="#request.hallList">
 		<tr>
            <td>${id}</td>
            <td>${name}</td>
            <td>${seatrow}</td>
            <td>${seatcolumn}</td>
            <!-- td><a href="#" class="btn btn-default">修改</a></td-->
        </tr>

</s:iterator>
</tbody>
</table>
			

    	</div>
		
    	<div role="tabpanel" class="tab-pane" id="clerkMng">
			<div class="space"></div>
		    	<a class="btn btn-primary" data-toggle="collapse" href="#clerkTab" aria-expanded="false" aria-controls="collapseExample">
				  新增服务员
				</a>
				
				<div class="collapse" id="clerkTab">
				  <div class="well">
				    
					
					<form action="ajax/addClerk" method="post" id="clerkForm">
						<div class="form-group">
							<label class="control-label">账号</label>
							<input type="text" class="form-control" name="id" required="required" />
						</div>
						<div class="form-group">
							<label class="control-label">密码</label>
							<input type="password" class="form-control" name="password" required="required" />
						</div>
					
					
						<input type="submit" class="btn btn-default" value="提交"/>
						
					
					</form>
					
					
					
				  </div>
				</div>

			
			
				<div class="space"></div>
				<div class="addClerkResponse"></div>
		</div>
    	<div role="tabpanel" class="tab-pane" id="analysis">
			<%@ include file="statis.jsp"%>
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
        },
        fields: {
            hallName: {
                validators: {
                    notEmpty: {
                        message: '名称不能为空'
                    },
                    
                }
            },
            seatRow:{
            	validators: {
            		notEmpty: {
            			message: '请填写密码'
            		},
            		integer: {
            			message: '请填写正整数'
            		},
            		greaterThan: {
            			value: 0,
            			message: '行数应当大于0'
            		}
            	}
            },
            seatColumn:{
            	validators: {
            		notEmpty: {
            			message: '请填写密码'
            		},
            		integer: {
            			message: '请填写正整数'
            		},
            		greaterThan: {
            			value: 0,
            			message: '列数应当大于0'
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
        		if(data.msg=="1")
        			tHall.row.add([data.hall.id,data.hall.name,data.hall.seatrow,data.hall.seatcolumn]).draw();  		
        		else if(data.msg=="0"){
        			alert("没有权限，仅对经理开放");
        		}else{
        			alert(data.msg);
        		}
        		
        		}
        })
       
    });
	
	$('#clerkForm')
    .bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            id: {
                validators: {
                    notEmpty: {
                        message: '账号不能为空'
                    },
                    regexp: {
                    	regexp: /^c/,
                    	message: '服务员账号以c开头'
                    }
                    
                }
            },
            password:{
            	validators: {
            		notEmpty: {
            			message: '请填写密码'
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
        		if(data.msg=="1")
        			
        			$('.addClerkResponse').html("<p>已成功添加服务员"+data.id+"</p>");
        		else{
        			alert(data.msg);
        		}
        		
        		}
        })
       
    });
    
        
    
});
</script>
