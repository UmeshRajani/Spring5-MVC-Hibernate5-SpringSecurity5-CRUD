package com.umesh.myfixer.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.umesh.myfixer.dao.AuthorityDAO;
import com.umesh.myfixer.entity.Authorities;

@Service
public class AuthoritiesServiceImpl implements AuthoritiesService {

	@Autowired
	AuthorityDAO authorityDAO;

	@Override
	public List<Authorities> list() {
		List<Authorities> list = authorityDAO.list();
		return list;
	}
}
