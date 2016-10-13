package com.login;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.BisUserDTO;
import com.dto.GenUserDTO;

import com.exception.CommonException;
import com.service.BisUserService;
import com.service.GenUserService;


@Controller
public class LoginController {
	@Autowired
	GenUserService Gservice;
	BisUserService Bservice;
	
	//?뿉?윭?럹?씠吏?
	@ExceptionHandler
	public String errorPage(Exception e){
		return "error";
	}
	
	
	@RequestMapping(value="/home_")
	public String home(){
		return "home_";
	}
	
	@RequestMapping(value="/LoginFormServlet")
	public String loginForm(){
		return "login_";
	}
	
	
	@RequestMapping(value="/LoginServlet",method=RequestMethod.POST)
	public String Login(@RequestParam("userid") String userid,@RequestParam String passwd,HttpSession session, HttpServletRequest request)	
		throws CommonException{
		
		HashMap<String, String> map= new HashMap<String,String>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		
		GenUserDTO dto = Gservice.login(map);
		if (dto == null) {
			String title = "�븘�씠�뵒 鍮꾨�踰덊샇瑜� �솗�씤�븯�뿬二쇱꽭�슂.";
			String target = "LoginFormServlet";
			request.setAttribute("loginError", title);
		} else {		
			session.setAttribute("login", dto);			
		}
			return "home_";
	}
	
	@RequestMapping(value="/BisLoginServlet",method=RequestMethod.POST)
	public String BisLogin(@RequestParam("bisid") String bisid,@RequestParam String passwd,HttpSession session, HttpServletRequest request)	
		throws CommonException{
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bisid", bisid);
		map.put("passwd", passwd);
		
		BisUserDTO dto = Bservice.bislogin(map);
		if (dto == null) {
			String title = "�븘�씠�뵒 鍮꾨�踰덊샇瑜� �솗�씤�븯�뿬二쇱꽭�슂.";
			String target = "LoginFormServlet";
			request.setAttribute("loginError", title);
		} else {			
			session.setAttribute("bislogin", dto);			
		}
		return "home_";
	}
	
	

	
	
	@RequestMapping(value="/BisLogOutServlet")
	public String BisLogOut(HttpSession session, HttpServletRequest request) throws CommonException{		
		BisUserDTO dto =
				(BisUserDTO)session.getAttribute("bislogin");		
		if(dto==null){
			String title= "濡쒓렇?씤 ?븯?꽭?슂";
			String link="LoginFormServlet";
		
			request.setAttribute("title", title);
			request.setAttribute("link", link);
			throw new CommonException("濡쒓렇?븘?썐 ?떎?뙣");
		}else{			
	request.setAttribute("logout", "濡쒓렇�븘�썐�씠 �젙�긽�쟻�쑝濡� �릺�뿀�뒿�땲�떎.");
		    session.invalidate();	
		}
		return "home";
	}
	
	
	
	@RequestMapping(value="/LogOutServlet")
	public String LogOut(HttpSession session, HttpServletRequest request) throws CommonException{		
		GenUserDTO dto =
				(GenUserDTO)session.getAttribute("login");
		if(dto==null){
			String title= "濡쒓렇?씤 ?븯?꽭?슂";
			String link="LoginFormServlet";
			
			request.setAttribute("title", title);
			request.setAttribute("link", link);
			throw new CommonException("濡쒓렇?븘?썐 ?떎?뙣");
		}else{			
			request.setAttribute("logout", "濡쒓렇�븘�썐�씠 �젙�긽�쟻�쑝濡� �릺�뿀�뒿�땲�떎.");
			session.invalidate();	
		}
		return "home";
	}
	
}
