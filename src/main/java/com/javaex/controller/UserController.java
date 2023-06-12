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

import com.javaex.service.UserService;
import com.javaex.vo.JsonResult;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/joinForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
	System.out.println("조인폼 들어옴?");
		return "user/joinForm";
	}
	
	@RequestMapping(value = "/loginForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		System.out.println("로그인폼 들어옴?");
		return "user/loginForm";
	}
	
	@RequestMapping(value="/join", method= {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo, Model model) {
		System.out.println("유저컨트롤러 조인");
		userService.join(userVo);
		
		
		return "user/joinSuccess";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId", method= {RequestMethod.POST, RequestMethod.GET})
	public JsonResult checkId(@RequestParam("id") String id) {
		System.out.println("UserController.checkId()");
		
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(userService.checkId(id));
		
		return jsonResult;
	}
	
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
	@RequestMapping(value="/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
		
		session.removeAttribute("uInfo");
		session.invalidate();
		
		return "redirect:/";
	}
	
}
