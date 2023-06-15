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
import com.javaex.service.CategoryService;
import com.javaex.service.PostService;
import com.javaex.vo.BlogVo;
import com.javaex.vo.PostVo;
import com.javaex.vo.UserVo;

@Controller
public class BlogController {
	
	@Autowired
	private BlogService blogService;

	@Autowired
	private CategoryService cateService;
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(value="/{id}")
	public String blog(@PathVariable("id") String id, Model model) {
		System.out.println("BlogController.blog()");
		model.addAttribute("uOneList", blogService.userOne(id));
		model.addAttribute("bOneList", blogService.blogOne(id));
		model.addAttribute("lastCateNo", cateService.LastCateNo(id));
		model.addAttribute("lastPostVo", postService.LastPostVo(id));
		
		return "blog/blog-main";
	}
	
	@RequestMapping(value="/{id}/admin/basic")
	public String basic(@PathVariable("id") String id, Model model) {
		model.addAttribute("uOneList",blogService.userOne(id));
		model.addAttribute("bOneList",blogService.blogOne(id));
		
		return "blog/admin/blog-admin-basic";
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