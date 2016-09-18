<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<LINK href="../css/master.css" rel="stylesheet" type="text/css">
<LINK href="../css/contents.css" rel="stylesheet" type="text/css">
<LINK href="../css/common.css" rel="stylesheet" type="text/css">
<SCRIPT src="../js/jquery-3.1.0.js"></SCRIPT>

<SCRIPT src="전령_files/main.js" type="text/javascript"></SCRIPT>


</HEAD>
<BODY>
	<DIV id="wrapper">
		<!--운행일지 블로그 링크 이동 버튼-->
		<DIV class="btn_blog">
			<BUTTON></BUTTON>
		</DIV>
		<!--★동영상 추가-->
		<DIV class="video_wrap">
			<DIV class="btn_video" id="btn_video">
				<BUTTON onclick="Main.showVideo();">
					<SPAN class="blind">소개 동영상 보기</SPAN>
				</BUTTON>
			</DIV>
			<!--//btn_video-->
			<!--☆동영상 보여주기               ↓block-->

			<DIV class="video" id="use_video" style="display: none;">
				<DIV class="v_iframe">
					<H3>전령 소개 영상</H3>
					<P class="v_close">
						<BUTTON id="close_video" onclick="Main.closeVideo();">
							<SPAN class="blind">팝업 닫기</SPAN>
						</BUTTON>
					</P>
					<IFRAME width="640" height="390" id="tgeonet_video"
						src="전령_files/HLJbA47NonQ.htm" frameborder="0" allowfullscreen=""></IFRAME>
				</DIV>
				<DIV class="mask"></DIV>
			</DIV>
			<!--//video-->
		</DIV>
		<!--//video_wrap-->
		
		<HR>

		<DIV id="container">
			<!--비쥬얼영역-->
			<DIV class="visual"></DIV>
			<!--//visual-->
			<!--컨텐츠 영역-->

			<DIV class="content02">
				<!--차량관제는 왜?-->
				<H3 class="title">
					<STRONG class="line01">차량관제 솔루션 “<SPAN>전령</SPAN>”의 <SPAN>7</SPAN>가지
						특장점
					</STRONG>
				</H3>
				<DIV class="cont01">
					<UL>
						<LI>
							<DIV class="numberBackground">
								<P>1</P>
							</DIV>
							<DIV class="listTitle">교통안전공단 운행자료 자동제출</DIV>
							<DIV class="listWord">전령을 이용하는 고객은 아무런 액션없이 시스템에서 자동제출 가능</DIV>
						</LI>
						<LI>
							<DIV class="numberBackground">
								<P>2</P>
							</DIV>
							<DIV class="listTitle">녹색물류에너지 기반 에코드라이브 유도</DIV>
							<DIV class="listWord">차량관제를 통한 급가속, 급감속, 유류정보 등을 분석하여 매일
								사용자에게 제공</DIV>
						</LI>
						<LI>
							<DIV class="numberBackground">
								<P>3</P>
							</DIV>
							<DIV class="listTitle">도로교통현황 표시</DIV>
							<DIV class="listWord">지도상의 차량의 교통정보를 실시간으로 제공</DIV>
						</LI>
						<LI>
							<DIV class="numberBackground">
								<P>4</P>
							</DIV>
							<DIV class="listTitle">CCTV 교통현황표시 및 교통사고 현황표시</DIV>
							<DIV class="listWord">국내 각 지역권별 CCTV 및 교통사고 현황정보를 실시간으로 제공</DIV>
						</LI>
						<LI>
							<DIV class="numberBackground">
								<P>5</P>
							</DIV>
							<DIV class="listTitle">주변 주유정보 표시 [APP]</DIV>
							<DIV class="listWord">최신 유류비를 차량위치에 맞게 저렴한 주유소로 정보 표시 – 경유,
								휘발유, LPG</DIV>
						</LI>
						<LI>
							<DIV class="numberBackground">
								<P>6</P>
							</DIV>
							<DIV class="listTitle">멀티언어 지원</DIV>
							<DIV class="listWord">다국어 지원 가능</DIV>
						</LI>
						<LI>
							<DIV class="numberBackground">
								<P>7</P>
							</DIV>
							<DIV class="listTitle">고객사에 맞는 커스터마이징 [기간계 연동가능]</DIV>
							<DIV class="listWord">다양한 래퍼런스 보유</DIV>
						</LI>
					</UL>
				</DIV>
				<!--//cont01-->
			</DIV>
			<!--//content02-->
			<!--4대 서비스-->
			<DIV class="content03_sub">
				<H3 class="title">
					<STRONG class="line01">차량관제 솔루션 “<SPAN>전령</SPAN>” 4대 서비스
					</STRONG>
				</H3>
				<DIV class="cont02">
					<UL>
						<LI>
							<DIV class="foulImage1"
								onclick="layer_open('layer2' , '1' );return false;">차량관제
								이미지</DIV>
							<DIV class="foulTitle">차량관제 [법인차량관제 포함]</DIV>
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
							<DIV class="foulTitle">TMS [배차관리시스템]</DIV>
						</LI>
						<LI>
							<DIV class="foulImage3"
								onclick="layer_open('layer2' , '3' );return false;">차량관제
								이미지</DIV>
							<DIV class="foulTitle">차량관리 [차계부 등]</DIV>
						</LI>
						<LI>
							<DIV class="foulImage4"
								onclick="layer_open('layer2' , '4' );return false;">차량관제
								이미지</DIV>
							<DIV class="foulTitle">녹색물류에너지</DIV>
						</LI>
					</UL>
				</DIV>
			</DIV>
			<!--4대 서비스 종료-->
			<!--컨텐츠 영역-->
			<DIV class="content">
				<!--기대효과-->
				<H3 class="title">
					<STRONG class="line01">전령 <SPAN>기대효과</SPAN></STRONG>
				</H3>
				<P class="featute_note">실시간 관제ㆍ체계적인 관리를 원한다면?</P>
				<UL class="sevice01 fix">
					<LI>
						<H4 class="s01">
							<SPAN>안전운전 문화 정착</SPAN>
						</H4>
						<P class="line03">
							<SPAN class="br">급가속/급제동/과속/장시간</SPAN> <SPAN class="br">운전
								등 차량관제를 통한</SPAN> <SPAN class="br">안전사고 예방</SPAN><SPAN class="br2"></SPAN><SPAN
								class="br">경제운전 습관 정착</SPAN><SPAN class="br2"></SPAN><SPAN
								class="br">정부 당국 벌점/과태료 방지</SPAN>
						</P>
					</LI>
					<LI>
						<H4 class="s02">
							<SPAN>운영비용 절감</SPAN>
						</H4>
						<P class="line03">
							<SPAN class="br">연비 개선을 통한 유류비 절감</SPAN> <SPAN class="br a_left">-
								디지털운행기록계(약12~15%)</SPAN> <SPAN class="br a_left">- 공회전제한장치(약8%)</SPAN><SPAN
								class="br2"></SPAN><SPAN class="br">사고 감소로 보험요율 인하</SPAN> <SPAN
								class="br a_left">- 사고 처리비용 절감</SPAN><SPAN class="br2"></SPAN><SPAN
								class="br">안전운행으로 소모품비 감소</SPAN> <SPAN class="br a_left">-
								배터리/타이어</SPAN> <SPAN class="br a_left">- 기타 소모품비</SPAN>
						</P>
					</LI>
					<LI>
						<H4 class="s03">
							<SPAN>차량 가동율 향상 등</SPAN>
						</H4>
						<P class="line03">
							<SPAN class="br">차량의 운행현황 파악 및</SPAN> <SPAN class="br">운행계획
								수립을 통한</SPAN> <SPAN class="br">차량 가동율 향상</SPAN><SPAN class="br2"></SPAN><SPAN
								class="br">차량의 상태 진단 및 능동적</SPAN> <SPAN class="br">대처로 차량
								성능 관리</SPAN><SPAN class="br2"></SPAN><SPAN class="br">사고 발생시 정확한
								사고 원인</SPAN> <SPAN class="br">파악이 가능한 객관적 자료 제공</SPAN>
						</P>
					</LI>
				</UL>
			</DIV>
			<!--//content-->
			<DIV class="content03">
				<DIV class="cont01">
					<!--티지오넷 선택-->
					<H3 class="title txt_gray">
						<STRONG class="line02">전령 <SPAN>선택</SPAN>하는 이유?
						</STRONG>
					</H3>
					<P class="featute_note">유류비와 차량 부속품 비용 절감과 간편한 운행 기록 전송 기능까지!</P>
					<OL>
						<LI><SPAN class="num">1</SPAN> S식품, K택배, L물류기업, Y물류기업 등의 다양한
							업종에 <EM>차량관제 서비스 제공</EM> 및 운영 경험 보유</LI>
						<LI><SPAN class="num">2</SPAN> 차량관제 차량당 부가되는 비용을 통해 <EM>저비용으로
								전령</EM> 서비스 이용</LI>
						<LI><SPAN class="num">3</SPAN> 관제 차량의 <EM>온도관제 실시간 확인</EM>서비스
							제공</LI>
						<LI><SPAN class="num">4</SPAN> <EM>웹사이트, 모바일(APP/WEB)</EM>을
							통한 다양한 환경에서의 서비스 제공</LI>
						<LI><SPAN class="num">5</SPAN> 추가 장비 없이 <EM>스마트폰을 활용한
								차량관제</EM>서비스 제공</LI>
						<LI><SPAN class="num">6</SPAN> <EM>전문 상담원과 콜센터</EM>를 통한 실시간
							고객 응대</LI>
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
</BODY>
</HTML>
