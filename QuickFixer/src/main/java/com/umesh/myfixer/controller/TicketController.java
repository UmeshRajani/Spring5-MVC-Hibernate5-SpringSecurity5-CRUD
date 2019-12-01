package com.umesh.myfixer.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umesh.myfixer.entity.Ticket;
import com.umesh.myfixer.entity.User;
import com.umesh.myfixer.services.TicketService;
import com.umesh.myfixer.services.UserService;

@Controller
public class TicketController {

	@Autowired
	TicketService ticketService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "/webrst/ticketForm")
	public ModelAndView showTicketForm(@RequestParam(required = false) Integer ticketId) {
		int userId = this.getLoggedUser();
		ModelAndView mav = new ModelAndView("postLoginContent");
		Ticket ticket = null;
		if (ticketId != null) {
			ticket = ticketService.getTicketByTicketid(ticketId);
			mav.addObject("ticket", ticket);
		} else {
			mav.addObject("userId", userId);
			mav.addObject("ticket", new Ticket());
		}
		mav.addObject("showTicketForm", true);
		return mav;
	}

	@RequestMapping("/webrst/saveTicketData")
	public String saveTicket(@ModelAttribute("ticket") Ticket ticket) {
		if (ticket.getId() == null) {
			ticket.setCreatedDate(new java.sql.Timestamp(new Date().getTime()));
		} 
		ticketService.save(ticket);
		return "redirect:ticket";
	}

	@RequestMapping(value = "/webrst/editTicket")
	public ModelAndView editTicket(@RequestParam("id") int id) {
		ModelAndView mav = new ModelAndView("postLoginContent");
		mav.addObject("ticket", ticketService.get(id));
		mav.addObject("showTicketForm", true);
		mav.addObject("readOnly", true);
		return mav;
	}

	@RequestMapping(value = "/webrst/deleteTicket")
	public String deleteTicket(@RequestParam("id") int id) {
		ticketService.delete(id);
		return "redirect:ticket";
	}

	private int getLoggedUser() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = "";
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
		} else {
			username = principal.toString();
		}
		User user = userService.findUserByName(username);
		return user.getId();
	}
}
