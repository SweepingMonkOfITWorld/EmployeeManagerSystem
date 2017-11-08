package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.NavigationDao;
import com.po.Navigation;

@Service
public class NavigationService {
	@Resource
	NavigationDao navigationDao;

	public List<Navigation> loadNavigation(int id) {
		return navigationDao.getNavigation(id);
	}

}
