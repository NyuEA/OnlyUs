package com.login;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.GenUserDTO;
import com.exception.CommonException;

import com.service.GenUserService;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");

		HashMap<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);

		GenUserService service = new GenUserService();
		String title = "";
		String target = "";
		try {
			GenUserDTO dto = service.login(map);
			if (dto == null) {
				title = "아이디 비밀번호를 확인하여주세요.";
				target = "LoginFormServlet";
				request.setAttribute("loginError", title);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("login", dto);
				target = "home_.jsp";
			}

		} catch (CommonException e) {
			title = e.getMessage();
			String link = "LoginFormServlet";
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
