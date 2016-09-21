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
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/GenMemberUpdateServlet")
public class GenMemberUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		System.out.println(userid+"|"+passwd+"|"+nickname+"|"+phone);
		GenUserDTO dto = new GenUserDTO(userid, passwd, nickname, phone);
		GenUserService service = new GenUserService();
	    String title="";
	    String target="";
	    try {
			service.updateGenUser(dto);
			target = "MyPageServlet";
			request.setAttribute("update", "정상적으로 수정되었습니다.");
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
