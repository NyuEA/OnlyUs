<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/style.css" rel="stylesheet" type="text/css">
<form action="genMemberAddServlet">
	<table>
		<tr>
			<th colspan="2"><font size="6">일반사용자 회원가입</font></th>
		</tr>
		<tr>
			<td colspan="2">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid" id="userid"><span
				id="result"></span></td>
		</tr>
		<tr>
			<td height="7" colspan="2">
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" id="passwd"><span
				id="result2"></span></td>
		</tr>
		<tr>
			<td height="7" colspan="2">
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="passwd2" id="passwd2"></td>
		</tr>
		<tr>
			<td height="7" colspan="2">
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nickname" id="nickname"></td>
		</tr>
		<tr>
			<td height="7" colspan="2">
		</tr>
		<tr>
			<th>생일</th>
			<td><input type="text" name="birthday" id="birthday">ex)2015/01/01</td>
		</tr>
		<tr>
			<td height="7" colspan="2">
		</tr>
		<tr>
			<th>선호업종(꼭 쓸필요 없음)</th>
			<td><input type="text" name="preferbis" id="preferbis"></td>
		</tr>
		<tr>
			<td height="7" colspan="2">
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="회원가입">
				<input type="reset" value="취소"></td>
		</tr>
	</table>
</form>

<script type="text/javascript">

	$(document).ready(function() {

		$("#passwd2").on("keyup", function(event) {
			$("#result2").removeClass();
			var p = $("#passwd").val();
			var p2 = $("#passwd2").val();
			if (p == p2) {
				$("#result2").text("일치").addClass("blue");
			} else {
				$("#result2").text("불일치").addClass("red");
				;
			}
		});







		// 아이디 중복체크 Ajax 연동
		$("#userid").on("keyup", function(event) {

			//Ajax 연동 
			//ajax통신
			jQuery.ajax({
				type : "GET",
				url : "idCheck.jsp",
				dataType : "text",
				data : {
					userid : $("#userid").val()
				},
				success : function(responseData, status, xhr) {
					console.log(responseData);
					$("#result").text(responseData);
				},
				error : function(xhr, status, error) {
					console.log("error");
				}
			});
		});







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
			} else if ($("#nickname").val() == '') {
				alert("닉네임을 입력하세요");
				return false;
			} else if ($("#birthday").val() == '') {
				alert("생일을 입력하세요");
				return false;
			} else {
				//성공
				//alert("회원가입을 환영합니다");
			}

		});

	});
</script>











