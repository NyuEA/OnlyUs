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
	<link rel="stylesheet" href="css/sub.css?ver=201609271052">
	<link href="css/top.css" rel="stylesheet" type="text/css">
	<script src="js/memberjoin.js"></script>


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


<div id="blogMenu">
<div class="nav">
	<h2 class="blind">로컬네이게이션</h2>
	<ul class="nav_ul fix">
		<!-- 	☆ 현재페이지 표시 class="on" -->
		<li id="submli1"><a href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li id="submli2"><a href="board_.jsp" id="subm2">문의하기</a>
		<ul>
		<li><a href="#">등록문의</a></li>
			<li><a href="#">일반문의</a></li></ul></li>
		</ul>
</div>
</div>


<form name="myform">

<div class="container member-container"><div class="w">
	<div class="section-join">
		
		<fieldset class="group-form">
			<legend>요깄넹 회원가입</legend>
			<div class="area-form">
				<span class="i-id">
					<input type="text" maxlength="15" id="userid" name="userid" placeholder="아이디(사업자번호)">
					
					<a href="#" class="btn-check">중복확인</a>
				</span>
				<p class="text-alert" style="display:none;">아이디는 5~15자 이내의 영/숫자 조합으로만 사용 가능합니다.</p>
			</div>
			
			<div class="area-form">
				<span class="i-id">
					<input type="password" maxlength="15" id="passwd" name="passwd" placeholder="비밀번호">
					
				</span>
				<p class="text-alert" style="display:none;" id="msg1">비밀번호 는 8~15자 이내의 영문 대소문자, 숫자 및 특수문자 2가지 이상 조합이어야 합니다.</p>
			</div>
			<div class="area-form">
				<span class="i-id">
					<input type="password" maxlength="15" id="passwd2" name="passwd2" placeholder="비밀번호 재확인">
					
				</span>
				<p class="text-alert" style="display:none;">입력하신 비밀번호가 일치하지 않습니다.</p>
			</div>
			<div class="area-form">
				<span class="i-id">
					<input type="text" maxlength="15" id="nickname" name="nickname" placeholder="업체명">										
				</span>
			</div>
			
			<div class="area-form">
				<span class="i-add">
					<input type="text" id="post1" name="userid" placeholder="주소" size="5" readonly="">-
				<input type="text" id="post2" name="post2" size="5" readonly=""> <br>
				 <span style="line-height: 10%;" ><br></span>
				 	
				 <input onclick="openDaumPostcode()" class="btn-check1" type="button" value="우편찾기" >
				<input type="text"name="addr1" id="addr1" size="54"> <br> <span
				style="line-height: 10%;" ><br></span> <input type="text" name="addr2"
				id="addr2" size="54" > <!-- 다음주소 끝 -->
					
				</span>
				
			</div>
			
			<div class="area-form">
				
				
				<span class="i-id">
					<input type="text" maxlength="15" id="phone" name="phone" placeholder="휴대전화번호 (-는 제외하고 입력하여 주세요)">										
				</span>
			
				<p class="text-alert" style="display:none;" id="msgTel">이미 사용중인 휴대전화번호입니다.</p>
			</div>
			
			
			

		</fieldset>

		<div class="group-agrees">
			<div class="area-all">
				<label><input type="checkbox" id="termArgees">요깄넹 가입 전체 약관에 동의합니다.</label>
			</div>
			<ul class="area-items" id="listsTerms">
				<li><label><input type="checkbox" id="agreement"> 서비스 이용약관에 동의</label><a href="#agreement1" class="btn">내용보기</a></li>
				<li><label><input type="checkbox" id="location"> 위치정보 이용약관에 동의</label><a href="#agreement2" class="btn">내용보기</a></li>
				<li><label><input type="checkbox" id="privacy"> 개인정보 수집 및 이용(필수)</label><a href="#agreement3" class="btn">내용보기</a></li>
				<li style="display:none;"><label><input type="checkbox" id="privacy_rule"> 개인정보 취급위탁에 동의 (선택)</label><a href="#agreement4" class="btn">내용보기</a></li>
			</ul>
		</div>

		<div class="group-btn">
	
			<button onclick="bismemberAdd(myform)" class="mypageBtn">가입신청</button>
				<button onclick="home_.jsp" class="mypageBtn">취소</button>
		</div>
		</div>
		</div>
				
			</div>
			
		
</form>

<script type="text/javascript">
	function bismemberAdd(f) {
		f.action = "bisMemberAddServlet";
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

