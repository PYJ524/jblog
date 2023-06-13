package com.javaex.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.BlogService;
import com.javaex.vo.BlogVo;

@Controller
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping(value="/{id}")
	public String blog(@PathVariable("id") String id, Model model) {
		model.addAttribute("uOneList",blogService.userOne(id));
		model.addAttribute("bOneList",blogService.blogOne(id));
		
		return "blog/blog-main";
	}
	
	@RequestMapping(value="/{id}/admin/basic")
	public String basic(@PathVariable("id") String id, Model model) {
		model.addAttribute("uOneList",blogService.userOne(id));
		model.addAttribute("bOneList",blogService.blogOne(id));
		
		return "blog/admin/blog-admin-basic";
	}

	@RequestMapping(value="/{id}/admin/category")
	public String category(@PathVariable("id") String id, Model model) {
		model.addAttribute("uOneList",blogService.userOne(id));
		model.addAttribute("bOneList",blogService.blogOne(id));
		
		return "blog/admin/blog-admin-cate";
	}
	
	@RequestMapping(value="/{id}/admin/writeForm")
	public String write(@PathVariable("id") String id, Model model) {
		model.addAttribute("uOneList",blogService.userOne(id));
		model.addAttribute("bOneList",blogService.blogOne(id));
		
		return "blog/admin/blog-admin-write";
	}
	
	@RequestMapping(value="/blogUpdate")
	public String modify(@RequestParam("file") MultipartFile file
					   , @ModelAttribute BlogVo blogVo) {
		System.out.println("BlogController.Update()");
		if(file.getOriginalFilename() == "") {
			blogService.modify(blogVo);
		}else {
			blogService.modify(file, blogVo);
		}
		return "redirect:/"+blogVo.getId();
	}
}