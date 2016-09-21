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


<form>
	<table border="1" width="100%" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td height="30">
		</tr>
		<tr>


			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0" style='margin-left: 30px'>
					<tr>
						<td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
							&nbsp;</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>

					<tr>
						<td rowspan="7"></td>
						<td class="td_title">코드</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>지코드
						</td>
					</tr>
					<tr>
						<td class="td_title">이름</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>네임
						</td>
					</tr>
					<tr>
						<td class="td_title">가격</td>

						<td class="td_red" colspan="2" style='padding-left: 30px'>￦가격
						</td>
					</tr>
					<tr>
						<td class="td_title">배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"
							style='padding-left: 30px'><b> 무료배송</b> </font> <font size="2">(도서
								산간지역 별도 배송비 추가)</font></td>
					</tr>
					<tr>
						<td class="td_title" rowspan="2">상품옵션</td>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="GOODS_SIZE" id="GOODS_SIZE">
								<option selected value="사이즈선택">사이즈선택</option>
								<option value="L">L</option>
								<option value="M">M</option>
								<option value="S">S</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="GOODS_COLOR"
							id="GOODS_COLOR">
								<option selected value="색상선택">색상선택</option>
								<option value="navy">navy</option>
								<option value="black">black</option>
								<option value="ivory">ivory</option>
								<option value="white">white</option>
								<option value="gray">gray</option>
						</select></td>
					</tr>

					<tr>
						<%
							
						%>

						<td class="td_title">주문수량</td>
						<td style="padding-left: 30px"><input type="text"
							name="GOODS_AMOUNT" value="1" id="GOODS_AMOUNT"
							style="text-align: right; height: 18px"> <img
							src="images/up.PNG" id="up"> <img src="images/down.PNG"
							id="down"></td>
					</tr>
				</table>

			</td>
		</tr>
		<!-- <tr>
			<td hidden=true><input type="text" id="GOODS_CODE"
				name="GOODS_CODE" value="T1"></td>
			<td height="10">
		</tr> -->
	</table>

	<br> <input type="button" value="구매하기" id="order" onclick="" />
	&nbsp;&nbsp;
	<button onclick="xxx(goodRetrieveForm)" id="cart">장바구니</button>
	<!-- <input type="button" onclick="xxx2(goodRetrieveForm)"
		value="장바구니 담기" id="cart" /> <br> <br> -->
</form>
<table>
<tr>
	<th width="150px">쿠폰코드</th>
	<th width="150px">업체명</th>
	<th width="150px">내용</th>
	<th colspan="2" width="150px">기간</th>
	<th width="150px">사용여부</th>
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
