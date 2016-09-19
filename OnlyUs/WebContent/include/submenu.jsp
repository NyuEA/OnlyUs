
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../css/common.css" rel="stylesheet" type="text/css">
<link href="../css/contents.css" rel="stylesheet" type="text/css">
<link href="../css/master.css" rel="stylesheet" type="text/css">
<link href="../css/top.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//$("#subm1").on("click", function() {
			$("#subm1").css({"color":"blue"});
		//});  

		$("#subm2").on("click", function() {
			$("#subm2").css({"color":"red"});
		});
	});
</script>


<div class="nav">
	<h2 class="blind">로컬네이게이션</h2>
	<ul class="nav_ul fix">
		<!-- 	☆ 현재페이지 표시 class="on" -->
		<li id="submli1"><a href="../home/home_.jsp?" id="subm1">서비스소개</a></li>
		<li id="submli2"><a href="../board/board_.jsp" id="subm2">문의하기</a></li>
	</ul>
</div>


