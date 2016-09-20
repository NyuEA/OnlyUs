package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.bisUserDTO;
import com.dto.genUserDTO;
import com.exception.CommonException;
import com.service.bisUserService;
import com.service.genUserService;

/**
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/bisMyPageServlet")
public class bisMyPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		bisUserDTO bisdto = (bisUserDTO)session.getAttribute("bislogin");
		String target="";
		String title="";
		if(bisdto!=null){
			target="bisMypage_.jsp";
			
			String bisid = bisdto.getBisid();
			bisUserService service = new bisUserService();
			try {
				bisUserDTO my = service.bisMypage(bisid);
				request.setAttribute("bisMypage", my);
			} catch (CommonException e) {
				title= e.getMessage();
				String link="LoginFormServlet";
				target="error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			}
		}else{
			target="LoginFormServlet";
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
