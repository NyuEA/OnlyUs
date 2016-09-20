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
import com.service.bisUserService;
import com.service.genUserService;

/**
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/genMemberDeleteServlet")
public class genMemberDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		genUserService service = new genUserService();
	    String title="";
	    String target="";
	    try {
			service.deleteGenUser(userid);
			target = "home_.jsp";
			request.setAttribute("delete", "정상적으로 삭제되었습니다.");
		} catch (CommonException e) {
			title= e.getMessage();
			String link="MyPageServlet";
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
