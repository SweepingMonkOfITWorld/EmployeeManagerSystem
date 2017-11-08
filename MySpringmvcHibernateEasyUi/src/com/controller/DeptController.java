package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Dept;
import com.service.DeptService;

@Controller
@RequestMapping("/dept")
public class DeptController {
	@Resource
	DeptService deptService;

	@RequestMapping("/queryAllDept")
	public @ResponseBody
	List<Dept> preLoadDept() {
		return deptService.preLoadDept();

	}
}
