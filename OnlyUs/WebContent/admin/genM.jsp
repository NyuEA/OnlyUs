<%@page import="com.dto.BisUserDTO"%>
<%@page import="com.dto.MycouponDTO"%>
<%@page import="com.dto.CouponDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link href="css/topten.css" rel="stylesheet" type="text/css">
	<LINK href="css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	function deleteGenUser(userid) {
		location.href = "GenMDeleteServlet?userid="+userid;
	}
</script>
<link href="css/coupon.css" rel="stylesheet" type="text/css">
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
		<li><a href="JoinMServlet" id="subm2">가입 관리</a></li>
		<li><a href="BisMServlet" id="subm2">업체 관리</a></li>
		<li><a class="on" href="GenMServlet" id="subm1">회원 관리</a></li>
		<li><a href="" id="subm2">문의사항관리</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	</ul>
</div>
</div>

<%
	List<GenUserDTO> list = (List<GenUserDTO>) request.getAttribute("genList");
%>
<div id="bisjoinList">
<img src="images/a_menu3.png" class="menu" alt="">
	<table width="90%" cellspacing="0" cellpadding="0" align="center">



		<tr>

			<th>일반회원ID</th>
			<th>닉네임</th>
			<th>연락처</th>
			<th>회원탈퇴</th>
		</tr>

		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="11">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>

		<tr>
			<td height="5">
		</tr>
		<tr>
			<td class="td_default" align="center" colspan="10"><br>
				가입신청한 업체가 존재하지 않습니다.<br>
			<br>
			<br></td>
		</tr>
		<%
			} else {
		%>

		<tr>
			<td colspan="11">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>

		<%
			} //end for
		%>

		<form name="myForm">
			<%
				for (GenUserDTO dto : list) {
					String userid = dto.getUserid();
					String nickname = dto.getNickname();
					String phone = dto.getPhone();
			%>
			<tr>
				<td class="coutd"><%=userid%></td>
				<td class="coutd"><%=nickname%></td>
				<td class="coutd"><%=phone%></td>
				<td class="coutd"><input type="button" value="탈퇴" onclick="deleteGenUser('<%=userid%>')"></td>
			</tr>

			<%
				} //end for
			%>
		</form>
	</table>
</div>