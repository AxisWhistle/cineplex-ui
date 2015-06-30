package edu.nju.cineplex.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.model.User;
import edu.nju.cineplex.service.UserService;
@Repository
public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	

	private String msg;
	private String id;
	private String password;
	
	public String execute(){
		if(id==null)
			return INPUT;
		this.msg="未知错误";//登录失败
		User user = userService.login(id, password);
		
		if(user==null){
			this.msg=userService.error();			
		}else{
			this.msg="1";
			this.session.put("user", user);
		}
		
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
