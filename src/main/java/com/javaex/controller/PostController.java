package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BlogService;
import com.javaex.service.PostService;
import com.javaex.vo.PostVo;

@Controller
public class PostController {

	@Autowired
	private BlogService blogService;
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(value="/{id}/admin/writeForm")
	public String writeForm(@PathVariable("id") String id, Model model) {
		model.addAttribute("bOneList",blogService.blogOne(id));
		model.addAttribute("cOneList",postService.getList(id));
		
		return "blog/admin/blog-admin-write";
	}
	
	@RequestMapping(value="/admin/write")
	public String write(@ModelAttribute PostVo postVo) {
		System.out.println("PostController.write()");
		String id = postService.write(postVo);
		System.out.println(id);
		return "redirect:/"+id+"/admin/writeForm";
	}
}