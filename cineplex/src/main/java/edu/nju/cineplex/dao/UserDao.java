package edu.nju.cineplex.dao;

//import java.util.List;

import java.util.List;

import edu.nju.cineplex.model.User;

public interface UserDao {
	
	public User load(String id);
	
	public void save(User user);
//	
//	public void update(User user);
//	
//	public List<User> groupList(char gid);

	public void update(User user);

	public void merge(User user);
	
	public List<User> findByColumn(String column,String value);
}
