package edu.nju.cineplex.service;

import java.util.Calendar;


public interface SystemService {
	/**
	 * 检查决定是否暂停或停止会员资格
	 * @param user
	 * @return
	 */
	public void memberValid(Calendar calendar);
	
	public void activityAuto(Calendar calendar);

}
