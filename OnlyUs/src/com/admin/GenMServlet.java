package com.admin;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/GenMServlet")
public class GenMServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		GenUserService service = new GenUserService();
		try {
			List<GenUserDTO> list = service.genList();
			request.setAttribute("genList", list);
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher dis = request.getRequestDispatcher("genM_.jsp");
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
