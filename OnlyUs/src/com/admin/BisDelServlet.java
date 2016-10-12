package com.admin;

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
import com.service.BisUserService;
import com.service.CouponService;

@WebServlet("/BisDelServlet")
public class BisDelServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		BisUserService service = new BisUserService();
		String bisid = request.getParameter("bisid");
		String title = "";
		String target = "";
		try {
			service.deleteBis(bisid);
		//	request.setAttribute("BisDelete", bisid + "가  삭제되었습니다.");
			target = "BisMServlet";
		} catch (CommonException e) {
			title = e.getMessage();
			String link = "home.jsp";
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
