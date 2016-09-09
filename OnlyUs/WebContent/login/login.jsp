<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://www.modernizr.com/downloads/modernizr-latest.js"></script>
<script type="text/javascript" src="../js/placeholder.js"></script>

<script type="text/javascript">
<%-- class="placeholder" placeholder="<% if($(".BG").equals("사업자")){
%>	사업자번호로 로그인<%}else{%>id<%}
%> --%>
</script>

<link href="css/style.css" rel="stylesheet" type="text/css">

<img id="slick-back" src="images/backG.png" />



<form id="slick-login">
	<img id="slick-logos" src="images/logo1.png" />
	<table id="bisgen">
		<tr>
			<td><input type="radio" name="BG"  id="c1" value="사업자" >사업자</td>			
			<td><input type="radio" name="BG" id="c2" value="일반">일반</td>			
		</tr>
		
		<tr>
			<td colspan="2"><label for="username">username</label>
			<input type="text" name="username" value="사업자로그인"> </td>			
		</tr>
		<tr>
			<td colspan="2"><label
			for="password">password</label>
			<input type="password" name="password"	class="placeholder" placeholder="password"></td>			
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="LOGIN"></td>			
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="Join"></td>			
		</tr>

	</table>
	
</form>

<footer>
	<div>Made by onlyUs</div>
</footer>
