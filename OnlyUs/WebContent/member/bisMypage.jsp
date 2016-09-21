<%@page import="com.dto.BisUserDTO"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- DAUM 주소 라이브러리 시작 -->
<style type="text/css">

   .blue{
     color:blue;
   }
   .red{
     color:red;
   }
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->  
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<link href="css/mypage.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">


<%
	String bislogout = (String) request.getAttribute("logout");
	if (bislogout != null) {
%>
<script type="text/javascript">
	var str = "<%=bislogout%>";
	alert("<%=bislogout%>");
</script>
<%
	}
%>
<%
	String bisupdate = (String) request.getAttribute("bisupdate");
	if (bisupdate != null) {
%>
<script type="text/javascript">
	var str = "<%=bisupdate%>";
	alert("<%=bisupdate%>");
</script>
<%
	}
%>
<div class="nav">
	<h2 class="blind">로컬네이게이션</h2>
	<ul class="nav_ul fix">
		<!-- 	☆ 현재페이지 표시 class="on" -->

		<li><a href="CouponListServlet" id="subm2">내 쿠폰함</a></li>
		<li><a href="board_.jsp" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<li><a href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a></li>


	</ul>
</div>

<%
	BisUserDTO bisdto = (BisUserDTO) request.getAttribute("bisMypage");
	String bisid = bisdto.getBisid();
	String passwd = bisdto.getPasswd();
	String bisname = bisdto.getBisname();
	String post1 = bisdto.getPost1();
	String post2 = bisdto.getPost2();
	String addr1 = bisdto.getAddr1();
	String addr2 = bisdto.getAddr2();
	String phone1 = bisdto.getPhone1();
	String phone2 = bisdto.getPhone2();
	String phone3 = bisdto.getPhone3();
%>


<form name="myform">
	<table align="center" id="mytable">
		<tr>
			<th>아이디<br>(사업자번호)</th>
			<td><input type="text" name="userid" id="userid"
				value="<%=bisid%>" readonly></td>
		</tr>

		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="passwd" id="passwd"
				value="<%=passwd%>"></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="text" name="passwd" id="passwd"
				value="<%=passwd%>"></td>
		</tr>

		<tr>
			<th>업체명</th>
			<td><input type="text" name="nickname" id="nickname"
				value="<%=bisname%>">
			</th>
		</tr>
		<tr>
		<th>주소</th>
			<td>
				<!-- 다음주소 시작--> <input name="post1" id="post1" size="5" readonly=""value="<%=post1%>">
				- <input name="post2" id="post2" size="5" readonly="" value="<%=post2%>"> <input
				onclick="openDaumPostcode()" type="button" value="우편번호찾기"> <br>
				<input name="addr1" id="addr1" size="40" value="<%=addr1%>"> <br> <span
				style="line-height: 10%;"><br></span> <input name="addr2"
				id="addr2" size="40" value="<%=addr2%>" > <!-- 다음주소 끝 -->
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone1" id="phone1" size="4" maxlength="3" value="<%=phone1%>">- <input type="text" name="phone2" id="phone2" size="4" maxlength="4" value="<%=phone2%>">- <input
				type="text" name="phone3" id="phone3" size="4"maxlength="4" value="<%=phone3%>"><br></td>
		</tr>

		<tr>
			<td colspan="2">
				<button onclick="bisMemberUpdate(myform)" class="mypageBtn">수정</button>
			</td>
		</tr>

	</table>
</form>

<script type="text/javascript">
	function bisMemberUpdate(f) {
		f.action = "BisMemberUpdateServlet";
	}

	$(document).ready(function() {

		$("form").on("submit", function(event) {

			var userid = $("#userid").val();
			if (userid == '') {
				alert("아이디를 입력하세요");
				return false;
			} else if ($("#passwd").val() == '') {
				alert("비밀번호를 입력하세요");
				return false;
			} else if ($("#username").val() == '') {
				alert("이름을 입력하세요");
				return false;
			} else if ($("#post1").val() == '') {
				alert("우편번호를 입력하세요");
				return false;
			} else if ($("#post2").val() == '') {
				alert("우편번호를 입력하세요");
				return false;
			} else if ($("#post2").val() == '') {
				alert("우편번호를 입력하세요");
				return false;
			} else if ($("#addr1").val() == '') {
				alert("주소를 입력하세요");
				return false;
			} else if ($("#phone1").val() == '') {
				alert("전화번호1 입력하세요");
				return false;
			} else if ($("#phone2").val() == '') {
				alert("전화번호2 입력하세요");
				return false;
			} else if ($("#phone3").val() == '') {
				alert("전화번호3 입력하세요");
				return false;
			} else if ($("#email1").val() == '') {
				alert("이메일1를 입력하세요");
				return false;
			} else if ($("#email2").val() == '') {
				alert("이메일2를 입력하세요");
				return false;
			} else {
				//성공
				//alert("회원가입을 환영합니다");
			}

		});

	});
</script>











