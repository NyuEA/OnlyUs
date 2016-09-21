<%@page import="com.dto.MycouponDTO"%>
<%@page import="com.dto.CouponDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>

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

<%  List<MycouponDTO> list = (List<MycouponDTO>) request.getAttribute("mycoupon");
 %>
<table  width="90%" cellspacing="0" cellpadding="0"   align="center">
	
			<tr>
				<td height="30">
			</tr>

			<tr>
				<td colspan="9" class="td_default">&nbsp;&nbsp;&nbsp; <font
					size="6" ><b>내 쿠폰함</b> </font> &nbsp;
				</td>
				
			</tr>

			<tr>
				<td height="15">
			</tr>

			<tr>
				<td colspan="11">
					<hr size="1" color="CCCCCC">
				</td>
			</tr>

			<tr>
				<td height="7">
			</tr>
			<tr>
				<td colspan="11" align="left">
					
				<input type="checkbox" name="allCheck" id="allCheck"  >전체선택</td>
				
				
			</tr>
			<tr>
				<td colspan="11"><br>
					<hr size="1" color="CCCCCC">
				<br><br><br></td>
			</tr>
	
	<tr>
		<th>쿠폰코드</th>
		<th>업체명</th>
		<th>내용</th>
		<th colspan="2">기간</th>
		<th>사용여부</th>
	</tr>
<tr>
				<td height="7">
			</tr>
			<%
			  
			   if(list.size()==0){
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
					<td class="td_default" align="center" colspan="10"><br>카트에 추가된 쿠폰이 없습니다.<br><br><br></td>
				</tr>
			<%
			   }else{
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
	</form>
</table>