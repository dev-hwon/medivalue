var quickOrderProductSearch = {
    currentPage: 2,
    // nextPage: 2,
    loading: false,
    searchBarReqList: [],
    getProductSearchList: function () {
        let params = new URLSearchParams(location.search);
        let cate_1_idx = params.get("cate_1_idx") != null ? params.get("cate_1_idx") : "";
        let cate_2_idx = params.get("cate_2_idx") != null ? params.get("cate_2_idx") : "";

        let searchString = $("#searchString").val();
        let searchAddCategory = $("#search_cate option:selected").val();

        let currentPage = quickOrderProductSearch.currentPage;
        let loading = quickOrderProductSearch.loading;

        if (!loading) {
            quickOrderProductSearch.loading = true;
            $.ajax({
                url: "/quickOrder/rest/search/list",
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    page: currentPage,
                    searchString: searchString,
                    searchAddCategory: searchAddCategory,
                    cate_1_idx: cate_1_idx,
                    cate_2_idx: cate_2_idx
                }),
                success: function (data) {
                    quickOrderProductSearch.drawProductSearchList(data['list']);
                    quickOrderProductSearch.currentPage += 1;
                    quickOrderProductSearch.loading = false;
                }
            });
        }
    },
    setProductSearchList: function (arg) {
        let productList = $("#product_search_content_list > ul");
        let tutorial_temp_li = productList.find(".tutorial_temp");
        // productList.empty();
        let productInfoList = arg["list"];

    },
    getProductSearchAddList: function (arg) {
        $.ajax({
            url: "/quickOrder/rest/search/list",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(arg),
            success: function (data) {
                // quickOrderProductSearch.nextPage = quickOrderProductSearch.nextPage + 1;
                quickOrderProductSearch.setProductSearchAddList(data);
            }
        });
    },
    setProductSearchAddList: function (arg) {
        let productList = $("#product_search_content_list > ul");
        let tutorial_temp_li = productList.find(".tutorial_temp");
        productList.empty();
        let productInfoList = arg["list"];
        if (productInfoList != null && productInfoList.length > 0) {
            $("#product_search_list .search_empty").hide();
            quickOrderProductSearch.drawProductSearchList(productInfoList);
        } else {

            let searchAddString = arg["searchAddString"];
            let searchString = arg["searchString"];
            if (searchAddString != null && searchAddString != "") {
                searchString = searchAddString;
            }
            if (searchString !== "") {
                $("#product_search_list .search_empty").show();
                $("#empty_product_search_list").css("z-index", 1);
                $("#product_search_list .search_empty").find(".text > span").text("'" + searchString + "'");
            } else {
                $("#empty_product_search_list").css("z-index", 2);
            }

        }

    },
    drawProductSearchList: function (productInfoList) {
        let productList = $("#product_search_content_list > ul");    
        productInfoList.forEach(function (value, index) {
            let group_tpmm_idx = value['group_tpmm_idx'].split(",");
            if (group_tpmm_idx !== undefined && group_tpmm_idx.length > 0) {
                let tpmm_idx = group_tpmm_idx[0];
                let tempHTML = "";
                tempHTML += "<li class='insure rebuy'>";
                tempHTML += "<div>";
                tempHTML += "<div class='img'>";
                tempHTML += "<a href='javascript:;' onclick='openLayerProductInfoPop(\"detail\", \"" + tpmm_idx + "\", \"" + value['group_cnt'] + "\")'>"
                tempHTML += "<img src=\"" + value['view_image'] + "\" onerror=this.src=\"/resources/images/dummy/img_ready_for_image.jpg\">"
                tempHTML += "</a>"
                tempHTML += "</div>";
                tempHTML += "<div class='txt'>";
                tempHTML += "<div class='hd'>";
                tempHTML += "<div class='detail'><button type='button' class='btn_detail' onclick='openLayerProductInfoPop(\"detail\", \"" + tpmm_idx + "\", \"" + value['group_cnt'] + "\")'>상세보기</button></div>";
                tempHTML += "<a href='javascript:;' class='title' onclick='openLayerProductInfoPop(\"detail\", \"" + tpmm_idx + "\", \"" + value['group_cnt'] + "\")'>" + value['fd_product_name'] + "</a>";
                tempHTML += "<div class='badge'>";

                if (value['lately_order_date'] != null && value['lately_order_date'] !== '') {
                    tempHTML +=     "<span class='btn_rebuy'>구매상품</span>"
                }

                if (value['fd_product_insure_code'] != null && value['fd_product_insure_code'] !== '') {
                    tempHTML +=     "<span class='btn_insure' title='보험 재료 상품입니다.'>보험</span>";
                }

                tempHTML += "</div>";
                tempHTML += "</div>";
                tempHTML += "<div class='bd'>";
                tempHTML += "<div class='manufact'>";
                tempHTML += "<div class='manu'>" + value['fd_company_info'] + "</div>";
                tempHTML += "<div class='date'>" + value['lately_order_date'] + "</div>";
                tempHTML += "</div>";
                tempHTML += "<div class='standard'>";
                tempHTML += "<div class='stand'>" + value['product_standard_info'] + " " + value['fd_product_unit'] + "</div>";
                tempHTML += "<div class='code'>";

                if (value['group_cnt'] === 1) {
                    tempHTML += value['group_medi_product_code'];
                }

                tempHTML += "</div>";
                tempHTML += "</div>";
                tempHTML += "</div>";

                if (value['group_cnt'] >= 1) {
                    tempHTML += "<div class='ft'>";
                    tempHTML += "<div class='package'>";
                    tempHTML += "<ul>";
                    tempHTML += "<li>";
                    tempHTML += "<div>"
                    tempHTML += "<input type='hidden' name='pd_group_idx' id='pd_group_idx' value=\"" + group_tpmm_idx + "\">"
                    tempHTML += "<select name='pd_group_type_1' id='pd_group_type_1' class='sel_standard'>"
                    tempHTML += "<option value=''>규격선택</option>"

                    let groupTypeArr_1 = ""
                    if (value['group_type_1'] === undefined || value['group_type_1'] === "") {
                        // groupTypeArr_1 = value['fd_product_name'].split("|");
                        groupTypeArr_1 = '단일규격'.split("|");
                    } else {
                        groupTypeArr_1 = value['group_type_1'].split("|");
                    }

                    groupTypeArr_1.forEach(function (groupInfo, index) {
                        tempHTML += "<option value=\"" + groupInfo + "\">" + groupInfo + "</option>"
                    });

                    tempHTML += "</select>";
                    tempHTML += "</div>"
                    tempHTML += "</li>";

                    if (value['group_check_2'] > 0) {
                        tempHTML += "<li>";
                        tempHTML +=     "<div>";
                        tempHTML +=        "<select name='pd_group_type_2' id='pd_group_type_2' class='sel_standard'>";
                        tempHTML +=             "<option value=''>규격선택</option>";
                        tempHTML +=        "</select>";
                        tempHTML +=     "</div>";
                        tempHTML += "</li>";
                    }

                    if (value['group_check_3'] > 0) {
                        tempHTML += "<li>";
                        tempHTML +=     "<div>";
                        tempHTML +=        "<select name='pd_group_type_3' id='pd_group_type_3' class='sel_standard'>";
                        tempHTML +=             "<option value=''>규격선택</option>";
                        tempHTML +=        "</select>";
                        tempHTML +=     "</div>";
                        tempHTML += "</li>";
                    }

                    tempHTML += "</ul>";
                    tempHTML += "</div>";
                    tempHTML += "</div>";
                }

                tempHTML += "</div>";
                tempHTML += "</div>";
                tempHTML += "</li>";
                productList.append(tempHTML);
            }
        });
    },
    getProductSearchBarList: function (arg) {
        let searchBarReq =
            $.ajax({
                url: "/quickOrder/rest/searchbar/list",
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify(arg),
                success: function (data) {
                    if (data["rtn_code"] === "200") {
                        let searchString = $("#searchString").val();
                        if ((searchString != null && searchString.length > 2)) {
                            quickOrderProductSearch.setProductSearchBarList(data);
                        }
                    }

                }
            });
    },
    setProductSearchBarList: function (arg) {
        let productList = arg["list"];
        if (productList != null && productList.length > 0) {
            $("#search_list").empty();
            productList.forEach(function (value, index) {
                let group_tpmm_idx = value['group_tpmm_idx'].split(",")[0];
                let group_type_1 = value['group_type_1'];
                group_type_1 = (group_type_1 === undefined || group_type_1 === "") ? value['product_standard_info'] : group_type_1;

                let searchListHTML = "";
                searchListHTML += "<li>";
                searchListHTML +=   "<div>";
                searchListHTML +=       "<a href='javascript:;' onclick='quickOrderProductSearch.getProductSearchBar(this, \"" + group_tpmm_idx + "\", \"" + group_type_1 +  "\")'>";
                searchListHTML +=           "<div class='img'>";
                // searchListHTML +=               "<img src='/resources/images/quickorder/ico_search_keyword.png' alt=''>";
                searchListHTML +=               "<img src=\"" + value['view_image'] + "\" onerror=\"this.src='/resources/images/quickorder/ico_search_keyword.png'\">";
                searchListHTML +=           "</div>";
                searchListHTML +=           "<div class='txt'>";
                searchListHTML +=               "<div class='tit'>" + value['fd_product_name'] + "</div>";

                if (group_type_1 !== undefined && group_type_1 !== "") {
                    searchListHTML +=           "<div class='desc'>" + value['cate_2_name'] + " - " + group_type_1 + "</div>";
                } else {
                    searchListHTML +=           "<div class='desc'>" + value['cate_2_name'] + "</div>";
                }
                searchListHTML +=           "</div>";
                searchListHTML +=       "</a>";
                searchListHTML +=   "</div>";
                searchListHTML += "</li>";
                $("#search_list").append(searchListHTML);
            });
            $("#search_list").parent().addClass("on");
			$(".quick_recommend_keyword").removeClass("on");
        } else {
            $("#search_list").parent().removeClass("on");
        }
    },

    getSearchBarRecommendList: function () {
        $.ajax({
            url: "/quickOrder/rest/recommend/info",
            method: "POST",
            contentType: "application/json",
            success: function (data) {
                if (data["rtn_code"] === "200") {
                    quickOrderProductSearch.setSearchBarRecommendList(data);
                }

            }
        });
    },
    setSearchBarRecommendList: function (arg) {
        let productList = arg["productInfoList"];
        let recommendKeywordList = arg["recommendKeywordList"];
        $(".popular_keyword > ul").empty();
        if (productList != null && productList.length > 0) {
            productList.forEach(function (value, index) {

                let group_type_1 = value['group_type_1'];
                group_type_1 = (group_type_1 === undefined || group_type_1 === "") ? value['fd_product_standard'] : group_type_1;

                let searchListHTML = "";
                searchListHTML += "<li>";
                searchListHTML +=   "<div>";
                searchListHTML +=       "<a href='javascript:;' onclick='getProductSearchBar(this, \"" + value['fk_tpmm_idx'] + "\")'>";
                searchListHTML +=           "<div class='img'>";
                searchListHTML +=               "<img src=\"" + value['fd_img_path'] + "\" onerror=\"this.src='/resources/images/quickorder/ico_search_keyword.png'\">";
                searchListHTML +=           "</div>";
                searchListHTML +=           "<div class='txt'>";
                searchListHTML +=               "<div class='tit'>" + value['fd_product_name'] + "</div>";

                if (group_type_1 !== undefined && group_type_1 !== "") {
                    searchListHTML +=           "<div class='desc'>" + value['cate_2_name'] + " - " + group_type_1 + "</div>";
                } else {
                    searchListHTML +=           "<div class='desc'>" + value['cate_2_name'] + "</div>";
                }

                searchListHTML +=           "</div>";
                searchListHTML +=       "</a>";
                searchListHTML +=   "</div>";
                searchListHTML += "</li>";
                $(".popular_keyword > ul").append(searchListHTML);
            });
        } else {
            let searchListHTML = "<li><div><a herf='javascript:void(0);'>준비중 입니다.</a></div></li>";
            $(".popular_keyword > ul").append(searchListHTML);
        }

        $(".recommend_keyword > ul").empty();
        if (recommendKeywordList != null && recommendKeywordList.length > 0) {
            recommendKeywordList.forEach(function (value, index) {
                let searchListHTML = "";
                searchListHTML += "<li>";
                searchListHTML +=   "<div>";
                searchListHTML +=   	"<a href='" + value["fd_act_info"] + "'>";
                searchListHTML +=   	value["fd_title"];
                searchListHTML +=   	"</a>";
                searchListHTML +=   "</div>";
                searchListHTML += "</li>";
                $(".recommend_keyword > ul").append(searchListHTML);
            });
        } else {
            let searchListHTML = "<li><div><a herf='javascript:void(0);'>준비중 입니다.</a></div></li>";
            $(".recommend_keyword > ul").append(searchListHTML);
        }
    },

    getProductSearchBar: function (e, idx, group_type) {
    	let check_search_string = $("input[name='searchString']").val();
        let product_name = $(e).find(".tit").text();
        $("#searchString").val(product_name);
        $("#searchSelectIdx").val(idx);
        $("#searchSelectGroupType").val(group_type);
        var formData = {
				req_search_text_query : check_search_string,
				req_search_text_select  : product_name,
				req_search_select_idx : idx
		};
		
		$.ajax({
				url : '/product/search/rest/recommen/select',
				type : 'post',
				cache : false,
				data : formData,
				dataType : 'json',
			   	success:function(data){
			   		if(data.rtn_code =='200'){
			   			$("#frm_top_search").submit();
			   		}else{
			   			$("#frm_top_search").submit();
			   		}
			   	},
			   	error:function(request,status,error){
			        // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		$("#frm_top_search").submit();
			    }
		});
        //$("#frm_top_search").submit();
    }

}

