package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.BisUserDTO;
import com.dto.GenUserDTO;
import com.exception.CommonException;
import com.service.BisUserService;
import com.service.GenUserService;

/**
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/GenMemberDeleteServlet")
public class GenMemberDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = request.getParameter("userid");
		GenUserService service = new GenUserService();
		String title = "";
		String target = "";
		try {
			System.out.println(userid);
			service.deleteGenUser(userid);
			target = "home_.jsp";
			request.setAttribute("delete", "정상적으로 탈퇴되셨습니다.");
			session.invalidate();
		} catch (CommonException e) {
			title = e.getMessage();
			String link = "MyPageServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}

		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
