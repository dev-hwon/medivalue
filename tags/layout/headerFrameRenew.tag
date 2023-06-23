<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header id="header" class="main_hd header_renew">
	<div class="sub_category_bg" onclick="categoryClose();"></div>
	<div class="hd_wrap">
		<%-- 이벤트 영역 시작 --%>
		<%--<div class="event_banner">	
			<div class="real_area">
				<p><span style="font-size: 14px;">메디밸류 사이트는 크롬 및 마이크로소프트 엣지에 최적화되어 있습니다.</span></p>
				<button class="close_btn" type="button"><img src="/resources/images/main/banner_close.png" width="10" height="10" border="0" alt="" /></button>
			</div>	
		</div>--%>
		<%-- 이벤트 영역 끝 --%>	
		
		<%-- 로그아웃 상태 or 로그인 상태 and 구매 이력이 없는 경우 노출 --%>
		<c:if test="${requestScope.event_popup_yn eq 'Y' }">
			<div class="banner_wrap">
	            <ul>
	                <li>
	                    <div >
	                        <a href="/event/first_order#atc_benefit_01" class="g_m_h_popup_event_l"><img src="/resources/images/event_first_purchase/ico_main_top_banner_01.png" />메디밸류에서 첫 구매라면? 인기상품 100원 ></a>
	                    </div>
	                </li>
	                <li>
	                    <div>
	                        <a href="/event/first_order#atc_benefit_02" class="g_m_h_popup_event_r"><img src="/resources/images/event_first_purchase/ico_main_top_banner_02.png" />소량 주문도 OK! 금액 제한 없는 무료배송 ></a>
	                    </div>
	                </li>
	            </ul>
	            <button class="btn_close" type="button" onclick="closeTopBanner();"><img src="/resources/images/event_first_purchase/ico_main_top_banner_close.png" /></button>
	        </div>
        </c:if>
        
        <%-- 로그인 상태 and 구매 이력이 있는 경우 노출 --%>
        <c:if test="${requestScope.event_special_popup_yn eq 'Y' }">
        <div class="banner_wrap type2">
            <ul>
                <li>
                    <div >
                        <a href="/event/special_price#atc_benefit_01" class="g_m_h_popup_event_l"><img src="/resources/images/event_special_price/ico_main_top_banner_03.png" />메디밸류 파격특가 놓치면 손해 ></a>
                    </div>
                </li>
                <li>
                    <div>
                        <%--<a href="/event/special_price#atc_benefit_02" class="g_m_h_popup_event_r"><img src="/resources/images/event_special_price/ico_main_top_banner_04.png" />창고대방출 한정수량 땡처리 ></a>--%>
                        <a href="/quickOrder/info?searchString=%EC%9B%90%EC%9E%A5%EC%B6%94%EC%B2%9C" class="g_m_h_popup_event_r"><img src="/resources/images/event_special_price/ico_main_top_banner_05.png" />원장님 가격비교 추천템 ></a>
                    </div>
                </li>
            </ul>
            <button class="btn_close" type="button" onclick="closeTopBanner();"><img src="/resources/images/event_first_purchase/ico_main_top_banner_close.png" /></button>
        </div>
		</c:if>

		<div class="top">
			<div class="area">
				<div class="real_area">
					<div class="utility_wrap">
						<div class="button">
							<%-- <a href="/quickOrder/info?func=quickorder" class="btn_qorder"><span>메디밸류</span> 이용방법</a> --%>
						</div>
						<div class="utility">
							<ul>
								<c:if test="${loginInfo == null}">
								<li>
									<div>
										<a href="javascript:;" id="btn_main_top_join" class="g_c_h_join">회원가입</a>
									</div>
								</li>
								<li>
									<div>
										<a href="javascript:;" id="btn_main_top_login" class="g_c_h_login">로그인</a>
									</div>
								</li>
								</c:if>
								<c:if test="${loginInfo !=null}">
								<li>
									<div>
										<a href="/myhome/info" id="btn_main_top_info" class="g_c_h_myinfo">${loginInfo.fd_medical_name}</a>
									</div>
								</li>
								<li>
									<div>
										<a href="javascript:;" id="btn_main_top_logout" class="g_c_h_logout">로그아웃</a>
									</div>
								</li>
								</c:if>
								<li class="withsub">
									<div>
										<a href="javascript:;">고객센터</a>
										<div class="submenu">
											<ul>
												<li><div><a href="javascript:;" class="g_c_h_question" onclick="onChatTalk();">1:1 문의</a></div></li>
												<li><div><a href="javascript:;" class="notice g_c_h_notice">공지사항</a></div></li>
											</ul>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<h1 class="logo main">
						<a href="/index" class="g_c_h_logo"><img src="/resources/images/main_renew/hd_logo.png" alt="" /></a>
						<div class="nav_list">
							<ul>
								<li class="on">
									<div><a href="javascript:void(0);">MV 재료</a></div>
								</li>
								<li class="new">
									<div>
										<a href="${requestScope.dt_info}">MV 기공</a>
