package edu.nju.cineplex.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.dao.UserDao;
import edu.nju.cineplex.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private BaseDao baseDao;
	@Override
	public User load(String id) {
		
		return (User)baseDao.load(User.class, id);
	}
	@Override
	public void save(User user) {
		baseDao.save(user);
		
	}
	@Override
	public void update(User user) {

		baseDao.update(user);
	}
	@Override
	public void merge(User user) {
		baseDao.merge(user);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<User> findByColumn(String column, String value) {
		// TODO Auto-generated method stub
		return baseDao.findByColumn(User.class, column, value);
	}

}
