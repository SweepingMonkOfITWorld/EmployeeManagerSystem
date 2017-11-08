package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Navigation;
import com.service.NavigationService;

@Controller
@RequestMapping("/navigation")
public class NavigationController {
	@Resource
	NavigationService navigationService;

	@RequestMapping("/loadNav")
	public @ResponseBody
	List<Navigation> load(@RequestParam(value = "id", defaultValue = "0") int id) {
		return navigationService.loadNavigation(id);
	}
}
