package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.DeptDao;
import com.po.Dept;

@Service
public class DeptService {
	@Resource
	DeptDao deptDao;

	public List<Dept> preLoadDept() {
		return deptDao.queryAllDept();
	}
}
