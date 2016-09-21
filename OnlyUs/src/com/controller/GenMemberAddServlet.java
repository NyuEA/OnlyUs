package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BisUserDTO;
import com.dto.GenUserDTO;
import com.exception.CommonException;
import com.service.BisUserService;
import com.service.GenUserService;

/**
 * Servlet implementation class genMemberAddServlet
 */
@WebServlet("/GenMemberAddServlet")
public class GenMemberAddServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		
		GenUserDTO dto = new GenUserDTO(userid, passwd, nickname, phone);
		GenUserService service = new GenUserService();
		String title="";
		    String target="";
		    try {
				service.addGenUser(dto);
				target = "home_.jsp";
				request.setAttribute("add", "회원가입이 정상적으로 되셨습니다.");
			} catch (CommonException e) {
				title= e.getMessage();
				String link="join.jsp";
				target="error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			}
			
			RequestDispatcher dis =
					request.getRequestDispatcher(target);
			dis.forward(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
