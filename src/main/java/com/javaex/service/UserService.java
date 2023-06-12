package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public void join(UserVo userVo) {
		userDao.insert(userVo);
	}
	
	public boolean checkId(String id) {
		boolean result = false;
		UserVo vo = userDao.checkId(id);
		if(vo == null) {result =true;}
		return result;
	}
	
	public UserVo login(UserVo vo) {
		System.out.println("UserService.login()");
		UserVo userVo = userDao.userList(vo);
		
		return userVo; 
	}
}
