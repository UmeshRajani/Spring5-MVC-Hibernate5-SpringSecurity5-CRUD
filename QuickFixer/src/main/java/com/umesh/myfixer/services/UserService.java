package com.umesh.myfixer.services;

import java.util.List;

import com.umesh.myfixer.entity.User;

public interface UserService {
	
	boolean save(User user);
	
	List<User> list();
	
	User get(int id);
	
	boolean delete(int id);
	
	User findUserByName(String name);
	
	boolean changePassword(String newPassword, User user);
}
