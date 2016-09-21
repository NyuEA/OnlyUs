<%@page import="com.dto.GenUserDTO"%>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/NyuEA/OnlyUs
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    

<SCRIPT src="../js/jquery-3.1.0.js"></SCRIPT>


<%
	String logout = (String) request.getAttribute("logout");
	if (logout != null) {
%>
<script type="text/javascript">
      var str = "<%=logout%>";
      alert("<%=logout%>");
</script>
<%
	}
%>
<div class="nav">
	<h2 class="blind">로컬네이게이션</h2>
	<ul class="nav_ul fix">
		<!-- 	☆ 현재페이지 표시 class="on" -->
		<%
			GenUserDTO dto = (GenUserDTO) session.getAttribute("login");
		%>
		<%
			if (dto == null) {
		%>
		<li><a class="on" href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			} else {
		%>
		<li><a href="coupon_.jsp" id="subm2">내 쿠폰함</a></li>
		<li><a href="topten_.jsp" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<li><a href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a class="on" href="board_.jsp" id="subm2">문의하기</a></li>
		<%
			} //end if
		%>

	</ul>
</div>



 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<style>
			.container{
				margin-top: 20px;
			}
			input.ng-invalid {
				border: 5px solid red;
			}
		</style>
		<script type="text/javascript" src="libs/angular/angular.js"></script>
		<script>
		angular.module('form-demo-app', [])
		.controller('mainCtrl', ['$scope', function ($scope) {
			
		}]);
		</script>
	</head>
	<body ng-controller="mainCtrl">
		<div class="container" id="wrap">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<form name="signUpForm" class="form" role="form">
						<legend>회원가입</legend>
						<h4>회원가입</h4>
						<div class="row">
							<div class="col-xs-6 col-md-6">
								<input type="text" name="firstname" class="form-control input-lg" ng-model="user.firstName" placeholder="성" ng-required="true" ng-maxlength="4"/>
							</div>
							<div class="col-xs-6 col-md-6">
								<input type="text" name="lastname" class="form-control input-lg" placeholder="이름" ng-model="user.lastName" ng-required="true" ng-minlength="2"/>
							</div>
							<div ng-show="signUpForm.firstname.$error.maxlength" class="col-xs-12 col-md-12 alert alert-warning" role="alert">성은 최대 4글자만 입력가능합니다.</div>
							<div ng-show="signUpForm.lastname.$error.minlength"  class="col-xs-12 col-md-12 alert alert-warning" role="alert">이름은 최소 2글자만 입력가능합니다.</div>
						</div>
						<br>
						<input type="text" name="email" class="form-control input-lg" placeholder="Email" ng-model="user.email" ng-required="true" />
						<br>
						<input type="password" name="password" class="form-control input-lg" placeholder="패스워드" ng-model="user.password" ng-required="true" ng-pattern="/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$/" />
						<div ng-show="signUpForm.password.$error.pattern" class="alert alert-warning" role="alert">최소 4글자, 최대 8글자이고 적어도 1나의 소문자, 대문자, 숫자를 포함해야합니다.</div>
						<br>
						<input type="password" name="confirm_password" class="form-control input-lg" placeholder="패스워드 재입력" ng-model="user.repassword" ng-required="true"/>
						<br>
						<label>성별 : </label>
						<input type="radio" name="gender" ng-model="user.gender" value="M">남자
						<input type="radio" name="gender" ng-model="user.gender" value="F">여자
						<br>
						<button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">회원가입</button>
					</form>
					<div>

					</div>
				</div>
			</div>
		</div>