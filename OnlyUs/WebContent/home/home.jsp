<%@page import="com.dto.BisUserDTO"%>
<%@page import="com.dto.GenUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<LINK href="css/master.css" rel="stylesheet" type="text/css">
<LINK href="css/contents.css" rel="stylesheet" type="text/css">
<LINK href="css/common.css" rel="stylesheet" type="text/css">
<LINK href="css/top.css" rel="stylesheet" type="text/css">
<SCRIPT src="js/jquery-3.1.0.js"></SCRIPT>




<%
	String add = (String) request.getAttribute("add");
	if (add != null) {
%>
<script type="text/javascript">
	var str = "<%=add%>";
	alert("<%=add%>");
</script>
<%
	}
%>
<%
	String logerror = (String) request.getAttribute("login");
	if (logerror != null) {
%>
<script type="text/javascript">
	var str = "<%=logerror%>";
	alert("dd");
</script>
<%
	}
%>
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
	<div id="blogMenu">
<div class="nav">
	<h2 class="blind">로컬네이게이션</h2>

	<ul class="nav_ul fix">
		<!-- 	☆ 현재페이지 표시 class="on" -->
		<%
			String userid = "";
			GenUserDTO dto = (GenUserDTO) session.getAttribute("login");
			BisUserDTO bisdto = (BisUserDTO) session.getAttribute("bislogin");
			if (dto != null) {
				userid = dto.getUserid();
				System.out.println(userid);
			}
		%>
		<%
			if (dto == null && bisdto == null) {
		%>
		<li><a class="on" href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a>
		
		<ul>
			<li><a href="#">등록문의</a></li>
			<li><a href="#">일반문의</a></li>
</ul>
</li>
		<%
			} else if (dto != null && "admin".equals(userid)) {
		%>
		<li><a href="JoinMServlet" id="subm2">가입 관리</a></li>
		<li><a href="BisMServlet" id="subm2">업체 관리</a></li>
		<li><a href="GenMServlet" id="subm1">회원 관리</a></li>
		<li><a href="" id="subm2">문의사항관리</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<%
			} else if (dto != null) {
		%>
		<li><a href="CouponListServlet" id="subm2">내 쿠폰함</a></li>
		<li><a href="TopTenServlet" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<li><a class="on" href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a>
		<ul><li><a href="#">등록문의</a></li>
			<li><a href="#">일반문의</a></li></ul>
			</li>
		<%
			} else {//end if
		%>
		<li><a href="" id="subm2">쿠폰관리</a></li>
		<li><a href="TopTenServlet" id="subm2">TOP10</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<li><a class="on" href="home_.jsp?" id="subm1">서비스소개</a></li>
		<li><a href="board_.jsp" id="subm2">문의하기</a>
		<ul>
			<li><a href="#">등록문의</a></li>
			<li><a href="#">일반문의</a></li>
</ul></li>
		<%
			}
		%>

	</ul>
</div>
</div>

