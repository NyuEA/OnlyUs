<%@page import="com.dto.Top10DTO"%>
<%@page import="com.dto.MycouponDTO"%>
<%@page import="com.dto.CouponDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/topten.css" rel="stylesheet" type="text/css">

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

		<li><a href="CouponListServlet" id="subm2">내 쿠폰함</a></li>
		<li><a class="on"  href="TopTenServlet" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

		<li><a href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			} //end if
		%>

	</ul>
</div>

 <div id="topten">
<table  width="90%"cellspacing="0" cellpadding="0"   align="center">
	
		
			<tr>
				<td colspan="9" class="cmain">&nbsp;&nbsp;&nbsp; <font
					size="6" ><b>Top 10</b> </font> &nbsp;
				</td>
				
			</tr>
<% 	List<Top10DTO> list = (List<Top10DTO>) request.getAttribute("top10"); %>

	<tr>
		<th>등수</th>
		<th>쿠폰코드</th>
		<th>업체명</th>
		<th>내용</th>
		<th colspan="2">기간</th>
		<th>다운수</th>
	</tr>
	
				<%
			  
			   if(list.size()==0){
			%>
				<tr>
					<td colspan="12">
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
	
	
	<% 
			
		for (int i = 0 ; i < 10 ; i++) {
			Top10DTO mdto = list.get(i);
			String period_f = mdto.getPeriod_f();
			String period_t = mdto.getPeriod_t();
			String bisname = mdto.getBisname();
			String content = mdto.getContent();
			String couid = mdto.getCouid();
			int clickcount = mdto.getClickcount();
	%>
	<tr>
		<td class="coutd"><%=(i+1)%></td>
		<td class="coutd"> <%=couid %></td>
		<td class="coutd"><%=bisname%></td>
		<td class="coutd"><%=content%></td>
		<td class="coutd"><%=period_f%>~</td>
		<td class="coutd"><%=period_t%></td>
		<td class="coutd"  colspan="2"><%=clickcount%></td>
	</tr>
	
	<%
		} //end for
	%>
</table>
</div>