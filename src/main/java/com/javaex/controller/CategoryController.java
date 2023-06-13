package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {

	
	
	@RequestMapping(value="/{id}/admin/category")
	public String categoryList(@PathVariable("id") String id, Model model) {
		System.out.println("CategoryController.categoryList()");
//		model.addAttribute("uOneList",blogService.userOne(id));
//		model.addAttribute("bOneList",blogService.blogOne(id));
		
		return "blog/admin/blog-admin-cate";
	}
	
	
}
