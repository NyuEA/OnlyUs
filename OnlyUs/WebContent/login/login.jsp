<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>


<link href="css/login.css" rel="stylesheet" type="text/css">

	<div class="nav">
		<h2 class="blind">로컬네이게이션</h2>
		<ul class="nav_ul fix">
			<!-- 	☆ 현재페이지 표시 class="on" -->
			<li id="submli1"><a href="home_.jsp?" id="subm1">서비스소개</a></li>
			<li id="submli2"><a href="board_.jsp" id="subm2">문의하기</a></li>
		</ul>
	</div>




<div class="loginForm">

	<form name="" action="LoginServlet">
	<div class="box">
		<table>			
			<tr>
				<td><input type="text" class="iText" placeholder="아이디 or 이메일"/>
					</td>
			</tr>
			<tr>
				<td><input type="password" name="" id="" class="iText" placeholder="비밀번호">
					<br></td>
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
				<td><input type="submit" value="로그인"  class="loginBtn"></td>
			</tr>
		</table>
		</div>
	</form>
</div>
