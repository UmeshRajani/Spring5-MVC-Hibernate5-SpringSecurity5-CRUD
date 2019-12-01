package com.umesh.myfixer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umesh.myfixer.entity.Authorities;
import com.umesh.myfixer.entity.User;
import com.umesh.myfixer.services.AuthoritiesService;
import com.umesh.myfixer.services.UserService;
import com.umesh.myfixer.utils.PasswordEncode;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	AuthoritiesService authorityService;

	@RequestMapping(value = "/webrst/userForm")
	public ModelAndView showUserForm() {
		ModelAndView mav = new ModelAndView("postLoginContent");
		mav.addObject("showUserForm", true);
		mav.addObject("user", new User());
		return mav;
	}

	@RequestMapping(value = "/webrst/saveUserData")
	public String saveUser(@ModelAttribute("user") User user) {
		userService.save(user);
		return "redirect:user";
	}

	@RequestMapping(value = "/webrst/editUser")
	public ModelAndView editUser(@RequestParam("id") int id) {
		ModelAndView mav = new ModelAndView("postLoginContent");
		User user = userService.get(id);
		mav.addObject("user", user);
		mav.addObject("showUserForm", true);
		return mav;
	}

	@RequestMapping(value = "/webrst/deleteUser")
	public String deleteUser(@RequestParam("id") int id) {
		userService.delete(id);
		return "redirect:user";
	}

	@ModelAttribute("role")
	public List<Authorities> list() {
		return authorityService.list();
	}

	@RequestMapping(value = "/webrst/change/changePassword", method = RequestMethod.POST)
	public String getUser(HttpServletRequest request, String oldPassword, String newPassword,
			HttpServletResponse response) {
		try {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			User user = userService.findUserByName(authentication.getName());
			if (PasswordEncode.checkPassword(oldPassword, user.getPassword())) {
				userService.changePassword(newPassword, user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/home";
	}

}
