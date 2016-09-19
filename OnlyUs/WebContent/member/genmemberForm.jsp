<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>

<form>
	아이디<input type="text" name="userid" id="userid"> <span
		id="result"></span><br> 비밀번호<input type="password" name="passwd"
		id="passwd"> <span id="result2"></span><br> 비밀번호확인<input
		type="password" name="passwd2" id="passwd2"><br> 닉네임<input
		type="text" name="nickname" id="nickname"><br> 생일<input
		type="text" name="birthday" id="birthday"><br>좋아하는 업종<select>
		<option>음식</option>
	</select><br> <input type="submit" value="회원가입"> <input
		type="reset" value="취소">
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











