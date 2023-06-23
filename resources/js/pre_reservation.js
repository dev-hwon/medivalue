$(function(){
	quickBarFixedHandler();
	qnaAccordionHandler();
	setClipUrl();
	checkAgreeHandler();
	setTimeout(closeIntro, 1000);
});

$(window).scroll(function(){
	quickBarFixedHandler();
});

/*스크롤 이동*/
const scrollToMove = (name)=> {
    const headHeight = $("header").height();
    const anchorTop = $("."+name).offset().top;
    const thisTop = anchorTop - headHeight;
    $("html, body").stop().animate({
        scrollTop : thisTop
    }, 300);
}

/*QnA 아코디언*/
const qnaAccordionHandler = ()=> {
	const qnaLi = $(".qna_list li");
	const qnaAnswer = $(".qna_list .answer");
	const qnaBtn = $(".qna_list li > div > a");
	qnaBtn.on("click", function(){
		if($(this).parents("li").hasClass("on")){
			qnaLi.removeClass("on");
			qnaAnswer.slideUp(300);
			$(this).siblings(".answer").slideUp(300);
		}else{
			qnaLi.removeClass("on");
			qnaAnswer.slideUp(300);
			$(this).parents("li").addClass("on");
			$(this).siblings(".answer").slideDown(300);
		}
	});
}

/*Quick bar 하단 고정*/
const quickBarFixedHandler = ()=> {
	const footer = $("footer");
	const quickBar = $(".sec_quickbar");
	const winHeight = $(window).height();
	const barHeight = $(".sec_quickbar").height();
	const visualTop = $(".sec_visual").offset().top;
	const visualHeight = $(".sec_visual").innerHeight();
	const barFixedPosition = visualTop + visualHeight + barHeight;
	const scrollTop = $(window).scrollTop();
	const scrollBot = scrollTop + winHeight;
    if (scrollBot > barFixedPosition){ 
        quickBar.addClass('fixed');
		footer.addClass("qucik_fixed");
    }else{
        quickBar.removeClass('fixed');
		footer.removeClass("qucik_fixed");
    }
}

/*동의 체크박스 전체 선택*/
const checkAgreeHandler = ()=> {
	const chkAgreeAll = $(".chk_agree_all");
	const chkAgree = $(".chk_agree");
	const chkAgreeLength = $(".chk_agree").length;

	chkAgreeAll.on("change", function(){
		if($(this).is(":checked")){
			chkAgree.prop("checked", true);
		}else{
			chkAgree.prop("checked", false);
		}
	});
	
	chkAgree.on("change", function(){
		const chkAgreeChkedLength = $(".chk_agree:checked").length;
		if(chkAgreeChkedLength == chkAgreeLength){
			chkAgreeAll.prop("checked", true);
		}else{
			chkAgreeAll.prop("checked", false);
		}
	});
}

let reservation_state = true;
/*사전예약하기 버튼*/
const preReservHandler = ()=> {
	const formWrap = $(".sec_form .form_wrap");
	const formText = formWrap.find("input[type='text']");
	const formNumber = formWrap.find("input[type='tel']");
	const formNumberLength = formWrap.find("input[type='tel']").val().length;
	const formCheck = formWrap.find("input[type='checkbox']");
	const formCheckLength = formWrap.find("input[type='checkbox']").length;
	const formCheckedLength = formWrap.find("input[type='checkbox']:checked").length;
	/*필수 항목 확인 (통합)*/
	/*if(formText.val()=="" || formNumberLength < 7 || formCheckLength != formCheckedLength){
		openAlertPopup("필수 항목을 확인해 주세요.");
		return false;
	}*/
	
	/*사업자명, 사업자번호 확인*/
	if($.trim(formText.val())==""){
		if($("#container").hasClass("dental")){
			openAlertPopup("치과명을 확인해 주세요.");			
		}else{
			openAlertPopup("사업자명 또는 사업자 번호를 확인해 주세요.");	
		}
		return false;
	}
	
	/*전화번호 확인*/
	if(formNumberLength < 7){
		openAlertPopup("전화번호를 확인해 주세요.");
		return false;
	}
	
	/*필수 약관 동의 확인*/
	if(formCheckLength != formCheckedLength){
		openAlertPopup("필수 동의 항목을 확인해 주세요.");
		return false;
	}
	
	/*이미 등록된 번호일 경우*/
	if(reservation_state){
		reservation_state = false;
		 let fd_company_info = formText.val();
		 let fd_tel_num = $("#mobile_type option:selected").val();
		 let fd_tel_info = formNumber.val();
		 let fd_agree_yn_private = $("#agree_yn_private").val();
		 let fd_agree_yn_service = $("#agree_yn_service").val();
		 let fd_agree_yn_age = $("#agree_yn_age").val();
		 let req_time = $("#req_time").val();
		 if(typeof(req_time) =='undefined'){
			 req_time = '';
		 } 
		 let form_data = {
				 fd_company_info:fd_company_info,
				 fd_tel_info : fd_tel_num+''+fd_tel_info,
				 fd_agree_yn_private:fd_agree_yn_private,
				 fd_agree_yn_service:fd_agree_yn_service,
				 fd_agree_yn_age : fd_agree_yn_age,
				 req_time :req_time
		 };
		$.ajax({
            url: "/event/rest/reservation/register",
            method: "POST",
            cache : false,
            dataType : 'json',            
            data: form_data,
            success: function (data) {            	
                if(data.rtn_cd !='200'){
                	openAlertPopup(data.rtn_msg);
                	reservation_state = true;
                	return false;
                }else{
					if($("#container").hasClass("dental")){
						openAlertPopup("감사합니다.<br/>가입 상담 신청이 완료 되었습니다.");
					}else{
                		openAlertPopup(data.rtn_msg);						
					}
                	reservation_state = true;
                	return false;
                }
            },
			error:function(request,status,error){				
				openAlertPopup(request.responseText);
				reservation_state = true;
				return false;
			}
        });
	}else{
		openAlertPopup("사전 예약을 처리 중에 있습니다. 잠시만 기다려 주세요.");
		return false;
	}
}

/*클립보드 복사 버튼*/
const setClipUrl = ()=> {
	const clipboard = new ClipboardJS(".btn_share");
	clipboard.on("success", function(){	
		openAlertPopup("URL이 복사되었어요 :)<br>채팅창에 붙여 넣어서<br>좋은 소식을 알려주세요~!");
	});
}

/*공통 경고창 팝업*/
const openAlertPopup = (txt)=> {
	$(".alert_popup .alert").html(txt);
	$(".alert_popup").addClass("on");
}

/*약관 동의 팝업*/
const openTermPopup = ()=> {
	$(".terms_popup").addClass("on");
}

/*팝업 닫기 버튼*/
const closePopup = (e)=> {
    $(e).parents(".comm_popup").removeClass("on");
}

/*인트로 페이지 닫기*/
const closeIntro = ()=> {
	$(".intro_popup").addClass("off");
}

/*1차 사전 예약 마감*/
const endFirstRound = ()=> {
	$(".sec_form").addClass("end");
}