<DIV id="wrapper">
	

	<HR>

	<DIV id="container">
		<!--비쥬얼영역-->

		<DIV class="visual">
			<img id="imgmain" src="images/main.jpg" />
		</DIV>
		<!--//visual-->
		<!--컨텐츠 영역-->

		<DIV class="content02">
			<!--쿠폰제는 왜?-->
			<H3 class="title">
				<STRONG class="line01">쿠폰제 솔루션 “<SPAN>요깄넹</SPAN>”의 <SPAN>7</SPAN>가지
					특장점
				</STRONG>
			</H3>
			<DIV class="cont01">
				<UL>
					<LI>
						<DIV class="numberBackground">
							<P>1</P>
						</DIV>
						<DIV class="listTitle">여기저기 쿠폰 드롭</DIV>
						<DIV class="listWord">요깄넹을 이용하는 고객은 아무런 액션없이 시스템에서 쿠폰보기 가능</DIV>
					</LI>
					<LI>
						<DIV class="numberBackground">
							<P>2</P>
						</DIV>
						<DIV class="listTitle">여기저기 쿠폰 드롭</DIV>
						<DIV class="listWord">요깄넹을 이용하는 고객은 아무런 액션없이 시스템에서 쿠폰보기 가능</DIV>
					</LI>
					<LI>
						<DIV class="numberBackground">
							<P>3</P>
						</DIV>
						<DIV class="listTitle">여기저기 쿠폰 드롭</DIV>
						<DIV class="listWord">요깄넹을 이용하는 고객은 아무런 액션없이 시스템에서 쿠폰보기 가능</DIV>
					</LI>
					<LI>
						<DIV class="numberBackground">
							<P>4</P>
						</DIV>
						<DIV class="listTitle">여기저기 쿠폰 드롭</DIV>
						<DIV class="listWord">요깄넹을 이용하는 고객은 아무런 액션없이 시스템에서 쿠폰보기 가능</DIV>
					</LI>
					<LI>
						<DIV class="numberBackground">
							<P>5</P>
						</DIV>
						<DIV class="listTitle">여기저기 쿠폰 드롭</DIV>
						<DIV class="listWord">요깄넹을 이용하는 고객은 아무런 액션없이 시스템에서 쿠폰보기 가능</DIV>
					</LI>
					<LI>
						<DIV class="numberBackground">
							<P>6</P>
						</DIV>
						<DIV class="listTitle">여기저기 쿠폰 드롭</DIV>
						<DIV class="listWord">요깄넹을 이용하는 고객은 아무런 액션없이 시스템에서 쿠폰보기 가능</DIV>
					</LI>

				</UL>
			</DIV>
			<!--//cont01-->
		</DIV>
		<!--//content02-->
		<!--4대 서비스-->
		<DIV class="content03_sub">
			<H3 class="title">
				<STRONG class="line01">쿠폰제 솔루션 “<SPAN>요깄넹</SPAN>” 4대 서비스
				</STRONG>
			</H3>
			<DIV class="cont02">
				<UL>
					<LI>
						<DIV class="foulImage1"
							onclick="layer_open('layer2' , '1' );return false;">차량관제
							이미지</DIV>
						<DIV class="foulTitle">요깄넹</DIV>
						<DIV class="layer">
							<DIV class="bg"></DIV>
							<DIV class="pop-layer" id="layer2">
								<DIV class="pop-container">
									<DIV class="pop-conts">
										<!--content 
											<p class="ctxt mb20">Thank you.<br>
												Your registration was submitted successfully.<br>
												Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
												Hope to see you soon!
											</p>

											//-->

										<DIV class="btn-r">
											<A class="cbtn"
												href="http://messenger.triphos.co.kr/html/main.html#">Close</A>
										</DIV>
										<!--// content-->
									</DIV>
								</DIV>
							</DIV>
						</DIV>
					</LI>
					<LI>
						<DIV class="foulImage2"
							onclick="layer_open('layer2' , '2' );return false;">차량관제
							이미지</DIV>
						<DIV class="foulTitle">요깄넹</DIV>
					</LI>
					<LI>
						<DIV class="foulImage3"
							onclick="layer_open('layer2' , '3' );return false;">차량관제
							이미지</DIV>
						<DIV class="foulTitle">요깄넹</DIV>
					</LI>
					<LI>
						<DIV class="foulImage4"
							onclick="layer_open('layer2' , '4' );return false;">차량관제
							이미지</DIV>
						<DIV class="foulTitle">요깄넹</DIV>
					</LI>
				</UL>
			</DIV>
		</DIV>
		<!--4대 서비스 종료-->
		
		<DIV class="content03">
			<DIV class="cont01">
				<!--티지오넷 선택-->
				<H3 class="title txt_gray">
					<STRONG class="line02">요깄넹 <SPAN>기대효과</SPAN>는 이래요
					</STRONG>
				</H3>
				<P class="featute_note">쿠폰기능까지!</P>
				<OL>
					<LI><SPAN class="num">1</SPAN>첫번째 장점</LI>
					
				</OL>
			</DIV>
			<!--//cont01-->
		</DIV>
		<!--//content03-->
	</DIV>
	<!--//container-->

	<HR>

