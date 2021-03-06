package com.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.GenUserDTO;

@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		GenUserDTO dto =
				(GenUserDTO)session.getAttribute("login");
		 String title="";
		 String target="";
		if(dto==null){
			title= "로그인 하세요";
			String link="LoginFormServlet";
			target="error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}else{
			target="home_.jsp";
	request.setAttribute("logout", "로그아웃이 정상적으로 되었습니다.");
		    session.invalidate();	
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
