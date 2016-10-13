package com.member;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.exception.CommonException;
import com.dto.BisUserDTO;
import com.dto.GenUserDTO;
import com.service.GenUserService;
import com.service.BisUserService;

@Controller
public class MemberController {
	@Autowired
	BisUserService Bservice;
	GenUserService Gservice;

	@ExceptionHandler
	public String errorPage(Exception e){
		return "error";
	}
	

	@RequestMapping(value="/bisMemberAddServlet")
	public String bisMemberAdd(@ModelAttribute("BisUserDTO") BisUserDTO dto, HttpServletRequest request) throws CommonException{		
		Bservice.addBisUser(dto);		
		request.setAttribute("add", "?öå?õêÍ∞??ûÖ?ù¥ ?†ï?ÉÅ?†Å?úºÎ°? ?êò?Ö®?äµ?ãà?ã§.");		
		return "home_";
	}
	
	
	@RequestMapping(value="/BisMemberUpdateServlet")
	public String BisMemberUpdate(@ModelAttribute("BisUserDTO") BisUserDTO bisdto, HttpServletRequest request)throws CommonException{			
		Bservice.updatebisUser(bisdto);		
		request.setAttribute("bisupdate", "?àò?†ï?ù¥ ?†ï?ÉÅ?†Å?úºÎ°? ?êò?óà?äµ?ãà?ã§."); 
		return "redirect:BisMyPageServlet";		
	}
	
	
	@RequestMapping(value="/BisMyPageServlet")
	public ModelAndView BisMyPage(HttpSession session)throws CommonException{		
		BisUserDTO bisdto = (BisUserDTO)session.getAttribute("bislogin");		
			String bisid = bisdto.getBisid();
			BisUserDTO my = Bservice.bisMypage(bisid);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bisMypage"); //mypage.jsp
			mav.addObject("bisMypage", my);		
		return mav;
		
	}
	
	
	@RequestMapping(value="/GenMemberAddServlet")
	public String GenMemberAdd(@ModelAttribute("GenUserDTO") GenUserDTO dto, HttpServletRequest request) throws CommonException{		
		Gservice.addGenUser(dto);		
		request.setAttribute("add", "?öå?õêÍ∞??ûÖ?ù¥ ?†ï?ÉÅ?†Å?úºÎ°? ?êò?Ö®?äµ?ãà?ã§.");		
		return "home_";		
	}
	
		
	@RequestMapping(value="/GenMemberDeleteServlet")
	public String GenMemberDelete(@RequestParam("userid") String userid, HttpSession session,HttpServletRequest request)throws CommonException{			
		Gservice.deleteGenUser(userid);
		request.setAttribute("delete", "?†ï?ÉÅ?†Å?úºÎ°? ?Éà?á¥?êò?Ö®?äµ?ãà?ã§.");
		session.invalidate();
		return "home_";
	}
	
	
	
	
	@RequestMapping(value="/GenMemberUpdateServlet")
	public String GenMemberUpdate(@ModelAttribute("GenUserDTO") GenUserDTO dto, HttpServletRequest request)throws CommonException{			
		Gservice.updateGenUser(dto);		
		request.setAttribute("bisupdate", "?àò?†ï?ù¥ ?†ï?ÉÅ?†Å?úºÎ°? ?êò?óà?äµ?ãà?ã§."); 
		return "redirect:MyPageServlet";		
	}
	
	
	@RequestMapping(value="/MyPageServlet")
	public ModelAndView MyPage(HttpSession session)throws CommonException{		
		GenUserDTO dto = (GenUserDTO)session.getAttribute("login");		
		String userid = dto.getUserid();
		GenUserDTO my = Gservice.mypage(userid);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage"); //mypage.jsp
		mav.addObject("mypage", my);		
	return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
}
