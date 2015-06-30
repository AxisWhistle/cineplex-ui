package edu.nju.cineplex.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.cineplex.model.*;
import edu.nju.cineplex.service.*;

public class UserAction extends BaseAction{

	
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private RechargeService rechargeService;
	
	private String id;
	private String password;
	private String msg;
	
	
	private Member member=new Member();
	private int city; 
	
	
	public String addClerk(){
		msg="注册失败";
		if(this.isManager()){
			if(userService.register(id, password, '1'))
				msg="1";
			else{msg=userService.error();
			}
		}else{
			msg="没有权限";
		}
		return SUCCESS;
	}
	
	public String register(){
		if(member.getName()==null)
			return INPUT;
			
		City city=memberService.loadCity(this.city);
		member.setCity(city);
		User user=memberService.register(member, password);
		session.put("user", user);
		
		return SUCCESS;
	}
	
	public String updateMember(){
		msg="0";
		System.out.println(id);
		User user=userService.load(id);
		Member m=user.getMember();
		City city=memberService.loadCity(this.city);
		m.setCity(city);
		m.setBirthday(member.getBirthday());
		m.setGender(member.getGender());
		m.setName(member.getName());
		memberService.update(m);
		user.setMember(m);
		System.out.println("ok");
		session.put("user", user);
		
		msg="1";
		
		return SUCCESS;
	}
	
	public String member(){
		if(this.isClerk()){
			User user= userService.load(id);
			System.out.println(user);
			if(user!=null&&user.getGid()=='2'){
				List<Recharge> rechargeList=rechargeService.getUserRecharges(user.getMember().getId());
				request.setAttribute("rechargeList", rechargeList);
				List<Consume> consumeList=rechargeService.getUserConsumes(user.getMember().getId());
				request.setAttribute("consumeList", consumeList);
				request.setAttribute("member", user.getMember());
				
			}else{
				System.out.println("membernull");
				request.setAttribute("member", null);
			}
		}else{
			return LOGIN;
		}
		return SUCCESS;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public int getCity() {
		return city;
	}

	public void setCity(int city) {
		this.city = city;
	}


}
