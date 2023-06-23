// 탭 클릭 시 스크롤 이동 함수
function scrollToMove(name){
    const headHeight = $("#header .btm").height();
    const anchorTop = $("."+name).offset().top;
    const thisTop = anchorTop - headHeight;
    $("html, body").stop().animate({
        scrollTop : thisTop
    }, 300);
}

// 로그인이 필요할 때 팝업 (if 1)
function layerAlertLogin(){
    const text = "로그인 후 이용해 주세요."; // 본문 텍스트
    const btnOkFunc = "layerAlertMoveLoginClose()"; // 확인 버튼 클릭 시 실행 함수명
    const btnCancelYn = "n"; // 취소 버튼 유무
    layerAlert(text, btnOkFunc, btnCancelYn);
}

// 이벤트 대상자가 아닐 때 팝업 (if 2)
function layerAlertNot(){
    const text = "이벤트 대상자가 아닙니다."; // 본문 텍스트
    const btnOkFunc = "layerAlertClose()"; // 확인 버튼 클릭 시 실행 함수명
    const btnCancelYn = "n"; // 취소 버튼 유무
    layerAlert(text, btnOkFunc, btnCancelYn);
}

// 이벤트 준비중
function layerAlertEventWait(){
    const text = "이벤트 준비중 입니다. 잠시만 기다려주세요."; // 본문 텍스트
    const btnOkFunc = "layerAlertClose()"; // 확인 버튼 클릭 시 실행 함수명
    const btnCancelYn = "n"; // 취소 버튼 유무
    layerAlert(text, btnOkFunc, btnCancelYn);
}

function layerAlertSoldOutProduct(){
    const text = "상품이 매진되었습니다. 다른 상품을 선택해주세요."; // 본문 텍스트
    const btnOkFunc = "layerAlertClose()"; // 확인 버튼 클릭 시 실행 함수명
    const btnCancelYn = "n"; // 취소 버튼 유무
    layerAlert(text, btnOkFunc, btnCancelYn);
}

// 이벤트 제품이 이미 담겨 있을 때 교체 여부 확인 팝업 (if 3)
function layerAlertChange(tpmm_idx,tpsm_idx,tsmi_idx, member_type, pd_title,pd_amount){	
    const text = "이미 이벤트 제품이 있습니다.\n교체하시겠습니까?"; // 본문 텍스트
    const btnOkFunc = "eventPrdChange('"+tpmm_idx+"','"+tpsm_idx+"','"+tsmi_idx+"','"+member_type+"','"+pd_title+","+pd_amount+"')"; // 확인 버튼 클릭 시 실행 함수명
    const btnCancelYn = "y"; // 취소 버튼 유무
    layerAlert(text, btnOkFunc, btnCancelYn);
}

// 알림 팝업 기본 (common.js로 이동)
/*function layerAlert(txt, func, cancel){
    $(".layer_alert .cont .body .txt").text(txt);
    $(".layer_alert .cont .foot .btn_ok").attr("onclick", func);
    if(cancel == "y"){
        $(".layer_alert").addClass("confirm");
    }else{
        $(".layer_alert").removeClass("confirm");
    }
    $(".layer_alert").addClass("on");
}*/

// 알림 팝업 닫기 (common.js로 이동)
/*function layerAlertClose(){
    $(".layer_alert").removeClass("on");
}*/

/* 로그인 페이지 이동 */
function layerAlertMoveLoginClose(){
	 $(".layer_alert").removeClass("on");
	 location.href='/access/login'
	}

//알림 팝업 닫기
function layerAlertMoveClose(){
 $(".layer_alert").removeClass("on");
 location.href='/quickOrder/info'
}

// function layerAlertClose(e){
//     $(e).parents(".layer_alert").removeClass("on");
// }

// 이벤트 제품이 이미 담겨 있을 때 확인 클릭 시 교체 함수
function eventPrdChange(tpmm_idx,tpsm_idx,tsmi_idx, member_type, pd_title,pd_amount){	
	addCart(tpmm_idx,tpsm_idx,tsmi_idx, member_type, pd_title,pd_amount);
}



// 장바구니 담기 클릭 시
function addCart(tpmm_idx,tpsm_idx,tsmi_idx, member_type, pd_title, pd_amount){
	let text = "장바구니에 담겼습니다.";// 본문 텍스트
    const btnOkFunc = "layerAlertClose()"; // 확인 버튼 클릭 시 실행 함수명
    const btnCartOkFunc = "layerAlertMoveClose()"; // 확인 버튼 클릭 시 실행 함수명
    const btnCancelYn = 'N'
   
	if(member_type === 'Y'){
		if(tpmm_idx != '0'){
			var req_data = [{
					tpmm_idx : tpmm_idx,
					tpsm_idx : tpsm_idx,					
					pd_amount : pd_amount,
					cnt : 1
			}];
			$.ajax({
				url: '/quickOrder/rest/cart/save',
			 	type : 'post',
			 	cache : false,
			 	data: JSON.stringify({cart_list: req_data}),
			 	dataType : 'json',			 	 
                contentType: 'application/json',
			    success:function(data){
			    		if(data.rtn_cd == '200'){
			    			popAlarm2(pd_title, 1, "N");
			    			layerAlert(text, btnCartOkFunc, btnCancelYn);
			    			$(".cart_put_new").hide();
			    			$(".cart_put_re").show();
			    		}else{
			    			text = data.rtn_msg;
			    			layerAlert(text, btnOkFunc, btnCancelYn);
			    		}
			    	},
			    	error:function(request,status,error){
			         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 	}
			});
		}else{
			layerAlertSoldOutProduct();
		}
	}else{
		layerAlertLogin();
	}
}

// 더 보기 버튼 클릭 시
function btnMore(e){
    const cnt = $(e).parents(".content");
    if(cnt.hasClass("on")){
        cnt.removeClass("on");
        $(e).children("span").text("더 보기");
    }else{
        cnt.addClass("on");
        $(e).children("span").text("숨기기");
    }
}