<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header id="header" class="main_hd">
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
		<div class="top">
			<div class="area">
				<div class="real_area">
					<div class="utility_wrap">
						<div class="button">
							<%--<a href="javascript:;" class="btn_qorder"><span>빠른주문</span> 사용안내</a>--%>
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
					<h1 class="logo"><a href="/index" class="g_c_h_logo"><img src="/resources/images/main_renew/hd_logo.png" alt="" /></a></h1>
				</div>
			</div>
		</div>
		<%-- 빠른주문 헤더 START--%>
        <div class="btm btm_quick">
            <div class="area">
                <div class="real_area clear">
                    <div class="quick_search_wrap">
                        <div class="quick_search">
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
                            <div class="form_cont">
                            	<form id="frm_top_search" name="frm_top_search" action="/quickOrder/info" method="get" >
                                <%--<label for="quickSearch" class="lab_search">제품명을 검색하세요.</label>--%>
                                    <input hidden type="text" id="searchSelectIdx" name="searchSelectIdx" value="${searchSelectIdx}">
                                    <input hidden type="text" id="searchSelectGroupType" name="searchSelectGroupType" value="${searchSelectGroupType}">
                                    <input type="text" class="inp_search" id=searchString name="searchString" value="${searchString}" placeholder="3만여 개 의료재료, 최저가 가격비교하세요!" autocomplete="off"  class="g_c_h_type_1_search"><button class="btn_search g_c_h_type_1_search_btn" onclick="submitSearch();"></button>
                                </form>
                                <div class="quick_search_keyword">
	                                <ul id="search_list" class="g_c_h_type_1_search_list">
<%--	                                    <li>--%>
<%--	                                        <div>--%>
<%--	                                            <a href="javascript:;">--%>
<%--	                                                <div class="img">--%>
<%--	                                                    <img src="/resources/images/quickorder/ico_search_keyword.png" alt="">--%>
<%--	                                                </div>--%>
<%--	                                                <div class="txt">--%>
<%--	                                                    <div class="tit">후지셈1</div>--%>
<%--	                                                    <div class="desc">시멘트 - GI/luting 시멘트</div>--%>
<%--	                                                </div>--%>
<%--	                                            </a>--%>
<%--	                                        </div>--%>
<%--	                                    </li>--%>
<%--	                                    <li>--%>
<%--	                                        <div>--%>
<%--	                                            <a href="javascript:;">--%>
<%--	                                                <div class="img">--%>
<%--	                                                    <img src="/resources/images/quickorder/ico_search_keyword.png" alt="">--%>
<%--	                                                </div>--%>
<%--	                                                <div class="txt">--%>
<%--	                                                    <div class="tit">후지셈2</div>--%>
<%--	                                                    <div class="desc">시멘트 - GI/luting 시멘트</div>--%>
<%--	                                                </div>--%>
<%--	                                            </a>--%>
<%--	                                        </div>--%>
<%--	                                    </li>--%>
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
                            <div class="tutorial_step tutorial_step_1">
                                <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                                <div class="clip_step"></div>
                                <div class="layer_step">
                                    <div class="layer_step_inner">
                                        <div class="txt">1. 찾으시는 제품명을 입력해주세요.</div>
                                        <button class="btn_next" onclick="nextLayerPop(2)">다음</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="quick_util">
                            <ul>
                                <li>
                                    <div>
                                        <button class="btn_util"
                                            onclick="openLayerPop('quickorder');"><span>메디밸류</span> 이용방법</button>
                                        <div class="tutorial_step tutorial_step_6">
                                            <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                                            <div class="clip_step"></div>
                                            <div class="layer_step">
                                                <div class="layer_step_inner">
                                                    <div class="btn_close_wrap">
                                                        <button class="btn_close"
                                                            onclick="closeLayerPop(this);"></button>
                                                    </div>
                                                    <div class="txt">
                                                        빠른주문하기 이용방법이 종료되었습니다.<br>궁금한 점이 있다면 오른쪽 하단의 채팅상담 버튼을 클릭해서 물어보세요.
                                                    </div>
                                                    <%-- <div class="img_coupon">
                                                        <img src="/resources/images/quickorder/ico_coupon.png" alt="">
                                                    </div>
                                                    <div class="txt ta_center">
                                                        축하합니다!<br>배송비 무료 쿠폰이 발급되었습니다.
                                                    </div> --%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <c:if test="${!empty member_info}">
                                <li>
                                    <div>
                                        <button class="btn_util btn_blue" onclick="openLayerPop('address');">배송지
                                            관리</button>
                                        <div class="address_pop layer_pop">
                                            <div class="layer_pop_inner">
                                                <div class="btn_close_wrap">
                                                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                                                </div>
                                                <div class="cont">
                                                    <div class="head">
                                                        <div class="head_inner">
                                                            <div class="title">주문하기 전 배송지 정보를 확인해 주세요.</div>
                                                        </div>
                                                    </div>
                                                    <div class="body">
                                                        <div class="body_inner">
                                                            <div class="address_list">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="th">배송지</div>
                                                                            <div class="td">${member_info.fd_addr_desc}</div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="th">상세정보</div>
                                                                            <div class="td">${member_info.fd_addr_detail_desc} (${member_info.fd_addr_post_desc}) / ${member_info.fd_medical_name}</div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="btn_wrap">
                                                    <button type="button" onclick="location.href='/member/addr/list';">배송지 변경하기</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- 빠른주문 헤더 END--%>	
			
	</div>
</header>