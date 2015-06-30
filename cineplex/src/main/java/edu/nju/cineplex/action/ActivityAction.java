package edu.nju.cineplex.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.model.Movie;
import edu.nju.cineplex.model.Options;
import edu.nju.cineplex.model.Question;
import edu.nju.cineplex.model.Schedule;
import edu.nju.cineplex.model.User;
import edu.nju.cineplex.service.ActivityService;
import edu.nju.cineplex.service.ScheduleService;
@Repository
public class ActivityAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	private int movieId;
	
	private int[] scheduleId;
	
	private String question;
	private String[] options;
	private int credit;
	
	private int sid;
	private int qid;
	
	private int oid;
	private String msg;
	
	public String addActivity(){
		User user=(User) session.get("user");
		
		if(user==null||user.getGid()!='1')
			return LOGIN;
		if(question==null||question.equals("")){
			availabelList();
			return INPUT;
		}
		
		Question question=new Question();
		question.setQues(this.question);
		question.setCredit(credit);
		
		for(int i=1;i<=options.length;i++){
			Options op=new Options();
			op.setContent(options[i-1]);
			op.setFlag(i+".");
			op.setQuestion(question);
			question.addOption(op);
			
		}
		
		
		activityService.addActivity(question,movieId,scheduleId);
		
		return SUCCESS;
	}

	private void availabelList() {
		//List<Movie> availabelList=activityService.availabelMovie();
		List<Schedule> schedules=activityService.availabelSchedule();
		List<Movie> movies=new ArrayList<Movie>();
		for(Schedule s:schedules){
			if(movies.contains(s.getMovie()))
				continue;
			else
				movies.add(s.getMovie());
		}
//		for(Movie m:movies){
//			for(Schedule s:m.getSchedules()){
//				System.out.print(s.getId()+" ");
//			}System.out.println();
//		}
		request.setAttribute("movieList", movies);
		request.setAttribute("scheduleList", schedules);
	}
	
	public String attendActivity(){
		msg="请选择一项后提交";
		if(this.isMember()){
			if(oid!=0){
				User user=(User) session.get("user");
				activityService.attendActivity(user,oid);
				msg="1";
			}
		}else
			msg="只有会员可以参加活动";
			
				
		
		
		return SUCCESS;
	}
	

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String[] getOptions() {
		return options;
	}

	public void setOptions(String[] options) {
		this.options = options;
	}

	public int[] getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(int[] scheduleId) {
		this.scheduleId = scheduleId;
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

}
