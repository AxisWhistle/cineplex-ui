package edu.nju.cineplex.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.dao.TicketDao;
import edu.nju.cineplex.model.Ticket;

@Repository
public class TicketDaoImpl implements TicketDao {

	@Autowired
	private BaseDao baseDao;
	@Override
	public void save(Ticket ticket) {
		baseDao.save(ticket);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> getAllTickets() {
		return baseDao.getAllList(Ticket.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> getTickets(String column, String value) {
		
		return baseDao.findByColumn(Ticket.class, column, value);
	}

	
}
