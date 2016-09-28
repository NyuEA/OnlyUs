<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>


<link href="css/login.css" rel="stylesheet" type="text/css">
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


<div class="formsize">

	<div class="loginForm">
		<form name="" action="LoginServlet">
			<div class="box">
				<table>
					<tr>
						<td><a href="bisJoin_.jsp"><img src="images/bisjoin.png"/></a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>


<img src ="images/sun.png" style="margin-top: 90px"/>

		<div class="loginForm1" style="padding-left :130px">
		<form name="" action="LoginServlet">
			<div class="box">
				<table>
					<tr>
						<td><a href="genJoin_.jsp"><img src="images/genjoin.png"/></a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	
</div>

