package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyui.JsonObject;
import com.po.User;
import com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	UserService userService;

	@RequestMapping("/login")
	public @ResponseBody
	JsonObject login(User user, HttpServletRequest request) {
		JsonObject json = new JsonObject();
		if (userService.validateLogin(user)) {
			json.setSuccess(true);
		} else {
			json.setSuccess(false);
			json.setMsg("用户名或密码错误");
		}
		request.getSession().setAttribute("user", user);

		return json;
	}

	@RequestMapping("/exit")
	public @ResponseBody
	JsonObject exit(HttpServletRequest request) {
		System.out.println("gf");
		request.getSession().invalidate();
		JsonObject json = new JsonObject();
		json.setMsg("index.jsp");
		return json;
	}
}
