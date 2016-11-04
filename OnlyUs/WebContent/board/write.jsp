<%@page import="com.dto.BisUserDTO"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<LINK href="../css/master.css" rel="stylesheet" type="text/css">
<LINK href="../css/contents.css" rel="stylesheet" type="text/css">
<LINK href="../css/common.css" rel="stylesheet" type="text/css">
<LINK href="../css/top.css" rel="stylesheet" type="text/css">
<SCRIPT src="../js/jquery-3.1.0.js"></SCRIPT>
<style>
.txt01 {
	font-family: Verdana, 돋움;
	font-size: 11px;
	color: slategray;
}

.txt02 {
	font-family: Verdana, 돋움;
	font-size: 16px;
	color: slategray;
}

th {
	background-color: #d9d9d9;
}
</style>

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

<div id="blogMenu">
	<div class="nav">
		<h2 class="blind">로컬네이게이션</h2>
		<ul class="nav_ul fix">
			<!-- 	☆ 현재페이지 표시 class="on" -->
			<%
				String userid = "";
				GenUserDTO dto = (GenUserDTO) session.getAttribute("login");
				BisUserDTO bisdto = (BisUserDTO) session.getAttribute("bislogin");
				if (dto != null) {
					userid = dto.getUserid();
					System.out.println(userid);
				}
			%>
			<%
				if (dto == null && bisdto == null) {
			%>
			<li><a href="home_.jsp?" id="subm1">서비스소개</a></li>
			<li><a class="on" href="" id="subm2">문의하기</a>
				<ul>
					<li><a href="board_.jsp">등록문의</a></li>
					<li><a href="write_.jsp">일반문의</a></li>
				</ul></li>
			<%
				} else if (dto != null && "admin".equals(userid)) {
			%>
			<li><a href="CouponListServlet" id="subm2">가입 관리</a></li>
			<li><a href="TopTenServlet" id="subm2">업체 관리</a></li>
			<li><a class="on" href="home_.jsp?" id="subm1">회원 관리</a></li>
			<li><a href="board_.jsp" id="subm2">문의사항관리</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<%
				} else if (dto != null) {
			%>
			<li><a href="CouponListServlet" id="subm2">내 쿠폰함</a></li>
			<li><a href="TopTenServlet" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<li><a class="on" href="home_.jsp?" id="subm1">서비스소개</a></li>
			<li><a href="" id="subm2">문의하기</a>
				<ul>
					<li><a href="board_.jsp">등록문의</a></li>
					<li><a href="write_.jsp">일반문의</a></li>
				</ul></li>
			<%
				} else {//end if
			%>
			<li><a href="CouponListServlet" id="subm2">쿠폰관리</a></li>
			<li><a href="TopTenServlet" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<li><a href="home_.jsp?" id="subm1">서비스소개</a></li>
			<li><a href="board_.jsp" id="subm2">문의하기</a>
				<ul>
					<li><a href="board_.jsp">등록문의</a></li>
					<li><a href="write_.jsp">일반문의</a></li>
				</ul></li>
			<%
				}
			%>

		</ul>
	</div>
</div>
<form action="BoardWriteServlet" method="post" id="bf">

	<table width="60%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr class="txt02">
			<td height="25" align="left" class="td2">&nbsp;&nbsp;문의하기</td>
		</tr>

	</table>
	<table width="60%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr class="txt01">
			<td bgcolor="#f0f0f0"></td>
		</tr>
		<tr class="txt01">
			<td bgcolor="#a6a6a6"></td>
		</tr>
		<tr class="txt01">
			<td height="2" bgcolor="#dadada"></td>
		</tr>
	</table>
	<table width="60%" cellpadding="5" cellspacing="0" border="0"
		align="center">
		<tr height="10">
			<td colspan="4"></td>
		</tr>
		<tr class="txt01">
			<th width="20%">제목</th>
			<td colspan="3"><input type="text" Class="input" name="title"
				size="100%"></td>
		</tr>
		<tr height="3">
			<td colspan="4"></td>
		</tr>
		<tr class="txt01">
			<th width="20%">작성자</th>
			<td width="200px"><input type="text" Class="input" ID="name"
				size="40%"></td>
			<th width="200px">연락처</th>
			<td><input type="text" Class="input" size="3">&nbsp; - <input
				type="text" Class="input" size="4">&nbsp; - <input
				type="text" Class="input" size="4"></td>
		</tr>
		<tr height="3">
			<td colspan="4"></td>
		</tr>
		<tr class="txt01">
			<th>내용
			</td>
			<td colspan="4"><textarea rows="10" cols="100%" name="content"></textarea></td>
		</tr>
		<tr height="3">
			<td colspan="4"></td>
		</tr>
		<th class="txt01" width="20%">비밀번호</th>
		<td ><input type="text" Class="input" ID="name"
			size="40%"></td>
		<tr height="3">
			<td colspan="4"></td>
		</tr>
		<tr class="txt01">
			<td align="center" colspan="4"><input type="submit" value="글쓰기"></td>

		</tr>
	</table>

</form>
<br>
<a href="BoardListServlet">목록보기</a>
<br>
