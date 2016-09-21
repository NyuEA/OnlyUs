package com.coupon;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.BisUserDTO;
import com.dto.CouponDTO;
import com.dto.DownCouponDTO;
import com.dto.GenUserDTO;
import com.dto.MycouponDTO;
import com.exception.CommonException;
import com.service.CouponService;

@WebServlet("/TopTenServlet")
public class TopTenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		CouponService service = new CouponService();
		GenUserDTO dto = (GenUserDTO) session.getAttribute("login");
		BisUserDTO bisdto = (BisUserDTO)session.getAttribute("bislogin");
		String userid = dto.getUserid();
		try {
			request.setAttribute("mycoupon", list);
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher dis = request.getRequestDispatcher("coupon_.jsp");
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
