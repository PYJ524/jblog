package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.BlogService;
import com.javaex.service.UserService;
import com.javaex.vo.BlogVo;
import com.javaex.vo.JsonResult;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BlogService blogService;
	
	// 회원가입 폼 컨트롤러
	@RequestMapping(value = "/joinForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
	System.out.println("조인폼 들어옴?");
		return "user/joinForm";
	}
	
	// 회원가입 정보입력시 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/checkId", method= {RequestMethod.POST, RequestMethod.GET})
	public JsonResult checkId(@RequestParam("id") String id) {
		System.out.println("UserController.checkId()");
		
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(userService.checkId(id));
		
		return jsonResult;
	}
	
	// 회원가입 컨트롤러
	@RequestMapping(value="/join", method= {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo
					 , @ModelAttribute BlogVo blogVo
					 , @RequestParam("fileName") String fileName) 
	{
		System.out.println("유저컨트롤러 조인");
		userService.join(userVo);
		blogVo.setId(userVo.getId());
		blogVo.setBlogTitle(userVo.getUserName()+"의 블로그입니다.");
		blogVo.setLogoFile(fileName);
		blogService.insert(blogVo);
		
		return "user/joinSuccess";
	}

	// 로그인 폼 컨트롤러
	@RequestMapping(value = "/loginForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		System.out.println("로그인폼 들어옴?");
		return "user/loginForm";
	}
	
	// 로그아웃 폼 컨트롤러
	@RequestMapping(value="/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session){
		System.out.println("UserController.login()");
		System.out.println(userVo);
		UserVo userInfo = userService.login(userVo);
		
		if(userInfo !=null) {
			System.out.println("로그인 성공");
			//세션에 저장
			session.setAttribute("uInfo", userInfo);
			
			return "redirect:/";
		}else {
			System.err.println("로그인 실패!!");
			//로그인폼으로 리다이렉트
			return "redirect:/user/loginForm?result=fail";
		}
		
	}
	
	// 로그인 폼 컨트롤러
	@RequestMapping(value="/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
		
		session.removeAttribute("uInfo");
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
}
