package edu.nju.cineplex.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.model.*;
import edu.nju.cineplex.service.*;
import edu.nju.cineplex.vo.MovieInfo;
import edu.nju.cineplex.vo.SliderInfo;

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
//		
		if(this.isManager()){
			List<Hall> hallList=hallService.getAllHalls();
			request.setAttribute("hallList", hallList);
			
			
		}else if(this.isMember()){
			User user=(User) session.get("user");
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
			
//			System.out.println(movies.size());
		}
		
		
		if(this.isLogin()){
			User user=(User) session.get("user");
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
	
	private void makeFakeDate(){
		makeMovieInfo();
//		makeScheduleInfo();
		makeSliderInfo();
//		makeTicketInfo();
	}



//	private void makeTicketInfo() {
//		// TODO Auto-generated method stub
//		
//	}



//	private void makeScheduleInfo() {
//		if(!session.containsKey("")){
//			
//		}
//		
//	}



	private void makeMovieInfo() {
		if(!session.containsKey("movielist")){
			List<MovieInfo> movieInfos = new ArrayList<MovieInfo>();
			String[] movieNames={"道士下山","我是路人甲","侏罗纪世界"};
			String[] movieIntros={"民国时期，外敌入侵，军阀混战，乱世中各类江湖人物纷纷登场。一个不堪忍受山中寂寞的小道士何安下偷偷下山，结果遭遇到一系列诡异奇幻的人物和事件。无心之中，他被卷入太极门掌门之争，并与来华偷师的日本忍者对局。后中统特务欲招揽其做间谍，他却利用这个机会帮京剧武生查老板截杀特务头子报夺妻之恨。何安下周旋于中统、纳粹博士、日本人和江湖之间，经历一系列匪夷所思的人物和事件，慢慢领悟武术的至理，而他的人生也永远的改变的故事",
					"学毕业的万国鹏为了完成演员梦想，从老家东北雪乡一路来到浙江横店，对拍戏一窍不通的他初来乍到屡屡碰壁，更引发连串笑话，但他从不轻言放弃，而是坚持一步一个脚印往前走，终于慢慢踏上正轨，成为一名“专业”的群众演员。 在这个“东方好莱坞”，万国鹏遇到了形形色色的年轻人，有的和自己一样坚定不移地做着演员梦，有的被现实打磨成了老油条，有的入戏太深，有的出戏太 早，梦想的模样时而清晰，时而模糊，而对于万国鹏来说，最重要的是在横店遇到了王婷，他想和她一起，把这个梦努力做下去",
					"侏罗纪公园惨剧发生的22年后。如今公园的所在地“努布拉岛”已经被重新建立成为了一个崭新的恐龙主题乐园，并更名为“侏罗纪世界”。当初的开办者约翰·哈蒙德所创办的“国际基因科技公司”已经被“马斯拉尼国际企业”收购。 欧文（克里斯·帕拉特 Chris Pratt 饰）是一名退役军人以及动物行为专家，在主园区的外围的迅猛龙研究基地进行隐密的工作。欧文多年来训练了一批具侵略性的迅猛龙，和它们建立起主从关系，勉 勉强强让它们得以压抑住掠食者的天性、不情愿的听从指示。。久而久之，当公园的游客开始对恐龙的表演开始感到厌倦时，在公司的要求下，公园所有的基因科学家 夜以继日地创造出了一只基因混合恐龙——D-Rex掠食者恐龙，专家一开始只是为了增加游客数量才动用这个计划，但未预料到野蛮和聪明程度都仍是未知数的 恐龙想出了逃脱方法，而消失在丛林深处。侏罗纪世界里的所有生物，包括人类和恐龙的性命都受到威胁。这时内部的命令让园区陷入混，游客成为了恐龙的猎物。恐龙们相继逃出，在大地、空中和水里对人类进行猎杀，整个园区已经没有任何一个角落是安全的，22年前的惨剧再度上演……"};
			String[] actors={"王宝强;张震;郭富城;范伟;林志玲"
					,"万国鹏;王婷;沈凯",
					"克里斯·帕拉特;布莱斯·达拉丝·霍华德;泰·辛普金斯;杰克·M·约翰森"
			};
			String[] types={"剧情","爱情","冒险"};
			String[] directors={"陈凯歌","尔冬升","科林·特雷沃罗"};
			String[] languages={"国语","国语","英语"};
			String[] onTimes={"2015-7-2","2015-7-9","2015-6-10"};
			for(int i =0;i<movieNames.length;i++){
				MovieInfo movieInfo=new MovieInfo(i, "movieCover/"+i+".jpg", movieNames[i], movieIntros[i], actors[i], types[i], 120, directors[i], languages[i], onTimes[i]);
				movieInfos.add(movieInfo);
			}
			session.put("movielist", movieInfos);
		}
		
		if(!session.containsKey("forwardlist")){
			List<MovieInfo> movieInfos = new ArrayList<MovieInfo>();
			String[] movieNames={"小时代4：灵魂尽头","奋斗吧！青春"};
			String[] actors={"杨幂;郭采洁;陈学冬"
					,"黄彦;杜晓书"
			};
			String[] types={"爱情","爱情"};
			String[] directors={"郭敬明","廖小飞"};
			String[] languages={"国语","国语"};
			String[] onTimes={"2015-7-9","2015-7-9"};
			for(int i =0;i<movieNames.length;i++){
				MovieInfo movieInfo=new MovieInfo(i, "movieCover/f"+i+".jpg", movieNames[i], "", actors[i], types[i], 120, directors[i], languages[i], onTimes[i]);
				movieInfos.add(movieInfo);
			}
			session.put("forwardlist", movieInfos);
		}
		
	}



	private void makeSliderInfo() {
		if(!session.containsKey("sliderlist")){
			List<SliderInfo> sliderInfos=new ArrayList<SliderInfo>();
			String[]titles ={"热映电影1","爱情片呢","侏罗纪嘉年华哦"};
			String[] contents={"不要犹豫快来看啊","小情侣们还等什么","冒险刺激停不下来"};
//			String[] targets={"dayMovieSchedule?movieId=0"};
			for(int i = 0;i<3;i++){
				SliderInfo sliderInfo=new SliderInfo(i,"movieCover/s"+i+".jpg" , titles[i], contents[i], "dayMovieSchedule?movieId="+i);
			}
			session.put("sliderlist", sliderInfos);
		}
		
	}
	

}
