<%@page import="com.dto.genUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<%
	genUserDTO dto = (genUserDTO) request.getAttribute("mypage");
	String userid = dto.getUserid();
	String passwd = dto.getPasswd();
	String nickname = dto.getNickname();
	String birthday = dto.getBirthday();
	String preferbis = dto.getPreferbis();
%>


<form name="myform">
	아이디<input type="text" name="userid" id="userid" value="<%=userid%>"
		readonly> <br>비밀번호<input type="text" name="passwd"
		id="passwd" value="<%=passwd%>"><br> 닉네임<input
		type="text" name="username" id="username" value="<%=nickname%>"
		readonly><br> 생일<input type="text" name="username"
		id="username" value="<%=birthday%>" readonly><br> 선호업종<input
		type="text" name="username" id="username" value="<%=birthday%>"><br>
	<button onclick="memberUpdate(myform)">수정</button>
	<button onclick="memberDelete(myform)">탈퇴</button>
</form>

<script type="text/javascript">
	function memberUpdate(f) {
		f.action = "MemberUpdateServlet";
	}

	function memberDelete(f) {
		f.action = "MemberDeleteServlet";
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











