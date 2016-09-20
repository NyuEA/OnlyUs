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

import com.dto.BisUserDTO;
import com.exception.CommonException;
import com.service.BisUserService;

@WebServlet("/BisLoginServlet")
public class BisLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String bisid = request.getParameter("bisid");
		String passwd = request.getParameter("passwd");

		HashMap<String, String> map = new HashMap<>();
		map.put("bisid", bisid);
		map.put("passwd", passwd);

		BisUserService service = new BisUserService();
		String title = "";
		String target = "";
		try {
			BisUserDTO dto = service.bislogin(map);
			if (dto == null) {
				title = "아이디 비밀번호 불일치";
				String link = "LoginFormServlet";
				target = "error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("bislogin", dto);
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