</DIV>
<!--//wrapper-->
<!--메일폼-->
<DIV class="mail_wrap" id="mail_pop" style="display: none;">
	<DIV class="mail_form" id="mail_pop1">
		<FORM id="sendMailForm" onsubmit="return false;" action="#"
			method="post">
			<FIELDSET>
				<LEGEND>메일로 문의하기</LEGEND>
				<DIV class="mail_tit">문의하기</DIV>
				<!--//mail_tit-->
				<DIV class="mail_cont">
					<DL class="fix">
						<DT>
							<LABEL for="mail_cate">문의유형</LABEL>
						</DT>
						<DD>
							<SELECT id="mail_cate"><OPTION>티지오넷(차량관제솔루션)</OPTION>
								<OPTION>기타문의</OPTION></SELECT>
						</DD>
					</DL>
					<DL class="fix">
						<DT>
							<LABEL for="qna_title">이름</LABEL>
						</DT>
						<DD>
							<INPUT name="username" class="text w01" id="qna_title"
								type="text">
							<!--작성완료시 ↓추가-->
							<!--<span class="chk on"></span>-->
						</DD>
					</DL>
					<DL class="fix">
						<DT>
							<LABEL for="qna_email">이메일</LABEL>
						</DT>
						<DD>
							<INPUT class="text w01" id="qna_email" type="text"> @ <INPUT
								class="text w04" id="qna_email02" type="text">
						</DD>
					</DL>
					<DL class="fix">
						<DT>
							<LABEL for="qna_phone">휴대폰</LABEL>
						</DT>
						<DD>
							<INPUT class="text w03" id="qna_phone" type="text"> - <INPUT
								class="text w02" id="qna_phone02" type="text"> - <INPUT
								class="text w02" id="qna_phone03" type="text">
						</DD>
					</DL>
					<DL class="fix">
						<DT class="cont_dt">
							<LABEL for="qna_text">내용</LABEL>
						</DT>
						<DD>
							<TEXTAREA name="qna_text" id="qna_text"></TEXTAREA>
						</DD>
					</DL>
					<P class="mail_btn">
						<SPAN><BUTTON class="send_btn"
								onclick="Main_mail.checkMail();" href="#">메일보내기</BUTTON></SPAN> <SPAN><BUTTON
								class="close_btn" onclick="Main_mail.closePop();" href="#">닫기</BUTTON></SPAN>
					</P>
				</DIV>
				<!--//mail_cont-->
				<!--버튼_닫기-->

				<DIV class="btn_close" onclick="Main_mail.closePop();">
					<!-- <a href="javascript:void(0)"></a> -->
				</DIV>
			</FIELDSET>
		</FORM>
	</DIV>
	<!--//mail_form-->
	<!--뒷배경 검은 마스크-->
	<!--☆메뉴보이기        ↓display:block-->
	<DIV class="mask" id="mask_mail" style="display: block;"></DIV>
	<!--//mask-->
</DIV>
<!--//mail_wrap-->
<DIV style="display: none;">
	<SCRIPT>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
			'//www.google-analytics.com/analytics.js', 'ga');
	
		ga('create', 'UA-74438158-1', 'auto');
		ga('send', 'pageview');
	</SCRIPT>
</DIV>
<!--카운터-->
<SCRIPT type="text/javascript">
	if (/Mobile | iPhone | Android | BlackBerry | IEMobile/i
			.test(navigator.userAgent)) {
		document.getElementById('phone').innerHTML = "<a href = 'tel:1670-4311'>1670-4311</a>";
	}
</SCRIPT>

<SCRIPT type="text/javascript">
	function layer_open(lay_name, num) {
		var temp = $('#' + lay_name);

		if (num == '1') {
			$(".pop-conts").css("background-image",
				"url(/images/img_popup_1.jpg)");
			$(".pop-conts").height("700px");
			$(".pop-conts").width("1024px");
		}
		if (num == '2') {
			$(".pop-conts").css("background-image",
				"url(/images/img_popup_2.jpg)");
			$(".pop-conts").height("700px");
			$(".pop-conts").width("1024px");
		}

		if (num == '3') {
			$(".pop-conts").css("background-image",
				"url(/images/img_popup_3.jpg)");
			$(".pop-conts").height("700px");
			$(".pop-conts").width("1024px");
		}

		if (num == '4') {
			$(".pop-conts").css("background-image",
				"url(/images/img_popup_4.jpg)");
			$(".pop-conts").height("700px");
			$(".pop-conts").width("1024px");
		}

		//$(".pop-conts").css("background-image" ,  $(obj).css("background-image" )   )  ;

		//$(".pop-conts").height("300");
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		if (bg) {
			$('.layer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		} else {
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height())
			temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
		else
			temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width())
			temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
		else
			temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e) {
			if (bg) {
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			} else {
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}
</SCRIPT>
