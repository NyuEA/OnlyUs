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

	HashMap<String, String> map = new HashMap<>();
	map.put("userid", id);
	map.put("passwd", passwd);
	GenUserService service = new GenUserService();
	GenUserDTO dto = service.login(map);

	String duserid = dto.getUserid();
	String dpasswd = dto.getPasswd();
	String nickname = dto.getNickname();
	String phone = dto.getPhone();
	StringBuffer buffer = new StringBuffer();
	buffer.append("<record>");
	buffer.append("<userid>" + duserid + "</userid>");
	buffer.append("<passwd>" + dpasswd + "</passwd>");
	buffer.append("<nickname>" + nickname + "</nickname>");
	buffer.append("<phone>" + phone + "</phone>");
	buffer.append("</record>");
	buffer.append("</dept>");
%>
<%=buffer.toString()%>
