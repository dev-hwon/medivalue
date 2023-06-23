var ocb = {
    saveCardInfo: function () {
        let isCardValid = true;
        let cardInfo = "";
        let ocbState = "";

        let ocb_agreement = $("#ocb_agreement").prop("checked");

        if (!ocb_agreement) {
            alert("OK 캐쉬백 적립 동의를 해주세요.");
            return;
        } else {
            ocb_agreement = "Y";
        }

        $("#ocb_card_info").children().each(function(index, value){
            let type = $(value).attr("type");
            if (type === "text" || type === "password") {
                let cardInfoValue = $(value).val();
                if (cardInfoValue === undefined || cardInfoValue.length < 4) {
                    isCardValid = false;
                }
                cardInfo += $(value).val();
            }
        });

        if (isCardValid) {

            let message = "";
            let current_ocb_card_info = $("#current_ocb_card_info").val();

            if ($("#ocb_info_save").hasClass("ocb_info_save")) {
                ocbState = 3;
                message = "카드 번호를 저장하시겠습니까?";
            } else if ($("#ocb_info_save").hasClass("ocb_info_delete")) {
                ocbState = 2;
                message = "카드 번호를 삭제하시겠습니까?";
            }

            let cardConfirm = confirm(message);
            if (cardConfirm) {
                $.ajax({
                    url: "/ocb/card/manage",
                    method: "POST",
                    contentType: "application/json",
                    accept: "*/*",
                    data: JSON.stringify({
                        ocb_state: ocbState,
                        ocb_card_info: cardInfo,
                        // current_ocb_card_info: current_ocb_card_info,
                        ocb_agreement: ocb_agreement
                    }),
                    success: function (data) {
                        alert(data["rtn_msg"]);
                        ocb.initCardInfo();
                    }
                });
            }

        } else {
            alert("카드 번호를 확인해주세요");
        }
    },
    initCardInfo: function () {
        $.ajax({
            url: "/ocb/card/info",
            method: "GET",
            contentType: "application/json",
            accept: "*/*",
            success: function (data) {
                let memberOcbCardInfo = data["memberOcbCardInfo"];
                if (memberOcbCardInfo !== null && memberOcbCardInfo["ocb_card_info"] !== "") {
                    $("#ocb_agreement").prop("checked", true);
                    $("#ocb_agreement").prop("disabled", true);

                    let cardInfo = memberOcbCardInfo["ocb_card_info"];

                    $("#current_ocb_card_info").val(cardInfo);
                    $("#ocb_card_info").children().each(function(index, value) {
                        let type = $(value).attr("type");
                        if (type === "text" || type === "password") {
                            $(value).val(cardInfo.substring(index * 4, (index + 1) * 4));
                            $(value).prop("readonly", true);
                        }
                        if (type === "button") {
                            $("#ocb_info_save").text("번호삭제");
                            $("#ocb_info_save").removeClass("ocb_info_save");
                            $("#ocb_info_save").addClass("ocb_info_delete");
                        }
                    });
                } else {
                    $("#ocb_agreement").prop("checked", false);
                    $("#ocb_agreement").prop("disabled", false);

                    $("#ocb_card_info").children().each(function(index, value) {
                        let type = $(value).attr("type");
                        if (type === "text" || type === "password") {
                            $(value).val("");
                            $(value).prop("readonly", false);
                        }
                        if (type === "button") {
                            $("#ocb_info_save").text("번호저장");
                            $("#ocb_info_save").removeClass("ocb_info_delete");
                            $("#ocb_info_save").addClass("ocb_info_save");
                        }
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
}

$(function () {
    $(".ocb_card_number").on("keyup", function (e) {
        let value = $(this).val();

        value = value.replaceAll(/[^\d]+/g, "");

        if (value.length > 4) {
            value = value.substring(0, 4);
        }

        $(this).val(value);
    });

    $("#ocb_info_save").on("click", function () {
        ocb.saveCardInfo();
    });

    ocb.initCardInfo();
});