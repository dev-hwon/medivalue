// var selected = [];
$(function(){
    addListRowEvent();

    // 에어팟 li 값
    let airpod = [
        $(".event_list_0 .ul_5 .li_1"),
        $(".event_list_2 .ul_4 .li_7"),
        $(".event_list_4 .ul_1 .li_2"),
    ];
    // 상품권 li 값
    let golf = [
        $(".event_list_0 .ul_1 .li_6"),
        $(".event_list_0 .ul_2 .li_0"),
        $(".event_list_1 .ul_3 .li_4"),
        $(".event_list_1 .ul_1 .li_8"),
        $(".event_list_2 .ul_2 .li_3"),
        $(".event_list_2 .ul_3 .li_1"),
        $(".event_list_3 .ul_4 .li_2"),
        $(".event_list_3 .ul_0 .li_7"),
        $(".event_list_4 .ul_4 .li_5"),
        $(".event_list_4 .ul_6 .li_8")
    ]

    $.each(airpod, function(index, item){
        item.children("div").addClass("airpod");
    });
    $.each(golf, function(index, item){
        item.children("div").addClass("golf");
    });

    $.ajax({
        url: "/survey/rest/dentex/list",
        method: "GET",
        contentType: "application/json",
        accept: "*/*",
        success: function (data) {
            if (data['rtn_cd'] == "200") {
                $.each(data['dentexList'], function (index, item) {
                    let wrap = item['fd_event_list_idx'];
                    let ul = item['fd_ul_idx'];
                    let li = item['fd_li_idx'];
                    var item_arr = $("."+wrap+" ."+ul+ " ."+li);
                    item_arr.children("div").addClass("on");
                });
            } else {
                alert(data['rtn_msg']);
            }
        },
        error: function (error) {
            console.log(error);
        }
    })

    // var output = localStorage.getItem("select");
    // selected = JSON.parse(output);
    // console.log(output);
    // $.each(selected, function(index, item){
    //     var wrap = item[0];
    //     var ul = item[1];
    //     var li = item[2];
    //
    //     var item_arr = $("."+wrap+" ."+ul+ " ."+li);
    //     item_arr.children("div").addClass("on");
    // });

    // $("#img_logo").on("click", function () {
    //     refreshUserList();
    // });

    $(".atc_content .nav .btn_prev").click(function(){
        $.fn.pagepiling.moveSectionUp();
    });
    $(".atc_content .nav .btn_next").click(function(){
        $.fn.pagepiling.moveSectionDown();
    });

    pagePiling();

});

function addList(){
    var text = ["m", "e", "d", "i", "v", "a", "l", "u", "e"];
    $.each(text, function(index, item){
        var add_list = $("<li class='li_" + index + "'><div><a href='javascript:;' onclick='clickButton(this);'><span>" + item + "</span></a></div></li>")
        $(".event_list .row ul").append(add_list);
    });
};

function addListRow(){
    for (var i = 0; i < 7; i++) {
        var add_row = $("<div class='row'><ul class='ul_" + i + "'></ul></div>")
        $(".event_list").append(add_row);
    }
    addList();
};

function addListRowEvent(){
    for (var i = 0; i < 5; i++) {
        var add_event = $("<div id='event_list_" + i + "' class='event_list event_list_" + i + "'></div>")
        $(".atc_content > .inner").append(add_event);
    }
    addListRow();
};

function pagePiling(){
    $(".atc_content > .inner").pagepiling({
        sectionSelector: '.event_list',
        afterLoad: function(anchorLink, index){
            if(index == 1){
                $(".atc_content .nav .btn_prev").addClass("off");
            }else if(index == 5){
                $(".atc_content .nav .btn_next").addClass("off");
            }else{
                $(".atc_content .nav button").removeClass("off");
            }
        }
    });
};

function refreshUserList() {
    $("#survey_complete_list").empty();
    $.ajax({
        url: "/survey/rest/username",
        method: "GET",
        contentType: "application/json",
        accept: "*/*",
        success: function (data) {
            if (data['rtn_cd'] == '200') {
                let selectHTML = "";
                selectHTML += "<select class='sel_name'>"
                selectHTML += "<option value='' selected>-</option>";

                $.each(data['surveyCompleteList'], function (index, item) {
                    let option_html = "<option value='" + item['pk_idx'] + "'>" + item['fd_username_desc'] + "(" + item['fd_tel_desc'] + ")" +"<option>"
                    selectHTML += option_html;
                });
                selectHTML += "</select>";

                $("#survey_complete_list").append(selectHTML);
            } else {
                alert(data['rtn_msg']);
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}

function dentexEvent(pk_idx, e) {
    if(!$(e).parent().hasClass("active") && !$(e).parent().hasClass("on")){
        var li = $(e).parents("li").attr("class");
        var ul = $(e).parents("ul").attr("class");
        var wrap = $(e).parents(".event_list").attr("id");
        var gift = "starbucks";
        $(e).parents("li > div").addClass("active");
        $(".layer_popup").addClass("on");
        $(".layer_popup").focus();
        if($(e).parents("li > div").hasClass("airpod")){
            $(".layer_popup").addClass("airpod");
            gift = "airpod";
        }else if($(e).parents("li > div").hasClass("golf")){
            $(".layer_popup").addClass("golf");
            gift = "golf";
        }else{
            $(".layer_popup").addClass("starbucks");
            gift = "starbucks";
        }

        //해당 이벤트 좌표를 참석 처리
        $.ajax({
            url: "/survey/rest/dentex/manage",
            method: "POST",
            data: JSON.stringify({
                "fk_sim_idx": pk_idx,
                "fd_event_idx": wrap + ul + li,
                "fd_event_list_idx": wrap,
                "fd_ul_idx": ul,
                "fd_li_idx": li,
                "fd_gift_info": gift
            }),
            contentType: "application/json",
            accept: "*/*",
            success: function (data) {
                if (data['rtn_cd'] != '200') {
                    alert(data['rtn_msg']);
                }
                // else {
                //     refreshUserList();
                // }
            },
            error: function (error) {
                console.log(error);
            }
        });

        // if(Array.isArray(selected) == false){
        //     selected = [];
        // }
        // selected.push(arr);
        // localStorage.setItem("select", JSON.stringify(selected));
    }
}

function clickButton(e){

    let pk_idx = $("#survey_complete_list option:selected").val();

    if (pk_idx == null || pk_idx === '') {
        alert('이벤트 참여자를 선택해주세요!');
        return;
    }
    //해당 사용자 이벤트 참여 여부 체크
    $.ajax({
        url: "/survey/rest/dentex/duplicate/" + pk_idx,
        method: "GET",
        contentType: "application/json",
        accept: "*/*",
        success: function (data) {
            if (data['rtn_cd'] == '200') {
                dentexEvent(pk_idx, e);
            } else {
                alert(data['rtn_msg']);
            }
        },
        error: function (error) {
            console.log(error);
        }
    });

}

function hidePopup(){
    $(".layer_popup").removeClass("on airpod golf starbucks");
}

function resetAll(){
    var code = "reset";
    var inp_reset = prompt("리셋 코드를 입력해주세요.");
    if(inp_reset == code){
        localStorage.clear();
        alert("리셋 되었습니다.");
        location.reload();
    }else{
        alert("리셋 코드가 일치하지 않습니다.");
        return false;
    }
}