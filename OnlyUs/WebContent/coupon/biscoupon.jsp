<%@page import="com.dto.BisUserDTO"%>
<%@page import="com.dto.MycouponDTO"%>
<%@page import="com.dto.CouponDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<link href="css/coupon.css" rel="stylesheet" type="text/css">
<LINK href="../css/top.css" rel="stylesheet" type="text/css">
<%
	String logout = (String) request.getAttribute("logout");
	if (logout != null) {
%>
<script type="text/javascript">
      var str = "<%=logout%>";
      alert("<%=logout%>");
</script>
<script type="text/javascript">
	function deleteCoupon(couid) {
		console.log("deleteCoupon");
		location.href = "DeleteCouponServlet?couid="+couid;
	}
</script>
<%
	}
%>
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
		<li><a class="on" href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			} else if (dto != null && "admin".equals(userid)) {
		%>
		<li><a href="Admin1Servlet" id="subm2">가입 관리</a></li>
		<li><a href="" id="subm2">업체 관리</a></li>
		<li><a href="" id="subm1">회원 관리</a></li>
		<li><a href="" id="subm2">문의사항관리</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<%
			} else if (dto != null) {
		%>
		<li><a class="on" href="CouponListServlet" id="subm2">내 쿠폰함</a></li>
		<li><a href="TopTenServlet" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<li><a href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			} else {//end if
		%>
		<li><a class="on" href="BisCouponListServlet" id="subm2">쿠폰관리</a></li>
		<li><a href="TopTenServlet" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<li><a href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			}
		%>

	</ul>
</div>

<%  List<CouponDTO> list = (List<CouponDTO>) request.getAttribute("BisCoupon"); 
System.out.print(list);
%>
 
 <div id="coupon">
 <img src="images/menu1.png" class="menu">
 

<table  width="90%"cellspacing="0" cellpadding="0"   align="center">
	
		
			

	<tr>
		
		<th>쿠폰코드</th>
		<th>쿠폰내용</th>
		<th>남은 장수</th>
		<th colspan="2">기간</th>
		<th>제공여부</th>
		<th>다운로드수</th>
		<th>삭제여부</th>
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
					<td class="td_default" align="center" colspan="10"><br>존재하는 쿠폰이 없습니다.<br><br><br></td>
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
		
		for (CouponDTO bdto : list) {
			String couid = bdto.getCouid();
			String amount = bdto.getAmount();
			String period_f = bdto.getPeriod_f();
			String period_t = bdto.getPeriod_t();
			char show_yn = bdto.getShow_yn();
			int clickcount = bdto.getClickcount();
			String content = bdto.getContent();
	%>
	<tr>
		<td class="coutd"><%=couid%></td>
		<td class="coutd"><%=content%></td>
		<td class="coutd"><%=amount%></td>
		<td class="coutd"><%=period_f%>~</td>
		<td class="coutd"><%=period_t%></td>
		<td class="coutd"><%=show_yn%></td>
		<td class="coutd"><%=clickcount%></td>
		<td align="center"><input type="button" value="삭제" onclick="deleteCoupon('<%=couid%>')"></td>
	</tr>
	
	<%
		} //end for
	%>
	</form>
	<tr>
	<td align="center"><button>쿠폰등록</button></td>
	</tr>
</table>
</div>