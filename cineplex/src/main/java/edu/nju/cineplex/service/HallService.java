package edu.nju.cineplex.service;

import java.util.List;

import edu.nju.cineplex.model.Hall;

public interface HallService {

	/**
	 * 添加放映厅
	 * @param hall
	 * @return 是否成功
	 */
	public boolean addHall(Hall hall);
	
	/**
	 * 获得所有放映厅
	 * @return
	 */
	public List<Hall> getAllHalls();
	
	/**
	 * 更新放映厅
	 * @param hall
	 * @return 是否成功
	 */
	public boolean updateHall(Hall hall);
	
	public Hall load(int id);
}
