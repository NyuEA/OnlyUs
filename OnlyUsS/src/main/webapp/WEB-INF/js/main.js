var Main = {
		
		/*회사 연락처*/
		h_compTel : "1670-4311",
		
		B_slider : null ,

		Init: function() {
			
			var oThis = this;
			
			//oThis.getListCnt() ;

			$(":input").each( function(index){
				if( $(this).attr("type") != "button" && $(this).attr("type") != "radio" ){
					$(this).val("") ;
				}
				
			});

			this.B_slider = $('.bxslider').bxSlider({
				  pagerCustom: '#bxpager2',
				  auto: true,
				  autoControls: true
			});	
		},
		
		showVideo: function() { // TGEONET 소개 동영상 팝업 보이기
			$("#use_video").show();
			$("#tgeonet_video").attr("src","http://www.youtube.com/embed/HLJbA47NonQ");

		},
		
		closeVideo: function() { // TGEONET 소개 동영상 팝업 끄기
			$("#use_video").hide();
			$("#tgeonet_video").attr("src","");
		},

		showHide: function() {
			$('#mail_pop').show();
		}
	};