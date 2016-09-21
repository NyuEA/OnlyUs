<%@page import="com.dto.BisUserDTO"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/common.css" rel="stylesheet" type="text/css">
<link href="css/contents.css" rel="stylesheet" type="text/css">
<link href="css/master.css" rel="stylesheet" type="text/css">
<link href="css/top.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">



<div class="nav1">
	<h2 class="blind">로컬네이게이션</h2>
	<ul class="nav_ul1 fix">
		<!-- 	☆ 현재페이지 표시 class="on" -->
		<%
		GenUserDTO dto = (GenUserDTO)session.getAttribute("login");
		BisUserDTO bisdto = (BisUserDTO)session.getAttribute("bislogin");
%>
		<%
  if(dto==null && bisdto == null){
%>
		<li><a class="on" href="LoginFormServlet">로그인</a></li>
		<li><a href="genJoin_.jsp">회원가입</a></li>
		<li><a href=""><img
				src="images/header_top_contact.png" id="header_top_contact"></a></li>
		<%
  }else if(dto!=null){
%>
<li><a class="on" href="LogOutServlet">로그아웃</a></li>
		<li><a href="MyPageServlet">마이페이지</a></li>
		<li><a href="genJoin_.jsp"><img
				src="images/header_top_contact.png" id="header_top_contact"></a></li>

<%
  }else{
  %>
  <li><a class="on" href="BisLogOutServlet">로그아웃</a></li>
  		<li><a href="BisMyPageServlet">마이페이지</a></li>
  		<li><a href="genJoin_.jsp"><img
  				src="images/header_top_contact.png" id="header_top_contact"></a></li>

  <%
    }//end if

 %>

	</ul>
</div>


