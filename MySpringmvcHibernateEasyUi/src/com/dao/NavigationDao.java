package com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.po.Navigation;

@Repository
public class NavigationDao extends HibernateTemplate {
	@Override
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@SuppressWarnings("unchecked")
	public List<Navigation> getNavigation(int id) {
		String hql = "select new Navigation(n.id,n.text,n.state,n.url) from Navigation n where n.tid = ?";
		return this.find(hql, id);
	}

}
