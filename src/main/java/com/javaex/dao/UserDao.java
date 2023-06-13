package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void insert(UserVo userVo) {
		System.out.println("UserDao.insert()");
		System.out.println(userVo);
		int result = sqlSession.insert("user.insert", userVo);
		
	}
	
	public UserVo checkId(String id) {
		return sqlSession.selectOne("user.checkId",id);
	}
	
	public UserVo userList(UserVo vo) {
		System.out.println("UserDao.userList()");
		sqlSession.selectList("user.userList", vo);
		UserVo userVo = sqlSession.selectOne("user.userList", vo);
		return userVo; 
	}
	
	public UserVo listOne(String id) {
		System.out.println("UserDao.listOne()");
		System.out.println(id);
		UserVo userVo = sqlSession.selectOne("user.listOne", id);
		return userVo;
	}
}
