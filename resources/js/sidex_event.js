$(function(){
    // addListRowEvent();
    // addClassIndex();
    //
    // // 에어팟 li 값
    // let airpod = [
    //     $(".li_31"),
    //     $(".li_17"),
    //     $(".li_62"),
    // ];
    //
    // // 상품권 li 값
    // let ssg = [
    //     $(".li_6"),
    //     $(".li_20"),
    //     $(".li_44"),
    //     $(".li_8"),
    //     $(".li_53"),
    //     $(".li_11"),
    //     $(".li_2"),
    //     $(".li_37"),
    //     $(".li_5"),
    //     $(".li_78")
    // ];
    //
    // // 도넛 li 값
    // let donut = [
    //     $(".li_96"),
    //     $(".li_92"),
    //     $(".li_105"),
    //     $(".li_200"),
    //     $(".li_125"),
    //     $(".li_503"),
    //     $(".li_404"),
    //     $(".li_403"),
    //     $(".li_500")
    // ];
    //
    // $.each(airpod, function(index, item){
    //     item.children("div").addClass("airpod");
    // });
    // $.each(ssg, function(index, item){
    //     item.children("div").addClass("ssg");
    // });
    // $.each(donut, function(index, item){
    //     item.children("div").addClass("donut");
    // });
    //
    // pagePiling();

});

function setEventProduct(version, productList, req_type) {
    addListRowEvent();
    addClassIndex();

    $.each(productList, function (index, item) {
        let className = item["className"];
        let productName = item["productName"];
        $(".li_" + index).children("div").addClass(className);
    });
    
    pagePiling();

    $.ajax({
        url: "/survey/rest/sidex/list" + "/" + req_type+"/"+version,    	
        method: "GET",
        success: function (data) {
            if (data["rtn_cd"] === "200") {
                $.each(data["dentexList"], function (index, item) {
                    let fd_event_list_idx = item["fd_event_list_idx"];
                    //console.log(fd_event_list_idx);
                    $("." + fd_event_list_idx).children("div").addClass("active");
                });
            } else {
                alert(data["rtn_msg"]);
            }
        },
        error: function () {
            console.log("네트워크 연결을 확인해주세요.");
        }
    })
}

function addListRowEvent(){
    for (var i = 0; i < 8; i++) {
        var add_event = $("<div id='event_list_" + i + "' class='event_list event_list_" + i + "'><ul></ul></div>")
        $(".atc_content > .inner").append(add_event);
    }
    addListRow();
};

function addListRow(){
    for (var i = 0; i < 7; i++) {
        addList();
    }
};

function addList(){
    var text = ["m", "e", "d", "i", "v", "a", "l", "u", "e"];
    $.each(text, function(index, i){
        var add_list = $("<li><div><a href='javascript:;' onclick='clickButton(this);'><span>" + i + "</span></a></div></li>")
        $(".event_list ul").append(add_list);
    });
};

function addClassIndex(){
    $(".event_list li").each(function(index){
        $(this).addClass("li_" + index);
    });
};

function pagePiling(){
    $(".atc_content > .inner").pagepiling({
        sectionSelector: '.event_list',
        anchors: ['page_1', 'page_2', 'page_3', 'page_4', 'page_5', 'page_6', 'page_7', 'page_8'],
        menu: ".menu ul",
    });
};

function clickButton(e){

    let fk_sim_idx = $("#survey_user_list option:selected").val();
    let fd_type = $("#req_type").val();
    let version = $("#version").val();
    if (fk_sim_idx !== "") {
        $.ajax({
            url: "/survey/rest/sidex/duplicate/" + fk_sim_idx,
            method: "GET",
            success: function (data) {

                if (data["rtn_cd"] === "200") {
                    if (!$(e).parent().hasClass("active") && !$(e).parent().hasClass("on")) {
                        $(e).parents("li > div").addClass("active");
                        $(".layer_popup").addClass("on");
                        $(".layer_popup").focus();

                        if ($(e).parents("li > div").hasClass("airpod")) {
                            $(".layer_popup").addClass("airpod");
                        } else if ($(e).parents("li > div").hasClass("ssg")) {
                            $(".layer_popup").addClass("ssg");
                        } else if ($(e).parents("li > div").hasClass("donut")) {
                            $(".layer_popup").addClass("donut");
                        } else {
                            $(".layer_popup").addClass("starbucks");
                        }

                        let event_list_idx = $(e).parents("li").attr("class");
                        let productClass = $(e).parents("li > div").attr("class").split(" ")[0];
                        if (productClass === "active") {
                            productClass = "starbucks";
                        }

                        $.ajax({
                            url: "/survey/rest/sidex/manage",
                            method: "POST",
                            contentType: "application/json",
                            data: JSON.stringify({
                            	"fd_type":fd_type,
                                "fk_sim_idx": fk_sim_idx,
                                "fd_event_list_idx": event_list_idx,
                                "fd_gift_info": productClass,
                                "fd_version": version
                            }),
                            success: function (data) {
                                if (data["rtn_cd"] === "200") {

                                } else {
                                    alert(data["rtn_msg"]);
                                }
                            },
                            error: function () {
                                alert("네트워크 연결을 확인해주세요.");
                            }
                        });
                    }
                } else {
                    alert(data["rtn_msg"]);
                }
            },
            error: function () {

            }
        })

    } else {
        alert("설문자를 선택해주세요.");
    }
}

function hidePopup(){
    $(".layer_popup").removeClass("on airpod ssg donut starbucks");
}

// function addListRow(){
//     var text = ["m", "e", "d", "i", "v", "a", "l", "u", "e"];
//     for (var i = 0; i < 7; i++) {
//         $.each(text, function(index, item){
//             var add_list = $("<li class='li_" + index + "'><div><a href='javascript:;'><span>" + item + "</span></a></div></li>")
//             $(".event_list .row ul").append(add_list);
//         });
//     }
// }