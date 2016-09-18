<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- DAUM 주소 라이브러리 시작 -->
<style type="text/css">
.blue {
	color: blue;
}

.red {
	color: red;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/daum.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<form action="MemberAddServlet">
	<table>
		<tr>
			<th colspan="2"><font size="6">사업자 회원가입</font></th>
		</tr>
		<tr>
			<td colspan="2">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
		<tr>
			<th>사업자번호</th>
			<td><input type="text" name="bisid" id="bisid"><span
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
			<th>업체이름</th>
			<td><input type="text" name="bisname" id="bisname"></td>
		</tr>
		<tr>
			<td height="7" colspan="2">
		</tr>
		<tr>
			<td colspan="2" align="center">
				<!-- 다음주소 시작--> <input name="post1" id="post1" size="5" readonly="">
				- <input name="post2" id="post2" size="5" readonly=""> <input
				onclick="openDaumPostcode()" type="button" value="우편번호찾기">
			</td>
		</tr>
		<tr>
			<td height="7" colspan="2">
		</tr>
		<tr>
			<td align="center" colspan="2"><input name="addr1" id="addr1"
				size="40" readonly="" placeholder="도로명주소"> <br> <span
				style="line-height: 10%;"><br></span> <input name="addr2"
				id="addr2" size="40" placeholder="지번주소"> <!-- 다음주소 끝 -->
				</td>
		</tr>
		<tr>
			<td height="7" colspan="2">
		</tr>
		<tr>
			<td colspan="2" align="center">휴대폰 <select name="phone1"
				id="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
			</select>- <input type="text" name="phone2" id="phone2" maxlength="4" size="2">-
				<input type="text" name="phone3" id="phone3" maxlength="4" size="2">
			</td>
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











