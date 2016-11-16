<%@page import="com.service.CouponService"%>
<%@page import="com.dto.MycouponDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.GenUserDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.service.GenUserService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	// 폼데이터 얻기
	String title = request.getParameter("title");
	String userid = request.getParameter("userid");

	CouponService service = new CouponService();
	String couid = service.getcouid(title);
	service.downcoupon(userid, couid);
%>
