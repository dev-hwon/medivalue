$(function(){

    // 메인 슬라이드
    const slide_main = $("#main .atc_visual .visual_wrap > ul");
    slide_main.on('init', function(){
        if($(this).find(".slick-slide.slick-active").hasClass("dark")){
            $(this).addClass("dark");
        }else{
            $(this).removeClass("dark");
        }
    });
    slide_main.on('afterChange', function(){
        if($(this).find(".slick-slide.slick-active").hasClass("dark")){
            $(this).addClass("dark");
        }else{
            $(this).removeClass("dark");
        }
    });
    slide_main.slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 5000,
        speed: 500,
        fade: false,
        swipe: true,
        swipeToSlide: true,
        dots: true,
        arrows: true
    });
});

/*클리닉 인증 거래 순위 정렬 버튼 클릭 시*/
const rankSortButtonEvent = (e)=> {
	const target = $(e);
	const tableCommon = $(".rank_list table th, .rank_list table td");
	const tableAccum = $(".rank_list table .accum");
	const tableRecent = $(".rank_list table .recent");
	$(".dt_rank_view").empty();
	
	let view_type = 'accum'
	if(target.hasClass("btn_accum")){
		tableCommon.removeClass("on");
		tableAccum.addClass("on");
		view_type = 'accum';
	}else{
		tableCommon.removeClass("on");
		tableRecent.addClass("on");
		view_type = 'recent';
	}
	
	let form_dt_data = {reqType : view_type};
	$.ajax({
        url: "/event/rest/dt_rank_info",
        method: "POST",
        cache : false,
        dataType : 'json',
        data: form_dt_data,
        success: function (data) {        	
            if (data.rtn_cd == "200") {
            	let temp_view_cnt = 0;
            	var dt_inner_html = "";
            	$.each(data.dt_list, function(index, value) {
            		temp_view_cnt++;
            		dt_inner_html += "<tr onclick=\"rankRowClickEvent(this);\">";
            			dt_inner_html += "<td class=\"no\">"+temp_view_cnt;
            				dt_inner_html += "<input type=\"hidden\" name=\"dt_corporate_representative_name\" id=\"dt_corporate_representative_name\" value=\""+value.fd_corporate_representative_name_desc+"\">";
            				dt_inner_html += "<input type=\"hidden\" name=\"dt_email\" id=\"dt_email\" value=\""+value.fd_email_info_desc+"\">";
            				dt_inner_html += "<input type=\"hidden\" name=\"dt_tel_info\" id=\"dt_tel_info\" value=\""+value.fd_tel_nomal_desc+"\">";
           				dt_inner_html += "</td>";
           				dt_inner_html += "<td class=\"title\">";
           					dt_inner_html += "<div class=\"txt_title\" id=\"dt_name\">"+value.fd_medical_name+"</div>";
           					dt_inner_html += "<div class=\"txt_desc\" id=\"dt_addr\">"+value.fd_addr_desc+" "+value.fd_addr_detail_desc+"</div>";
           				dt_inner_html += "</td>";
           				if(view_type=='accum'){
           					dt_inner_html += "<td class=\"accum on\">";	
           				}else{
           					dt_inner_html += "<td class=\"accum\">";
           				}
           				
           					dt_inner_html += "<div class=\"txt_num\">"+value.write_cnt+"</div>";
           				dt_inner_html += "</td>";
           				if(view_type=='recent'){
           					dt_inner_html += "<td class=\"recent on\">";	
           				}else{
           					dt_inner_html += "<td class=\"recent\">";
           				}
           					dt_inner_html += "<div class=\"txt_num\">"+value.receive_cnt+"</div>";
           				dt_inner_html += "</td>";
            		dt_inner_html += "</tr>";
            	});
            	$(".dt_rank_view").html(dt_inner_html);
            } else {
            	$("#rank_loading").show();                
            }
        },
	   	error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
    });
	
}

/*클리닉 인증 거래 순위 리스트 클릭 시*/
const rankRowClickEvent = (e)=> {
    const target = $(e);
    const idx = target.index();
    rankPopupListEvent(e, idx);
    rankDetailPopupEvent();
}

/*클리닉 인증 거래 순위 자세히보기 클릭 시*/
const rankDetailPopupEvent = ()=> {
	const target = $(".rank_list table td.on");
	const targetText = $(".rank_detail_popup .content .head .title .sort");
	const tableAccum = $(".comm_popup.rank_detail_popup .content .body .rank_wrap .rank_list table td.accum");
	
	if(target.hasClass("accum")){
		targetText.text("누적거래");
		tableAccum.addClass("on");
	}else{
		targetText.text("최근거래");
		tableAccum.removeClass("on");		
	}
	showCommPopup('rank_detail_popup');
}


/*클리닉 인증 거래 순위 팝업 내 리스트 클릭 시*/
const rankPopupListEvent = (e, i)=> {
    const target = $(e);
    const tableRow = $(".comm_popup.rank_detail_popup .content .body .rank_wrap .rank_list table tbody tr");
    const targetTableRow = tableRow.eq(i);
    tableRow.removeClass("on");
    target.addClass("on");
    targetTableRow.addClass(("on"));

    let temp_dt_name = target.find("#dt_name").text();
    let temp_dt_corporate_representative_name = target.find("#dt_corporate_representative_name").val();
    let temp_dt_addr= target.find("#dt_addr").text();
    let temp_dt_email= target.find("#dt_email").val();
    let temp_dt_tel_info= target.find("#dt_tel_info").val();
    
    
    $("#view_dt_name").html(temp_dt_name);
    $("#view_dt_corporate_representative_name").html(temp_dt_corporate_representative_name);
    $("#view_dt_addr").html(temp_dt_addr);
    $("#view_dt_email").html(temp_dt_email);
    $("#view_dt_tel_info").html(temp_dt_tel_info);
    
}


