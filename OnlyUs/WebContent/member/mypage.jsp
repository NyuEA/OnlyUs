<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<link href="css/mypage.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">


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
<%
	String update = (String) request.getAttribute("update");
	if (update != null) {
%>
<script type="text/javascript">
      var str = "<%=update%>";
      alert("<%=update%>");
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
	GenUserDTO dto = (GenUserDTO) request.getAttribute("mypage");
	String userid = dto.getUserid();
	String passwd = dto.getPasswd();
	String nickname = dto.getNickname();
	String phone = dto.getPhone();
%>


<form name="myform">
	<table align="center" id="mytable">
		<tr>
			<th>아이디</th>
		<td><input type="text" name="userid" id="userid"
				value="<%=userid%>" readonly>
			</td>
		</tr>

		<tr>
			<th>비밀번호</th>
		<td><input type="text" name="passwd" id="passwd" value="<%=passwd%>"></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
		<td><input type="text" name="passwd" id="passwd" value="<%=passwd%>"></td>
		</tr>
		
		 <tr>
			<th>닉네임</th>
		<td><input type="text" name="nickname" id="nickname" value="<%=nickname%>"></th>
		</tr>
			
		<tr>
			<th>휴대폰</th>
		<td>
		<input type="text" name="phone" id="phone" value="<%=phone%>" maxlength="11"></td>
		</tr>
		
		<tr>
			<td colspan="2">
		<button onclick="memberUpdate(myform)" class="mypageBtn">수정</button>
		<button onclick="memberDelete(myform)"  class="mypageBtn">탈퇴</button></td>
		</tr>
		
	</table>
</form>

<script type="text/javascript">
	function memberUpdate(f) {
		f.action = "GenMemberUpdateServlet";
	}

	function memberDelete(f) {
		f.action = "GenMemberDeleteServlet";
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











