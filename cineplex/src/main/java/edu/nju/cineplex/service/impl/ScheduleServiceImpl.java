package edu.nju.cineplex.service.impl;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.cineplex.dao.HallDao;
import edu.nju.cineplex.dao.MovieDao;
import edu.nju.cineplex.dao.ScheduleDao;
import edu.nju.cineplex.model.Movie;
import edu.nju.cineplex.model.Schedule;
import edu.nju.cineplex.service.ScheduleService;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	private final static int MAXPREDAY=700;

	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private MovieDao movieDao;
	@Autowired
	private HallDao hallDao;
	private String error;
	
	@Override
	public boolean mergeSchedule(Schedule schedule) {
		
		if(unValidTime(schedule.getTime()))
			return false;
		if(outMovieTime(schedule)){
			return false;
		}
		if(existColli(schedule))
			return false;
		scheduleDao.merge(schedule);
		return true;
	}

	private boolean outMovieTime(Schedule schedule) {
		Movie movie=schedule.getMovie();
		Calendar toCheck=schedule.getTime();
		Calendar s=Calendar.getInstance();
		Calendar e=Calendar.getInstance();
		s.setTimeInMillis(movie.getOnTime().getTime());
		e.setTimeInMillis(movie.getOffTime().getTime());
		e.add(Calendar.DATE, 1);
		if(toCheck.after(e)||toCheck.before(s)){
			error="放映时间不在电影上映期间";
			return true;
		}
		return false;
	}

	

	private boolean updateSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		if(schedule.getGranted()==1){
			if(unValidTime(schedule.getTime()))
			return false;
			if(existColli(schedule))
			return false;
		}
		System.out.print("update");
		scheduleDao.update(schedule);
		return true;
	}

	@Override
	public List<Schedule> getAllSchedules() {
		return scheduleDao.getAllSchedules();
	}
	
	private boolean existColli(Schedule schedule){
		List<Schedule> colli=scheduleDao.getColli(schedule);
		if(colli.size()==0)
			return false;
		error="放映时间地点存在冲突";
		
		return true;
	}
	private boolean unValidTime(Calendar time){
		Calendar local=Calendar.getInstance();
		local.add(Calendar.DAY_OF_MONTH, 1);
		
		
		if(time.after(local)||time.equals(local))
			return false;
		
		error="请至少提前一整天制定计划";
		return true;
	}

	@Override
	public String error() {
		
		return this.error;
	}

	@Override
	public boolean approve(int checkId,int granted) {
		Schedule schedule=scheduleDao.load(checkId);
		System.out.println(checkId+" ,"+granted);
		if(schedule==null){
			error="计划id出错";
		}
		schedule.setGranted(granted);
		System.out.println(checkId+" ,"+granted);
		System.out.println(schedule.getId()+" ,"+schedule.getGranted());
		
		return this.updateSchedule(schedule);
	}
	

	/**
	 * 可以购买的票，从now到未来MAXPREDAY天
	 */
	@Override
	public List<Schedule> availableSchedules() {

		Calendar now=Calendar.getInstance();
		Calendar end=Calendar.getInstance();
		end.add(Calendar.DAY_OF_MONTH, MAXPREDAY);
		
		return scheduleDao.availableSchedules(now,end);
	}

	@Override
	public Schedule load(int scheduleId) {
		return scheduleDao.load(scheduleId);
	}

	

	


}
