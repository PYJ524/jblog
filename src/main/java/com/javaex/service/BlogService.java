package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.BlogDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.BlogVo;
import com.javaex.vo.UserVo;

@Service
public class BlogService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BlogDao blogDao;
	
	public UserVo userOne(String id) {
		return userDao.listOne(id); 
	}
	
	public void insert(BlogVo vo) {
		blogDao.insert(vo);
	}
	
	public BlogVo blogOne(String id) {
		return blogDao.selectOne(id);
	}
	
	public void modify(BlogVo blogVo) {
		System.out.println("BlogService.modify()1");
		BlogVo vo = new BlogVo(blogVo.getId(), blogVo.getBlogTitle(), blogVo.getLogoFile());
		blogDao.update(vo);
	}
	
	public void modify(MultipartFile file, BlogVo blogVo) {
		System.out.println("BlogService.modify()2");
		// 원 파일 이름
		String orgName = file.getOriginalFilename();
		// System.out.println("orgName: " + orgName);
		
		// 확장자
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		// System.out.println("exName: " + exName);
		
		// 저장파일이름
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString()+ exName;
		// System.out.println("saveName: "+saveName);
		
		// 파일패스
		String filePath = saveDir + "/"+ saveName;
		// System.out.println("filePath: "+ filePath);
		
		// 파일 사이즈
		long fileSize = file.getSize();
		System.out.println("fileSize: "+fileSize);
		
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bout =  new BufferedOutputStream(out);
			bout.write(fileData);
			bout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		BlogVo vo = new BlogVo(blogVo.getId(), blogVo.getBlogTitle(), saveName);
		blogDao.update(vo);
 
	}
	String saveDir = "C:/Yoojun_Spring/upload2";
}
