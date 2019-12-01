package com.umesh.myfixer.services;

import java.util.List;

import com.umesh.myfixer.entity.Ticket;

public interface TicketService {
	
	boolean save(Ticket vehicle);
	
	List<Ticket> list();
	
	boolean delete(int id);
	
	Ticket get(int id);
	
	Ticket getTicketByTicketid(int ticketId);
	
	List<Ticket> getListBasedOnUserId(int userId);
}
