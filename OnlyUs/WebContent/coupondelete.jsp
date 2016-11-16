<%@page import="com.service.CouponService"%>
<%@page import="java.util.concurrent.CountDownLatch"%>
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
	String id = request.getParameter("dcouid");
	
	CouponService service = new CouponService();
	service.deleteMyCoupon(id);
%>
