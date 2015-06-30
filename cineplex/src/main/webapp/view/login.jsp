<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <form action="ajax/login" method="post" id="loginForm">
					
					<div class="form-group">
						<label class="control-label">账号</label>
						<input type="text" class="form-control" name="id" required />
					</div>
					<div class="form-group">
						<label class="control-label">密码</label>
						<input type="password" class="form-control" name="password" required/>
					</div>
					
					<div class="text-center">
						<input type="submit" class="btn btn-default" value="登录"/>
					</div>
	</form>
	
<script type="text/javascript">
$(document).ready(function() {
    $('#loginForm')
        .bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
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
            		if(data.msg=="1")
            			window.location.reload();
            		else
            			alert(data.msg);
            		}
            })
           
        });
});
</script>