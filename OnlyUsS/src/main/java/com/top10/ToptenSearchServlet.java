package com.top10;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.Top10DTO;
import com.exception.CommonException;
import com.service.CouponService;

@WebServlet("/ToptenSearchServlet")
public class ToptenSearchServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String searchName = request.getParameter("searchName");

		CouponService service = new CouponService();

		List<Top10DTO> list = null;
		try {
			list = service.search(searchName);
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("top10", list);

		RequestDispatcher dis = request.getRequestDispatcher("topten_.jsp");
		dis.forward(request, response);

	}// end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
