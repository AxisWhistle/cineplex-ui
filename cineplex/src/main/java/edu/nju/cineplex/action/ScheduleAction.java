package edu.nju.cineplex.action;

import java.util.Calendar;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.cineplex.model.*;
import edu.nju.cineplex.service.HallService;
import edu.nju.cineplex.service.MovieService;
import edu.nju.cineplex.service.ScheduleService;

public class ScheduleAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	@Autowired
	private HallService hallService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ScheduleService scheduleService;
	
	
	private String movieSelect;
	
	private int movieId;
	private int hallId;
	private String time;
	private double price;
	
	private int checkId;
	
	private String msg;
	
	private int granted;
	
	public String addSchedule(){
		msg="0";
		Schedule schedule=new Schedule();
		schedule.setMovie(movieService.load(movieId));
		schedule.setHall(hallService.load(hallId));
		schedule.setPrice(price);
		schedule.setTime(calcuTime(time));
		schedule.setEnd(calcuEnd(schedule));
		
			
			if(scheduleService.mergeSchedule(schedule))
				msg="1";
			else
				msg=scheduleService.error();
		
		return SUCCESS;
	}
	
	
	

	
	public String checkSchedule(){
		msg="0";
		if(this.isManager())
			if(scheduleService.approve(checkId,granted)){
				this.msg="1";
				
			}else{
				msg=scheduleService.error();
			}
			
		return SUCCESS;
	}
	
	public String dayMovieSchedule(){
		return SUCCESS;
	}
	
	
	
	public String updateSchedule(){
		msg="0";
		System.out.println(checkId);
		Schedule schedule=scheduleService.load(checkId);
		schedule.setMovie(movieService.load(movieId));
		schedule.setHall(hallService.load(hallId));
		schedule.setPrice(price);
		schedule.setTime(calcuTime(time));
		schedule.setEnd(calcuEnd(schedule));
		schedule.setGranted(0);
		if(scheduleService.mergeSchedule(schedule))
			msg="1";
		else
			msg=scheduleService.error();
		
		return SUCCESS;
	}
	

	private Calendar calcuTime(String time) {
		System.out.println(time);
		String datetime[]=time.split(" ");
		String date[]=datetime[0].split("-");
		String tim[]=datetime[1].split(":");
		Calendar start=new  GregorianCalendar(Integer.parseInt(date[0]),Integer.parseInt(date[1])-1,Integer.parseInt(date[2]),
				Integer.parseInt(tim[0]),Integer.parseInt(tim[1]));
		return start;
	}


	private Calendar calcuEnd(Schedule schedule) {
//		Calendar end=schedule.getTime();
		Calendar end=Calendar.getInstance();
		end.setTimeInMillis(schedule.getTime().getTimeInMillis());
		int duration=schedule.getMovie().getDuration();
		end.add(Calendar.MINUTE, duration);
		
		return end;
	}
	
	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public int getHallId() {
		return hallId;
	}

	public void setHallId(int hallId) {
		this.hallId = hallId;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getMovieSelect() {
		return movieSelect;
	}

	public void setMovieSelect(String movieSelect) {
		this.movieSelect = movieSelect;
	}

	public int getCheckId() {
		return checkId;
	}

	public void setCheckId(int checkId) {
		this.checkId = checkId;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}



	public int getGranted() {
		return granted;
	}



	public void setGranted(int granted) {
		this.granted = granted;
	}
	
	

}
