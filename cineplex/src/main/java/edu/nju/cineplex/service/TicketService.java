package edu.nju.cineplex.service;

import java.util.List;

import edu.nju.cineplex.model.Ticket;

public interface TicketService {

	
	public boolean buyTickets(String userId,List<Ticket> tickets);

	public List<Ticket> getTicketsByUser(String id);
	
	/**
	 * 已经被购买或者锁定的电影票
	 * @param schedule
	 * @return
	 */
	
}
