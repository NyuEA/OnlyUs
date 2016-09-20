package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.bisUserDTO;
import com.dto.genUserDTO;
import com.exception.CommonException;
import com.service.bizUserService;
import com.service.genUserService;

/**
 * Servlet implementation class genMemberAddServlet
 */
@WebServlet("/genMemberAddServlet")
public class genMemberAddServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		
		genUserDTO dto = new genUserDTO(userid, passwd, nickname, phone);
		genUserService service = new genUserService();
		String title="";
		    String target="";
		    try {
				service.addGenUser(dto);
				target = "home_.jsp";
				request.setAttribute("add", "정상적으로 회원가입되셨습니다.");
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