$(function () {
    quickOrderProductSearch.getSearchBarRecommendList();
    $("#product_search_list").scroll(function () {
        let scrollT = $(this).scrollTop();
        let scrollH = $(this).height();
        let contentH = $(this).find("#product_search_content_list").height();

        if(scrollT + scrollH + ((scrollT + scrollH) * 0.6) >= contentH) {
            // && (quickOrderProductSearch.nextPage > quickOrderProductSearch.currentPage)) {
            quickOrderProductSearch.getProductSearchList();
        }
    });

    $("#search_cate").on("change", function () {
        let params = new URLSearchParams(location.search);
        let cate_1_idx = params.get("cate_1_idx") != null ? params.get("cate_1_idx") : "";
        let cate_2_idx = params.get("cate_2_idx") != null ? params.get("cate_2_idx") : "";

        let searchString = $("#searchString").val();
        let searchAddCategory = $("#search_cate option:selected").val();
        quickOrderProductSearch.currentPage = 1;

        let arg = {
            searchString: searchString,
            searchAddCategory: searchAddCategory,
            cate_1_idx: cate_1_idx,
            cate_2_idx: cate_2_idx
        }

        quickOrderProductSearch.getProductSearchAddList(arg);

    });

    $("#btn_search_add_list").on("click", function () {
        let params = new URLSearchParams(location.search);
        let cate_1_idx = params.get("cate_1_idx") != null ? params.get("cate_1_idx") : "";
        let cate_2_idx = params.get("cate_2_idx") != null ? params.get("cate_2_idx") : "";

        let searchString = $("#searchString").val();
        let searchAddString = $("#searchAddString").val();
        let searchAddCategory = $("#search_cate option:selected").val();

        let arg = {
            searchString: searchString,
            searchAddString: searchAddString,
            searchAddCategory: searchAddCategory,
            cate_1_idx: cate_1_idx,
            cate_2_idx: cate_2_idx
        }

        quickOrderProductSearch.getProductSearchAddList(arg);

    });

    $("#searchAddString").on("keydown", function (e) {
        let value = $(this).val();
        if (e.keyCode === 13) {
            let params = new URLSearchParams(location.search);
            let cate_1_idx = params.get("cate_1_idx") != null ? params.get("cate_1_idx") : "";
            let cate_2_idx = params.get("cate_2_idx") != null ? params.get("cate_2_idx") : "";
            let searchString = $("#searchString").val();
            let searchAddString = $("#searchAddString").val();
            let searchAddCategory = $("#search_cate option:selected").val();

            let arg = {
                searchString: searchString,
                searchAddString: searchAddString,
                searchAddCategory: searchAddCategory,
                cate_1_idx: cate_1_idx,
                cate_2_idx: cate_2_idx
            }

            quickOrderProductSearch.getProductSearchAddList(arg);
        }
    });

    $("#searchString").on("focus", function () {
        $("#searchSelectIdx").val("");
        $("#searchSelectGroupType").val("");
    });

    $("#searchString").on("input", function () {
        // $("#searchSelectIdx").val("");
        // $("#searchSelectGroupType").val("");
        let searchString = $(this).val().trim();
        if (searchString.length > 2 && searchString !== "") {
            let arg = {
                searchString: searchString,
                page_limit: 10
            }
            quickOrderProductSearch.getProductSearchBarList(arg);
        } else {
            $("#search_list").parent().removeClass("on");
			$(".quick_recommend_keyword").addClass("on");
        }
    });

    $("html").on("click", function (e) {
        if (!$(e.target).hasClass("quick_search_keyword") && $(e.target).attr("id") !== "searchString") {
            $("#search_list").parent().removeClass("on");
			$(".quick_recommend_keyword").removeClass("on");
        } else if ($(e.target).attr("id") === "searchString") {
            let searchString = $("#searchString").val().trim();
            if (searchString != null && searchString.length > 2) {
                if ($("#search_list > li").length > 0) {
                    $("#search_list").parent().addClass("on");
					$(".quick_recommend_keyword").removeClass("on");
                } else {
                    let arg = {
                        searchString: searchString,
                        page_limit: 10
                    }
                    quickOrderProductSearch.getProductSearchBarList(arg);
                }
            }else{
                quickOrderProductSearch.getSearchBarRecommendList();
				$(".quick_recommend_keyword").addClass("on");
			}
        }
    });

    // let searchSelectIdx = $("#searchSelectIdx").val();
    // if (searchSelectIdx !== "") {
    //     var req_data = {
    //         req_group_type_value_1 : "fd_group_type_1" ,
    //         req_group_type_value_2 : "fd_group_type_2" ,
    //         req_group_type_value_3 : "fd_group_type_3" ,
    //         req_pd_group_idx : searchSelectIdx ,
    //         req_type:"view"
    //     };
    //
    //     $.ajax({
    //         url : '/quickOrder/rest/groupProduct/info',
    //         type : 'post',
    //         cache : false,
    //         data : req_data,
    //         dataType : 'json',
    //         success:function(data){
    //             if(data.rtn_cd == '200'){
    //                 product_info_view(data);
    //             }else{
    //                 alert(data.rtn_msg);
    //             }
    //         },
    //         error:function(request,status,error){
    //             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    //         }
    //     });
    // }

});