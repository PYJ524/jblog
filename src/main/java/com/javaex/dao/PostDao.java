package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void insert(PostVo postVo) {
		System.out.println("PostDao.insert()");
		System.out.println(postVo);
		sqlSession.insert("post.insert",postVo);
	}
	
}
