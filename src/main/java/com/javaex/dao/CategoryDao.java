package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CategoryVo;
import com.javaex.vo.PostVo;

@Repository
public class CategoryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insert(CategoryVo cateVo){
		System.out.println("CategoryDao.insert()");
		System.out.println(cateVo);
		sqlSession.insert("cate.insert", cateVo);
	}
	
	public CategoryVo selectList(int cateNo) {
		System.out.println("CategoryDao.selectList()");
		System.out.println(cateNo);
		return sqlSession.selectOne("cate.ajaxList", cateNo);
	}
	
	public List<CategoryVo> getList(String id){
		return sqlSession.selectList("cate.getList", id);
	}
	
	public String checkid(PostVo postVo) {
		System.out.println(postVo);
		return sqlSession.selectOne("cate.checkId", postVo.getCateNo());
	};
}
