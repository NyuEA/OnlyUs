<%@page import="com.dto.GenUserDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<LINK href="../css/master.css" rel="stylesheet" type="text/css">
<LINK href="../css/contents.css" rel="stylesheet" type="text/css">
<LINK href="../css/common.css" rel="stylesheet" type="text/css">
<SCRIPT src="../js/jquery-3.1.0.js"></SCRIPT>


<%
	String logout = (String) request.getAttribute("logout");
	if (logout != null) {
%>
<script type="text/javascript">
      var str = "<%=logout%>";
alert("<%=logout%>");
</script>
<%
	}
%>
<div class="nav">
	<h2 class="blind">로컬네이게이션</h2>
	<ul class="nav_ul fix">
		<!-- 	☆ 현재페이지 표시 class="on" -->
		<%
			GenUserDTO dto = (GenUserDTO)session.getAttribute("login");
		%>
		<%
			if (dto == null) {
		%>
		<li><a class="on" href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			} else {
		%>
		<li><a href="board_.jsp" id="subm2">내 쿠폰함</a></li>
		<li><a href="board_.jsp" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<li><a href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a class="on" href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			} //end if
		%>

	</ul>
</div>
<form action="BoardWriteServlet" method="post">
	<table align="center">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"><br></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="author"><br></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="10" name="content"></textarea></td>
		</tr>
		<tr>
			<td><input type="submit" value="글쓰기"></td>
			
		</tr>
	</table>
		
</form>
<br>
<a href="BoardListServlet">목록보기</a>
<br>


