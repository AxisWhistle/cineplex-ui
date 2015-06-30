package edu.nju.cineplex.dao;

import java.util.Calendar;
import java.util.List;

import edu.nju.cineplex.model.Schedule;

public interface ScheduleDao {

	public void save(Schedule schedule);
	
//	public Schedule findByName(String name);
	
	public List<Schedule> getAllSchedules();
	
	public void update(Schedule schedule); 
	
	public Schedule load(int id);
	
//	public List<Schedule> getColli(Calendar start, Calendar end);
	
	public List<Schedule> getColli(Schedule schedule);

	public List<Schedule> availableSchedules(Calendar now, Calendar end);

	public void merge(Schedule schedule);
}
