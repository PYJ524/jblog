package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CategoryDao;
import com.javaex.dao.PostDao;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.PostVo;

@Service
public class PostService {
	
	@Autowired
	private CategoryDao cateDao;
	
	@Autowired
	private PostDao postDao;

	public List<CategoryVo> getList(String id) {
		return cateDao.getList(id);
	}
	
	public String write(PostVo postVo) {
		postDao.insert(postVo);
		return cateDao.checkid(postVo);
	}
}
