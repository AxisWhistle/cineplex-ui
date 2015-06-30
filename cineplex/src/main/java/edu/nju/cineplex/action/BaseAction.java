package edu.nju.cineplex.action;


import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;

import edu.nju.cineplex.model.User;

public class BaseAction extends ActionSupport implements SessionAware,
        ServletRequestAware, ServletResponseAware,ServletContextAware {  
  
    private static final long serialVersionUID = 1L;  
    public ServletContext context;
    public HttpServletRequest   request;  
    public HttpServletResponse  response;  
    public Map<String, Object> session;
    
	public ServletContext getServletContext() {
		return context;
	}
	public void setServletContext(ServletContext servletContext) {
		this.context = servletContext;
	}
	public HttpServletRequest getServletRequest() {
		return request;
	}
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.request = servletRequest;
	}
	public HttpServletResponse getServletResponse() {
		return response;
	}
	public void setServletResponse(HttpServletResponse servletResponse) {
		this.response = servletResponse;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
		
	}
	
	public boolean isLogin(){
		if(session.get("user")!=null){
			return true;
		}
		return false;
	}
	
	public boolean isMember(){
		User user=(User) session.get("user");
		if(user!=null&&user.getGid()=='2')
			return true;
		return false;
	}
	public boolean isClerk(){
		User user=(User) session.get("user");
		if(user!=null&&user.getGid()=='1')
			return true;
		return false;
	}
	
	public boolean isManager(){
		User user=(User) session.get("user");
		if(user!=null&&user.getGid()=='0')
			return true;
		return false;
	}
	
	

  
}

