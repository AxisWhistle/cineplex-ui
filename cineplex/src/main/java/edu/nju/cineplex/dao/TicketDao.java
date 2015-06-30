package edu.nju.cineplex.dao;

import java.util.List;

import edu.nju.cineplex.model.Ticket;

public interface TicketDao {

	/**
	 * 购买一张票
	 * @param ticket
	 */
	public void save(Ticket ticket);
	
	public List<Ticket> getAllTickets();

	public List<Ticket> getTickets(String column, String value);

}