<%--										<a href="https://dt.medivalue.co.kr">MV 기공</a>--%>
									</div>
								</li>
							</ul>
						</div>
					</h1>
				</div>
			</div>
		</div>
		<%-- 공통 헤더 START--%>
        <div class="btm">
            <div class="area">
                <div class="real_area clear">
                	<div class="hd_search_wrap">
	                    <div class="left clear">
	                        <div class="sch_box">
	                            <form id="frm_top_search" name="frm_top_search" action="/quickOrder/info" method="get">
	                                <!-- main_renew add START -->
									<c:if test="${!empty requestScope.common_cate_list}">
									<div class="category">
										<a href="javascript:;" title="" class="btn_category g_c_h_menu_category" onclick="categoryToggle();">
											<div class="hamberg"><span></span><span></span><span></span></div>
											<div class="text">카테고리</div>
										</a>
										<c:set var="prev_menu" value="0"/>
										<div class="sub_category g_c_h_menu_category_list">
											<div class="text">전체 카테고리</div>
											<div class="depth_1">
												<ul>
													<li>
														<a href="https://www.medivalue.co.kr/event/tech">기공재료</a>
														<div class="depth_2">
															<ul>
																<li>
																	<a href="/event/tech">기공 재료 특판</a>
																</li>
																<li>
																	<a href="/quickOrder/info?searchString=기공일반재료">일반 기공 재료</a>
																</li>
																<li>
																	<a href="/quickOrder/info?searchString=지르코니아블럭">지르코니아블럭</a>
																</li>
																<li>
																	<a href="/quickOrder/info?searchString=환봉">환봉</a>
																</li>
															</ul>
														</div>
													</li>
										<c:forEach var="item" items="${requestScope.common_cate_list}" varStatus="state">
											<c:if test="${item.cate_1_idx != prev_menu}">
												<c:if test="${!state.first}">
														</ul>
													</div>
												</li>
												</c:if>
												<c:set var="prev_menu" value="${item.cate_1_idx}"/>
												<li>
													<a href="/quickOrder/info?cate_1_idx=${item.cate_1_idx}">${item.cate_1_name}</a>
													<div class="depth_2">
														<ul>
											</c:if>
											<c:if test="${item.cate_1_idx == prev_menu}">
															<li>
																<a href="/quickOrder/info?cate_1_idx=${item.cate_1_idx}&cate_2_idx=${item.cate_2_idx}">${item.cate_2_name}</a>
															</li>
											</c:if>
											<c:if test="${state.last}">
														</ul>
													</div>
												</li>
											</c:if>
										</c:forEach>
												</ul>
											</div>
										</div>
									</div>
									</c:if>
	                                <div class="title g_c_h_type_1_quick_order" onclick="location.href='/quickOrder/info'">빠른주문하기</div>
	                                <!-- main_renew add END -->
	                                <div class="form_cont">
	                                	<div class="search_area">
	                                    	<%-- <label for="searchString">제품 검색시 가격 비교를 할 수 있습니다.</label> --%>
<%--	                                    	<input type="text" id="searchString" name="" value="" autocomplete="off" placeholder="제품 검색시 가격 비교를 할 수 있습니다." onkeyup="quickSearchKeyword(this);" />--%>
<%--												<form id="frm_top_search" name="frm_top_search" action="/quickOrder/info" method="post" >--%>
													<%--<label for="quickSearch" class="lab_search">제품명을 검색하세요.</label>--%>
													<input hidden type="text" id="searchSelectIdx" name="searchSelectIdx" value="">
													<input type="text" id="searchString" name="searchString" value="" autocomplete="off" placeholder="3만여 개 의료재료, 최저가 가격비교하세요!" onkeyup="" class="g_c_h_type_1_search"/>
