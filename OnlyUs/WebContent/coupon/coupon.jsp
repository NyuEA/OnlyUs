<%@page import="com.dto.MycouponDTO"%>
<%@page import="com.dto.CouponDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
			GenUserDTO dto = (GenUserDTO) session.getAttribute("login");
		%>
		<%
			if (dto == null) {
		%>
		<li><a class="on" href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			} else {
		%>
		<li><a class="on" href="CouponListServlets" id="subm2">내 쿠폰함</a></li>
		<li><a href="top_.jsp" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<li><a href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			} //end if
		%>

	</ul>
</div>
<table border="1">
	<tr>
		<th>쿠폰코드</th>
		<th>업체명</th>
		<th>내용</th>
		<th colspan="2">기간</th>
		<th>사용여부</th>
	</tr>

	<%
		List<MycouponDTO> list = (List<MycouponDTO>) request.getAttribute("mycoupon");

		for (MycouponDTO mdto : list) {
			String dcouid = mdto.getDcouid();
			String period_f = mdto.getPeriod_f();
			String period_t = mdto.getPeriod_t();
			String bisname = mdto.getBisname();
			String use_yn = mdto.getUse_yn();
			String content = mdto.getContent();
	%>
	<tr>
		<td><%=dcouid%></td>
		<td><%=bisname%></td>
		<td><%=content%></td>
		<td><%=period_f%>~</td>
		<td><%=period_t%></td>
		<td><%=use_yn%></td>
	</tr>
	<%
		} //end for
	%>
</table>