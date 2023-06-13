package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BlogVo;

@Repository
public class BlogDao {

	@Autowired
	private SqlSession sqlSession;
	
	public BlogVo selectOne(String id) {
		System.out.println("BlogDao.selectOne");
		BlogVo vo = sqlSession.selectOne("blog.listOne",id);
		return vo;
	}
	
	public void insert(BlogVo vo) {
		sqlSession.insert("blog.insert", vo);
	}
	
	public void update(BlogVo vo) {
		sqlSession.update("blog.update", vo);
	}
}
