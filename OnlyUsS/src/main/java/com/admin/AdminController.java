package com.admin;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.dto.BisUserDTO;
import com.dto.GenUserDTO;
import com.exception.CommonException;
import com.service.BisUserService;
import com.service.GenUserService;


@Controller
public class AdminController {
	@Autowired
	BisUserService service;
	GenUserService Gservice;
	
	@ExceptionHandler
	public String errorPage(Exception e){
		return "error";
	}
	

	
	@RequestMapping(value="/ApprovalYServlet")
	public String ApprovalY(@RequestParam("bisid") String bisid,HttpSession session, HttpServletRequest request)	
		throws CommonException{
			
		
			service.approvalY(bisid);
			request.setAttribute("approvalUpdate", bisid + "媛� �닔�젙�릺�뿀�뒿�땲�떎.");		
			return "redirect:JoinMServlet";
	}
	
	
	@RequestMapping(value="/BisDelServlet")
	public String BisDel(@RequestParam("bisid") String bisid,HttpSession session, HttpServletRequest request)	
			throws CommonException{

			service.approvalY(bisid);
			request.setAttribute("approvalUpdate", bisid + "媛� �닔�젙�릺�뿀�뒿�땲�떎.");
			return "redirect:BisMServlet";
	}
	
	@RequestMapping(value="/BisMServlet")
	public String BisM(HttpSession session, HttpServletRequest request)	
			throws CommonException{

		List<BisUserDTO> list = service.bisList();
		request.setAttribute("bisList", list);
			return "bisM_";
	}
	
	
	@RequestMapping(value="/GenMDeleteServlet")
	public String GenMDel(@RequestParam("userid") String userid,HttpSession session, HttpServletRequest request)	
			throws CommonException{
			Gservice.deleteGenUser(userid);		
			return "redirect:GenMServlet";
	}
	
	
	@RequestMapping(value="/GenMServlet")
	public String GenM(HttpSession session, HttpServletRequest request)	
			throws CommonException{
		List<GenUserDTO> list = Gservice.genList();
		request.setAttribute("genList", list);
			return "genM_";
	}
	
	@RequestMapping(value="/JoinMServlet")
	public String JoinM(HttpSession session, HttpServletRequest request)	
			throws CommonException{
		List<BisUserDTO> list = service.bisjoinList();
		request.setAttribute("bisjoinList", list);
			return "joinM_";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
