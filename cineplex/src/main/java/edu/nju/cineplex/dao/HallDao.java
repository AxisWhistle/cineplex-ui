package edu.nju.cineplex.dao;

import java.util.List;

import edu.nju.cineplex.model.Hall;

public interface HallDao {

	public void save(Hall hall);
	
	public Hall findByName(String name);
	
	public List<Hall> getAllHalls();
	
	public void update(Hall hall); 
	
	public Hall load(int id);
}
