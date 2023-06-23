var productQuickOrderHandler = {
    handleEvent: function (data) {
        alert(data['rtn_msg']);
        if (data['rtn_cd'] === '403') {
            // $(".tab_wrap .tab_list > ul > li").removeClass("on");
            // $(".tab_wrap .tab_content > ul > li").removeClass("on");
            // $(".tab_wrap .tab_list > ul > li:first-child").addClass("on");
            // $(".tab_wrap .tab_content > ul > li:first-child").addClass("on");
            // $("#quick_order .atc_step_1 .list_style_01").addClass("gallery");
            // $("#quick_order .comm_filter_wrap .btn_gall .inp_list").prop("checked", true);
            location.href = "/index";
        }
    }
};

var productQuickOrder = {
    quickOrderId: '',
    quickOrderTotalPayment: 0,
    quickOrderTotalProductPrice: 0,
    productPriceSum_discount: 0,
    quickOrderDeliveryFee: 0,
    quickOrderCouponInfo: 0,
    quickOrderCouponType: '',
    quickOrderDeliveryCouponInfo: 0,
    quickOrderPointInfo: 0,
    medicashAmount:0,
    quickOrderInfo: {

    },
    getOrderInfo: function () {
        let cart_pd_list = [];
        let event_product_yn = 'N';
        let temp_product_amount = 0;
        let event_product_cnt=0;
        $("#view_order_cart_area > .tr").each(function () {
            let cart_pd_obj = {};
            let pd_order_chk = $(this).find("input[name='pd_order_chk']").prop("checked");
            if (pd_order_chk) {
                let cart_pd_idx = $(this).find("#pd_cart_idx").val();
                let temp_tpmm_idx = $(this).find("#cart_tpmm_idx").val();
                let temp_pd_amount = Number($(this).find("#cart_pd_total_amount").val());

                cart_pd_obj["pk_idx"] = cart_pd_idx;

                if(event_product.indexOf(Number(temp_tpmm_idx))>-1){
                	event_product_yn = 'Y';
                	event_product_cnt++;
                }
                temp_product_amount += temp_pd_amount;
                cart_pd_list.push(cart_pd_obj);
            }
        });

        $(".payment_detail_medicash").css("display","none");
        $("#medicash_use_amount").val(0);
        let temp_paymet_type = $("#payment_type").val();
        let temp_payment_repeat = $("#payment_repeat").val();

        if(temp_payment_repeat == 'Y'){
            $("input:radio[name='rdo_payment']:radio[value='"+temp_paymet_type+"']").prop("checked",true);
        }


        if(event_product_yn == 'Y' && (temp_product_amount-100) <30000){
        	alert('이벤트 상품 구매시 최소 3만원 이상 주문을 하셔야 합니다.');
        	return;
        }else if(event_product_cnt>1){
        	alert('이벤트 상품은 1개만 구매 가능합니다.');
        	return;
        }

        if (cart_pd_list.length > 0) {
            $.ajax({
                url: "/quickOrder/rest/check",
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    cartPdList: cart_pd_list
                }),
                success: function (data) {
                    if (data["rtn_code"] === "200") {
                        productQuickOrder.setOrderInfo(data);
                        openLayerPop('order');
                    } else {
                        alert(data["rtn_msg"]);
                        if(data["rtn_code"]=="801"){
                        	locaion.replace("/index");
                        }
                    }
                }
            });
        } else {
            alert("주문하실 제품을 선택해주세요!");
        }
    },
    setOrderInfo: function (data) {
        let productList = data["orderProductList"];
        let deliveryFee = data["deliveryFee"];
        let couponList = data["couponList"];
        let event_delivery = data["event_delivery"];
        // let deliveryCouponList = data["deliveryCouponList"];
        let mileage = data["mileage"];
        let totalMaxUsePoint = data["totalMaxUsePoint"];
        let productPriceSum = 0;
        let productPriceSum_discount = 0;
        let orderProductInfoListHTML = "";
		let paymentMethod = data["paymentMethod"]; // 후불결제 22.04.19
		let member_event_yn = data["member_event_yn"];
		let medicash_amount = data["medicash_amount"];
        $(".order_payment_pop #order_product_info_list").empty();
        // $("input:radio[name='rdo_payment']").prop("checked", false);
        $("#order_payment").prop("checked", false);

		// 후불결제 22.04.19 후불고객만 선택할 수 있도록 함.
		if(paymentMethod == 'PM0002') {
			$(".paymentMethodDiv").css("display", "");
			$("#deferred_pay").prop("checked", true);
			$(".paymentTypeDiv").css("display", "none");
		} else {
			$(".paymentMethodDiv").css("display", "none");
            $("#advance_pay").prop("checked", true);
		}

        for (let idx = 0; idx < productList.length; idx++) {
            let product = productList[idx];
            productPriceSum  += Number(product["shop_sale_amount"]) * Number(product["fd_cnt"]);

            let orderProductInfoHTML = "";
            orderProductInfoHTML += "<li>";
            orderProductInfoHTML += "<div>";
            orderProductInfoHTML += "<input hidden name='pd_idx' value='" + product["pk_idx"] +"'/>"
            orderProductInfoHTML += "<input hidden name='pd_cnt' value='" + product["fd_cnt"] +"'/>"
            orderProductInfoHTML += "<input hidden name='pd_name' value='" + product["fd_product_name"] +"'/>"
            orderProductInfoHTML += "<div class='row'>";
            orderProductInfoHTML += "<div class='title'>" + product["fd_product_name"] + "</div>";
            orderProductInfoHTML += "<div class='stock'>" + product["fd_cnt"] + "개</div>";
            orderProductInfoHTML += "</div>";
            orderProductInfoHTML += "<div class='row'>";
            orderProductInfoHTML += "<div class='stand'>" + product["fd_product_standard"] + "</div>";
            orderProductInfoHTML += "<div class='price'>" + numberToPrice((product["shop_sale_amount"]*product["fd_cnt"])) + "원</div>";
            if(member_event_yn=='Y' && product["fd_group_type_cd"]=='PCG001'){
            	//orderProductInfoHTML += "<div class='price'>" + numberToPrice((product["fd_product_discount_amount"]*product["fd_cnt"])) + "원</div>";
            	productPriceSum_discount += Number(product["fd_product_discount_amount"]) * Number(product["fd_cnt"]);
            }else{
            	//orderProductInfoHTML += "<div class='price'>" + numberToPrice((product["shop_sale_amount"]*product["fd_cnt"])) + "원</div>";
            	productPriceSum_discount += Number(product["shop_sale_amount"]) * Number(product["fd_cnt"]);
            }
            
            orderProductInfoHTML += "</div>";
            orderProductInfoHTML += "<div class='row'>";
            orderProductInfoHTML += "<div class='manu'>" + product["fd_company_info"] + "/" + product["fd_product_unit"] + "</div>";
            orderProductInfoHTML += "</div>";
            orderProductInfoHTML += "</li>";

            orderProductInfoListHTML += orderProductInfoHTML;
        }
        $(".order_head #order_product_info_cnt").find("span").text(productList.length);

        $(".order_payment_pop #order_product_info_list").append(orderProductInfoListHTML);

        $(".order_info #order_coupon_list").empty();
        //쿠폰, 포인트
        if (couponList != null && couponList.length > 0) {
            let emptyCouponHTML = "<option id=\"\" value=\"0\" selected>" + "쿠폰을 선택해주세요." + "</option>";
            $(".order_info #order_coupon_list").append(emptyCouponHTML);
            couponList.forEach(function (v, i) {
                let couponName = "";
                if (v['fd_coupon_type'] === "UC0003") {
                    couponName = "배송비 할인 - " + v["fd_coupon_name"];
                } else if (v['fd_coupon_type'] === "UC0002") {
                    couponName = "금액 할인 - " + v["fd_coupon_name"];
                } else if (v['fd_coupon_type'] === "UC0001") {
                    couponName = "금액(%) 할인 - " + v["fd_coupon_name"];
                }
                let couponHTML = "<option id=" + v["pk_idx"] + " name=" + v["fd_coupon_type"] + " value=" + v["fd_coupon_info"] + ">" + couponName + "</option>";
                $(".order_info #order_coupon_list").append(couponHTML);
            });
        } else {
            let emptyCouponHTML = "<option id=\"\" value=\"\" selected>" + "사용가능한 쿠폰이 없습니다." + "</option>";
            $(".order_info #order_coupon_list").append(emptyCouponHTML);
        }

        if (mileage != null) {
            $("#order_point_info_input").val("");
            $("#order_point_info_text").text(numberToPrice(mileage["fd_mileage_point"]));
        }

        if (mileage["fd_mileage_point"] > totalMaxUsePoint) {
            $("#total_max_use_point").text(numberToPrice(totalMaxUsePoint));
        } else {
            $("#total_max_use_point").text(numberToPrice(mileage["fd_mileage_point"]));
        }

        productQuickOrder.quickOrderTotalProductPrice = productPriceSum;
        productQuickOrder.productPriceSum_discount = productPriceSum_discount;

        if (productPriceSum > deliveryFee["fd_delivery_fee_limit"]) {
            productQuickOrder.quickOrderDeliveryFee = 0;
        } else {
        	if(event_delivery == 'Y'){
        		productQuickOrder.quickOrderDeliveryFee = 0;
        	}else{
        		productQuickOrder.quickOrderDeliveryFee = deliveryFee["fd_delivery_fee"];
        	}
        }

        productQuickOrder.quickOrderTotalPayment = productQuickOrder.quickOrderTotalProductPrice + productQuickOrder.quickOrderDeliveryFee;
        productQuickOrder.setDefaultCouponPointInfo();
        productQuickOrder.setTotalPaymentInfo();

        productQuickOrder.quickOrderId = data["orderId"];
        productQuickOrder.medicashAmount = data["medicash_amount"];

        let TE0002 = data["TE0002"];
        let TE0004 = data["TE0004"];

        $("#TE0002").empty();
        $("#TE0002").append(TE0002["fd_content"]);
        $("#TE0004").empty();
        $("#TE0004").append(TE0004["fd_content"]);

        labbit_begin_checkout(productList);
    },
    getOrderPreInfoList: function (arg) {
        // $("#order_empty_area").css("z-index", 2);
        $.ajax({
            url: "/quickOrder/rest/info/list",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(arg),
            success: function (data) {
                if (data['rtn_cd'] == '200') {
                    productQuickOrder.setOrderInfoList(data);
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    getOrderInfoList: function (arg) {
        $.ajax({
            url: "/quickOrder/rest/info/list",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(arg),
            success: function (data) {
                if (data['rtn_cd'] == '200') {
                    productQuickOrder.setOrderInfoList(data);
                } else {
                    productQuickOrderHandler.handleEvent(data);
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    setOrderInfoList: function (arg) {
        $("#order_month_total_payment").text(numberToPrice(arg["orderTotalPayment"]) + "원");
        // let quickOrderDateInfoMap = arg["quickOrderDateInfoMap"];
        let quickOrderInfoList = arg["quickOrderInfoList"];
        let cate_list = arg["cate_list"];

        $("#order_info_list").empty();

        if (quickOrderInfoList == null || quickOrderInfoList.length === 0) {
            // let emptyOrderList = "<div className=\"empty\">" + "<p>주문내역이 없습니다.</p>" + "</div>"
            // $("#order_info_list").append(emptyOrderList);
            // $("#order_empty_area").css("z-index", 2);
        } else {
            $("#order_empty_area").css("z-index", 1);
            let currentOrderDate = "";
            let currentOrderId = "";
            let currentOrderName = "";
            let currentTotalPayment = 0;
            let totalOrderCount = 0;
            let currentOrderProductCount = 0;
            let currentPartCancelYn = "N";

            let partCancelOrderIdMap = new Map();

            // quickOrderInfoList.forEach(function (value, index) {
            //     let tempOrderId = value['fd_order_id'];
            //
            //     if (value['fd_cancel_yn'] === 'Y') {
            //     } else if (value['fd_part_cancel_yn'] === 'Y') {
            //         partCancelOrderIdMap.set(tempOrderId, 'Y');
            //     }
            // });

            quickOrderInfoList.forEach(function (value, index) {
                let tempHTML = "";
                let tempOrderDate = value['fd_order_date'];
                let tempOrderId = value['fd_order_id'];

                if (currentOrderDate !== tempOrderDate) {
                    currentOrderDate = tempOrderDate;
                    tempHTML += "<dl>";
                    tempHTML +=    "<dt>";
                    tempHTML +=        "<div class='order_date'>" + currentOrderDate + "</div>";
                    tempHTML +=    "</dt>";
                    tempHTML +=    "<dd>";
                    tempHTML +=        "<div class='order_list'>";
                    tempHTML +=            "<ul id='" + value['fd_date'] + "'>";
                    tempHTML +=            "</ul>";
                    tempHTML +=        "</div>";
                    tempHTML +=    "</dd>";
                    tempHTML += "</dl>";
                    $("#order_info_list").append(tempHTML);
                }

                if (currentOrderId !== tempOrderId) {

                    if (currentOrderProductCount > 1) {
                        let currentOrderSummary = $("#" + currentOrderId).parent().parent();
                        tempHTML = "";
                        tempHTML +=                                "<a href='javascript:;'>";
                        tempHTML +=                                    "<div class='text'>" + currentOrderName + " 외 " + (currentOrderProductCount - 1) + "건</div>"
                        tempHTML +=                                    "<div class='sum'>" + numberToPrice(currentTotalPayment) + "원</div>";
                        tempHTML +=                                "</a>";
                        currentOrderSummary.prepend(tempHTML);
                    }

                    if(currentPartCancelYn === 'Y') $("#" + currentOrderId + "_cancel_part").text('부분취소');

                    currentOrderId = tempOrderId;
                    currentTotalPayment = value["fd_total_payment"]
                    currentOrderName = value["fd_product_name"];
                    currentPartCancelYn = 'N';

                    //PP0002 - 결제 완료
                    //PP0006 - 입금 대기
                    //PP0012 - 배송준비중
                    //PP0013 - 배송완료
                    //PP0014 - 상품준비중
                    //PP0015 - 배송중

                    //오류
                    //PP0005 - 기타오류

                    tempHTML = "";
                    tempHTML +=            "<li class=''>";
                    tempHTML +=                "<div>"
                    tempHTML +=                    "<div class='txt'>"
                    tempHTML +=                        "<div class='hd g_q_t6_order_title'>"
                    tempHTML +=                            "<a href='javascript:;' class='title'>" + currentOrderId + "</a>"
                    tempHTML +=                            "<div class='date'>" + value['fd_order_date_time'] + "</div>"
                    tempHTML +=                            "<div class='badge'>"
                    /*tempHTML +=                                "<div class='time'>" + value['fd_order_date_time'] + "</div>";*/

                    let part_cancel_yn = 'N';
                    if (value['fd_state_code'] !== 'PP0003') {
                        quickOrderInfoList.forEach(function (value, index) {
                            let partOrderId = value['fd_order_id'];
                            if (partOrderId === tempOrderId) {
                                if (value['fd_cancel_yn'] === 'Y') {
                                } else if (value['fd_part_cancel_yn'] === 'Y') {
                                    part_cancel_yn = 'Y';
                                }
                            }
                        });
                    }

					// 부분취소일 경우 START
                    if (part_cancel_yn === 'Y') {
                        tempHTML +=                                "<span class='btn_p_cancel_part'>부분취소</span>";
                    }
                    // tempHTML +=                                "<span id='" + currentOrderId + "_cancel_part' class='btn_p_cancel_part'></span>";
					// 부분취소일 경우 END

                    let b_class = "";
                    let state_code = value['fd_state_code'];
                    if (state_code === "PP0002") {
                        b_class = "btn_p_complete";
                    } else if (state_code === "PP0003") {
                        b_class = "btn_p_cancel";
                    } else if (state_code === "PP0006") {
                        b_class = "btn_p_deposit";
                    } else if (state_code === "PP0012") {
                        b_class = "btn_d_ready";
                    } else if (state_code === "PP0013") {
                        b_class = "btn_d_complete";
                    } else if (state_code === "PP0014") {
                        b_class = "btn_p_ready";
                    } else if (state_code === "PP0015") {
                        b_class = "btn_d_ing";
                    }

                    tempHTML +=                                "<span class=" + b_class + ">" + value['fd_state_name'] + "</span>";

                    // tempHTML +=                                "<span class='btn_fail'>주문실패</span>";
                    // tempHTML +=                                "<span class='btn_somefail'>일부주문실패</span>";
                    tempHTML +=                            "</div>"
                    tempHTML +=                        "</div>"
                    tempHTML +=                        "<div class='bd g_q_t6_order_info'>";
                    tempHTML +=                            "<div class='accordion_02'>"
                    tempHTML +=                                "<div class='subacc'>";
                    tempHTML +=                                    "<ul id=" + currentOrderId + ">";
                    tempHTML +=                                    "</ul>";
                    tempHTML +=                                "</div>";
                    tempHTML +=                            "</div>";
                    tempHTML +=                        "</div>";
                    tempHTML +=                    "</div>";
                    tempHTML +=                "</div>";
                    tempHTML +=            "</li>";
                    $("#" + value['fd_date']).append(tempHTML);
                    currentOrderProductCount = 1;
                    totalOrderCount ++;

                } else {
                    currentOrderProductCount += 1;
                }

                tempHTML = "";
                tempHTML +=                                    "<li>";
                tempHTML +=                                        "<div>";
                tempHTML +=                                            "<div class='row'>";
                tempHTML +=                                                "<div class='title'>" + value['fd_product_name'] +"</div>";
				tempHTML +=                                                "<div class='util'>";

                if (value['fd_cancel_yn'] === 'Y') {
                    tempHTML +=                                            "<div class='stat'>" + "취소" + "</div>"; // 일부취소 고려
                } else if (value['fd_part_cancel_yn'] === 'Y') {
                    tempHTML +=                                            "<div class='stat'>" + "일부 취소" + "</div>"; // 일부취소 고려
                } else {
                    tempHTML +=                                            "<div class='stat'>" + value['fd_state_name'] + "</div>"; // 일부취소 고려
                }
				tempHTML +=                                                "</div>";
                tempHTML +=                                            "</div>";
                tempHTML +=                                            "<div class='row'>";
                tempHTML +=                                                "<div class='descript'>";
                tempHTML +=                                                    "<div class='standard'>" + value['fd_product_standard'] + "</div>";
                tempHTML +=                                                "</div>"
                tempHTML +=                                                "<div class='util'>";
                tempHTML +=                                                    "<input hidden name='pd_tpmm_idx' value=" + value['fk_tpmm_idx'] + " />"
                tempHTML +=                                                    "<input hidden name='fd_group_type_1' value=" + value['fd_group_type_1'] + " />"
                tempHTML +=                                                    "<input hidden name='fd_group_type_2' value=" + value['fd_group_type_2'] + " />"
                tempHTML +=                                                    "<input hidden name='fd_group_type_3' value=" + value['fd_group_type_3'] + " />"
                tempHTML +=                                                    "<div class='button'>" + "<button type='button' class='g_q_t6_order_re_cart' onclick='productQuickOrder.getGroupProductInfo(this)'>다시담기</button>" + "</div>";
                tempHTML +=                                                "</div>"
                tempHTML +=                                            "</div>";
                tempHTML +=                                            "<div class='row'>";
                tempHTML +=                                                "<div class='descript'>";
                tempHTML +=                                                    "<div class='manufact'>" + value['fd_company_info'] + "</div>";
                tempHTML +=                                                "</div>"
                tempHTML +=                                                "<div class='util'>";

                if (value['cancel_cnt'] > 0) {
                    tempHTML +=                                                    "<div class='amount'>" + value['fd_cnt'] + "개 (취소" + value['cancel_cnt'] +"개)</div>";
                } else {
                    tempHTML +=                                                    "<div class='amount'>" + value['fd_cnt'] + "개</div>";
                }

                tempHTML +=                                                "</div>"
                tempHTML +=                                            "</div>";
                tempHTML +=                                            "<div class='row'>";
                tempHTML +=                                                "<div class='descript'>";
                tempHTML +=                                                    "<div class='package'>"  + value['fd_product_unit'] + "</div>";
                tempHTML +=                                                "</div>"
                tempHTML +=                                                "<div class='util'>";
                tempHTML +=                                                    "<div class='price'>"  + numberToPrice(value['shop_sale_amount']) + "원</div>";
                tempHTML +=                                                "</div>"
                tempHTML +=                                            "</div>";
                tempHTML +=                                            "<div class='row'>";
                tempHTML +=                                                "<div class='descript'>";
				// 보험코드 있을 경우 START
                // tempHTML +=                                                    "<div class='insure'>보험코드</div>";
				// 보험코드 있을 경우 START
                tempHTML +=                                                "</div>"
                tempHTML +=                                            "</div>";
                tempHTML +=                                        "</div>";
                tempHTML +=                                    "</li>";
/*                tempHTML = "";
                tempHTML +=                                    "<li>";
                tempHTML +=                                        "<div>";
                tempHTML +=                                            "<div class='row'>";
                tempHTML +=                                                "<div class='title'>" + value['fd_product_name'] +"</div>";
				tempHTML +=                                                "<div class='util'>";
				tempHTML +=                                                		"<div class='stat'>" + value['fd_state_name'] + "</div>";
				tempHTML +=                                                "</div>";
                tempHTML +=                                            "</div>";
                tempHTML +=                                            "<div class='row'>";
                tempHTML +=                                                "<div class='descript'>";
                tempHTML +=                                                    "<div class='standard'>" + value['fd_product_standard'] + "</div>";
                tempHTML +=                                                    "<div class='manufact'>" + value['fd_company_info'] + "</div>";
                tempHTML +=                                                    "<div class='package'>"  + value['fd_product_unit'] + "</div>";
                tempHTML +=                                                "</div>"
                tempHTML +=                                                "<div class='util'>";

                tempHTML +=                                                    "<input hidden name='pd_tpmm_idx' value=" + value['fk_tpmm_idx'] + " />"
                tempHTML +=                                                    "<input hidden name='fd_group_type_1' value=" + value['fd_group_type_1'] + " />"
                tempHTML +=                                                    "<input hidden name='fd_group_type_2' value=" + value['fd_group_type_2'] + " />"
                tempHTML +=                                                    "<input hidden name='fd_group_type_3' value=" + value['fd_group_type_3'] + " />"
                tempHTML +=                                                    "<div class='button'>" + "<button type='button' onclick='productQuickOrder.getGroupProductInfo(this)'>다시담기</button>" + "</div>";
                tempHTML +=                                                    "<div class='amount'>" + value['fd_cnt'] + "개</div>";
                tempHTML +=                                                    "<div class='price'>"  + numberToPrice(value['shop_sale_amount']) + "원</div>";
                tempHTML +=                                                "</div>"
                tempHTML +=                                            "</div>";
                tempHTML +=                                        "</div>";
                tempHTML +=                                    "</li>";*/

                // else $("#" + currentOrderId + "_cancel_part").text('');
                $("#" + currentOrderId).append(tempHTML);

            });
            $("#btn_order_info_list").text("주문내역(" + totalOrderCount + ")");
        }
    },
    getPreWishInfoList: function (arg) {
        $("#wish_info_list").empty();
        $("#wish_info_cate_list").empty();
        $.ajax({
            url: "/quickOrder/rest/wish/group/list",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(arg),
            success: function (data) {
                if (data["rtn_cd"] == "200") {
                    let quickOrderWishList = data["quickOrderWishList"];
                    if (quickOrderWishList == null && quickOrderWishList.length === 0) {
                        $("#btn_view_wish").text("AI위시리스트(0)");
                        $("#wish_info_list").parent().siblings(".wish_empty").show();
                    } else {
                        $("#btn_view_wish").text("AI위시리스트(" + quickOrderWishList.length + ")");
                        $("#wish_info_list").parent().siblings(".wish_empty").hide();
                    }
                }
            },
            error: function (error) {
                console.log(error);
            }
        })
    },
    getWishInfoList: function (arg) {
        $("#wish_info_list").empty();
        $("#wish_info_cate_list").empty();
        $.ajax({
            url: "/quickOrder/rest/wish/group/list",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(arg),
            success: function (data) {
                if (data["rtn_cd"] == "200") {
                    productQuickOrder.setWishInfoList(data);
                } else {
                    productQuickOrderHandler.handleEvent(data);
                }
            },
            error: function (error) {
                console.log(error);
            }
        })
    },
    setWishInfoList: function (arg) {
        // let quickOrderWishListMap = arg["quickOrderWishListMap"];
        let quickOrderWishList = arg["quickOrderWishList"];
        let cate_list = arg["cate_list"];
        let cate_2_idx = arg["cate_2_idx"];

        if (quickOrderWishList == null && quickOrderWishList.length === 0) {
            // let emptyOrderList = "<div className=\"empty\">" + "<p>주문내역이 없습니다.</p>" + "</div>"
            // $("#order_info_list").append(emptyOrderList);
            $("#btn_view_wish").text("AI위시리스트(0)");
            $("#wish_info_list").parent().siblings(".wish_empty").show();
        } else {
            $("#wish_empty_area").css("z-index", 1);
            $("#btn_view_wish").text("AI위시리스트(" + quickOrderWishList.length + ")");
            $("#wish_info_list").parent().siblings(".wish_empty").hide();

            let tempOptionHTML = "<option value=''>카테고리 전체</option>";
            $("#wish_info_cate_list").append(tempOptionHTML);
            cate_list.forEach(function (value, index) {
                if (value['fk_cate_2_idx'] === Number(cate_2_idx)) {
                    tempOptionHTML = "<option selected value=\"" + value['fk_cate_2_idx'] + "\">" + value['cate_1_name'] + ">" + value['cate_2_name'] +"</option>";
                } else {
                    tempOptionHTML = "<option value=\"" + value['fk_cate_2_idx'] + "\">" + value['cate_1_name'] + ">" + value['cate_2_name'] +"</option>";
                }
                $("#wish_info_cate_list").append(tempOptionHTML);
            });

            quickOrderWishList.forEach(function (value, index) {
                let standard = value['fd_product_standard'];
                let product_name = value['fd_product_name'];
                let unit = value['fd_product_unit'];

                if (standard == null && standard === '') {
                    let group_type_1 = value['fd_group_type_1'];
                    let group_type_2 = value['fd_group_type_2'];
                    let group_type_3 = value['fd_group_type_3'];
                }

                let pd_wish_idx = "pd_wish_" + value['pk_idx'];
                let tempHTML = "";

                let group_tpmm_idx = value['group_tpmm_idx'].split(",");
                let tpmm_idx = "";
                if (group_tpmm_idx !== undefined && group_tpmm_idx.length > 0) {
                    tpmm_idx = group_tpmm_idx[0];
                } else {
                    tpmm_idx = value['group_tpmm_idx'];
                }

                // if (value['fd_order_date'] !== '') {
                //     tempHTML += "<li class='insure rebuy'>";
                // } else {
                //     tempHTML += "<li class='insure'>";
                // }

                // tempHTML += "<li class='insure rebuy'>";
				if (value['fd_order_date'] !== '') {
                    tempHTML += "<li class='rebuy'>";
                } else {
                    tempHTML += "<li class='putin'>";
                }

                if (value['fd_product_insure_code'] !== null && value['fd_product_insure_code'] !== '') {
                    tempHTML += "<li class='insure'>";
                }

                tempHTML +=     "<div>";
                // tempHTML +=         "<div class='img'>";
                // tempHTML +=             "<img src=\"" + value['view_image'] + "\" onerror=this.src=\"/resources/images/dummy/img_ready_for_image.jpg\">"
                // tempHTML +=         "</div>"
                tempHTML +=         "<div class='img'>";
                tempHTML +=             "<a href='javascript:;' class='g_q_t2_product_img' onclick='openLayerProductInfoPop(\"detail\", \"" + tpmm_idx + "\", \"" + value['group_cnt'] + "\")'>"
                tempHTML +=                 "<img src=\"" + value['view_image'] + "\" onerror=this.src=\"/resources/images/dummy/img_ready_for_image.jpg\">"
                tempHTML +=             "</a>"
                tempHTML +=         "</div>"
                tempHTML +=         "<div class='txt'>";
                tempHTML +=             "<div class='hd'>";
                tempHTML +=                 "<div class='detail'><button type='button' class='btn_detail' onclick='openLayerProductInfoPop(\"detail\", \"" + value['group_tpmm_idx'] + "\", \"" + value['group_cnt'] + "\")'>상세보기</button></div>";
                tempHTML +=                 "<a href='javascript:;' class='title g_q_t2_product_info' onclick='openLayerProductInfoPop(\"detail\", \"" + value['group_tpmm_idx'] + "\", \"" + value['group_cnt'] + "\")'>" + product_name + "</a>"
                tempHTML +=                 "<div class='badge'>";
                /*
                 * forecasting_cnt 값을 통해 AI제품 구분
                */
                /*
                if (value['forecasting_cnt'] != '' && value['forecasting_cnt'] > 0) {
                	  tempHTML +=                 "<span class='btn_recom' title='추천'>Ai추천</span>";
                }*/

				tempHTML += "<span class='btn_rebuy' title='"+ value['fd_order_date'] +"일 주문'>구매상품</span><span class='btn_putin'>담은상품</span><span class='btn_insure' title='보험 재료 상품입니다.'>보험</span>";
                /*if (value['fd_order_date'] !== '') {
                    tempHTML +=                 "<span class='btn_rebuy' title='"+ value['fd_order_date'] +"일 주문'>구매상품</span>";
                } else {
                    tempHTML +=                 "<span class='btn_putin'>담은상품</span>";
                }

                if (value['fd_product_insure_code'] !== null && value['fd_product_insure_code'] !== '') {
                    tempHTML +=                 "<span class='btn_insure' title='보험 재료 상품입니다.'>보험</span>";
                }*/

                tempHTML +=                 "</div>"
                tempHTML +=             "</div>";
                tempHTML +=             "<div class='bd g_q_t2_product_info' onclick='openLayerProductInfoPop(\"detail\", \"" + tpmm_idx + "\", \"" + value['group_cnt'] + "\")'>";
                tempHTML +=                 "<div class='manufact'>"
                tempHTML +=                     "<div class='manu'>" + value['fd_company_info'] + "</div>"

                if (value['fd_order_date'] !== '') {
                    tempHTML +=                     "<div class='date'>" + value['fd_order_date'] + "일 주문</div>";
                } else {
                    tempHTML +=                     "<div class='date'></div>";
                }

                tempHTML +=                 "</div>"
                tempHTML +=                 "<div class='standard'>"
                tempHTML +=                     "<div class='stand'> " + standard + " " + unit + "</div>"
                // tempHTML +=                     "<div class='code'> " +  + " </div>"
                tempHTML +=                 "</div>"
                tempHTML +=             "</div>";

				// LIST Anchor 형태 (AI위시리스트 규격선택)
                /*tempHTML +=             "<div class='ft'>";
                tempHTML +=                 "<button type='button' class='btn_package'>규격선택</button>";
                tempHTML +=                 "<div class='package'>";
                tempHTML +=                     "<ul id=" + pd_wish_idx + ">";
                tempHTML +=                     "</ul>";
                tempHTML +=                 "</div>";
                tempHTML +=             "</div>";*/

				// SELECT BOX 형태 (AI위시리스트 규격선택)
                tempHTML +=             "<div class='ft'>";
                tempHTML +=                 "<button type='button' class='btn_package'>규격선택</button>";
                tempHTML +=                 "<div class='package'>";
                tempHTML +=                     "<ul class=" + pd_wish_idx + ">";
                tempHTML +=                     	"<li>";
                tempHTML +=                     		"<div>";
                //tempHTML +=                     			"<select onchange='productQuickOrder.getGroupProductInfoSelectChange(this)' onclick='productQuickOrder.getGroupProductInfoSelectClick(this)' class='sel_standard g_q_t2_product_standard_1' id=" + pd_wish_idx + ">";
                tempHTML +=                     			"<select onchange='productQuickOrder.getGroupProductInfoSelectChange(this)' class='sel_standard g_q_t2_product_standard_1' id=" + pd_wish_idx + ">";
                tempHTML +=                     				"<option>규격선택</option>";
                tempHTML +=                     			"</select>";
                tempHTML +=                     		"</div>";
                tempHTML +=                     	"</li>";
                tempHTML +=                     "</ul>";
                tempHTML +=                 "</div>";
                tempHTML +=             "</div>";

                tempHTML +=         "</div>";
                tempHTML +=     "</div>";
                tempHTML += "</li>"

                $("#wish_info_list").append(tempHTML);

                let group_cnt = value["group_cnt"];
                if (group_cnt > 0) {
                    let group_tpmm_idx = value["group_tpmm_idx"];
                    $.ajax({
                        url: "/quickOrder/rest/wish/product/list",
                        method: "POST",
                        contentType: "application/json",
                        data: JSON.stringify({
                            group_tpmm_idx: group_tpmm_idx
                        }),
                        
						// LIST Anchor 형태 (AI위시리스트 규격선택)
                        /*success: function (data) {
                            let productWishList = data["productWishList"];
                            productWishList.forEach(function (value, index) {
                                tempHTML = "";
                                tempHTML += "<li>";
                                tempHTML +=     "<input hidden name='pd_tpmm_idx' value=" + value['pk_idx'] + " />"
                                tempHTML +=     "<input hidden name='fd_group_type_1' value=" + value['fd_group_type_1'] + " />"
                                tempHTML +=     "<input hidden name='fd_group_type_2' value=" + value['fd_group_type_2'] + " />"
                                tempHTML +=     "<input hidden name='fd_group_type_3' value=" + value['fd_group_type_3'] + " />"
                                tempHTML +=     "<div>";
                                tempHTML +=         "<a href='javascript:;' onclick='productQuickOrder.getGroupProductInfo(this)'>" + value['fd_product_name'] + value['fd_product_standard'] + " " + value['fd_product_unit'] +"</a>"
                                tempHTML +=     "</div>";
                                tempHTML += "</li>";
                                $("#" + pd_wish_idx).append(tempHTML);
                            });
                        }*/

						// SELECT BOX 형태 (AI위시리스트 규격선택)
						success: function (data) {
                            let productWishList = data["productWishList"];
                            productWishList.forEach(function (value, index) {
                                tempHTML = "";
                                let temp_group_1 = value['fd_group_type_1'];
                                if(temp_group_1 == ''){temp_group_1 = value['fd_product_standard'];}
                                
                                let temp_group_2 = value['fd_group_type_2'];
                                if(temp_group_2 == ''){temp_group_2 = value['fd_product_standard'];}
                                
                                let temp_group_3 = value['fd_group_type_3'];
                                if(temp_group_3 == ''){temp_group_3 = value['fd_product_standard'];}
                                
                                tempHTML +=     "<option data-idx='"+ value['pk_idx'] +"' data-group-1='"+ temp_group_1 +"' data-group-2='"+ temp_group_2 +"' data-group-3='"+ temp_group_3 +"' >" + value['fd_product_name'] + value['fd_product_standard'] + " " + value['fd_product_unit'] +"</option>"
                                //tempHTML +=     "<option data-idx='"+ value['pk_idx'] +"' data-group-1='"+ value['fd_group_type_1'] +"' data-group-2='"+ value['fd_group_type_2'] +"' data-group-3='"+ value['fd_group_type_3'] +"' >" + value['fd_product_name'] + value['fd_product_standard'] + " " + value['fd_product_unit'] +"</option>"
                                $("#" + pd_wish_idx).append(tempHTML);
                            });
                        }
                    });
                }
            });
        }
    },
    confirmOrderInfo: function () {
        let confirm_pd_List = [];
        let order_name = '';
        let use_medicash_info = parseInt($("#medicash_use_amount").val().replaceAll(",", ""));
        if(typeof(use_medicash_info) =='undefined' || use_medicash_info ==''){
        	use_medicash_info = 0;
        }
        let check_next_use = "N";

        $(".order_payment_pop #order_product_info_list").children("li").each(function (index, value) {
            let pd_idx = $(value).find("input[name='pd_idx']").val();
            let pd_cnt = $(value).find("input[name='pd_cnt']").val();
            let pd_name = $(value).find("input[name='pd_name']").val();
            let confirm_pd_obj = {};
            confirm_pd_obj["pk_idx"] = pd_idx;
            confirm_pd_obj["fd_cnt"] = pd_cnt;
            confirm_pd_List.push(confirm_pd_obj);
            if (index === 0) {
                order_name = pd_name + " 외 ";
            }
        });

        order_name = order_name + confirm_pd_List.length + "건";

		let paymentMethod = "";
		let paymentAggrementYn = "";
		
		// 후불결제 22.04.19
		if($(".order_payment_pop .payment_radio_wrap")
	            .find("input[name='payment_method']:checked").val() == "deferred_pay") {
			paymentMethod = "deferred_pay";
			paymentAggrementYn = "Y";			
	 	}else {			
	        	paymentMethod =
	            $(".order_payment_pop .payment_radio_wrap").find("input[name='rdo_payment']:checked").val();
	
	        	paymentAggrementYn = "N";
	        if ($(".order_payment_pop #order_payment").prop("checked")) {
	            paymentAggrementYn = "Y";
	        }
		}

        if(paymentMethod == 'medicash'){
            if($("#payment_repeat").is(":checked")){
                check_next_use = "Y";
            }
        }
        if(paymentMethod == 'medipay'){
            if($("#payment_repeat_medipay").is(":checked")){
                check_next_use = "Y";
            }
        }
		
		let taxYn = $(".order_payment_pop #order_invoice").find("input[name='rdo_invoice']:checked").val();

        let taxInfo = {};
        $(".order_basic #order_invoice").parent().find("dd").each(function (index, value) {
            let invoice_text = $(this).find(".text");
            let invoice_input = $(this).find(".inp_basic");
            invoice_input.val(invoice_text.text());
            taxInfo[invoice_input.attr("name")] = invoice_input.val();
        });

        let mileage = priceToNumber($("#order_point_info_input").val());
        let couponGroupIdx = $("#order_coupon_list option:selected").attr("id");

        let shipReq = $("#order_ship_req").val();
        let paymentMedicashInfo = 0; 
        productQuickOrder.quickOrderInfo = {
            confirmPdList: confirm_pd_List,
            paymentMethod: paymentMethod,
            taxYn:         taxYn,
            taxInfo:       taxInfo,
            paymentAgreementYn: paymentAggrementYn,
            mileage: mileage,
            couponGroupIdx: couponGroupIdx,
            shipReq: shipReq,
            use_medi_cash : use_medicash_info,
            check_next_use:check_next_use
        }

        if(productQuickOrder.quickOrderTotalPayment<=0  && paymentMethod != 'transfer'){
        	alert("결제금액이 없는 경우 계좌이체를 선택해주세요.");
        	return;
        }

        if(paymentMethod =='medicash'){
        	if(productQuickOrder.quickOrderTotalPayment > productQuickOrder.medicashAmount){
        		alert("메디캐시 결제 금액이 부족합니다. 충전 후 사용해주세요.");
            	return;
        	}else if(productQuickOrder.medicashAmount < use_medicash_info){
        		alert("메디캐시 사용 금액을 확인해주세요.");
            	return;
        	}else if(productQuickOrder.quickOrderTotalPayment != use_medicash_info){
        		alert("메디캐시 사용 금액을 확인해주세요.");
            	return;
        	}
        }

        let data = {
            orderId: productQuickOrder.quickOrderId,
            total_payment: productQuickOrder.quickOrderTotalPayment,
            order_name: order_name
        }

        let pointType = $("input[name='rdo_point']:checked").attr("id");
        if (pointType === "ocb_point") {
            let isCardValid = true;

            $("#ocb_card_info").children().each(function(index, value){
                let type = $(value).attr("type");
                if (type === "text") {
                    let cardInfoValue = $(value).val();
                    if (cardInfoValue === undefined || cardInfoValue.length < 4) {
                        isCardValid = false;
                    }
                }
            });

            if (!isCardValid) {
                alert("OK 캐쉬백 카드 번호를 확인해주세요.");
                return;
            }

            let ocb_agreement = $("#ocb_agreement").prop("checked");
            if (!ocb_agreement) {
                alert("OK 캐쉬백 적립 동의를 해주세요.");
                return;
            }
        }

        if (paymentMethod === 'toss_payments') {
            productQuickOrder.requestTossPayments(data);
        } else if(paymentMethod === 'settle_bank_mytongjang') {
            productQuickOrder.requestSettleBankMyTongJang(data);
        } else if (paymentMethod === 'transfer') {
            productQuickOrder.confirmOrderResult(data);
        } else if (paymentMethod === 'deferred_pay') { // 후불결제 22.04.19
            productQuickOrder.confirmOrderResult(data);
        } else if (paymentMethod === 'medicash') { 		// 메디캐시 처리
            productQuickOrder.confirmOrderResult(data);
        } else if (paymentMethod === 'medipay') { 		// 브랜드페이 처리 (메디페이)
            productQuickOrder.requestMediPay(data);
        }

    },
    confirmOrderResult: function (data) {
        let pointType = $("input[name='rdo_point']:checked").attr("id");
        productQuickOrder.quickOrderInfo['pointSaveType'] = pointType;
        productQuickOrder.quickOrderInfo['orderId'] = data['orderId'];
        let paymentMethod = productQuickOrder.quickOrderInfo['paymentMethod'];

        if (paymentMethod === 'toss_payments') {
            productQuickOrder.quickOrderInfo['paymentKey'] = data['paymentKey'];
            productQuickOrder.quickOrderInfo['paymentAmount'] = data['amount'];
        } else if (paymentMethod === 'settle_bank_mytongjang') {
            productQuickOrder.quickOrderInfo['ordNo'] = data['ordNo'];
            productQuickOrder.quickOrderInfo['resultCd'] = data['resultCd'];
            productQuickOrder.quickOrderInfo['trPrice'] = data['trPrice'];
            productQuickOrder.quickOrderInfo['mercntId'] = data['mercntId'];
            productQuickOrder.quickOrderInfo['resultMsg'] = data['resultMsg'];
            productQuickOrder.quickOrderInfo['trNo'] = data['trNo'];
            productQuickOrder.quickOrderInfo['trDay'] = data['trDay'];
            productQuickOrder.quickOrderInfo['trTime'] = data['trTime'];
        } else if (paymentMethod === 'transfer') {

        } else if (paymentMethod === 'deferred_pay') {

        } else if (paymentMethod === 'medicash') {
        		// 메디캐시
        } else if (paymentMethod === 'medipay') {
            // 메디페이 (브랜드페이)
            productQuickOrder.quickOrderInfo['paymentKey'] = data['paymentKey'];
            productQuickOrder.quickOrderInfo['paymentAmount'] = data['amount'];
        }

        let order_info = productQuickOrder.quickOrderInfo;

        $.ajax({
            url: "/quickOrder/rest/confirm",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(order_info),
            success: function (data) {
                if (data["rtn_code"] === "200") {
                    cart_list_reload($("#pd_cart_align").val());
                    productQuickOrder.setOrderResult(data);
                } else {
                    if (data['errorMessage'] !== undefined && data['errorMessage'] !== '') {
                        alert(data['errorMessage']);
                    } else {
                        alert(data["rtn_msg"]);
                    }
                    productQuickOrder.quickOrderId = data["orderId"];
                }
            }
        });
    },
    requestMediPay: function (data) {
        var userAgent = new String(navigator.userAgent);
        var windowStatus = '';
        if (userAgent.indexOf('Trident') > 0) {
            if (userAgent.indexOf('Trident/4.0') > 0) windowStatus = 'left=100, top=100, height=800, width=800, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
            else windowStatus = 'left=100, top=100, height=800, width=800, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
        }
        else if (userAgent.indexOf('AppleWebKit') > 0 && userAgent.indexOf('Chrome') == -1) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
        else windowStatus = 'left=100, top=100, height=800, width=800, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';

        let url = window.location.origin + "/quickOrder/external/medipay?" + $.param(data);
        var mchtPopup = window.open(url, 'MediPay', windowStatus);

        //확인 필요
        setTimeout(function() {
            if (mchtPopup == null) alert("팝업 허용 해주세요");
        }, 1000);

    },
    requestTossPayments: function (data) {
        var userAgent = new String(navigator.userAgent);
        var windowStatus = '';
        if (userAgent.indexOf('Trident') > 0) {
            if (userAgent.indexOf('Trident/4.0') > 0) windowStatus = 'left=100, top=100, height=800, width=800, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
            else windowStatus = 'left=100, top=100, height=800, width=800, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
        }
        else if (userAgent.indexOf('AppleWebKit') > 0 && userAgent.indexOf('Chrome') == -1) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
        else windowStatus = 'left=100, top=100, height=800, width=800, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';

        let url = window.location.origin + "/quickOrder/external/tosspayments?" + $.param(data);
        var mchtPopup = window.open(url, 'TOSS_PAYMENTS', windowStatus);

        //확인 필요
        setTimeout(function() {
            if (mchtPopup == null) alert("팝업 허용 해주세요");
        }, 1000);

    },
    requestSettleBankMyTongJang: function (data) {
        $.ajax({
            url: "/quickOrder/rest/external/settlebank/mytongjang/info",
            method: "POST",
            data: data,
            dataType: 'json',
            success: function (data) {
                var el = document.getElementsByTagName("body")[0];

                var settleForm = document.createElement("form");
                settleForm.setAttribute("id", "SETTLEBANK_FORM");
                settleForm.setAttribute("name", "SETTLEBANK_FORM");
                settleForm.setAttribute("target", "SETTLEBANK_FORM");
                settleForm.setAttribute("method", "POST");
                settleForm.setAttribute("action", data['authUrl'] + "/init.do");

                for(var key in data){
                    if (key === "callbackUrl" || key === "cancelUrl") {
                        data[key] = window.location.origin + data[key];
                    }
                    settleForm.appendChild(productQuickOrder.makeFormInput(key, data[key]));
                }
                el.appendChild(settleForm);

                var userAgent = new String(navigator.userAgent);
                var mobilePhones = new Array('iphone', 'ipod', 'android', 'blackberry', 'windows ce', 'nokia', 'webos', 'opera mini', 'sonyericsson', 'opera mobi', 'iemobile', 'windows phone', 'test_app');
                var isMobile = false;

                for( var i = 0 ; i < mobilePhones.length ; ++i ){
                    if( userAgent.toLowerCase().indexOf(mobilePhones[i]) > -1)
                    {
                        isMobile = true;
                        break;
                    }
                }

                if(!isMobile){
                    var windowStatus = '';
                    if (userAgent.indexOf('Trident') > 0) {
                        if (userAgent.indexOf('Trident/4.0') > 0) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
                        else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
                    }
                    else if (userAgent.indexOf('AppleWebKit') > 0 && userAgent.indexOf('Chrome') == -1) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
                    else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';

                    var mchtPopup = window.open('', 'SETTLEBANK_FORM', windowStatus);
                    setTimeout(function(){
                        if (mchtPopup == null) alert("팝업 허용 해주세요");
                        else settleForm.submit();
                    }, 1000);
                } else {
                    settleForm.submit();
                }
            }, error: function (error) {
                console.log(error);
            }
        })


    },
    checkOrderInfo: function () {

	// 후불결제 22.04.19 후불고객만 선택할 수 있도록 함.
		if($(".order_payment_pop .payment_radio_wrap")
	            .find("input[name='payment_method']:checked").val() == "deferred_pay") {
			// alert('후불입니다!');
		}
		else {
	        if ($(".order_payment_pop .payment_radio_wrap")
	            .find("input[name='rdo_payment']:checked").val() === undefined) {
	            alert('결제수단을 선택해주세요.');
	            return false;
	        }
	
	        if ($(".order_payment_pop #order_invoice")
	            .find("input[name='rdo_invoice']:checked").val() === undefined) {
	            alert('세금계산서 신청 여부를 선택해주세요.');
	            return false;
	        }
	
	        if (!$(".order_payment_pop #order_payment").prop("checked")) {
	            alert('결제 진행 필수 동의 사항을 확인해주세요.');
	            return false;
	        }
		}

        return true;
    },
    setTotalPaymentInfo: function () {
        let deliveryFee = productQuickOrder.quickOrderDeliveryFee;
        if (productQuickOrder.quickOrderDeliveryFee > 0) {
            deliveryFee = productQuickOrder.quickOrderDeliveryFee - productQuickOrder.quickOrderDeliveryCouponInfo;
        }

        $("#order_total_product_price").text(numberToPrice(productQuickOrder.quickOrderTotalProductPrice) + "원")
        $("#order_delivery_fee").text(numberToPrice(deliveryFee) + "원");
        $("#order_point_info").text(numberToPrice(productQuickOrder.quickOrderPointInfo) + "원");
        if(productQuickOrder.productPriceSum_discount>0){
        	$("#order_add_discount_amount").text(numberToPrice(productQuickOrder.quickOrderTotalProductPrice-productQuickOrder.productPriceSum_discount)+"원");
        }else{
        	$("#order_add_discount_amount").text("0원");
        }
        
        
        if(productQuickOrder.productPriceSum_discount>0){
        	productQuickOrder.quickOrderTotalPayment = productQuickOrder.productPriceSum_discount + deliveryFee;
            // productQuickOrder.quickOrderTotalPayment = productQuickOrder.quickOrderTotalPayment - productQuickOrder.quickOrderCouponInfo - productQuickOrder.quickOrderPointInfo;
            let couponInfo = productQuickOrder.quickOrderCouponInfo;
            if (productQuickOrder.quickOrderCouponType === "UC0001") {
                couponInfo = Math.round(productQuickOrder.quickOrderCouponInfo * productQuickOrder.quickOrderTotalPayment);
            }
            $("#order_coupon_info").text(numberToPrice(couponInfo) + "원");
            productQuickOrder.quickOrderTotalPayment = productQuickOrder.quickOrderTotalPayment - couponInfo - productQuickOrder.quickOrderPointInfo;;
        }else{
        	productQuickOrder.quickOrderTotalPayment = productQuickOrder.quickOrderTotalProductPrice + deliveryFee;
            // productQuickOrder.quickOrderTotalPayment = productQuickOrder.quickOrderTotalPayment - productQuickOrder.quickOrderCouponInfo - productQuickOrder.quickOrderPointInfo;
            let couponInfo = productQuickOrder.quickOrderCouponInfo;
            if (productQuickOrder.quickOrderCouponType === "UC0001") {
                couponInfo = Math.round(productQuickOrder.quickOrderCouponInfo * productQuickOrder.quickOrderTotalPayment);
            }
            $("#order_coupon_info").text(numberToPrice(couponInfo) + "원");
            productQuickOrder.quickOrderTotalPayment = productQuickOrder.quickOrderTotalPayment - couponInfo - productQuickOrder.quickOrderPointInfo;;
        }
        if(productQuickOrder.quickOrderTotalPayment<0){
        	productQuickOrder.quickOrderTotalPayment = 0;
        }
        $("#order_final_total_product_payment").text(numberToPrice(productQuickOrder.quickOrderTotalPayment) + "원");
    },
    setDefaultCouponPointInfo: function () {
        productQuickOrder.quickOrderDeliveryCouponInfo = 0;
        productQuickOrder.quickOrderCouponInfo = 0;
        productQuickOrder.quickOrderCouponType = '';
        productQuickOrder.quickOrderPointInfo = 0;
    },
    setOrderResult: function (data) {
        $(".btn_payment_wrap > .btn_payment").parents(".order_pop.order_payment_pop").addClass("order_complete_pop");
        $(".btn_payment_wrap > .btn_payment").parents(".order_pop.order_payment_pop").removeClass("order_payment_pop");

        $("#order_result_delivery_info #order_result_delivery_info_order_id").text(data['fd_order_id']);

        $("#order_result_addr_info #order_result_addr_info_name").text(data['fd_addr_name']);
        $("#order_result_addr_info #order_result_addr_info_detail").text(data['fd_addr_desc'] + " " + data['fd_addr_detail_desc']);
        $("#order_result_addr_info #order_result_addr_info_tel_info").text(data['fd_tel_info_desc']);

        $("#order_result_payment_info #order_result_payment_info_amount").text(numberToPrice(data['fd_total_payment']) + "원");
        $("#order_result_payment_info #order_result_payment_info_product").text(numberToPrice(data['fd_product_payment']) + "원");
        $("#order_result_payment_info #order_result_payment_info_discount_amount").text(numberToPrice(data['discount_amount']) + "원");
        
        $("#order_result_payment_info #order_result_payment_info_delivery_fee").text(numberToPrice(data['fd_delivery_fee']) + "원");
        $("#order_result_payment_info #order_result_payment_info_total").text(numberToPrice(Number(data['fd_total_payment'])) + "원");

        $("#order_result_payment_info #order_result_coupon_info").text(numberToPrice(data['fd_coupon_info']) + "원");

        $("#order_result_payment_info #order_result_point_info").text(numberToPrice(data['fd_point_info']) + "원");

        //세금계산서 정보
        if (data['fd_tax_yn'] === 'Y') {
            $("#order_result_corporate_registration_number").text(data['fd_corporate_registration_number_desc'])
            $("#order_result_corporate_representative_name").text(data['fd_corporate_representative_name_desc'])
            $("#order_result_corporate_registration_name").text(data['fd_corporate_registration_name_desc'])
            $("#order_result_corporate_business_conditions").text(data['fd_corporate_business_conditions_desc'])
            $("#order_result_corporate_industry_type").text(data['fd_corporate_industry_type_desc'])
            $("#order_result_email_info").text(data['fd_email_info_desc'])
        } else {
            $("#order_result_invoice_1").hide();
            $("#order_result_invoice_2").hide();
            $("#order_result_invoice_3").hide();
            $("#order_result_invoice_4").hide();
        }

        $("#estimate_delivery_day").text(data["fd_estimate_delivery_day"]);
        
		// 후불결제 22.04.20
		if (data["paymentMethod"] === "deferred_pay") {
			$("#order_result_payment_info_payment_name").parent().prev().children(".text").text("결제방식");
			$("#order_result_payment_info_payment_name").text("후불결제");
		 }
		else {
			//paymentMethod에 따라서 다르게
			$("#order_result_payment_info_payment_name").parent().prev().children(".text").text("결제수단");
        	$("#order_result_payment_info_payment_name").text(data["paymentMethodName"])
		}

        if (data["paymentMethod"] === "transfer") {
            $("#order_result_payment_transfer_info").show();
            $("#deposit_limit_date").text(data["fd_deposit_limit_date"] + " 까지 미입금시 취소");
        } else {
            $("#order_result_payment_transfer_info").hide();
        }

        $("#btn_order_detail").attr("onclick", "productQuickOrder.getOrderDetailInfo(" + data["fd_order_id"] + ")");

        if (data["fd_total_save_amount"] > 0) {
            $("#order_result_info_text").addClass("saving");
            $("#order_result_info_saving").text(numberToPrice(data["fd_total_save_amount"]) + "원");
        } else {
            $("#order_result_info_text").removeClass("saving");
        }

        let productList = data["orderProductInfoList"];
        labbit_purchase({
            fd_order_id: data['fd_order_id'],
            fd_total_payment: data['fd_total_payment'],
            fd_delivery_fee: data['fd_delivery_fee']
        }, productList)
    },
    makeFormInput: function(name, value) {
        var settleInput = document.createElement("input");
        settleInput.setAttribute("type", "hidden");
        settleInput.setAttribute("name", name);
        settleInput.setAttribute("value", value);
        return settleInput;
    },
    getCurrentOrderInfoListDate: function () {
        let curMonth = $("#quick_order .total_month_wrap .inp_month").datepicker("getDate");
        let startMonth = new Date(curMonth.getFullYear(), curMonth.getMonth(), 1);
        let endMonth = new Date(curMonth.getFullYear(), curMonth.getMonth() + 1, 0);
        let startDate = startMonth.getFullYear() + "-" + (startMonth.getMonth() + 1) + "-" + startMonth.getDate();
        let endDate = endMonth.getFullYear() + "-" + (endMonth.getMonth() + 1) + "-" + endMonth.getDate();
        return {
            start_date: startDate,
            end_date: endDate
        }
    },
    getGroupProductInfo: function (value) {
        let tpmm_idx = $(value).parent().siblings("input[name='pd_tpmm_idx']").val();
        let fd_group_type_1 = $(value).parent().siblings("input[name='fd_group_type_1']").val();
        let fd_group_type_2 = $(value).parent().siblings("input[name='fd_group_type_2']").val();
        let fd_group_type_3 = $(value).parent().siblings("input[name='fd_group_type_3']").val();

        var req_data = {
            req_group_type_value_1 : fd_group_type_1 ,
            req_group_type_value_2 : fd_group_type_2 ,
            req_group_type_value_3 : fd_group_type_3 ,
            req_pd_group_idx : tpmm_idx ,
            req_type:"view"
        };

        $.ajax({
            url : '/quickOrder/rest/groupProduct/info',
            type : 'post',
            cache : false,
            data : req_data,
            dataType : 'json',
            success:function(data){
                if(data.rtn_cd == '200'){
                    product_info_view(data);
                }else{
                    productQuickOrderHandler.handleEvent(data);
                }
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    },

	// SELECT BOX 형태일 때 함수 추가 (AI위시리스트 갤러리 형태에서 규격선택을 셀렉트 박스로 변경 후 onchange로 실행 시)
    getGroupProductInfoSelectChange: function (value) {
        let tpmm_idx = $(value).find(":selected").data("idx");
        let fd_group_type_1 = $(value).find(":selected").data("group-1");
        let fd_group_type_2 = $(value).find(":selected").data("group-2");
        let fd_group_type_3 = $(value).find(":selected").data("group-3");

		if(tpmm_idx != null){
	        var req_data = {
	            req_group_type_value_1 : fd_group_type_1 ,
	            req_group_type_value_2 : fd_group_type_2 ,
	            req_group_type_value_3 : fd_group_type_3 ,
	            req_pd_group_idx : tpmm_idx ,
	            req_type:"type_2"
	        };
	
	        $.ajax({
	            url : '/quickOrder/rest/groupProduct/info',
	            type : 'post',
	            cache : false,
	            data : req_data,
	            dataType : 'json',
	            success:function(data){
	                if(data.rtn_cd == '200'){
	                    product_info_view(data);
	                }else{
	                    productQuickOrderHandler.handleEvent(data);
	                }
	            },
	            error:function(request,status,error){
	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	        });
		}
    },

	// SELECT BOX 형태일 때 함수 추가 (AI위시리스트 갤러리 형태에서 규격선택을 셀렉트 박스로 변경 후 onclick으로 실행 시)
    getGroupProductInfoSelectClick: function (value) {
        let tpmm_idx = $(value).find(":selected").data("idx");
        let fd_group_type_1 = $(value).find(":selected").data("group-1");
        let fd_group_type_2 = $(value).find(":selected").data("group-2");
        let fd_group_type_3 = $(value).find(":selected").data("group-3");

		if(tpmm_idx != null){
	        var req_data = {
	            req_group_type_value_1 : fd_group_type_1 ,
	            req_group_type_value_2 : fd_group_type_2 ,
	            req_group_type_value_3 : fd_group_type_3 ,
	            req_pd_group_idx : tpmm_idx ,
	            req_type:"type_2"
	        };
	
	        $.ajax({
	            url : '/quickOrder/rest/groupProduct/info',
	            type : 'post',
	            cache : false,
	            data : req_data,
	            dataType : 'json',
	            success:function(data){
	                if(data.rtn_cd == '200'){
	                    product_info_view(data);
	                }
	            },
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	        });
		}
    },
    getOrderDetailInfo: function (value) {
        location.href = "/order/detail/" + value;
    },
    addWishInfo: function (wishInfo) {
        const thisWish = $("#view_order_area");
        const delAlert = $(".wish_del_pop");

        if(thisWish.hasClass("wish")){
            delAlert.addClass("on");
        }else{
            thisWish.addClass("wish");

            wishInfo["fd_del_yn"] = "N";

            $.ajax({
                url: "/wish/rest/manage",
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify(wishInfo),
                success: function (data) {
                    if (data["rtn_code"] === "200") {
                        $("#wish_info").empty();
                        let wishInfoHTML = "<button type='button' onclick='productQuickOrder.addWishInfo("+ JSON.stringify(data["wish_info"]) +")'></button>";
                        $("#wish_info").append(wishInfoHTML);
                        $("#wish_delete_button").attr("onclick", "productQuickOrder.deleteWishInfo("+ JSON.stringify(data["wish_info"]) +" )")

                        let arg = {};
                        productQuickOrder.getWishInfoList(arg);
                    } else {
                        const thisWish = $("#view_order_area");
                        const delAlert = $(".wish_del_pop");
                        thisWish.removeClass("wish");
                        delAlert.removeClass("on");
                    }
                },
                error: function (error) {
                    console.log(error);
                    const thisWish = $("#view_order_area");
                    const delAlert = $(".wish_del_pop");
                    thisWish.removeClass("wish");
                    delAlert.removeClass("on");
                }
            });
        }

        //wish 리스트 새로 고침
    },
    deleteWishInfo: function (wishInfo) {
        // const thisWish = $("#view_order_area");
        // const delAlert = $(".wish_del_pop");
        // thisWish.removeClass("wish");
        // delAlert.removeClass("on");
        wishInfo["fd_del_yn"] = "Y";
        $.ajax({
            url: "/wish/rest/manage",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(wishInfo),
            success: function (data) {
                if (data["rtn_code"] === "200") {
                    $("#wish_info").empty();
                    let wishInfoHTML = "<button type='button' onclick='productQuickOrder.addWishInfo("+ JSON.stringify(data["wish_info"]) +")'></button>";
                    $("#wish_info").append(wishInfoHTML);

                    $("#wish_delete_button").attr("onclick", "productQuickOrder.deleteWishInfo("+ JSON.stringify(data["wish_info"]) +" )")
                    const thisWish = $("#view_order_area");
                    thisWish.removeClass("wish");

                    let arg = {};
                    productQuickOrder.getWishInfoList(arg);
                }
                const delAlert = $(".wish_del_pop");
                delAlert.removeClass("on");
            },
            error: function (error) {
                const delAlert = $(".wish_del_pop");
                delAlert.removeClass("on");
            }
        });

        //wish 리스트 새로 고침
    },
}

$(function () {
    $(".btn_order_wrap > .btn_order").on("click", function () {
        productQuickOrder.getOrderInfo();
    });

    $(".btn_payment_wrap > .btn_payment").off().on("click", function () {
        if (productQuickOrder.checkOrderInfo()) {
            //ocb check
            productQuickOrder.confirmOrderInfo();
        }
    });

    $(".btn_complete_wrap > #btn_order_continue").on("click", function () {

        $(".btn_payment_wrap > .btn_payment")
            .parents(".order_pop.order_complete_pop").addClass("order_payment_pop");
        $(".btn_payment_wrap > .btn_payment")
            .parents(".order_pop.order_complete_pop").removeClass("order_complete_pop");

        let currentOrderInfoListDate = productQuickOrder.getCurrentOrderInfoListDate();
        let arg = {
            start_date: currentOrderInfoListDate["start_date"],
            end_date: currentOrderInfoListDate["end_date"]
        }
        // productQuickOrder.getOrderInfoList(arg);
    });

    $("#btn_order_close").on("click", function () {
        $(".btn_payment_wrap > .btn_payment")
            .parents(".order_pop.order_complete_pop").addClass("order_payment_pop");
        $(".btn_payment_wrap > .btn_payment")
            .parents(".order_pop.order_complete_pop").removeClass("order_complete_pop");
    });

    $(".order_box #btn_modify_tax_info").on("click", function () {
        if ($(this).hasClass("on")) {
            $(this).removeClass("on");
            $(".order_basic #order_invoice").parent().find("dd").each(function (index, value) {
                let invoice_text = $(this).find(".text");
                let invoice_input = $(this).find(".inp_basic");
                invoice_text.prop("hidden", false);
                invoice_input.prop("hidden", true);
                invoice_text.text(invoice_input.val());
            });
            $(this).text("수정하기");
        } else {
            $(this).addClass("on");
            $(".order_basic #order_invoice").parent().find("dd").each(function (index, value) {
                let invoice_text = $(this).find(".text");
                let invoice_input = $(this).find(".inp_basic");
                invoice_text.prop("hidden", true);
                invoice_input.prop("hidden", false);
                invoice_input.val(invoice_text.text());
            });
            $(this).text("저장");
        }
    });

    $(".order_basic #order_invoice").find("input[name='rdo_invoice']").on("change", function () {
        let invoice_yn = $(this).val();
        if (invoice_yn === 'Y') {
            $(".order_basic #order_result_invoice").find("#rdo_result_invoice_Y").prop("checked", true);
        } else {
            $(".order_basic #order_result_invoice").find("#rdo_result_invoice_N").prop("checked", true);
        }
    });

    $("#order_coupon_list").on("change", function () {
        $("#order_point_info_input").val("0");
        $("#medicash_use_amount").val(0);
        let coupon = $(this).find("option:selected");
        let coupon_type = coupon.attr("name");
        let coupon_info = coupon.val();

        productQuickOrder.setDefaultCouponPointInfo();

        if (coupon_type === "UC0003") {
            productQuickOrder.quickOrderDeliveryCouponInfo = coupon_info;
            productQuickOrder.quickOrderCouponType = "";
        } else {
            productQuickOrder.quickOrderCouponInfo = coupon_info;
            productQuickOrder.quickOrderCouponType = coupon_type;
        }

        productQuickOrder.setTotalPaymentInfo();
    });

    $("#order_point_info_input").on("change", function () {
        //$("#order_coupon_list").val("0").prop("selected", true);
        $("#order_coupon_list option").eq(0).prop("selected", true);

        let pd_list = [];
        let mileage = $("#order_point_info_input").val().trim().replaceAll(/(\.|,|\s)/g, "");
        $(".order_payment_pop #order_product_info_list").children("li").each(function (index, value) {
            let pd_idx = $(value).find("input[name='pd_idx']").val();
            let pd_cnt = $(value).find("input[name='pd_cnt']").val();
            let pd_name = $(value).find("input[name='pd_name']").val();
            let confirm_pd_obj = {};
            confirm_pd_obj["pk_idx"] = pd_idx;
            confirm_pd_obj["fd_cnt"] = pd_cnt;
            pd_list.push(confirm_pd_obj);
        });

        if (mileage !== '' && mileage != null) {
            $.ajax({
                url: "/quickOrder/rest/point/check",
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    mileage: mileage,
                    pdList: pd_list
                }),
                success: function (data) {
                    productQuickOrder.setDefaultCouponPointInfo();
                    if (data["rtn_code"] !== "200") {
                        $("#order_point_info_input").val("");
                        alert(data["rtn_msg"]);
                    } else {
                        productQuickOrder.quickOrderPointInfo = mileage;
                        $("#order_point_info_input").val(numberToPrice(mileage));
                    }
                    productQuickOrder.setTotalPaymentInfo();
                }
            });
        } else {
            productQuickOrder.quickOrderPointInfo = 0;
            productQuickOrder.setTotalPaymentInfo();
        }

    });

    //포인트 전체 사용
    $("#order_point_info_input").siblings("button.btn_basic").on("click", function () {
        //$("#order_coupon_list").val("0").prop("selected", true);
        $("#order_coupon_list option").eq(0).prop("selected", true);
        $("#medicash_use_amount").val(0);
        let pd_list = [];
        $(".order_payment_pop #order_product_info_list").children("li").each(function (index, value) {
            let pd_idx = $(value).find("input[name='pd_idx']").val();
            let pd_cnt = $(value).find("input[name='pd_cnt']").val();
            let pd_name = $(value).find("input[name='pd_name']").val();
            let confirm_pd_obj = {};
            confirm_pd_obj["pk_idx"] = pd_idx;
            confirm_pd_obj["fd_cnt"] = pd_cnt;
            pd_list.push(confirm_pd_obj);
        });

        $.ajax({
            url: "/quickOrder/rest/point/check",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                pdList: pd_list
            }),
            success: function (data) {
                productQuickOrder.setDefaultCouponPointInfo();
                if (data["rtn_code"] !== "200") {
                    $("#order_point_info_input").val("");
                    alert(data["rtn_msg"]);
                } else {
                    productQuickOrder.quickOrderPointInfo = data["mileage"];
                    $("#order_point_info_input").val(numberToPrice(data["mileage"]));
                }
                productQuickOrder.setTotalPaymentInfo();
            }
        });
    });

    $("#quick_order .total_month_wrap .inp_month").on("change", function () {
        // let startMonth = $(this).datepicker("getDate");
        // let endMonth = new Date(startMonth.getFullYear(), startMonth.getMonth() + 1, 0);
        // let startDate = startMonth.getFullYear() + "-" + (startMonth.getMonth() + 1) + "-" + startMonth.getDate();
        // let endDate = endMonth.getFullYear() + "-" + (endMonth.getMonth() + 1) + "-" + endMonth.getDate();
        $("#insure_code_yn").prop("checked", false);
        let currentOrderInfoListDate = productQuickOrder.getCurrentOrderInfoListDate();
        let arg = {
            start_date: currentOrderInfoListDate["start_date"],
            end_date: currentOrderInfoListDate["end_date"]
        }
        productQuickOrder.getOrderInfoList(arg);
    });

    $("#btn_order_info_list").on("click", function () {
        $("#insure_code_yn").prop("checked", false);
        let currentOrderInfoListDate = productQuickOrder.getCurrentOrderInfoListDate();
        let arg = {
            start_date: currentOrderInfoListDate["start_date"],
            end_date: currentOrderInfoListDate["end_date"]
        }
        productQuickOrder.getOrderInfoList(arg);
    });

    $("#order_info_list_search_input").on("keydown", function (e) {
        $("#insure_code_yn").prop("checked", false);
        if (e.keyCode === 13) {
            let currentOrderInfoListDate = productQuickOrder.getCurrentOrderInfoListDate();
            let product_name = $("#order_info_list_search_input").val();
            let arg = {
                product_name: product_name,
                start_date: currentOrderInfoListDate["start_date"],
                end_date: currentOrderInfoListDate["end_date"]
            }
            productQuickOrder.getOrderInfoList(arg);
        }
    });

    $("#btn_order_info_list_search").on("click", function () {
        $("#insure_code_yn").prop("checked", false);
        let currentOrderInfoListDate = productQuickOrder.getCurrentOrderInfoListDate();
        let product_name = $("#order_info_list_search_input").val();
        let arg = {
            product_name: product_name,
            start_date: currentOrderInfoListDate["start_date"],
            end_date: currentOrderInfoListDate["end_date"]
        }
        productQuickOrder.getOrderInfoList(arg);
    });

    $("#insure_code_yn").on("change", function () {
        let insure_code_yn = 'N';
        if ($(this).prop("checked")) {
            insure_code_yn = 'Y';
        }
        let currentOrderInfoListDate = productQuickOrder.getCurrentOrderInfoListDate();
        let arg = {
            start_date: currentOrderInfoListDate["start_date"],
            end_date: currentOrderInfoListDate["end_date"],
            insure_code_yn: insure_code_yn
        }
        productQuickOrder.getOrderInfoList(arg);
    });

    $("#wish_list_search_input").on("keydown", function (e) {
        if (e.keyCode === 13) {
            let product_name = $("#wish_list_search_input").val();
            let cate_2_idx = $("#wish_info_cate_list option:selected").val();
            let arg = {
                product_name: product_name,
                cate_2_idx: cate_2_idx
            }
            productQuickOrder.getWishInfoList(arg);
        }
    });

    $("#wish_info_cate_list").on("change", function () {
        let product_name = $("#wish_list_search_input").val();
        let cate_2_idx = $("#wish_info_cate_list option:selected").val();
        let arg = {
            product_name: product_name,
            cate_2_idx: cate_2_idx
        }
        productQuickOrder.getWishInfoList(arg);
    });

    $("#btn_wish_list_search").on("click", function () {
        let product_name = $("#wish_list_search_input").val();
        let cate_2_idx = $("#wish_info_cate_list option:selected").val();
        let arg = {
            product_name: product_name,
            cate_2_idx: cate_2_idx
        }
        productQuickOrder.getWishInfoList(arg);
    });

    $(document).on("click", ".accordion_02 > a", function () {
        if ($(this).parents(".accordion_02").hasClass("off")) {
            $(this).parents(".accordion_02").removeClass("off");
            $(this).siblings(".subacc").stop().slideDown(300);
        } else {
            $(this).parents(".accordion_02").addClass("off");
            $(this).siblings(".subacc").stop().slideUp(300);
        }
    });

    $("#btn_view_wish").on("click", function () {
        let arg = {};
        productQuickOrder.getWishInfoList(arg);
    });

    $("#btn_request_product_info").on("click", function () {
        let pd_info_idx = $("#request_product_info_idx").val();
        $.ajax({
            url: "/quickOrder/rest/product/info/" + pd_info_idx,
            // method: "POST",
            success: function (data) {
                // if (data["rtn_code"] !== "200") {
                //
                // }
                alert(data["rtn_msg"]);
            }
        })
    });

    $("#btn_member_purchase_list").on("click", function () {
        location.href = "/member/purchase/list";
    });

    $("#btn_member_addr_list").on("click", function () {
        location.href = "/member/addr/list";
    });

    $(document).on("keyup", ".inp_stock_wrap > .inp_stock", function () {
        let value = $(this).val().trim();
        let rgx = /^\d+$/;
        if (!rgx.test(value)) {
            value = value.match(rgx);
            $(this).val(value);
        }
    });

    let arg = {};
    productQuickOrder.getPreWishInfoList(arg);
    let currentOrderInfoListDate = productQuickOrder.getCurrentOrderInfoListDate();
    arg = {
        start_date: currentOrderInfoListDate["start_date"],
        end_date: currentOrderInfoListDate["end_date"]
    }
    productQuickOrder.getOrderPreInfoList(arg);
    
	$("#btn_reset_medicash_charge").off().on("click",function(){
		$("#medicash_use_amount").val(0);
		$.ajax({
            url: "/quickOrder/rest/check/medicash",
            method: "POST",
            contentType: "application/json",
            success: function (data) {
                if (data.rtn_code == "200"){
                	if(data.m_cash != null){
                		$("#user_medicash_info").text(numberToPrice(data.m_cash.fd_total_amount));
                		productQuickOrder.medicashAmount = data.m_cash.fd_total_amount;
                	}else{
                		$("#user_medicash_info").text("0");
                		productQuickOrder.medicashAmount = 0;
                	}
                } else {
                   alert(data.rtn_msg);
                }
            }
        });
	});

	$("#medicash_use_amount").on("click",function(){
		if($(this).val()==0){
			$(this).val('')
		}
	});
	$("#medicash_use_amount").on("blur",function(){
		if($(this).val()==0){
			$(this).val('')
		}
	});
	
    $("#btn_use_all_medicash").on("click",function(){
    	$.ajax({
    		url: "/quickOrder/rest/check/medicash",
            method: "POST",
            contentType: "application/json",
            success: function (data) {
                if (data.rtn_code == "200"){
                	if(data.m_cash != null){
                		$("#user_medicash_info").text(numberToPrice(data.m_cash.fd_total_amount));
                		productQuickOrder.medicashAmount = data.m_cash.fd_total_amount;
                		let temp_use_medicash = productQuickOrder.medicashAmount;
                		if(productQuickOrder.quickOrderTotalPayment >productQuickOrder.medicashAmount){
                			$("#medicash_use_amount").val(0);
                			alert("메디캐시 결제 금액이 부족합니다. 충전 후 사용해주세요.");
                		}else{
                			$("#medicash_use_amount").val(productQuickOrder.quickOrderTotalPayment.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
                		}
                	}else{
                		$("#user_medicash_info").text("0");
                		productQuickOrder.medicashAmount = 0;
                		$("#medicash_use_amount").val(0);
                	}
                } else {
                   alert(data.rtn_msg);
                }
            }
        });
    });

});
