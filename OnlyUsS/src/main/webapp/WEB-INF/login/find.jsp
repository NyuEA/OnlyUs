<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(window).lode(function(){
	$("#btnFindUid").click(btnFindUid);
	$("#btnFindPW").click(btnFindPW);
	
});

function btnFindUid(event) {
	var Email=$("#Email");
	
	if(Email.val() == ""){
		alert("이메일을 입력하세요");
		return;
	}
	var name=$("#name");
	
	if(name.val() == ""){
		alert("이름을 입력하세요");
		return;
	}
	$.post("findIDResult.htm",{
		Email:Email.val(),
		name:name.val()
		}, function(data) {
			alert(eval(data).result);
		
	});
	
}
</script>

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

		<form name="form1" action="findIDResult.htm" method="post">
			<fieldset>
				<legend class="hidden">ID/비밀번호 찾기 </legend>
				<ul id="findID">
				<li>ID찾기</li>
				<li><label> E-mail</label> <input type="Text" id="Email" name="email"/></li>
				<li><label> 이름</label> <input type="Text" id="name" name="name"/></li>				
				<li><input type="button" name="btnFindUid" id="btnFindUid" value="아이디 찾기"/></li>			
				</ul>
			</fieldset>
		</form>
	</div>

