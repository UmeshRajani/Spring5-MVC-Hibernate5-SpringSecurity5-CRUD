package com.umesh.myfixer.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.umesh.myfixer.entity.User;
import com.umesh.myfixer.utils.PasswordEncode;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	BCryptPasswordEncoder bCryptPasswordEncoder = PasswordEncode.encode();

	@Transactional
	@Override
	public boolean save(User user) {
		boolean flag = false;
		try {
			String encoded = new BCryptPasswordEncoder().encode(user.getPassword());
			user.setPassword(encoded);
			sessionFactory.getCurrentSession().saveOrUpdate(user);
			flag = true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<User> list() {
		List<User> list = null;
		try {
			list = new ArrayList<User>();
			Query<User> query = sessionFactory.getCurrentSession().createQuery("from User");
			list = query.getResultList();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Transactional
	@Override
	public User get(int id) {
		User user = null;
		try {
			user = (User) sessionFactory.getCurrentSession().get(User.class, id);

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Transactional
	@Override
	public boolean delete(int id) {
		boolean flag = false;
		User user = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			user = (User) session.load(User.class, id);
			session.delete(user);
			flag = true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public User findUserByName(String name) {
		List<User> list = null;
		User user = null;
		try {
			list = new ArrayList<User>();
			Query<User> query = sessionFactory.getCurrentSession().createQuery("from User where name = :name");
			query.setParameter("name", name);
			list = query.getResultList();
			if (list.size() > 0) {
				user = list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Transactional
	@Override
	public boolean changePassword(String newPassword, User user) {
		boolean flag = false;
		try {
			String encoded = new BCryptPasswordEncoder().encode(newPassword);
			user.setPassword(encoded);
			sessionFactory.getCurrentSession().update(user);
			flag = true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
