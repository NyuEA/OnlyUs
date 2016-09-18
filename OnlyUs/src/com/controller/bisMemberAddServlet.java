package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.bisUserDTO;
import com.exception.CommonException;
import com.service.bizUserService;

/**
 * Servlet implementation class genMemberAddServlet
 */
@WebServlet("/bisMemberAddServlet")
public class bisMemberAddServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bisid = request.getParameter("bisid");
		String passwd = request.getParameter("passwd");
		String bisname = request.getParameter("bisname");
		String post1 = request.getParameter("post1");
		String post2 = request.getParameter("post2");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		bisUserDTO dto = new bisUserDTO(bisid, passwd, bisname, Integer.parseInt(post1), Integer.parseInt(post2), addr1, addr2, Integer.parseInt(phone1), Integer.parseInt(phone2), Integer.parseInt(phone3));
		bizUserService service = new bizUserService();
		 String title="";
		    String target="";
		    try {
				service.addBisUser(dto);
				target = "login.jsp";
				request.setAttribute("result", "success");
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
