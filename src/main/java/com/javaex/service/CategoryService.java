package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CategoryDao;
import com.javaex.vo.CategoryVo;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao cateDao;
	
	public CategoryVo cateAdd(CategoryVo cateVo) {
		cateDao.insert(cateVo);
		return cateDao.selectList(cateVo.getCateNo());
	}
	
	public List<CategoryVo> getList(String id){
		return cateDao.getList(id);
	}
}