<%--												</form>--%>
											<button id="btn_top_search" class="search_icon g_c_h_type_1_search_btn" type="button">
                                                <img src="/resources/images/main/search_btn2.png" alt="" />
                                            </button>
	                                    </div>
	                                    <div class="quick_search_keyword">
                                            <ul id="search_list" class="g_c_h_type_1_search_list">

                                            </ul>
                                        </div>
                                        <div class="quick_recommend_keyword">
                                        	<div class="popular_keyword">
                                        		<div class="keyword_title">인기 재료</div>
                                        		<ul>
                                        		</ul>
                                        	</div>
                                        	<div class="recommend_keyword">
                                        		<div class="keyword_title">추천 키워드</div>
                                        		<ul>
                                        		</ul>
                                        	</div>
                                        	<button type="button" class="btn_keyword_close"></button>
                                        </div>
	                                </div>
	                            </form>
	                        </div>
	                    </div>
	                    <div class="right">
	                    	<div class="button">
	                    		<a href="/quickOrder/info?func=quickorder" class="btn_qorder"><span>메디밸류</span> 이용방법</a>
	                    	</div>
	                    	
	                        <ul class="clear">
	                            <%-- <li class="hd_r_btn1">
	                                <a href="/myhome/info" target="_self">
	                                    <span class="icon"><img src="/resources/images/main/hd_icon1.png" width="27"
	                                            height="24" border="0" alt="" /></span>
	                                    <h3>MY 홈</h3>
	                                </a>
	                            </li> --%>
	                            <li class="hd_r_btn2">
	                                <a href="/myhome/info" class="g_c_h_myinfo_img">
	                                    <span class="icon"><img src="/resources/images/main/hd_icon2.png" alt="" /></span>
	                                    <h3>내 계정</h3>
	                                </a>
	                                <div class="my_account_pu">
	                                    <ul>
	                                        <li><a href="/myhome/info" class="g_c_h_myinfo_myhome">MY 홈 (위시리스트)</a></li>
	                                        <li><a href="/order/list" class="g_c_h_myinfo_order_delivery_info">주문배송 조회</a></li>
	                                        <li><a href="/member/addr/list" class="g_c_h_myinfo_order_place">배송지 관리</a></li>
	                                        <li><a href="/coupon/list" class="g_c_h_myinfo_point_info">쿠폰 / 포인트</a></li>
	                                        <li><a href="/member/mypage/check" class="g_c_h_myinfo_modify">회원정보 수정</a></li>
	                                        <li><a href="/member/purchase/list" class="g_c_h_myinfo_order_info">구매내역 조회</a></li>
	                                        <c:if test="${member_paymentMethod eq 'PM0002'}" ><li><a href="/member/purchase/deferlist" class="g_c_h_myinfo_deferorder_info">후불 구매내역 조회</a></li> </c:if>
											<li><a href="/medicashMng/info" class="g_c_h_medicash_info">메디캐시 충전/내역</a></li>
	                                    </ul>
	                                </div>
	                            </li>
	                            <li class="hd_r_btn3">
	                                <a href="/quickOrder/info" class="g_c_h_cart">
	                                    <span class="icon"><img src="/resources/images/main/hd_icon3.png" alt="" /></span>
	                                    <h3>장바구니</h3>
	                                    <c:if test="${requestScope.basket_user_cnt != null}">
										<span class="cart_num" style="display: block;">${requestScope.basket_user_cnt}</span>
									</c:if>
									<c:if test="${requestScope.basket_user_cnt == null}">
										<span class="cart_num">0</span>
									</c:if>
	                                </a>
	                                <div class="cart_alarm">
	                                    <span class="tri"><img src="/resources/images/main/cart_alarm_tri.png" alt="" /></span>
	                                    <h3 class="pd_tit">제품명</h3>
	                                    <p class="pd_desc">제품을 장바구니에 제품을 담았습니다</p>
	                                </div>
	                            </li>
	                            
	                            <!-- 20230317 알림창 활성화 버튼 -->
	                            <!-- <li class="hd_r_btn4">
	                                <a href="javascript:;" class="btn_noti" onclick="notiSideShow();"></a>
                                </li> -->
	                        </ul>
	                    </div>
	                </div>
                </div>
            </div>
        </div>
        <%-- 공통 헤더 END--%>	
		<script>
		function quickSearchKeyword(e){
		    const input = $(e);
		    if(input.val() == ""){
		        input.parent().removeClass("on");
		    }else{
		        input.parent().addClass("on");
		    }
		}
		function getProductSearchBarList(arg) {
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
									setProductSearchBarList(data);
								}
							}

						}
					});

			// setTimeout(function () {
			//     let searchString = $("#searchString").val();
			//     if ((searchString === "" || searchString.length <= 2)) {
			//         searchBarReq.abort();
			//     }
			// }, 1000);
		}
		function setProductSearchBarList(arg) {
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
					searchListHTML +=       "<a href='javascript:;' onclick='getProductSearchBar(this, \"" + group_tpmm_idx + "\")'>";
					searchListHTML +=           "<div class='img'>";
					// searchListHTML +=               "<img src='/resources/images/quickorder/ico_search_keyword.png' alt=''>";
					searchListHTML +=               "<img src=\"" + value['view_image'] + "\" onerror=\"this.src='/resources/images/quickorder/ico_search_keyword.png'\">";
					searchListHTML +=           "</div>";
					searchListHTML +=           "<div class='txt'>";
					searchListHTML +=               "<div class='tit'>" + value['fd_product_name'] + "</div>";
					// searchListHTML +=               "<div class='desc'>" + value['cate_1_name'] + " > " + value['cate_2_name'] + " - " + value["product_standard_info"] + "</div>";
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
				/* $(".search_area").addClass("on"); */
				$(".quick_recommend_keyword").removeClass("on");
				$(".quick_search_keyword").addClass("on");
			} else {
				/* $(".search_area").removeClass("on"); */
				$(".quick_search_keyword").removeClass("on");
			}
		}

		function getSearchBarRecommendList() {
			$.ajax({
				url: "/quickOrder/rest/recommend/info",
				method: "GET",
				contentType: "application/json",
				success: function (data) {
					if (data["rtn_code"] === "200") {
						setSearchBarRecommendList(data);
					}
				}
			});
		}
		function setSearchBarRecommendList(arg) {
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
					searchListHTML +=   	"<a href='javascript:void(0);' onclick='clickKeyWord(" + value["pk_idx"] + ", \"" + value["fd_act_info"] + "\")' >";
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

		}
		function clickKeyWord(idx, url) {
			$.ajax({
				url: "/quickOrder/rest/recommend/clickLog?kIdx=" + idx,
				method: "GET",
				contentType: "application/json",
				success: function (data) {
					window.document.location.href = url;
				}
			});
		}

		function getProductSearchBar(e, idx) {
			let check_search_string = $("input[name='searchString']").val();

			let product_name = $(e).find(".tit").text();
			$("#searchString").val(product_name);
			$("#searchSelectIdx").val(idx);
			
			//if(check_search_string != ''){
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
			//}
		}

		$(function () {
			getSearchBarRecommendList();
			$("#btn_top_search").on("click",function(){
				if($("#searchString").val() !='' && $("#searchString").val().trim().length>2){
					$("#frm_top_search").submit();
				}
			});

			$("#searchString").on("input", function () {
				let searchString = $(this).val().trim();
				if (searchString.length > 2 && searchString !== "") {
					let arg = {
						searchString: searchString,
						page_limit: 10
					}
					getProductSearchBarList(arg);
				} else {
					/* $(".search_area").removeClass("on"); */
					$(".quick_search_keyword").removeClass("on");
				}
			});

			$("html").on("click", function (e) {
				if (!$(e.target).hasClass("quick_search_keyword") && $(e.target).attr("id") !== "searchString") {
					/* $(".search_area").removeClass("on"); */
					$(".quick_recommend_keyword").removeClass("on");
					$(".quick_search_keyword").removeClass("on");
				} else if ($(e.target).attr("id") === "searchString") {
					let searchString = $("#searchString").val().trim();
					if (searchString != null && searchString.length > 2) {
						if ($("#search_list > li").length > 0) {
							/* $(".search_area").addClass("on"); */
							$(".quick_recommend_keyword").removeClass("on");
							$(".quick_search_keyword").addClass("on");
						} else {
							let arg = {
								searchString: searchString,
								page_limit: 10
							}
							getProductSearchBarList(arg);
						}
					}else{
						getSearchBarRecommendList();
						$(".quick_recommend_keyword").addClass("on");
					}
				}
			});
			$("#searchString").on("keydown", function (e) {
				let value = $(this).val();
				if (e.keyCode === 13) {
					let searchString = $("#searchString").val();
					// let searchAddString = $("#searchAddString").val();
					$("#searchString").val(searchString);
					$("#frm_top_search").submit();
				}
				if (value.length < 4){
					// getSearchBarRecommendList();
					$(".quick_recommend_keyword").addClass("on");
				}
			});
			
			$(".quick_recommend_keyword .btn_keyword_close").click(function(){
				$(".quick_recommend_keyword").removeClass("on");
			});
		});


		</script>
	</div>
</header>