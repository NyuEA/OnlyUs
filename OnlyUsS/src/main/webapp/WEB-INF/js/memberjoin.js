window.JoinMember = function(type){
	this.init(type);
}
JoinMember.prototype = {
		
	isIdConfirm : false,
	rUrl : "",
	msg_id_invaid : "아이디는 5~15자 이내의 영/숫자 조합으로만 사용 가능합니다.",
	msg_id_use : "이미 사용중인 아이디입니다.",
	msg_id_empty : "아이디를 입력해주세요.",
	msg_id_ok : "사용 가능한 아이디입니다.",
	msg_id_check : "아이디 중복확인을 해주세요.",
	
	msg_agreement : "이용약관에 동의해주세요.",
	msg_location : "위치정보 이용약관에 동의해주세요.",
	msg_privacy : "쿠차 개인정보 수집 및 이용에 동의해주세요.",
	msg_privacy_rule : "개인정보 취급 위탁 동의를 하지 않으면, 이벤트 혜택 증정 등에 불이익이 있을 수 있습니다. 동의 없이 진행하시겠습니까?",
	
	msg_pass_empty : "비밀번호를 입력해주세요.",
	msg_pass_invalid : "비밀번호 는 8~15자 이내의 영문 대소문자, 숫자 및 특수문자 2가지 이상 조합이어야 합니다.",
	msg_pass_unmatch : "입력하신 비밀번호가 일치하지 않습니다.",
	msg_pass_invalid_birthday : "비밀번호는 고객님의 생년월일 숫자를4자 이상 사용할 수 없습니다.",
	msg_pass_invalid_3charactor : "비밀번호는 동일한 문자/숫자를 3자 이상연속으로 사용할 수 없습니다",
	msg_mail_empty : "이메일 주소를 입력해주세요.",
	msg_mail_invalid : "잘못된 이메일 주소입니다.",
	msg_mail_use : "이미 사용중인 이메일 주소입니다.",
	msg_birth_empty : "생년월일을 입력해주세요.",
	
	msg_tel_empty : "휴대폰 번호를 입력해주세요.",
	msg_tel_use : "이미 사용중인 휴대폰번호 입니다.",
	
	msg_join_confirm : "회원가입을 진행하시겠습니까?",
	msg_join_ok : "회원가입이 완료되었습니다.",
	
	msg_error : "잘못된 정보입니다.",
	msg_14 : "만 14세 미만은 가입하실 수 없습니다.",
	
	init : function(type){
		var _this = this;
		
		//중복 확인 클릭 이벤트
		$("div.section-join a.btn-check").on("click",function(e){
			e.preventDefault();
			_this.checkIdUse();
		});
		
		//약관 내용보기
		$("#listsTerms .btn").each(function(){
			$(this).on("click",function(){
				var $target = $($(this).attr("href"));
				var top = $target.offset().top;
				$("html,body").animate({
					scrollTop :top + "px"
				},800);
				return false;
			});
		});
		
		// 이메일 SMS 통합 수신 동의
		$("#mailSmsYn").on('change', function(){
			if($(this).prop("checked")){
				$("#mailYn").attr("checked", true);
				$("#smsYn").attr("checked", true);
			} else {
				$("#mailYn").attr("checked", false);
				$("#smsYn").attr("checked", false);
			}
		});
		
		//약관 체크박스
		$("input#termArgees").on("change",function(){
			if($(this).prop("checked")){
				$("#listsTerms .checkbox:not(.checked)").addClass("checked");
				$("#listsTerms input[type=checkbox]").attr("checked",true);
			}else{
				$("#listsTerms .checkbox.checked").removeClass("checked");
				$("#listsTerms input[type=checkbox]").attr("checked",false);
			}
		});
		$("#listsTerms input[type=checkbox]").each(function(){
			$(this).on("change",function(){
				if(!$(this).prop("checked")){
					$("input#termArgees").attr("checked",false);
					$("input#termArgees").parent(".checkbox").removeClass("checked");
				}
				if($("#listsTerms input[type=checkbox]:checked").size()==3){
					$("input#termArgees").attr("checked",true);
					$("input#termArgees").parent(".checkbox").addClass("checked");
				}
			});
		});
		
		//회원가입 클릭 이벤트
		$("div.group-btn > button.btn-confirm").on("click",function(e){
			e.preventDefault();
			if(type == 'sns') {
				_this.checkJoinBySNSForm();
			} else {
				_this.checkJoinForm();
			}
		});
		
		$("#mid").on("change",function(){
			_this.isIdConfirm = false;
		});
	},
	
	isAlphaNumetic : function(str){
/*		if( /[^a-zA-Z0-9]/.test( str ) ) {
	       return false;
	    }
	    return true;  */
		var ID = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{5,15}$/;
		return(ID.test(str));
	},
	
	isCellPhoneFormat : function(str){
		if(str.length == 7) {
			return /(01[016789])(\d{3})(\d{4})/.test(str);	
		}
		return /(01[016789])(\d{4})(\d{4})/.test(str);
	},
	
	checkIdUse : function(){
		var _this = this;
		var inputId = $("#mid").val();
		if(inputId === ""){
			_this.isIdConfirm = false;
			$("#mid").parent().next().text(_this.msg_id_empty).show().focus();
			$("#mid").focus();
		}
		else if(inputId.length < 5 || inputId.length > 15 || !_this.isAlphaNumetic(inputId))
		{
			_this.isIdConfirm = false;
			$("#mid").parent().next().text(_this.msg_id_invaid).show().focus();
			$("#mid").focus();
		}
		else
		{
			$("#mid").parent().next().hide();
			
			$.ajax({
				url : './idChk.do',
				type : "POST",
				data : {"mid" : inputId},
				dataType : "html",
				error : function() {
					_this.isIdConfirm = false;
					alert(_this.msg_error);
				},
				success : function(strData) {
					var seqs = strData.split(",");
					var idChk = seqs[1];
					var chk = seqs[2];
					if (idChk == 0) {
						_this.isIdConfirm = true;
						$("#mid").parent().next().text(_this.msg_id_ok).show().focus();
						//setTimeout(function(){ $("#mid").parent().next().hide(); }, 2000);
					} else {
						_this.isIdConfirm = false;
						$("#mid").focus().parent().next().text(_this.msg_id_use).show().focus();
					}
				}
			}); 
		}
	},
	/* SNS 회원 여부 체크 */
	checkSNSIdUse : function(object){
		var joinClass = object.joinClass;
		var snsid = object.snsid;
		
		$.ajax({
			url : './idChk.do',
			type : "POST",
			data : {"joinClass" : joinClass, "snsid" : snsid},
			dataType : "html",
			error : function() {
				_this.isIdConfirm = false;
				alert(_this.msg_error);
			},
			success : function(strData) {
				var seqs = strData.split(",");
				var idChk = seqs[1];
				var chk = seqs[2];
				if (idChk == 0) {
					// TODO: 여기 popup으로 변경
					_this.isIdConfirm = true;
					$("#mid").parent().next().text(_this.msg_id_ok).show().focus();
					//setTimeout(function(){ $("#mid").parent().next().hide(); }, 2000);
				} else {
					_this.isIdConfirm = false;
					$("#mid").focus().parent().next().text(_this.msg_id_use).show().focus();
				}
			}
		}); 
	},
	
	checkJoinForm : function(){
		var _this = this;
		$joinForm = $("<form />");
		var coochaYn = $("#joinClass").length == 0;

		//회원가입 선택시 경고 메세지를 기존 그대로 다시 보여줌
		$("#msg14").attr("class","text-info").text(_this.msg_14).show();

		/* 쿠차회원 가입시에만 사용됨 */
		if(coochaYn) {
			// 쿠차 joinClass 추가
			$("<input />").attr("name","joinClass").attr("value",'CC').appendTo($joinForm);
			
			//아이디 유효성 체크
			var inId = $("#mid").val();
			if(inId == ""){
				$("#mid").focus().parent().next().text(_this.msg_id_empty).show();
				return;
			}
			else{
				$("#mid").parent().next().hide();
			}
			
			//아이디 중복확인 체크
			if(!_this.isIdConfirm){
				$("#mid").focus().parent().next().text(_this.msg_id_check).show();
				return;
			}
			else{
				$("#mid").parent().next().hide();
				$("<input />").attr("name","mid").attr("value",$("#mid").val()).appendTo($joinForm);
			}
			
			//비밀번호 유효성체크
			var inPass = $("#mpwd").val();
//			var passCheck = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9]){8,15}&/;
			if(inPass == ""){
				$("#mpwd").focus().parent().next().text(_this.msg_pass_empty).show();
				return;
			}
			else if(inPass != "" && inPass.length >=8){
				var isValid = true;
				$.ajax({
					url : _PATH + '/member/checkPasswordPattern.do',
					type : "post",
					async : false,
					data : {"newPassword" : inPass},
					dataType : "html",
					error : function() {
						// alert(_this.msg_error);
					},
					success : function(strData) {
						if(strData.trim() != "valid"){
							$("#msg1").attr("class","text-alert").text(_this.msg_pass_invalid).show();
							$("#mpwd").focus();
							isValid = false;
							return;
						}
					}
				});
				
				$.ajax({
					url : _PATH + '/member/getCheckMemberDuplicate3Charactor.do',
					type : "post",
					async : false,
					data : {"newPassword" : inPass},
					dataType : "html",
					error : function() {
						// alert(_this.msg_error);
					},
					success : function(strData) {
						if(strData.trim() != "valid"){
							$("#msg1").attr("class","text-alert").text(_this.msg_pass_invalid_3charactor).show();
							$("#mpwd").focus();
							isValid = false;
							return;
						} 
					}
				});
				
				if(isValid == false) {
					return;
				}else {
					$("<input />").attr("name","mpwd").attr("value",$("#mpwd").val()).appendTo($joinForm);
				}
			}else {
				$("#msg1").attr("class","text-alert").text(_this.msg_pass_invalid).show();
				$("#mpwd").focus();
				return;
			}
			
			//비밀번호 재확인 체크
			var passConfirm = $("#mpwd2").val();
			if(inPass != passConfirm){
				$("#mpwd2").focus().parent().next().text(_this.msg_pass_unmatch).show();
				return;
			}
			else{
				$("#mpwd2").parent().next().hide();
			}
			
			
			//이메일 유효성 체크
			var email1 = $("#email1").val();
			var email2 = $("#emailDomain").val();
			var email = email1+"@"+email2;
			var regex=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var isEmailValid = true;
			if(!regex.test(email)){
				$("#msgEmail").text(_this.msg_mail_invalid).show();
				// $("#email1").focus();
				$("#msgEmail").show();
				isEmailValid = false;
				return;
			}
			// else{
			// 	$("#msgEmail").hide();
			// }
			else if(email1 === "" || email2 === ""){
				$("#msgEmail").text(_this.msg_mail_empty).show();
				// $("#email1").focus();
				$("#msgEmail").show();
				isEmailValid = false;
				return;
			}
			// else{
			// 	$("#msgEmail").hide();
			// }
			else {
				// $("<input />").attr("name","mail").attr("value",email).appendTo($joinForm);
				$("#msgEmail").hide();
				addInputTag("mail", email, $joinForm);
				isEmailValid = true;
				//이메일 사용여부 체크
				if (_this.checkEmailUse($joinForm.serialize())) {
					isEmailValid = false;
					return;
				}
			}
			
			if(!isEmailValid){
				return;
			}
			//전화 번호 유효성 체크
			var tel1 = $("#tel1").val();
			var tel2 = $("#tel2").val();
			if(tel2.length == 8){
				tel2 = tel2.substring(0,4) + tel2.substring(4,8);
			}
			if(tel2.length == 7){
				tel2 = tel2.substring(0,3) + tel2.substring(4,8);
			}
			var inputTel = tel1+tel2;
			if(!_this.isCellPhoneFormat(inputTel)){
				$("#msgTel").text(_this.msg_tel_empty).show();
				$("#tel1").focus();
				return;
			}
			else{
				$("#msgTel").hide();
				$("<input />").attr("name","mhp").attr("value",inputTel).appendTo($joinForm);
			}
			//전화번호 사용여부 확인
			if(_this.checkPhoneUse($joinForm.serialize())){
				return;
			}
		}
		var date = new Date();
		var userBirthYear = $("#userBirthYear").val();
		var userBirthMonth =$("#userBirthMonth").val();
		var userBirthDay = $("#userBirthDay").val();
		var userBirth = userBirthYear + userBirthMonth + userBirthDay;
		var twoDigitMonth = ((date.getMonth().length+1) == 1)? (date.getMonth()+1) : '0' + (date.getMonth()+1);
		var today = date.getFullYear().toString()+twoDigitMonth.toString()+((date.getDate().toString().length > 1) ? date.getDate().toString() : '0' + date.getDate());

		var result = parseInt(today) - parseInt(userBirth) - 140000;


		if(userBirthYear=="년도"|| userBirthMonth=="월" || userBirthDay =="일"){
			$("#msg14").attr("class","text-alert").text(_this.msg_birth_empty).show();
			return;
		}

		var pwdBirthChk = true;
		for(i = 0; i <= userBirth.length - 4; i++) {
			var compStr = userBirth.substring(i, i+4);
			if(inPass.indexOf(compStr) > -1) {
				$("#msg1").attr("class","text-alert").text(_this.msg_pass_invalid_birthday).show();
				pwdBirthChk = false;
				return;
			}
		}
		if(!pwdBirthChk) {
			return;
		}
		
		//14세 미만 체크
		if(result < 0){
			$("#msg14").attr("class","text-alert").text(_this.msg_14).show();
			return;
		}
		else{
			// $("#msg14").hide();

			$("<input />").attr("name","birthDay").attr("value",userBirth).appendTo($joinForm);
		}

		//서비스 이용약관
		if( !$("#agreement").parent().hasClass("checked") ){
			alert(_this.msg_agreement);
			return;
		}
		//위치정보 이용약관
		if( !$("#location").parent().hasClass("checked") ){
			alert(_this.msg_location);
			return;
		}
		//개인정보 이용약관
		if( !$("#privacy").parent().hasClass("checked") ){
			alert(_this.msg_privacy);
			return;
		}
		
		//이메일 수신 동의
		if( $("#mailYn").prop("checked") ){
			$("<input />").attr("name","mailYn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","mailYn").attr("value","0").appendTo($joinForm);
		}
		
		//문자 수신 동의
		if( $("#smsYn").prop("checked") ){
			$("<input />").attr("name","smsYn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","smsYn").attr("value","0").appendTo($joinForm);
		}
		
		if (confirm(_this.msg_join_confirm)) {
			_this.submitJoinForm($joinForm.serialize());
		}
		
	},
	/* SNS 회원가입 validation 체크 */
	checkJoinBySNSForm : function(){
		var _this = this;
		$joinForm = $("<form />");
		
		//회원가입 선택시 경고 메세지를 기존 그대로 다시 보여줌
		$("#msg14").attr("class","text-info").text(_this.msg_14).show();
		
		//아이디 유효성 체크
		/*var inId = $("#mid").val();
		if(inId == ""){
			$("#mid").focus().parent().next().text(_this.msg_id_empty).show();
			return;
		}
		else{
			$("#mid").parent().next().hide();
		}*/
		
		//아이디 중복확인 체크
		/*if(!_this.isIdConfirm){
			$("#mid").focus().parent().next().text(_this.msg_id_check).show();
			return;
		}
		else{
			$("#mid").parent().next().hide();
			$("<input />").attr("name","mid").attr("value",$("#mid").val()).appendTo($joinForm);
		}*/
		
		//비밀번호 유효성체크
		/*var inPass = $("#mpwd").val();
		var passCheck = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{5,15}$/;
		if(inPass == ""){
			$("#mpwd").focus().parent().next().text(_this.msg_pass_empty).show();
			return;
		}
		else if(passCheck.test(inPass) === false || inPass.length < 5 ){
			
			$("#mpwd").focus().parent().next().text(_this.msg_pass_invalid).show();
			return;
		}
		else{
			$("#mpwd").parent().next().hide();
			$("<input />").attr("name","mpwd").attr("value",$("#mpwd").val()).appendTo($joinForm);
		}*/
		
		//비밀번호 재확인 체크
		/*var passConfirm = $("#mpwd2").val();
		if(inPass != passConfirm){
			$("#mpwd2").focus().parent().next().text(_this.msg_pass_unmatch).show();
			return;
		}
		else{
			$("#mpwd2").parent().next().hide();
		}
		*/
		
		//이메일 유효성 체크
		/*var email1 = $("#email1").val();
		var email2 = $("#emailDomain").val();
		var email = email1+"@"+email2;
		var regex=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(!regex.test(email)){
			$("#msgEmail").text(_this.msg_mail_invalid).show();
			// $("#email1").focus();
			$("#msgEmail").show();
			return;
		}
		// else{
		// 	$("#msgEmail").hide();
		// }
		else if(email1 === "" || email2 === ""){
			$("#msgEmail").text(_this.msg_mail_empty).show();
			// $("#email1").focus();
			$("#msgEmail").show();
			return;
		}
		// else{
		// 	$("#msgEmail").hide();
		// }
		else {
			
			// $("<input />").attr("name","mail").attr("value",email).appendTo($joinForm);
			$("#msgEmail").hide();
			addInputTag("mail", email, $joinForm);
			//이메일 사용여부 체크
			if (_this.checkEmailUse($joinForm.serialize())) {
				return;
			}
			
		}*/
		
		//전화 번호 유효성 체크
		/*var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		if(tel2.length == 8){
			tel2 = tel2.substring(0,4) + "-" + tel2.substring(4,8);
		}
		if(tel2.length == 7){
			tel2 = tel2.substring(0,3) + "-" + tel2.substring(4,8);
		}
		var inputTel = tel1+"-"+tel2;
		if(!_this.isCellPhoneFormat(inputTel)){
			$("#msgTel").text(_this.msg_tel_empty).show();
			$("#tel1").focus();
			return;
		}
		else{
			$("#msgTel").hide();
			$("<input />").attr("name","mhp").attr("value",inputTel).appendTo($joinForm);
		}
		//전화번호 사용여부 확인
		if(_this.checkPhoneUse($joinForm.serialize())){
			return;
		}*/
		
		var date = new Date();
		var userBirthYear = $("#userBirthYear").val();
		var userBirthMonth =$("#userBirthMonth").val();
		var userBirthDay = $("#userBirthDay").val();
		var userBirth = userBirthYear + userBirthMonth + userBirthDay;
		var twoDigitMonth = ((date.getMonth().length+1) === 1)? (date.getMonth()+1) : '0' + (date.getMonth()+1);
		var today = date.getFullYear().toString()+twoDigitMonth.toString()+((date.getDate().length === 1) ? date.getDate().toString() : '0' + date.getDate());
		
		var result = parseInt(today) - parseInt(userBirth) - 140000;
		
		
		if(userBirthYear=="년도"|| userBirthMonth=="월" || userBirthDay =="일"){
			$("#msg14").attr("class","text-alert").text(_this.msg_birth_empty).show();
			return;
		}
		
		//14세 미만 체크
		if(result < 0){
			$("#msg14").attr("class","text-alert").text(_this.msg_14).show();
			return;
		}
		else{
			// $("#msg14").hide();
			
			$("<input />").attr("name","birthDay").attr("value",userBirth).appendTo($joinForm);
		}
		
		//서비스 이용약관
		if( !$("#agreement").parent().hasClass("checked") ){
			alert(_this.msg_agreement);
			return;
		}
		//위치정보 이용약관
		if( !$("#location").parent().hasClass("checked") ){
			alert(_this.msg_location);
			return;
		}
		//개인정보 이용약관
		if( !$("#privacy").parent().hasClass("checked") ){
			alert(_this.msg_privacy);
			return;
		}
		
		//이메일 수신 동의
		if( $("#mailYn").prop("checked") ){
			$("<input />").attr("name","mailYn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","mailYn").attr("value","0").appendTo($joinForm);
		}
		
		//문자 수신 동의
		if( $("#smsYn").prop("checked") ){
			$("<input />").attr("name","smsYn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","smsYn").attr("value","0").appendTo($joinForm);
		}
		
		// 개인 정보 취급 위탁 동의
		if( $("#privacy_rule").parent().hasClass("checked") ){
			$("<input />").attr("name","consignyn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","consignyn").attr("value","0").appendTo($joinForm);
		}
		
		$("<input />").attr("name","joinClass").attr("value",$("#joinClass").val()).appendTo($joinForm);
		$("<input />").attr("name","snsid").attr("value",$("#snsid").val()).appendTo($joinForm);
		$("<input />").attr("name","mail").attr("value",$("#email").val()).appendTo($joinForm);
		
		// 개인정보 이용약관(선택)
		/*if( !$("#privacy_rule").parent().hasClass("checked") ){
			if(!confirm(_this.msg_privacy_rule)) {
				return;
			}
			_this.submitJoinForm($joinForm.serialize());
		} else {*/
			if (confirm(_this.msg_join_confirm)) {
				_this.submitJoinForm($joinForm.serialize());
			}
		// }
		
	},
	checkEmailUse : function(param){
		var _this = this;
		var checkInvalid = false;
		//이메일 체크
		$.ajax({
			url : './emailChk.do',
			type : "post",
			async : false,
			data : param,
			dataType : "html",
			error : function() {
				alert(_this.msg_error);
				return;
			},
			success : function(strData) {
				var seqs = strData.split(",");
				var emailChk = seqs[1];
				if (Number(emailChk) > 0) {
					$("#msgEmail").text(_this.msg_mail_use).show();
					$("#email1").focus();
					checkInvalid = true;
				} else {
				}
			}
		});
		return checkInvalid;
	},
	checkPhoneUse : function(param){
		var _this = this;
		var checkInvalid = false;
		//휴대전화 체크
		$.ajax({
			url : './hpChk.do',
			type : "post",
			async : false,
			data : param,
			dataType : "html",
			error : function() {
				alert(_this.msg_error);
			},
			success : function(strData) {
				var seqs = strData.split(",");
				var hpChk = seqs[1];
				if (hpChk != 0) {
					checkInvalid = true;
					$("#msgTel").text(_this.msg_tel_use).show();
					$("#tel2").focus();
				} else {
				}
			}
		});
		return checkInvalid;
	},
	submitJoinForm : function(param){
		var _this = this;
		
		//폼 전송
		$.ajax({
			url : './memberSave.do',
			type : "post",
			async : false,
			data : param,
			dataType : "html",
			error : function() {
				alert(_this.msg_error);
			},
			beforeSend : function() {

			},
			complete : function() {

			},
			success : function(strData) {
				var trackObj = {
					scid : 2408
				};
				Tracker.clickLog(trackObj);
				alert(_this.msg_join_ok);
				var referLink = document.createElement('a');
				var url = _this.rUrl;
				if(url == ""){
					url = _COOCHA_WEB_DOMAIN + _PATH + "/";
				}
				referLink.href = url;
				document.body.appendChild(referLink);
				referLink.click();
				return false;
			}
		});
	},
	goJoinMemberPage : function(object){
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", _PATH + "/member/join/joinMember.do");
		document.body.appendChild(form);
		
		var joinClass = document.createElement("input");
		joinClass.setAttribute("type", "hidden");
		joinClass.setAttribute("name", "joinClass");
		joinClass.setAttribute("value", object.joinClass);
		form.appendChild(joinClass);
		var snsid = document.createElement("input");
		snsid.setAttribute("type", "hidden");
		snsid.setAttribute("name", "snsid");
		snsid.setAttribute("value", object.snsid);
		form.appendChild(snsid);
		/* 이메일 받아오기 삭제 */
		/*var email = document.createElement("input");
		email.setAttribute("type", "hidden");
		email.setAttribute("name", "email");
		email.setAttribute("value", object.email== null ? '' : object.email);
		form.appendChild(email);*/
		var rUrl = document.createElement("input");
		rUrl.setAttribute("type", "hidden");
		rUrl.setAttribute("name", "rUrl");
		rUrl.setAttribute("value", object.rUrl== null ? '' : object.rUrl);
		form.appendChild(rUrl);
		
		//폼전송
		form.submit();  
	},
	setRUrl : function(url){
		var _this = this;
		_this.rUrl = url;
	}
}
window.Login = function(type){
	this.init(type);
}
Login.prototype = {
	/**
	 * 유입 경로
	 */
	rUrl : "",
	type : "",
	msg_error : "잘못된 정보입니다.",
	msg_idpw_invalid : "아이디 또는 비밀번호를 다시 확인하세요.",
	msg_no_result : "일치하는 정보가 없습니다. 정보를 다시 확인해주세요.",
	msg_sns_member : "SNS 계정 가입 회원입니다. 가입 시 선택한 서비스로 로그인해주세요.",
	msg_pw_result : "로 임시 비밀번호가 발송되었습니다. 로그인 후 바로 비밀번호를 변경해주세요.",
	isLoading : false,
	/**
	 * 초기화
	 */
	init : function(type){
		var _this = this;
		
		_this.type = type;
		
		//아이디 패스워드 엔터키 이벤트
		$("#uid").on("keyup",function(e){
			if (e.keyCode == 13) {
				_this.login();
			}
		});
		$("#upw").on("keyup",function(e){
			if (e.keyCode == 13) {
				_this.login();
			}
		});
		//로그인 버튼 이벤트
		$(".section-login .btn-confirm").on("click",function(){
			_this.login();
		});
		//아이디 찾기 버튼 이벤트
		$(".section-login .group-links a").eq(0).on("click",function(e){
			e.preventDefault();
			$(".ui-select").removeClass("open");
			//$(".ui-select .s").hide();
			$("#findIdResult").hide();
			$("#findPwResult").hide();
			$(".popup-find .group-tab a").removeClass("selected").eq(0).addClass("selected");
			$(".popup-find fieldset").hide().eq(0).show();
			$(".popup-find").show();
		});
		$("div.popup-find > div.group-tab > a").eq(0).on("click",function(e){
			e.preventDefault();
			$(".ui-select").removeClass("open");
			//$(".ui-select .s").hide();
			$("#findIdResult").hide();
			$("#findPwResult").hide();
			$(".popup-find .group-tab a").removeClass("selected").eq(0).addClass("selected");
			$(".popup-find fieldset").hide().eq(0).show();
			$(".popup-find").show();
		});
		
		//비밀번호 찾기 버튼 이벤트
		$(".section-login .group-links a").eq(1).on("click",function(e){
			$(".ui-select").removeClass("open");
			//$(".ui-select .s").hide();
			$("#findIdResult").hide();
			$("#findPwResult").hide();
			$(".popup-find .group-tab a").removeClass("selected").eq(1).addClass("selected");
			$(".popup-find fieldset").hide().eq(1).show();
			$(".popup-find").show();
			e.preventDefault();
		});
		$("div.popup-find > div.group-tab > a").eq(1).on("click",function(e){
			$(".ui-select").removeClass("open");
			//$(".ui-select .s").hide();
			$("#findIdResult").hide();
			$("#findPwResult").hide();
			$(".popup-find .group-tab a").removeClass("selected").eq(1).addClass("selected");
			$(".popup-find fieldset").hide().eq(1).show();
			$(".popup-find").show();
			e.preventDefault();
		});
		
		//회원가입 버튼 이벤트
		$(".section-login .group-links a").eq(2).on("click",function(e){
			e.preventDefault();
			var referLink = document.createElement('a');
			var url = _COOCHA_LOGIN_DOMAIN + _PATH + "/member/join/join.do";
			referLink.href = url;
			document.body.appendChild(referLink);
			referLink.click();
			return false;
		});
		//아이디 비밀번호 찾기 닫기 버튼
		$(".popup-find fieldset button.btn-cancel").on("click",function(e){
			e.preventDefault();
			$(".popup-find").hide();
		});
		//아이디 찾기 확인 버튼
		$(".popup-find fieldset").eq(0).find("button.btn-confirm").on("click",function(e){
			_this.findId();
		});
		//비밀번호 찾기 확인
		//아이디 찾기 확인 버튼
		$(".popup-find fieldset").eq(1).find("button.btn-confirm").on("click",function(e){
			_this.findPw();
		});
		//아이디 찾기 결과 창 확인
		$("#findIdResult button.btn-confirm").on("click",function(e){
			var referLink = document.createElement('a');
			var url = _COOCHA_LOGIN_DOMAIN + _PATH + "/member/login/login.do";
			referLink.href = url;
			document.body.appendChild(referLink);
			referLink.click();
			//$(".popup-find").hide();
			return false;
		});
		//비밀번호 찾기 결과창
		$("#findPwResult button.btn-confirm").on("click",function(e){
			var referLink = document.createElement('a');
			var url = _COOCHA_LOGIN_DOMAIN + _PATH + "/member/login/login.do";
			referLink.href = url;
			document.body.appendChild(referLink);
			referLink.click();
			//$(".popup-find").hide();
			return false;
		});
		
	},
	
	/**
	 * 로그인
	 */
	login : function(){
		var _this = this;
		//console.log("로그인!!");
		
		var uid = $("#uid").val();
		var upw = $("#upw").val();
		
		//아이디 유효성 체크
		if (uid.length == 0) {
			$("#uid").focus();
			alert("아이디를 입력해주세요.");
			return;
		}
		if (uid.length < 5 || uid.length > 15) {
			$("#uid").focus();
			alert("5자 ~ 15자 이내의 아이디를 사용해 주세요.");
			return;
		}
		//패스워드 유효성 체크
		if (upw.length == 0) {
			$("#upw").attr("value","").val("").focus();
			alert("패스워드를 입력해주세요.");
			return;
		} 
		if (upw.length < 5 || upw.length > 15) {
			$("#upw").attr("value","").val("").focus();
			alert("8자 ~ 15자 이내의 패스워드를 사용해 주세요.");
			return;
		}
		//로그인
		$.ajax({
			url : _PATH + "/member/login/loginChk.do",
			type : "POST",
			data : {
				mid : uid,
				mpwd : upw
			},
			error : function(){
			},
			success : function(strData){
				var seqs = strData.split(",");
                var returnCode = $.trim(seqs[0]);
				var idChk = seqs[1];
				var secedeCodeid = seqs[2];
				
                if (secedeCodeid == 1025 || secedeCodeid == 1026 || returnCode != 'success') {
					$("#msgIdPw").text(_this.msg_idpw_invalid).show();
        		    $("#uid").attr("value","").val("").focus();
        		    $("#upw").attr("value","").val("");
        			return;
				}
				
				if (idChk == 0) {
					$("#msgIdPw").text(_this.msg_idpw_invalid).show();
					$("#uid").attr("value","").val("").focus();
        		    $("#upw").attr("value","").val("");
        		    return;
				}
				else if (idChk == 1) {
					
					$.ajax({
						url : _PATH + "/member/checkLastChangedPassword.do",
						type : "POST",
						data : {
							mid : uid
						},
						error : function(){
						},
						success : function(strData){
							if(strData.trim() == 'Y'){
								if(_this.rUrl == ""){
									var referLink = document.createElement('a');
									var url = _COOCHA_WEB_DOMAIN  + _PATH + "/index.do";
									referLink.href = url;
									document.body.appendChild(referLink);
									referLink.click();
									return false;
			           			}
			           			else if(_this.rUrl.indexOf("member/mypage/mypageCoupon.do") >= 0){
									Tracker.clickLog({scid : 2405});
									var referLink = document.createElement('a');
									var url = _this.rUrl;
									location.href = url;
									return false;
			           			}
			           			else if(_this.rUrl.indexOf("member/mypage/mypageDaily.do") >= 0){
			           				Tracker.clickLog({scid : 2403});
									var referLink = document.createElement('a');
									var url = _this.rUrl;
									location.href = url;
									return false;
			           			}
			           			else{
			           				var referLink = document.createElement('a');
									var url = _this.rUrl;
									location.href = url;
									return false;
			           			}
								
							}else if(strData.trim() == 'N'){
								location.href= _PATH + "/member/changePassword.do?mid="+uid;
								
							}
						}
					});
           			Tracker.clickLog({scid : 2407});
           			if(_this.rUrl == ""){
						var referLink = document.createElement('a');
						var url = _COOCHA_WEB_DOMAIN  + _PATH + "/index.do";
						referLink.href = url;
						document.body.appendChild(referLink);
						referLink.click();
						return false;
           			}
           			else if(_this.rUrl.indexOf("member/mypage/mypageCoupon.do") >= 0){
						Tracker.clickLog({scid : 2405});
						var referLink = document.createElement('a');
						var url = _this.rUrl;
						location.href = url;
						return false;
           			}
           			else if(_this.rUrl.indexOf("member/mypage/mypageDaily.do") >= 0){
           				Tracker.clickLog({scid : 2403});
						var referLink = document.createElement('a');
						var url = _this.rUrl;
						location.href = url;
						return false;
           			}
           			else{
           				var referLink = document.createElement('a');
           				var url = _this.rUrl;
           				location.href = url;
						return false;
           			}
				}
				else if(idChk == 2){
					//휴면계정
					var referLink = document.createElement('a');
					var url = _PATH + "/member/dormant.do";
					referLink.href = url;
					document.body.appendChild(referLink);
					referLink.click();
					return false;
				}
			}
		});
		
	},
	/**
	 * [SNS] 로그인
	 */
	snsLogin : function(object){
		var _this = this;
		object.rUrl = _this.rUrl;
		if(!_this.isLoading) {
			_this.isLoading = true;
			//로그인
			$.ajax({
				url : _PATH + "/member/login/loginChk.do",
				type : "POST",
				/* IE에서 object 값이 중간에 손실되는 issue 존재하여  */
				async : false,
				data : {
					joinClass : object.joinClass,
					snsid : object.snsid,
					pagetype : _this.type
				},
				beforeSend : function(){
					$(".ico-loading").show();
				},
				complete : function() {
					_this.isLoading = false;
				},
				error : function(){
					alert(_this.msg_error);
				},
				success : function(strData){
					var seqs = strData.split(",");
                    var returnCode = $.trim(seqs[0]);
					var idChk = seqs[1];
					var secedeCodeid = seqs[2];
					
                    if (secedeCodeid == 1025 || secedeCodeid == 1026 || returnCode != 'success') {
						$("#msgIdPw").text(_this.msg_idpw_invalid).show();
						$("#uid").attr("value","").val("").focus();
						$("#upw").attr("value","").val("");
						_this.isLoading = false;
						$(".ico-loading").hide();
						return;
					}
					if (idChk == 0) {
						new JoinMember().goJoinMemberPage(object);
					}
					else if (idChk == 1) {
						if(_this.type == 'join') {
							$(".ico-loading").hide();
							if(confirm("이미 쿠차에 가입되어 있는 계정입니다.\n로그인하시겠습니까?")) {
								_this.isLoading = false;
								$(".ico-loading").show();								
								var login = new Login();
								login.setRUrl(object.rUrl);
								login.snsLogin(object);
							} else {
								_this.isLoading = false;
								$(".ico-loading").hide();
								return;
							}
						}
						Tracker.clickLog({scid : 2407});
						if(_this.rUrl == ""){
							var referLink = document.createElement('a');
							var url = _COOCHA_WEB_DOMAIN  + _PATH + "/index.do";
							referLink.href = url;
							document.body.appendChild(referLink);
							referLink.click();
							return false;
						}
						else if(_this.rUrl.indexOf("member/mypage/mypageCoupon.do") >= 0){
							Tracker.clickLog({scid : 2405});
							var referLink = document.createElement('a');
							var url = _this.rUrl;
							referLink.href = url;
							document.body.appendChild(referLink);
							referLink.click();
							return false;
						}
						else if(_this.rUrl.indexOf("member/mypage/mypageDaily.do") >= 0){
							Tracker.clickLog({scid : 2403});
							var referLink = document.createElement('a');
							var url = _this.rUrl;
							referLink.href = url;
							document.body.appendChild(referLink);
							referLink.click();
							return false;
						}
						else{
							var referLink = document.createElement('a');
							var url = _this.rUrl;
							referLink.href = url;
							document.body.appendChild(referLink);
							referLink.click();
							return false;
						}
					}
					else if(idChk == 2){
						//휴면계정
						var referLink = document.createElement('a');
						var url = _PATH + "/member/dormant.do";
						referLink.href = url;
						document.body.appendChild(referLink);
						referLink.click();
						return false;
					}
				}
			});
		}
	},
	addInputTag : function(name,value,targetForm){
		$("<input />").attr("name",name).attr("value",value).appendTo(targetForm);
	},
	
	findId : function(){
		var _this = this;
		
		$findForm = $("<form />");
		_this.addInputTag("gubun", "id", $findForm);
		var telNo =  $("#findIdTel1").val() + $("#findIdTel2").val();
		_this.addInputTag("mhp",telNo, $findForm);
		var mailAddr = $("#findIdMail1").val() + "@"+  $("#emailDomain").val();
		_this.addInputTag("mail", mailAddr, $findForm);
		
		$.ajax({
			url: _PATH+"/member/join/findInfo.do",
			type: "post",
			data: $findForm.serialize(),
			async:false,
			dataType: "html",
			error: function(){
				alert(_this.msg_error);
			},
			success: function( strData ){
				var seqs = strData.split(",");
				var idChk = seqs[1];
				var info = seqs[2];
				var leng = info.length;
				var sum = leng-2;
				var userInfo = info.substring(0, sum); 
				var saveId = seqs[3];
				if (idChk == 0) {
					$("#msgFindId").text(_this.msg_no_result).show();
				}else{
					if(1== saveId){
						$(".popup-find fieldset").hide();
						$("#findIdResult").show().find("em").text(userInfo+"**");
					} else if(2 == saveId) {
						$("#msgFindId").html(_this.msg_sns_member).show();
					}
				} 
			}
		});  
	},
	
	findPw : function(){
		var _this = this;
		//console.log("비밀번호 찾기");
		
		$findForm = $("<form />");
		_this.addInputTag("gubun", "pw", $findForm);
		var telNo =  $("#findPwTel1").val() + $("#findPwTel2").val();;
		_this.addInputTag("mhp",telNo, $findForm);
		var mid = $("#findPwId").val();
		_this.addInputTag("mid", mid, $findForm);
		_this.addInputTag("mail", "", $findForm);
		
		$.ajax({
			url: _PATH+"/member/join/findInfo.do",
			type: "post",
			data: $findForm.serialize(),
			async:false,
			dataType: "html",
			error: function(){
				alert(_this.msg_error);
			},
			success: function( strData ){
				var seqs = strData.split(",");
				var idChk = seqs[1];
				var info = seqs[2];
				var leng = info.length;
				var sum = leng-2;
				var userInfo = info.substring(0, sum); 
				var saveId = seqs[3];
				if (idChk == 0) {
					$("#msgFindPw").text(_this.msg_no_result).show();
				}else{
					if(3 == saveId) {
						$("#msgFindPw").text(_this.msg_sns_member).show();
					} else if(1 != saveId){
						$(".popup-find fieldset").hide();
						$("#findPwResult").show().find("em").text(info);
					}
				} 
			}
		}); 
	},
	
	setRUrl : function(url){
		var _this = this;
		_this.rUrl = url;
	}
}
window.Join = function(){
	this.init();
}
/**
 * 초기화
 */
Join.prototype = {
	init : function() {
		var _this = this;
		
		/* 쿠차 회원가입 */
		$("#coochaJoin").on("click", function() {
			var referLink = document.createElement('a');
			var url = _PATH + "/member/join/joinMember.do";
			referLink.href = url;
			document.body.appendChild(referLink);
			referLink.click()
		});
		
	}
}