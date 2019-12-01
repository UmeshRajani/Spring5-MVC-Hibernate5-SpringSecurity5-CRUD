package com.umesh.myfixer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umesh.myfixer.entity.Ticket;
import com.umesh.myfixer.entity.User;
import com.umesh.myfixer.services.TicketService;
import com.umesh.myfixer.services.UserService;

@Controller
public class MasterController {

	@Autowired
	UserService userService;

	@Autowired
	TicketService ticketService;

	@RequestMapping(value = { "/", "/index", "/home" })
	public ModelAndView showHome() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("showHome", true);
		return mav;
	}

	@RequestMapping(value = "/webrst/user")
	public ModelAndView showUser() {
		ModelAndView mav = new ModelAndView("postLoginContent");
		mav.addObject("showUserList", true);
		mav.addObject("list", userService.list());
		return mav;
	}

	@RequestMapping(value = "/webrst/ticket")
	public ModelAndView showVehicle(@RequestParam(required = false) Integer userId) {
		ModelAndView mav = new ModelAndView("postLoginContent");
		mav.addObject("showTicketList", true);
		if (userId!=null) {
			mav.addObject("list", ticketService.getListBasedOnUserId(userId));
		} else {
			List<Ticket> list = getTicketListBasedOnRole();
			mav.addObject("list", list);
		}
		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView showLogout() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("showHome", true);
		return mav;
	}

	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mav = new ModelAndView("access-denied");
		return mav;
	}
	
	private List<Ticket> getTicketListBasedOnRole() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		List<Ticket> ticketList = null;
		User user = null;
		boolean isUserRole = authentication.getAuthorities().stream()
		          .anyMatch(r -> r.getAuthority().equals("ROLE_USER"));
		if(isUserRole) {
			user = userService.findUserByName(authentication.getName());
			ticketList = ticketService.getListBasedOnUserId(user.getId());
		} else {
			ticketList = ticketService.list();
		}
		return ticketList;
	}
}
