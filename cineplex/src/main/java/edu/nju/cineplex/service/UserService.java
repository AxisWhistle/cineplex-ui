package edu.nju.cineplex.service;

import java.util.List;

import edu.nju.cineplex.model.User;

public interface UserService {
	
	/**
	 * 登录验证
	 * @param user
	 * @return 成功则为null，否则为错误信息
	 */
	public User login(String id,String password);
	public String error();
	public boolean register(String id, String password, char gid);
	public User load(String id);
	
	public List<User> getUsersByRole(char c);
	

}
