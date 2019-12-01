package com.umesh.myfixer.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.umesh.myfixer.entity.Ticket;

@Repository
public class TicketDAOImpl implements TicketDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	@Override
	public boolean save(Ticket ticket) {
		boolean flag = false;
		try {
			if (ticket.getId()!=null) {
				Ticket tmpTicket = get(ticket.getId());
				ticket.setCreatedDate(tmpTicket.getCreatedDate());
				sessionFactory.getCurrentSession().evict(tmpTicket);
			}
			sessionFactory.getCurrentSession().saveOrUpdate(ticket);
			flag = true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<Ticket> list() {
		List<Ticket> list = null;
		try {
			list = new ArrayList<Ticket>();
			Query<Ticket> query = sessionFactory.getCurrentSession().createQuery("from Ticket");
			list = query.getResultList();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Transactional
	@Override
	public boolean delete(int id) {
		boolean flag = false;
		try {
			Session session = sessionFactory.getCurrentSession();
			Ticket ticket = (Ticket) session.load(Ticket.class, id);
			session.delete(ticket);
			flag = true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Transactional
	@Override
	public Ticket get(int id) {
		Ticket ticket = null;
		try {
			ticket = (Ticket) sessionFactory.getCurrentSession().get(Ticket.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return ticket;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public Ticket getTicketByTicketid(int ticketId) {
		Ticket ticket = null;
		List<Ticket> list = null;
		try {
			list = new ArrayList<Ticket>();
			Query<Ticket> query = sessionFactory.getCurrentSession().createQuery("from Ticket where id = :ticketId");
			query.setParameter("ticketId", ticketId);
			list = query.getResultList();
			if (list.size() > 0) {
				ticket = list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return ticket;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<Ticket> getListBasedOnUserId(int userId) {
		List<Ticket> list = null;
		try {
			list = new ArrayList<Ticket>();
			Query<Ticket> query = sessionFactory.getCurrentSession().createQuery("from Ticket where user.id = :userid");
			query.setParameter("userid", userId);
			list = query.getResultList();
			
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}
}
