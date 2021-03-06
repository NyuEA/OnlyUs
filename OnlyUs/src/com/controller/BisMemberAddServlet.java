package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BisUserDTO;
import com.exception.CommonException;
import com.service.BisUserService;

/**
 * Servlet implementation class genMemberAddServlet
 */
@WebServlet("/bisMemberAddServlet")
public class BisMemberAddServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bisid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String bisname = request.getParameter("nickname");
		String post1 = request.getParameter("post1");
		String post2 = request.getParameter("post2");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		BisUserDTO dto = new BisUserDTO(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3);
		BisUserService service = new BisUserService();
		 String title="";
		    String target="";
		    try {
				service.addBisUser(dto);
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
