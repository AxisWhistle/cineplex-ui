package edu.nju.cineplex.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.cineplex.model.*;
import edu.nju.cineplex.service.HallService;
import edu.nju.cineplex.service.MovieService;
import edu.nju.cineplex.service.ScheduleService;
import edu.nju.cineplex.util.DateFormater;
import edu.nju.cineplex.vo.MovieInfo;
import edu.nju.cineplex.vo.ScheduleInfo;

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
	
	private List<List<ScheduleInfo>> schedulelist;
	private String startDay;
	private String endDay;
	
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
		
		Movie m = movieService.load(movieId);
		Set<Schedule> sc=m.getSchedules();
//		System.out.println(sc.size());
		String[] c = new String[7];
		Calendar nowCalendar = Calendar.getInstance();
		schedulelist= new ArrayList<List<ScheduleInfo>>();
		for(int i = 0;i<7;i++){
			Calendar ca = Calendar.getInstance();
			ca.add(Calendar.DATE,i);
			c[i] = DateFormater.CalendarToString(ca);
			List<ScheduleInfo> sInfos=new ArrayList<ScheduleInfo>();
			schedulelist.add(sInfos);
		}
		
		for(Schedule s:sc){
			Calendar cs = s.getTime();
			String day=DateFormater.CalendarToString(cs);
			for(int i = 0;i<7;i++){
				if(day.equals(c[i])){

//					System.out.println("here");
					if(cs.after(nowCalendar)){
						ScheduleInfo ss =new ScheduleInfo(s);
						schedulelist.get(i).add(ss);
					}
					
					break;
				}
			}
			
		}
		int i = 0;
		for(List<ScheduleInfo> l :schedulelist){
//			System.out.println("i");
			for(ScheduleInfo ss:l){
				System.out.println(ss.getMovie().getName()+"---"+ss.getDay()+ss.getWeekday()+ss.getTime());
			}
		}
		
		
//		Calendar day=Calendar.getInstance();
//		List<MovieInfo> movieInfos=(List<MovieInfo>) session.get("movielist");
//		MovieInfo m = null;
//		String[] weeks={"周日","周一","周二","周三","周四","周五","周六"};
//	    if(movieId<movieInfos.size()){
//	    	m=movieInfos.get(movieId);
//	    }
//	    schedulelist=new ArrayList<List<ScheduleInfo>>();
//	    int scheduleId=0;
//	    for(int i =0;i<7;i++){
//	    	List<ScheduleInfo> scheduleInfos=new ArrayList<ScheduleInfo>();
//	    	String dayString=day.get(Calendar.YEAR)+"-"+day.get(Calendar.MONTH)+"-"+day.get(Calendar.DAY_OF_MONTH);
//	    	String weekString=weeks[day.get(Calendar.DAY_OF_WEEK)];
//	    	for(int j = 0; j<5%(i+1);j++){
//	    		ScheduleInfo s =new ScheduleInfo(scheduleId, dayString, weekString,(10+j)+":45", "放映厅"+j, 120, 140, m, 80);
//	    		scheduleInfos.add(s);
//	    	}
//	    	schedulelist.add(scheduleInfos);
//	    	day.add(Calendar.DAY_OF_MONTH, 1);
//	    
//	    }
//	    	
//	   
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





	public List<List<ScheduleInfo>> getSchedulelist() {
		return schedulelist;
	}





	public void setSchedulelist(List<List<ScheduleInfo>> schedulelist) {
		this.schedulelist = schedulelist;
	}





	public String getStartDay() {
		return startDay;
	}





	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}





	public String getEndDay() {
		return endDay;
	}





	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	
	

}
