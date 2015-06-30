package edu.nju.cineplex.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.cineplex.dao.*;
import edu.nju.cineplex.model.*;
import edu.nju.cineplex.service.ActivityService;
@Service
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private MovieDao movieDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private BaseDao baseDao;
	

	
	@Override
	public void addActivity(Question question, int movieId, int[] scheduleId) {
		Movie movie=movieDao.load(movieId);
		for(int i:scheduleId){
			question.addSchedule(scheduleDao.load(i));
		}
		question.setMovie(movie);
		System.out.println(question.getOptions().size());
		questionDao.merge(question);
	}


	


	@Override
	
	public List<Schedule> availabelSchedule() {

		Calendar now =Calendar.getInstance();
		//Calendar end=Calendar.getInstance();
		//end.add(Calendar.MONTH, 1);
		List<Schedule> schedules=scheduleDao.availableSchedules(now, null);
		return schedules;
	}
	@Override
	public List<Question> getAllQuestions(){
		return questionDao.getAllQuestions();
	}
	
	@Override
	public List<Question> getAvailable(User user){
		if(user.getGid()<'2'){
			return this.getAllQuestions();
		}else{
			user=userDao.load(user.getId());
			Member member=user.getMember();
			Date today=new Date(Calendar.getInstance().getTimeInMillis());
			Set<Ticket> tickets=user.getTickets();
			List<Schedule> schedules=new ArrayList<Schedule>();
			List<Question> questions=new ArrayList<Question>();//已经参加过的活动
			List<Question> results=new ArrayList<Question>();
			for(Options option:member.getOptions()){
				//option.getQuestion();
				questions.add(option.getQuestion());
			}
			for(Ticket ticket:tickets){
				
				
				Schedule schedule=ticket.getSchedule();
				if(schedule.getMovie().getOffTime().after(today)){
					if(!schedules.contains(schedule)){
						schedules.add(schedule);
						
						for(Question question:schedule.getQuestions()){
							if(!questions.contains(question)){
								if(!results.contains(question))
									results.add(question);
							}
						}
					}
				}
			}
			
			
			return results;
		}
		//return null;
	}





	@Override
	public void attendActivity(User user, int oid) {
		user=userDao.load(user.getId());
		Member member=user.getMember();
		System.out.println(oid);
		Options option=(Options) baseDao.load(Options.class, oid);
		member.addOption(option);
		option.addMember(member);
		
		baseDao.merge(option);
		
	}

}
