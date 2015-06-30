package edu.nju.cineplex.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.cineplex.dao.HallDao;
import edu.nju.cineplex.model.Hall;
import edu.nju.cineplex.service.HallService;

@Service
public class HallServiceImpl implements HallService{
	
	@Autowired
	private HallDao hallDao;

	@Override
	public boolean addHall(Hall hall) {
		Hall result=hallDao.findByName(hall.getName());
		if(result==null){
			hallDao.save(hall);
			return true;
		}
			
		return false;
	}

	@Override
	public List<Hall> getAllHalls() {
		return hallDao.getAllHalls();
	}

	@Override
	public boolean updateHall(Hall hall) {
		if(hallDao.load(hall.getId())==null)
			return false;
		hallDao.update(hall);
		return true;
	}

	@Override
	public Hall load(int id) {
		// TODO Auto-generated method stub
		return hallDao.load(id);
	}

}
