package edu.nju.cineplex.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.model.User;
import edu.nju.cineplex.service.RechargeService;
import edu.nju.cineplex.service.UserService;

@Repository
public class RechargeAction extends BaseAction{

	@Autowired
	RechargeService rechargeService;
	@Autowired
	UserService userService;
	
	private static final long serialVersionUID = 1L;
	
	private String bankId;
	private String password;
	private String price;
	private String msg;
	private String money;
	
	private int level;
	
	public String execute(){
		msg="0";
		User user=(User) session.get("user");
		if(this.isMember()){
			if(rechargeService.recharge(bankId, password, user.getId(), Double.parseDouble(price))){
				user=userService.load(user.getId());
				session.put("user", user);
				msg="1";
				return SUCCESS;
			}
		}
		msg=rechargeService.error();
		return SUCCESS;
	}
	public String convert(){
		msg="0";
		User user=(User) session.get("user");
		if(this.isMember()){
			
			
			if(rechargeService.convert( user.getId(), Double.parseDouble(money))){
				user=userService.load(user.getId());
				session.put("user", user);
				msg="1";
				return SUCCESS;
			}
		}
		msg=rechargeService.error();
		return SUCCESS;
	}
	
	public String uplevel(){
		msg="0";
		User user=(User) session.get("user");
		if(this.isMember()){
			
			
			if(rechargeService.uplevel( user.getId(), level)){
				user=userService.load(user.getId());
				session.put("user", user);
				msg="1";
				return SUCCESS;
			}
		}
		msg=rechargeService.error();
		return SUCCESS;
	}

	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
}
