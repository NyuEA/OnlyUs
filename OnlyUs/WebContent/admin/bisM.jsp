<%@page import="com.dto.BisUserDTO"%>
<%@page import="com.dto.MycouponDTO"%>
<%@page import="com.dto.CouponDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link href="css/topten.css" rel="stylesheet" type="text/css">
	<link href="css/top.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	function approvalY(bisid) {
		location.href = "ApprovalYServlet?bisid="+bisid;
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
<div class="nav">
	<h2 class="blind">로컬네이게이션</h2>
	<ul class="nav_ul fix">
		<!-- 	☆ 현재페이지 표시 class="on" -->
		<li><a  href="JoinMServlet" id="subm2">가입 관리</a></li>
		<li><a class="on" href="BisMServlet" id="subm2">업체 관리</a></li>
		<li><a href="GenMServlet" id="subm1">회원 관리</a></li>
		<li><a href="" id="subm2">문의사항관리</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	</ul>
</div>

<%
	List<BisUserDTO> list = (List<BisUserDTO>) request.getAttribute("bisList");
%>
<div id="bisjoinList">

<img src="images/a_menu1.png" class="menu" alt="">
	<table width="90%" cellspacing="0" cellpadding="0" align="center">


	


		<tr>

			<th>사업자회원 ID</th>
			<th>업체이름</th>
			<th>우편번호</th>
			<th>도로명주소</th>
			<th>지번주소</th>
			<th>연락처</th>
			<th>승인여부</th>
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
				for (BisUserDTO bisdto : list) {
					String bisid = bisdto.getBisid();
					String bisname = bisdto.getBisname();
					String post1 = bisdto.getPost1();
					String post2 = bisdto.getPost2();
					String addr1 = bisdto.getAddr1();
					String addr2 = bisdto.getAddr2();
					String phone1 = bisdto.getPhone1();
					String phone2 = bisdto.getPhone2();
					String phone3 = bisdto.getPhone3();
					String phone = phone1 +"-"+phone2+"-"+phone3;
					String approval = bisdto.getApproval();
			%>
			<tr>
				<td class="coutd"><%=bisid%></td>
				<td class="coutd"><%=bisname%></td>
				<td class="coutd"><%=post1%>-<%=post2%></td>
				<td class="coutd"><%=addr1%></td>
				<td class="coutd"><%=addr2%></td>
				<td class="coutd"><%=phone%></td>
				<td class="coutd"><%=approval%></td>
			</tr>

			<%
				} //end for
			%>
		</form>
	</table>
</div>