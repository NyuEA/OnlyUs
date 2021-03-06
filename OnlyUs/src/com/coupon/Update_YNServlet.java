package com.coupon;

import java.io.IOException;
import java.util.HashMap;
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
import com.service.BisUserService;
import com.service.CouponService;

@WebServlet("/Update_YNServlet")
public class Update_YNServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		CouponService service = new CouponService();
		String couid = request.getParameter("couid");
		String manage_yn = request.getParameter("manage_yn");
		HashMap<String, String> map = new HashMap<>();
		map.put("couid", couid);
		map.put("manage_yn", manage_yn);
		String title = "";
		String target = "";
		try {
			service.update_YN(map);
			request.setAttribute("update_YN", couid+"의 쿠폰제공여부가 수정되었습니다.");
			target = "BisCouponListServlet";
		} catch (CommonException e) {
			title = e.getMessage();
			String link = "BisCouponListServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}

		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
