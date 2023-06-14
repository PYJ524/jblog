package com.javaex.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.BlogService;
import com.javaex.service.CategoryService;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.JsonResult;
import com.javaex.vo.PostVo;

@Controller
public class CategoryController {

	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CategoryService cateService;
	
	@RequestMapping(value="/{id}/admin/category")
	public String cateList(@PathVariable("id") String id, Model model) {
		System.out.println("CategoryController.categoryList()");
		model.addAttribute("bOneList",blogService.blogOne(id));
		model.addAttribute("cateList",cateService.getList(id));
		
		return "blog/admin/blog-admin-cate";
	}
	
	@ResponseBody
	@RequestMapping(value="/category/add")
	public JsonResult catesAdd(@RequestBody CategoryVo cateVo) {
		System.out.println("CategoryController.categoryAdd()");
		CategoryVo vo = cateService.cateAdd(cateVo);
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(vo);
		System.out.println(jsonResult);
		
		return jsonResult;
	}
	
	
}
