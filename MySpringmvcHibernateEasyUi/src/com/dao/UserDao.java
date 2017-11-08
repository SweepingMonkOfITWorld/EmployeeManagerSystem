package com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.po.User;

@Repository
public class UserDao extends HibernateTemplate {
	@Override
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@SuppressWarnings("unchecked")
	public int query(User user) {
		List<User> users = this.find("from User u where u.username=? and u.password = ? ", user.getUsername(), user.getPassword());
		int count = users.size();
		return count;
	}

}
