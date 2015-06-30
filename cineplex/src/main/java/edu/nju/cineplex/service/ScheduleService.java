package edu.nju.cineplex.service;


import java.util.List;

import edu.nju.cineplex.model.Schedule;

public interface ScheduleService {


	
	//public boolean addSchedule(int movieId,int hallId,double price,String time);
	
	public List<Schedule> availableSchedules();
	
	public List<Schedule> getAllSchedules();
	
	public String error();


	public Schedule load(int scheduleId);

	public boolean approve(int checkId, int granted);


	public boolean mergeSchedule(Schedule schedule);


}
