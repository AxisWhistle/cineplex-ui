package edu.nju.cineplex.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.dao.HallDao;
import edu.nju.cineplex.model.Hall;
@Repository
public class HallDaoImpl implements HallDao{

	@Autowired
	private BaseDao baseDao;
	@Override
	public void save(Hall hall) {
		
		baseDao.save(hall);
	}

	@Override
	public Hall findByName(String name) {
		
		return (Hall) baseDao.findByUnique(Hall.class, "name", name);
	}

	@Override
	public void update(Hall hall) {
		baseDao.update(hall);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Hall> getAllHalls() {
		
		return baseDao.getAllList(Hall.class);
	}

	@Override
	public Hall load(int id) {
		
		return (Hall)baseDao.load(Hall.class, id);
	}

	
}
