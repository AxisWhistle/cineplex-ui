package edu.nju.cineplex.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.cineplex.dao.UserDao;
import edu.nju.cineplex.model.User;
import edu.nju.cineplex.service.UserService;
import edu.nju.cineplex.util.MD5andKL;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	private String error;

	@Override
	public User login(String id,String password) {
		
//		password=MD5andKL.MD5(password);
//		password=MD5andKL.KL(password);
//		User user=new User();
//		user.setId(id);
//		user.setPassword(password);
//		user.setGid('0');
//		userDao.save(user);
		
		User user=userDao.load(id);
		if(user==null){
			error="账号不存在";
			return null;
		}
		
		if(MD5andKL.MD5(password).equals(MD5andKL.JM(user.getPassword())))
			return user;
		error="密码错误";
		return null;
	}
	
	public String error(){
		return this.error;
	}
	@Override
	public boolean register(String id,String password,char gid){
		User user = userDao.load(id);
		if(user!=null){
			error="账户已存在";
			return false;
		}
		
		password=MD5andKL.MD5(password);
		password=MD5andKL.KL(password);
		user=new User();
		user.setId(id);
		user.setPassword(password);
		user.setGid(gid);
		userDao.save(user);
		return true;
	}

	@Override
	public User load(String id) {
		
		return userDao.load(id);
	}

	@Override
	public List<User> getUsersByRole(char c) {
		
		return userDao.findByColumn("gid", String.valueOf(c));
	}
	
	

}
