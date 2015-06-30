<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    
    <div class="row">
    

 <form action="ajax/uplevel"method="post" id="levelForm">
 	<div class="form-group">
 	<label for="bankId" class="col-sm-2 control-label">级别</label>
 	<div class="col-sm-4">
						<select class="form-control" name="level">

							<option value="">请选择升级</option>
							 

  						<s:iterator value="#request.discountList">
  								<s:if test="#session.user.member.disaccount.id >= id">
  									
  								</s:if><s:else>
  								<option value="${id}">${title}--会费${charge}, 折扣${disaccount}, 积分加倍${muticredit}</option>  
  								</s:else>
  						</s:iterator>
						</select>
						</div>
	</div> 	
					  
					  	<div class="col-sm-offset-2">
					  	<input type="submit" class="btn btn-default" value="提交兑换">
					  	</div>
					  	
					  	
</form>   

</div>
