
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/mypage.css" rel="stylesheet" type="text/css">

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
<link href="css/top.css" rel="stylesheet" type="text/css">

<div id="blogMenu">
<div class="nav">
	<h2 class="blind">로컬네이게이션</h2>
	<ul class="nav_ul fix">
		<!-- 	☆ 현재페이지 표시 class="on" -->
		<li id="submli1"><a href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li id="submli2"><a href="board_.jsp" id="subm2">문의하기</a>
		<ul><li><a href="#">등록문의</a></li>
			<li><a href="#">일반문의</a></li></ul></li>
	</ul>
</div>
</div>



<center>
<form id="joinF" action="GenMemberAddServlet" >

   <table id="joinT">
   
		<tr>
			<td colspan="2">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid" id="userid" value=""><span
				id="result"></span></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" id="passwd" ><span
				id="result2"></span></td>
		</tr>
		
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="passwd2" id="passwd2"></td>
		</tr>
	
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nickname" id="nickname" value=""></td>
		</tr>
		
		<tr>
			<th>핸드폰<br><font color="gray" size="2">(-는 제외하고 입력하여 주세요)</font></th>
			<td><input type="text" name="phone" id="phone" value="" maxlength="11"></td>
		</tr>
		<tr>
			<td height="7" colspan="7">
		</tr>
		<tr>
		
			<td colspan="6"align="center"><input type="submit" value="가입" class="joinBtn">
				<input type="reset" value="취소" class="joinBtn"><br><br></td>
		</tr>
		
	</table>


</form>
</center>


<script type="text/javascript">

	$(document).ready(function() {

		$("#passwd2").on("keyup", function(event) {
			$("#result2").removeClass();
			var p = $("#passwd").val();
			var p2 = $("#passwd2").val();
			if (p == p2) {
				$("#result2").text("일치합니다").addClass("blue");
			} else {
				$("#result2").text("일치하지않습니다").addClass("red");
				;
			}
		});







		// 아이디 중복체크 Ajax 연동
		$("#bisid").on("keyup", function(event) {

			//Ajax 연동 
			//ajax통신
			jQuery.ajax({
				type : "GET",
				url : "idCheck.jsp",
				dataType : "text",
				data : {
					userid : $("#bisid").val()
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












<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="../css/login.css" rel="stylesheet" type="text/css">
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

<center>
<form id="joinF" action="genMemberAddServlet" >

	아이디<input type="text" name="userid" id="userid"> <span
		id="result"></span><br> 비밀번호<input type="password" name="passwd"
		id="passwd"> <span id="result2"></span><br> 비밀번호확인<input
		type="password" name="passwd2" id="passwd2"><br> 닉네임<input
		type="text" name="nickname" id="nickname"><br> 핸드폰(-제외하고 입력해주세요)<input
		type="text" name="phone" id="phone"><br> 
		<input type="submit" value="회원가입"> <input
		type="reset" value="취소">
</form>
</center>


<script type="text/javascript">

	$(document).ready(function() {

		$("#passwd2").on("keyup", function(event) {
			$("#result2").removeClass();
			var p = $("#passwd").val();
			var p2 = $("#passwd2").val();
			if (p == p2) {
				$("#result2").text("일치합니다").addClass("blue");
			} else {
				$("#result2").text("일치하지않습니다").addClass("red");
				;
			}
		});







		// 아이디 중복체크 Ajax 연동
		$("#bisid").on("keyup", function(event) {

			//Ajax 연동 
			//ajax통신
			jQuery.ajax({
				type : "GET",
				url : "idCheck.jsp",
				dataType : "text",
				data : {
					userid : $("#bisid").val()
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











 --%>