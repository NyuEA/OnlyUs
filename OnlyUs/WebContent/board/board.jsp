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
<div>
	<form id="bf">


		<table id="Insert" width="80%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td bgcolor="#336699"></td>
			</tr>
			<tr>
				<td bgcolor="#668fcd"></td>
			</tr>
		</table>


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



		<table width="60%" cellpadding="5" cellspacing="0" border="0" align="center">
			<tr height="10">
				<td colspan="4"></td>
			</tr>

			<tr class="txt01">
				<th width="20%">업체명</th>
				<td width="200px"><input type="text" Class="input" ID="name"
					size="40%"></td>
				<th width="200px">연락처</th>
				<td><input type="text" Class="input" size="3">&nbsp; -
					<input type="text" Class="input" size="4">&nbsp; - <input
					type="text" Class="input" size="4"></td>
			</tr>

			<tr height="4">
				<td colspan="4"></td>
			</tr>

			<tr height="1">
				<td colspan="2" background="images/dotline.gif"></td>
			</tr>
			<tr class="txt01">
				<th>주소</th>
				<td colspan="3"><input type="text" Class="input" size="101%">
				</td>

			</tr>

			<tr height="4">
				<td colspan="4"></td>
			</tr>



			<tr height="1">
				<td colspan="2" background="images/dotline.gif"></td>
			</tr>
			<tr class="txt01">
				<th>문의내용</th>
				<td colspan="4"><textarea Rows="7" cols="100%">음식점 등록시 필수 입력 사항
(제휴 문의는 음식점 등록 필수 입력 사항과 관계 없이 자유롭게 작성하시면 됩니다)

상호(매장명):
* 프랜차이즈의 경우 매장명과 지점명을 함께 입력해 주세요
예) 빕스(강남역점)

주소:

전화번호:

대표자 또는 담당자 이름 :

대표자 또는 담당자 핸드폰 :

영업시간 :
예) 11:00 ~ 22:00 또는 16:00 ~ 익일 03:00

대표메뉴 4가지
예) 까르보나라 12,000원, 해산물크림스파게티 12,000원, 리조또 12,000원, 빠네파스타 12,000원

주차 :
예) 가능 or 불가

찾아오는 길 :
예)강남역 10번출구로 나와서 CGV골목으로 들어가 첫번째 사거리에서 우회전 후 던킨도넛츠 2층 위치

쿠폰 내용 :
예)
1. 1인 1메뉴 주문시 샐러드(9,000원 상당) 무료 제공
2. 해산물크림파스타, 리조또, 빠네파스타 20%할인
3. 결재금액의 20% 할인

쿠폰사용시 유의사항 :
예)
1. 테이블당 1매 사용가능
2. 타 할인쿠폰 중복 사용 불가
      </textarea></td>
			</tr>


			<tr height="4">
				<td colspan="4"></td>
			</tr>

			<tr class="txt01">
				<th>약관동의</th>
				<td colspan="4"><textarea Rows="7" cols="100%">개인정보취급방침
(주)요깄넹(이하 '회사')는 회원님의 개인정보를 중요시하며, 개인정보의 보호와 관련하여 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관련법 상의 개인정보 보호 규정을 준수하고 있습니다.

회사는 개인정보취급방침을 통하여 회원님들의 개인정보가 남용되거나 유출되지 않도록 최선을 다할 것이며, 회원님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있고, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드리고자 합니다.

단, 본 개인정보 취급방침은 정부의 법령 및 지침의 변경, 또는 보다 나은 서비스의 제공을 위하여 그 내용이 변경될 수 있으니, 회원님들께서는 사이트 방문시 수시로 그 내용을 확인하여 주시기 바라며, 회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

1. 수집하는 개인정보 항목 및 수집방법
회사는 회원가입, 상담, 서비스 신청 및 제공 등을 위해 다음과 같은 개인정보를 수집하고 있습니다.
가. 개인정보 항목
- 필수항목 : 이메일, 연락처(일반전화 또는 휴대전화), 사는 지역, 만 14세 미만인 경우 위 항목에 대한 법정대리인의 정보 다만, 서비스 이용과정에서 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록 등이 생성되어 수집될 수 있습니다.
나. 수집방법 : 홈페이지(회원가입, 고객센터게시판) 및 모바일웹 회원가입 시 또는 국민뽑기와 같은 프로모션 진행시 수집

2. 개인정보의 수집 및 이용목적
회사는 수집된 회원님들의 개인정보를 다음의 목적을 위해 이용하고 있습니다.
가. 회원 관리
회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입회수 제한, 만 14세 미만 아동 개인정보 수집 시 법정대리인 동의여부 확인, 추후 법정대리인 동의여부 확인, 분쟁 조정을 위한 기록 보존, 불만처리 등 민원처리, 고지사항 전달
다. 신규서비스 개발 • 마케팅 및 광고에 활용
신규 서비스(컨텐츠) 개발 및 특화, 이벤트 등 광고성 정보 전달, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계

3. 개인정보의 보유 및 이용기간
회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 개인정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
가. 상법 등 법령에 따라 보존할 필요성이 있는 경우
- 표시 • 광고에 관한 기록
보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률
보존기간 : 6월
- 계약 또는 청약철회 등에 관한 기록
보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률
보존기간 : 5년
- 대금결제 및 재화 등의 공급에 관한 기록
보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률
보존기간 : 5년
- 소비자의 불만 또는 분쟁처리에 관한 기록
보존근거 : 전자상거래등에서의 소비자보호에 관한 법률
보존기간 : 3년
- 신용정보의 수집, 처리 및 이용 등에 관한 기록
보존근거 : 신용정보의 이용 및 보호에 관한 법률
보존기간 : 3년
나. 기타, 회원님의 개별적인 동의가 있는 경우에는 개별 동의에 따른 기간까지 보관합니다.
      </textarea></td>
			</tr>

			<tr height="10">
				<td colspan="4"></td>
			</tr>
			<tr height="1">
				<td colspan="4"><input type="submit" value="보내기"> <input
					type="reset" value="취소하기"></td>
			</tr>

		</table>

	</form>
</div>
