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

import com.dto.BisUserDTO;
import com.dto.CouponDTO;
import com.dto.DownCouponDTO;
import com.dto.GenUserDTO;
import com.dto.MycouponDTO;
import com.exception.CommonException;
import com.service.BisUserService;
import com.service.CouponService;

@WebServlet("/bisMServlet")
public class bisMServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		BisUserService service = new BisUserService();
		try {
			List<BisUserDTO> list = service.bisList();
			request.setAttribute("bisList", list);
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher dis = request.getRequestDispatcher("bisM_.jsp");
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
