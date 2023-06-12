package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlogController {
	
	@RequestMapping(value="/blog")
	public String blog() {
		System.out.println("UserController.user()");
		return "blog/blog-main";
	}
}
