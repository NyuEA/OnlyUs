package com.coupon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.couponDTO;
import com.dto.genUserDTO;
import com.exception.CommonException;
import com.service.CouponService;

@WebServlet("/CouponListServlet")
public class CouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		CouponService service = new CouponService();
		genUserDTO dto = (genUserDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		try {
			couponDTO cdto = service.MyCoupon(userid);
			request.setAttribute("mycoupon", cdto);
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher dis = request.getRequestDispatcher("mycouponlist.jsp");
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
