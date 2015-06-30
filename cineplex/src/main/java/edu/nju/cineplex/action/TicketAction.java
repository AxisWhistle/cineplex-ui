package edu.nju.cineplex.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.model.VO.Line;
import edu.nju.cineplex.model.Schedule;
import edu.nju.cineplex.model.VO.Seat;
import edu.nju.cineplex.model.Ticket;
import edu.nju.cineplex.model.User;
import edu.nju.cineplex.service.ScheduleService;
import edu.nju.cineplex.service.TicketService;
import edu.nju.cineplex.service.UserService;

@Repository
public class TicketAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private UserService userService;
	
	private int scheduleId;
	
	private String[] cell;
	private String price;
	
	private int cash;
	
	private String id;//
	private String password;
	
	private String msg;
	
	//初始化选座页面
	public String buyTickets(){
		if(!this.isLogin()){
			return LOGIN;
		}
		
				
			Schedule schedule=scheduleService.load(scheduleId);
			session.put("schedule", schedule);
			int row=schedule.getHall().getSeatrow();
			int column=schedule.getHall().getSeatcolumn();
			Set<Ticket> set=schedule.getTickets();
			
			
			List<Line> seatMap=new ArrayList<Line>();
		
			for(int i=1;i<=row;i++){
				Line line=new Line(i);
				for(int j=1;j<=column;j++){
					Seat seat=new Seat(i,j);
					line.addSeat(seat);
				}
				seatMap.add(line);
			}
			
			for(Ticket t: set){
				int r=t.getRownum()-1;
				int c=t.getColnum()-1;
				//System.out.println(t.getRownum()+"排"+t.getColnum()+"座");
				Line line=seatMap.get(r);
				Seat seat=line.getSeats().get(c);
				seat.setAvail(false);
				line.getSeats().set(c, seat);
				seatMap.set(r, line);
			}

			
			request.setAttribute("seat",seatMap);
			request.setAttribute("column", column);
			return INPUT;
		
	}
	
	//异步买票
	public String buyTicket(){
		User user=(User) session.get("user");
		msg="0";
		System.out.println(cash);
		System.out.println(id);
		
		String buyer=user.getId();
		if(user.getGid()!='2'&&cash==0 ){
			User u=userService.login(id, password);
			if(u==null||u.getGid()!='2'){
				msg="卡号或密码错误";
				return SUCCESS;
			}
			buyer=u.getId();
			
		}
		if(cell==null||cell.length==0){
			msg="请选座";
			return SUCCESS;
		}
		
		
		List<Ticket> tickets=new ArrayList<Ticket>();
		for(String s:cell){
			Ticket t=new Ticket();
			System.out.println(s);
			Schedule schedule=(Schedule)session.get("schedule");
			t.setSchedule(schedule);
			t.setPrice(schedule.getPrice());
			
			String[] seat=s.split("-");
			t.setRownum(Integer.parseInt(seat[0]));
			t.setColnum(Integer.parseInt(seat[1]));
			t.setDate(Calendar.getInstance());
			tickets.add(t);
		}
		
		if(	this.ticketService.buyTickets(buyer, tickets))
				msg="1";
		else
			msg="余额不足";
		
		session.remove("schedule");
		session.put("user", userService.load(user.getId()));
		return SUCCESS;
		
	}
	
	
	

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}

	public String[] getCell() {
		return cell;
	}

	public void setCell(String[] cell) {
		this.cell = cell;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}



	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	

}
