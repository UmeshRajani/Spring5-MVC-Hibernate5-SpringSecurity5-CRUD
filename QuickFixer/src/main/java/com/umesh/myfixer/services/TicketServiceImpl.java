package com.umesh.myfixer.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.umesh.myfixer.dao.TicketDAO;
import com.umesh.myfixer.entity.Ticket;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	TicketDAO ticketDAO;

	@Override
	public boolean save(Ticket ticket) {
		boolean flag = ticketDAO.save(ticket);
		return flag;
	}

	@Override
	public List<Ticket> list() {
		List<Ticket> list = ticketDAO.list();
		return list;
	}

	@Override
	public boolean delete(int id) {
		boolean flag = ticketDAO.delete(id);
		return flag;
	}

	@Override
	public Ticket get(int id) {
		Ticket ticket = ticketDAO.get(id);
		return ticket;
	}

	@Override
	public Ticket getTicketByTicketid(int ticketId) {
		Ticket ticket = ticketDAO.getTicketByTicketid(ticketId);;
		return ticket;
	}
	
	@Override
	public List<Ticket> getListBasedOnUserId(int userId) {
		List<Ticket> list = ticketDAO.getListBasedOnUserId(userId);
		return list;
	}

}
