package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.po.User;

@Service
public class UserService {
	@Resource
	UserDao userDao;

	public boolean validateLogin(User user) {
		if (userDao.query(user) > 0) {
			return true;
		} else {
			return false;
		}

	}

}
