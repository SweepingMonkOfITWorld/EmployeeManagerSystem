package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyui.DataGridResult;
import com.po.Emp;
import com.service.EmpService;

@Controller
@RequestMapping("/emp")
public class EmpController {
	@Resource
	EmpService empService;
	@Resource
	DataGridResult dataGridResult;

	@InitBinder
	public void InitBinder(WebDataBinder dataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping("/list")
	public @ResponseBody
	DataGridResult getListForPage(int page, int rows) {
		dataGridResult.setRows(empService.getPageList(page, rows));
		dataGridResult.setTotal(empService.getTotals());
		return dataGridResult;
	}

	@RequestMapping("/queryByDept")
	public @ResponseBody
	List<Emp> queryByDept(int deptno) {
		return empService.queryByDept(deptno);
	}

	@RequestMapping("/getMax")
	public @ResponseBody
	int getMaxEmpno() {
		return empService.getMaxEmpno() + 1;
	}

	@RequestMapping("/addEmp")
	public @ResponseBody
	int addEmp(Emp emp) {
		return empService.addEmp(emp);
	}

	@RequestMapping("/update")
	public @ResponseBody
	DataGridResult update(@RequestBody Emp emp) {
		int effectRows = 0;
		try {
			effectRows = empService.updateEmp(emp);
		} catch (Exception e) {
			System.out.println("上级名字或部门名称修改错误");
		}
		dataGridResult.setEffectRow(effectRows);
		return dataGridResult;
	}

	@RequestMapping("/update2")
	public @ResponseBody
	DataGridResult update2(@RequestBody Emp emp) {
		System.out.println("update2");
		int effectRows = 0;
		try {
			effectRows = empService.updateEmp2(emp);
		} catch (Exception e) {
			System.out.println("上级名字或部门名称修改错误");
			e.printStackTrace();
		}
		dataGridResult.setEffectRow(effectRows);
		return dataGridResult;
	}

	// 批量删除员工 前台页面直接传过来 7906,8888,9999类似的字符串 用in语句删除
	@RequestMapping("/delete")
	public @ResponseBody
	DataGridResult deleteEmp(String empnos) {
		int effectRows = empService.deleteEmp(empnos);
		dataGridResult.setEffectRow(effectRows);
		return dataGridResult;
	}

	@RequestMapping("/searchByDept")
	public @ResponseBody
	DataGridResult searchByDept(int page, int rows, String ename, String dname) {
		List<Emp> emps = empService.searchByDept(page, rows, ename, dname);
		int total = empService.getTotalCondition(ename, dname);
		dataGridResult.setRows(emps);
		dataGridResult.setTotal(total);
		return dataGridResult;
	}
}
