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
	String id = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	String nickname = request.getParameter("nickname");
	String phone = request.getParameter("phone");
	
	GenUserService service = new GenUserService();
	service.addGenUser(new GenUserDTO(id, passwd, nickname, phone));

%>
