package edu.nju.cineplex.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.model.*;
import edu.nju.cineplex.service.*;

@Repository
public class IndexAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private HallService hallService;
	@Autowired
	private UserService userService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private RechargeService rechargeService;
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private TicketService ticketService;
	
	public String execute(){
		User user=(User) session.get("user");
		if(this.isManager()){
			List<Hall> hallList=hallService.getAllHalls();
			request.setAttribute("hallList", hallList);
			
			
		}else if(this.isMember()){
			
			List<Recharge> rechargeList=rechargeService.getUserRecharges(user.getMember().getId());
			request.setAttribute("rechargeList", rechargeList);
			List<Consume> consumeList=rechargeService.getUserConsumes(user.getMember().getId());
			request.setAttribute("consumeList", consumeList);
			List<Ticket> ticketList=ticketService.getTicketsByUser(user.getId());
			request.setAttribute("ticketList", ticketList);
			List<Discount> discountList=memberService.allDiscount();
			request.setAttribute("discountList", discountList);
			

		}
		
		else if(this.isClerk()){
			List<Movie> movieMngList=movieService.getFutureMovies();
			request.setAttribute("movieMngList", movieMngList);
			List<Hall> hallList=hallService.getAllHalls();
			request.setAttribute("hallList", hallList);
			List<Member> memberList=memberService.allMember();
			request.setAttribute("memberList", memberList);
			
			List<Schedule> schedules=activityService.availabelSchedule();
			System.out.println(schedules.size());
			List<Movie> movies=new ArrayList<Movie>();
			for(Schedule s:schedules){
				if(movies.contains(s.getMovie()))
					continue;
				else
					movies.add(s.getMovie());
			}

			request.setAttribute("movieAcList", movies);
			request.setAttribute("scheduleAcList", schedules);
			
			System.out.println(movies.size());
		}
		
		
		if(this.isLogin()){
			List<Question> questionList=activityService.getAvailable(user);
			request.setAttribute("questionList", questionList);
			
//			System.out.println(questionList.size());
//			for(Question question:questionList){
//				System.out.println(question.getQues());
//				for(Options option:question.getOptions()){
//					System.out.println(option.getContent());
//				}
//				
//			}
			
		}
		List<City> cityList=memberService.allCity();
		request.setAttribute("cityList", cityList);
		List<Schedule> scheduleList=scheduleService.getAllSchedules();
		request.setAttribute("scheduleList", scheduleList);
		List<Schedule> movieList=scheduleService.availableSchedules();
		request.setAttribute("movieList", movieList);
		
	
		return SUCCESS;
	}
	
	
	
	public String logout(){
		session.clear();
		return SUCCESS;
	}
	

}
