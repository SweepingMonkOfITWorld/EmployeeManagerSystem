package com.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.po.Emp;
import com.sun.org.apache.commons.beanutils.BeanUtils;

@Repository
public class EmpDao extends HibernateTemplate {

	@Override
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public List<Emp> getListForPage(final int page, final int rows) {
		// final int currentPage = Integer.parseInt((page == null || page ==
		// "0") ? "1" : page);// 第几页
		// final int pageSize = Integer.parseInt((rows == null || rows == "0") ?
		// "10" : rows);// 每页多少行
		final String hql = "select new Emp(e1.empno,e1.ename,e1.job,e2.ename,e1.hiredate,e1.sal,e1.comm,d.dname) from Emp e1,Emp e2,Dept d where e1.deptno = d.deptno " + "and e1.mgr =e2.empno order by e1.empno desc";
		List<Emp> emps = this.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {

				return session.createQuery(hql).setFirstResult((page - 1) * rows).setMaxResults(rows).list();
			}
		});
		return emps;
	}

	public int getTotals() {
		return this.find("from Emp").size();
	}

	public List<Emp> queryByDept(int deptno) {
		return this.find("select new Emp(e.empno,e.ename) from Emp e where e.deptno = ?", deptno);
	}

	public int getMaxEmpno() {
		return (Integer) this.find("select max(e.empno) from Emp e").get(0);
	}

	public int saveEmp(Emp emp) {
		this.save(emp);
		return 1;

	}

	public Emp convertEmptoEmp(Emp emp) throws Exception {
		Emp e = this.get(Emp.class, new Integer(emp.getEmpno()));
		BeanUtils.copyProperties(e, emp);
		String ename = emp.getMname();
		String dname = emp.getDname();
		int empMgr = (Integer) (this.find("select e.empno from Emp e where e.ename=?", ename)).get(0);
		int deptno = (Integer) (this.find("select d.deptno from Dept d where d.dname=?", dname)).get(0);
		e.setMgr(empMgr);
		e.setDeptno(deptno);
		return e;
	}

	public int updateEmp(Emp emp) throws Exception {

		this.update(convertEmptoEmp(emp));

		return 1;
	}

	public int updateEmp2(Emp emp) throws Exception {
		Emp e = this.get(Emp.class, new Integer(emp.getEmpno()));
		BeanUtils.copyProperties(e, emp);
		this.update(e);

		return 1;
	}

	public int deleteEmp(String empnos) {
		final String hql = "delete from Emp e where e.empno in(" + empnos + ")";
		System.out.println(hql);
		int rows = this.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				int effectRows = session.createQuery(hql).executeUpdate();
				return effectRows;
			}
		});
		return rows;
	}

	public String contactSql(String ename, String dname) {
		String hql = "select new Emp(e1.empno,e1.ename,e1.job," + "e2.ename,e1.hiredate,e1.sal,e1.comm,d.dname) " + "from Emp e1,Emp e2,Dept d " + "where e1.deptno = d.deptno and e1.mgr =e2.empno and e1.deptno in(select d.deptno from Dept d where d.dname ='" + dname + "')";
		if (!"".equals(ename)) {
			hql += " and e1.ename like '%" + ename + "%'";
		}
		hql += " order by e1.empno";
		return hql;
	}

	public int getTotalCondition(String ename, String dname) {
		String hql = contactSql(ename, dname);
		return this.find(hql).size();
	}

	public List<Emp> searchByDept(final int page, final int rows, String ename, String dname) {
		final String hql = contactSql(ename, dname);
		List<Emp> emps = this.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {

				return session.createQuery(hql).setFirstResult((page - 1) * rows).setMaxResults(rows).list();
			}
		});
		return emps;
	}

}
