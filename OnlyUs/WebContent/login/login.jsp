<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>


<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/top.css" rel="stylesheet" type="text/css">
<%
	String loginError = (String) request.getAttribute("loginError");
	if (loginError != null) {
%>
<script type="text/javascript">
	var str = "<%=loginError%>";
	alert("<%=loginError%>");
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
		<ul><li><a href="#">등록문의</a></li>
			<li><a href="#">일반문의</a></li></ul></li>
	</ul>
</div>
</div>


<div class="formsize">

	<div class="loginForm">

		<form name="" action="BisLoginServlet">
			<div class="box">
				<table>
					<tr>
						<td><input type="text" class="iText" placeholder="사업자 등록 번호"
							name="bisid" id="bisid" /></td>
					</tr>
					<tr>
						<td><input type="password" name="passwd" id="passwd"
							class="iText" placeholder="비밀번호"> <br></td>
					</tr>
					<tr>
						<td>
							<p>
								<span class="fleft"><input type="checkbox" id=""><label
									for=""> 아이디 저장</label></span> <span class="fright"><a href="">아이디
										찾기</a>&nbsp;|&nbsp;<a href="">비밀번호 찾기</a></span>
							</p>
					</tr>

					<tr>
						<td><input type="submit" value="로그인" class="loginBtn"></td>
					</tr>
				</table>


			</div>
		</form>
	</div>


<img src ="images/sun.png" style="margin-top: 80px"/>

	<div class="loginForm1">

		<form name="" action="LoginServlet">
			<div class="box">
				<table>
					<tr>
						<td><input type="text" class="iText" placeholder="아이디"
							name="userid" id="userid" /></td>
					</tr>
					<tr>
						<td><input type="password" name="passwd" id="passwd"
							class="iText" placeholder="비밀번호"> <br></td>
					</tr>
					<tr>
						<td>
							<p>
								<span class="fleft"><input type="checkbox" id=""><label
									for=""> 아이디 저장</label></span> <span class="fright"><a href="">아이디
										찾기</a>&nbsp;|&nbsp;<a href="">비밀번호 찾기</a></span>
							</p>
						</td>
					</tr>

					<tr>
						<td><input type="submit" value="로그인" class="loginBtn"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>

