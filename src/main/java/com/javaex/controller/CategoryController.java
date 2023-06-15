package com.javaex.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.BlogService;
import com.javaex.service.CategoryService;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.JsonResult;
import com.javaex.vo.PostVo;
import com.javaex.vo.UserVo;

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
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value="/category/delete")
	public int delete(@ModelAttribute CategoryVo cateVo) {
		System.out.println("CategoryController.delete()");
		return cateService.delete(cateVo);
	}
	
	@ResponseBody
	@RequestMapping(value="/category/list")
	public JsonResult list(@ModelAttribute UserVo userVo) {
		System.out.println("CategoryController.list()");
		System.out.println(userVo.getId());
		List<CategoryVo> vo = cateService.getList(userVo.getId());
		
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(vo);
		
		return jsonResult;
	}
}
