package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.EmpDao;
import com.po.Emp;

@Service
public class EmpService {
	@Resource
	EmpDao empDao;

	public List<Emp> getPageList(int page, int rows) {
		return empDao.getListForPage(page, rows);
	}

	public int getTotals() {
		return empDao.getTotals();
	}

	public List<Emp> queryByDept(int deptno) {
		return empDao.queryByDept(deptno);
	}

	public int getMaxEmpno() {
		return empDao.getMaxEmpno();
	}

	public int addEmp(Emp emp) {
		return empDao.saveEmp(emp);
	}

	public int updateEmp(Emp emp) throws Exception {
		return empDao.updateEmp(emp);

	}

	public int updateEmp2(Emp emp) throws Exception {
		return empDao.updateEmp2(emp);

	}

	public int deleteEmp(String empnos) {
		return empDao.deleteEmp(empnos);
	}

	public int getTotalCondition(String ename, String dname) {
		return empDao.getTotalCondition(ename, dname);
	}

	public List<Emp> searchByDept(final int page, final int rows, String ename, String dname) {
		return empDao.searchByDept(page, rows, ename, dname);
	}
}
