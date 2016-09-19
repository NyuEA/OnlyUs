<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>


<link href="../css/login.css" rel="stylesheet" type="text/css">





<div class="loginForm">

	<form name="" action="LoginServlet">
	<div class="box">
		<table>
			
			<tr>
				<td><input type="text" class="iText" value="아이디를 입력하세요.">
					</td>
			</tr>
			<tr>
				<td><input type="password" name="" id="" class="iText">
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
