package com.coupon;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.BisUserDTO;
import com.dto.CouponDTO;
import com.dto.GenUserDTO;
import com.dto.MycouponDTO;
import com.dto.Top10DTO;
import com.exception.CommonException;
import com.service.CouponService;

@Controller
public class CouponController {
	@Autowired
	CouponService service;
	

	@ExceptionHandler
	public String errorPage(Exception e){
		return "error";
	}
	
	
	@RequestMapping(value="/BisCouponListServlet")
	public String BisCouponList(HttpSession session, HttpServletRequest request)	
		throws CommonException{
		BisUserDTO dto = (BisUserDTO) session.getAttribute("bislogin");
		String bisid = dto.getBisid();
		List<CouponDTO> list = service.BisCoupon(bisid);
		request.setAttribute("BisCoupon", list);	
			return "biscoupon_";
	}
	
	
	@RequestMapping(value="/CouponBoardServlet")
	public String CouponBoard(HttpSession session, HttpServletRequest request)	
			throws CommonException{
		List<Top10DTO> list = service.first10();
		request.setAttribute("top10", list);
		return "couponboard_";
	}
	
	
	@RequestMapping(value="/CouponListServlet")
	public String CouponList(HttpSession session, HttpServletRequest request)	
			throws CommonException{
		GenUserDTO dto = (GenUserDTO) session.getAttribute("login");
		String userid = dto.getUserid();
			List<MycouponDTO> list = service.MyCoupon(userid);
			request.setAttribute("mycoupon", list);	
		return "coupon_";
	}

	@RequestMapping(value="/DeleteCouponServlet")
	public String DeleteCoupon(@RequestParam("couid") String couid,HttpSession session, HttpServletRequest request)	
			throws CommonException{
		service.deleteCoupon(couid);
		request.setAttribute("deleteCoupon", couid + "媛� �궘�젣�릺�뿀�뒿�땲�떎.");
		return "redirect:BisCouponListServlet";
	}
	
	
	
	@RequestMapping(value="/TopTenServlet")
	public String TopTen(HttpSession session, HttpServletRequest request)	
			throws CommonException{
		List<Top10DTO> list = service.first10();
		request.setAttribute("top10", list);
		return "topten_";
	}
	
	
	
	@RequestMapping(value="/Update_YNServlet")
	public String Update_YN(@RequestParam("couid") String couid,@RequestParam("manage_yn") String manage_yn,HttpSession session, HttpServletRequest request)	
			throws CommonException{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("couid", couid);
		map.put("manage_yn", manage_yn);
		
		service.update_YN(map);
		request.setAttribute("update_YN", couid+"�쓽 荑좏룿�젣怨듭뿬遺�媛� �닔�젙�릺�뿀�뒿�땲�떎.");
		return "redirect:BisCouponListServlet";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
