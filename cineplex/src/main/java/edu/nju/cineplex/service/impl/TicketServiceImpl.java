package edu.nju.cineplex.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.cineplex.dao.MemberDao;
import edu.nju.cineplex.dao.TicketDao;
import edu.nju.cineplex.dao.UserDao;
import edu.nju.cineplex.model.Consume;
import edu.nju.cineplex.model.Discount;
import edu.nju.cineplex.model.Member;
import edu.nju.cineplex.model.Ticket;
import edu.nju.cineplex.model.User;
import edu.nju.cineplex.service.TicketService;
import edu.nju.cineplex.util.CreditStrategy;
@Service
public class TicketServiceImpl implements TicketService {
	
	@Autowired
	private TicketDao ticketDao;

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private MemberDao memberDao;
	
	

	@Override
	/**
	 * 要求ticket中的price是折后价，即实际支付价格
	 */
	public boolean buyTickets(String userId, List<Ticket> tickets) {
		double price=0;
		User user=userDao.load(userId);
		Member member=null;
		Discount dis = new Discount();
		dis.setDisaccount(1);
		if(user.getGid()=='2'){
			member=user.getMember();
			dis=member.getDisaccount();
		}
		
		
		/**
		 * 会员卡扣除票价
		 */
		
		for(Ticket ticket:tickets){
			ticket.setUser(user);
			
					
			price+=ticket.getPrice();
			if(user.getGid()!='2')
				ticket.setCash(true);
			else{
				ticket.setPrice(ticket.getPrice()*dis.getDisaccount());
				ticket.setCash(false);
			}
			user.addTicket(ticket);	
		}
		
		
		
		if(user.getGid()=='2'){
			
			double credit=CreditStrategy.calCredit(price)*dis.getMuticredit();
			int c=(int)Math.floor(credit);
			member.setCredit(member.getCredit()+c);
			if(member.getBalance()<price)
				return false;
			member.setBalance(member.getBalance()-price);
			Consume consume=new Consume();
			consume.setCredit(c);
			consume.setDate(Calendar.getInstance());
			consume.setInfo("购买电影票"+tickets.size()+"张");
			consume.setMoney(price);
			consume.setMember(member);
			memberDao.saveConsume(consume);
			//memberDao.update(member);
		}
		//user.setMember(member);
		//理想情况级联保存
		userDao.merge(user);
		
		
		
		
		return true;
	}



	@Override
	public List<Ticket> getTicketsByUser(String id) {
		User user=userDao.load(id);
		List<Ticket> tickets=new ArrayList<Ticket>();
		Set<Ticket> set=user.getTickets();
		for(Ticket t:set)
			tickets.add(t);
		return tickets;
	}

	
	

}
