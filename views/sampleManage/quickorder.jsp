<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrameNew>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="stylesheet" href="/resources/css/quickorder.css?20220314" />
		<link rel="stylesheet" href="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.standalone.min.css" type="text/css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220317"></script>
		<script type="text/javascript" src="/resources/js/quickorder.js?20220317"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.min.js"></script>
   		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
		<script type="text/javascript">
			
		</script>
	</jsp:attribute>
	<jsp:body>
		<!-- BODY START -->
    <section id="quick_order" class="sub">
        <div class="quick_order_inner">
            <article class="atc_step_1">
                <div class="step_box">
                    <div class="tab_wrap">
                        <div class="tab_list">
                            <ul>
                                <li>
                                    <div>
                                        <button>제품검색(0)</button>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <button>위시리스트(0)</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="tab_content">
                            <ul>
                                <li>
                                    <div class="empty">
                                        <p>검색창에서 <span>주문하실 제품</span>을 검색해 주세요.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <div class="row">
                                                <div class="comm_search_wrap">
                                                    <select name="" id="" class="sel_search">
                                                        <option value="">카테고리 전체</option>
                                                    </select>
                                                    <span class="bar"></span>
                                                    <input type="text" placeholder="결과 내 재검색" class="inp_search">
                                                    <button class="btn_search"></button>
                                                </div>
                                                <div class="comm_filter_wrap">
                                                    <label class="btn_list"><input type="radio" name="sch_filter_1"
                                                            class="inp_list" onclick="changeFilter(this);"
                                                            checked><span></span></label>
                                                    <label class="btn_gall"><input type="radio" name="sch_filter_1"
                                                            class="inp_gall"
                                                            onclick="changeFilter(this);"><span></span></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab_body">
                                            <div class="list_style_01">
                                                <ul>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 START (삭제금지) -->
                                                    <li class="insure rebuy tutorial_temp">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">GenTaper Finishing File</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>
                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">Micro-Mega</div>
                                                                        <div class="date">21.12.10일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">F1, 21mm yellow</div>
                                                                        <div class="code">03050000420</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 END (삭제금지) -->

                                                    <li class="insure rebuy">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">GenTaper Finishing File</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">Micro-Mega</div>
                                                                        <div class="date">21.12.10일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">F1, 21mm yellow</div>
                                                                        <div class="code">03050000420</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">제품이름 제품이름
                                                                        제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing
                                                                            Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">제품이름 제품이름
                                                                        제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing
                                                                            Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">제품이름 제품이름
                                                                        제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing
                                                                            Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">제품이름 제품이름
                                                                        제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing
                                                                            Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">제품이름 제품이름
                                                                        제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing
                                                                            Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" id=""
                                                                                        class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="empty">
                                        <p>위시리스트 내역이 없습니다.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <div class="ai_wish_wrap">
                                                <div class="ai_wish_inner">
                                                    <div class="txt">구매 데이터를 바탕으로 구매 예측중입니다.<br>구매한 제품이 100건 이상시 기능이 활성화 됩니다.</div>
                                                    <div class="progress_wrap" data-num="50">
                                                        <div class="graphic"><span>AI</span></div>
                                                        <div class="txt"><span>0</span>%</div>
                                                    </div>
                                                    <button class="btn_ai_wish">Ai 위시리스트 자세히 보기 ></button>
                                                    <!-- <div class="txt">ai 위시리스트 완료시 더 빠른 구매가 가능힙니다.</div> -->
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="comm_search_wrap">
                                                    <select name="" id="" class="sel_search">
                                                        <option value="">카테고리 전체</option>
                                                    </select>
                                                    <span class="bar"></span>
                                                    <input type="text" placeholder="결과 내 재검색" class="inp_search">
                                                    <button class="btn_search"></button>
                                                </div>
                                                <div class="comm_filter_wrap">
                                                    <label class="btn_list"><input type="radio" name="sch_filter_2"
                                                            class="inp_list" onclick="changeFilter(this);"
                                                            checked><span></span></label>
                                                    <label class="btn_gall"><input type="radio" name="sch_filter_2"
                                                            class="inp_gall"
                                                            onclick="changeFilter(this);"><span></span></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab_body">
                                            <div class="list_style_02">
                                                <ul>
                                                    <li class="insure rebuy">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">제품이름 제품이름
                                                                        제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing
                                                                            Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <button class="btn_package">규격선택</button>
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure rebuy">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">제품이름 제품이름
                                                                        제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing
                                                                            Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <button class="btn_package">규격선택</button>
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure rebuy">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">제품이름 제품이름
                                                                        제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing
                                                                            Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <button class="btn_package">규격선택</button>
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure rebuy">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/640x480.png" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button class="btn_detail"
                                                                            onclick="openLayerPop('detail');">상세</button>
                                                                    </div>
                                                                    <a href="javascript:;" class="title"
                                                                        onclick="openLayerPop('detail');">제품이름 제품이름
                                                                        제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">재구매</span>
                                                                        <span class="btn_insure">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing
                                                                            Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <button class="btn_package">규격선택</button>
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord
                                                                                        #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="step_box step_box_recent">
                    <div class="tab_wrap">
                        <div class="tab_content">
                            <div class="empty">
                                <p>최근 3개월 내 주문내역이 없습니다.</p>
                            </div>
                            <div class="recent_wrap">
                                <div class="tab_head">
                                    <div class="recent_tit">최근 주문내역 (3개월)</div>
                                </div>
                                <div class="tab_body">
                                    <div class="table_wrap">
                                        <table>
                                            <colgroup>
                                                <col>
                                                <col>
                                                <col>
                                                <col>
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>주문날짜</th>
                                                    <th>도매상</th>
                                                    <th>단가</th>
                                                    <th>수량</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>2021.12.29</td>
                                                    <td>eDENTeDENTeDENTeDENTeDE</td>
                                                    <td>9,999,999원</td>
                                                    <td>9999개</td>
                                                </tr>
                                                <tr>
                                                    <td>2021.12.29</td>
                                                    <td>eDENTeDENTeDENTeDENTeDE</td>
                                                    <td>9,999,999원</td>
                                                    <td>9999개</td>
                                                </tr>
                                                <tr>
                                                    <td>2021.12.29</td>
                                                    <td>eDENTeDENTeDENTeDENTeDE</td>
                                                    <td>9,999,999원</td>
                                                    <td>9999개</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tutorial_step tutorial_step_2">
                    <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                    <div class="clip_step"></div>
                    <div class="layer_step">
                        <div class="layer_step_inner">
                            <div class="txt">2. 찾으시는 제품의 규격을 선택해 주세요.</div>
                            <button class="btn_next" onclick="nextLayerPop(3)">다음</button>
                        </div>
                    </div>
                </div>
            </article>
            <article class="atc_step_2">
                <div class="step_box">
                    <div class="tab_wrap">
                        <div class="tab_list">
                            <ul>
                                <li>
                                    <div>
                                        <button>재료상 가격비교</button>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <button>재료상관리</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="tab_content">
                            <ul>
                                <li>
                                    <div class="empty">
                                        <p>선택하신 상품이 <span>재료상 업체</span> 별로 표시됩니다.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                        	<div class="row">
                                        		<div class="table_util">
                                        			<span>연동 재료상(0)</span>
                                        		</div>
                                        	</div>
                                        </div>
                                        <div class="tab_body">
                                            <div class="accordion_01">
                                                <ul>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 START (삭제금지) -->
                                                    <li class="tutorial_temp">
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">도매상</div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="price">가격</div>
                                                                        <div class="stock">수량(재고)</div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">eDENT</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">39,000원</div>
                                                                                    <div class="stock">
                                                                                        <div class="inp_stock_wrap">
                                                                                            <input type="text" class="inp_stock" placeholder="999">
                                                                                            <button class="btn_stock">담기</button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">F1, 21mm yellow</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">DVmall</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">0원</div>
                                                                                    <div class="stock">
                                                                                        <div class="inp_stock_wrap">
                                                                                            <input type="text" class="inp_stock" placeholder="품절" readonly>
                                                                                            <button class="btn_stock" disabled>담기</button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">F1, 21mm yellow</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">SeilGlobal</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">39,000원</div>
                                                                                    <div class="stock">
                                                                                        <div class="inp_stock_wrap">
                                                                                            <input type="text" class="inp_stock" placeholder="100">
                                                                                            <button class="btn_stock">담기</button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">F1, 21mm yellow</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 END (삭제금지) -->
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">소매상</div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="price">가격</div>
                                                                        <div class="stock">수량(재고)</div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <div class="empty_wrap">
                                                                    <div class="text">
                                                                        <div class="title">연동된 재료상이 없습니다.</div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="button">
                                                                            <button class="btn_white" onclick="goTabShow(2,2);">재료상관리</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">도매상</div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="price">가격</div>
                                                                        <div class="stock">수량(재고)</div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">도매상 A</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">9,999,999원</div>
                                                                                    <div class="stock">
                                                                                        <div class="inp_stock_wrap">
                                                                                            <input type="text" class="inp_stock" placeholder="9999">
                                                                                            <button class="btn_stock">담기</button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">Taper 01 / mm 01 / Ø3</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">도매상 B</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">1,999,999원</div>
                                                                                    <div class="stock">
                                                                                        <div class="inp_stock_wrap">
                                                                                            <input type="text"
                                                                                                class="inp_stock"
                                                                                                placeholder="100">
                                                                                            <button
                                                                                                class="btn_stock">담기</button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">Taper 01 / mm 01 /
                                                                                    Ø3</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">도매상 C</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">2,999,999원</div>
                                                                                    <div class="stock">
                                                                                        <div class="inp_stock_wrap">
                                                                                            <input type="text" class="inp_stock" placeholder="품절" readonly>
                                                                                            <button class="btn_stock" disabled>담기</button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">Taper 01 / mm 01 / Ø3</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">온라인 도매상</div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="price">가격</div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">도매상 A</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">9,999,999원</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">Taper 01 / mm 01 /
                                                                                    Ø3</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">도매상 A</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">9,999,999원</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">Taper 01 / mm 01 /
                                                                                    Ø3</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">도매상 A</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">9,999,999원</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">Taper 01 / mm 01 /
                                                                                    Ø3</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">도매상 A</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">9,999,999원</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">Taper 01 / mm 01 /
                                                                                    Ø3</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">재료상 연동정보(2)</div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">한국치과유통</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button class="btn_red">연동실패</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="subacc_accordion">
                                                                                    <a href="javascript:;">
                                                                                        <div class="row">
                                                                                            <div class="text">
                                                                                                <div class="title">소매상에서 요청을 거절하였습니다.</div>
                                                                                            </div>
                                                                                            <div class="util">
                                                                                                <div class="button">
                                                                                                    <button class="btn_recommend">추천 도매상</button>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </a>
                                                                                    <div class="subacc_subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div
                                                                                                            class="text">
                                                                                                            <div
                                                                                                                class="title">
                                                                                                                A 소매상
                                                                                                            </div>
                                                                                                            <div
                                                                                                                class="desc">
                                                                                                                18.3 km
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="util">
                                                                                                            <div
                                                                                                                class="button">
                                                                                                                <button
                                                                                                                    class="btn_white"
                                                                                                                    onclick="openLayerPop('interlock');">연동하기</button>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div
                                                                                                            class="text">
                                                                                                            <div
                                                                                                                class="title">
                                                                                                                B 소매상
                                                                                                            </div>
                                                                                                            <div
                                                                                                                class="desc">
                                                                                                                20.3 km
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="util">
                                                                                                            <div
                                                                                                                class="button">
                                                                                                                <button
                                                                                                                    class="btn_white"
                                                                                                                    onclick="openLayerPop('interlock');">연동하기</button>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">유닛808</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button
                                                                                            class="btn_white">연동확인중</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="tab_foot">
                                            <div class="information">
                                                ※ 도매상 A,B,C는 입점한 치과재료 전문 대형 도매상들의 가격 중 가장 낮은 가격순 3개 업체의 가격입니다.
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="empty">
                                        <p>재료상 연동 관리입니다.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <div class="notification">
                                                <div class="btn_add_wrap">
                                                    <button class="btn_add" onclick="openLayerPop('request');">재료상 추가
                                                        요청</button>
                                                </div>
                                                <div class="noti_box_wrap">
                                                    <button class="btn_box_close"
                                                        onclick="closeNotice(this);">&#10005;</button>
                                                    <div class="tit">재료상 연동 관리</div>
                                                    <div class="desc">계정 정보를 한 번만 입력하시면, 각 재료상에 자동으로 로그인 되어 제품 검색, 재고
                                                        확인, 주문을 메디밸류 한 곳에서 이용하실 수 있습니다.</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab_body">
                                            <div class="accordion_01 manage">
                                                <ul>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">이용 중인 재료상 <span
                                                                                class="num">(3)</span></div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">SS GLOBAL</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button
                                                                                            class="btn_blue">연동완료</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">DVmall</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button
                                                                                            class="btn_blue">연동완료</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">DVmall</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button
                                                                                            class="btn_blue">연동완료</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">확인 중인 재료상 <span
                                                                                class="num">(2)</span></div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">SS GLOBAL</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button
                                                                                            class="btn_white">연동확인중</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">DVmall</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button
                                                                                            class="btn_white">연동확인중</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">연동 가능 재료상 <span
                                                                                class="num">(0)</span></div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="market_search_wrap">
                                                                            <input type="text" class="inp_search"
                                                                                placeholder="재료상 검색하기">
                                                                            <button class="btn_search"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">건화약품</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button class="btn_white"
                                                                                            onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">경동사</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button class="btn_white"
                                                                                            onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">뉴케이팜</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button class="btn_white"
                                                                                            onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">대일양행</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button class="btn_white"
                                                                                            onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">더원팜</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button class="btn_white"
                                                                                            onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tutorial_step tutorial_step_3">
                    <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                    <div class="clip_step"></div>
                    <div class="layer_step">
                        <div class="layer_step_inner">
                            <div class="txt">3. 찾으시는 제품의 최저가를 확인해 보세요.</div>
                            <button class="btn_next" onclick="nextLayerPop(4)">다음</button>
                        </div>
                    </div>
                </div>
            </article>
            <article class="atc_step_3">
                <div class="step_box">
                    <div class="tab_wrap">
                        <div class="tab_list">
                            <ul>
                                <li>
                                    <div>
                                        <button>장바구니(0)</button>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <button>주문내역(0)</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="tab_content">
                            <ul>
                                <li>
                                    <div class="empty">
                                        <p>제품을 장바구니에 담아주세요.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <div class="row">
                                                <div class="table_util">
                                                    <label class="label_check"><input type="checkbox" class="chk_cart_all chk_cart"><span>전체(0)</span></label>
                                                    <button class="btn_util">삭제</button>
                                                    <button class="btn_util">새로고침</button>
                                                </div>
                                                <div class="table_align">
                                                    <select class="sel_align">
                                                        <option value="">재료상별 정렬</option>
                                                        <option value="">제품담긴순서별 정렬</option>
                                                        <option value="">제품이름별 정렬</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab_body">
                                            <div class="table_style_01">
                                                <ul>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 START (삭제금지) -->
                                                    <li class="tutorial_temp">
                                                        <div>
                                                            <div class="thead">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox"><span>eDENT</span></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="price">231,000원</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tbody">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox"><span>GenTaper Finishing File</span></label>
                                                                        </div>
                                                                        <div class="standard">F1, 21mm yellow</div>
                                                                        <div class="manufact">Micro-Mega</div>
                                                                        <div class="package">6ea/1box</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text" value="1">
                                                                        </div>
                                                                        <div class="price">
                                                                            39,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox"><span>Hero apical</span></label>
                                                                        </div>
                                                                        <div class="standard">종합 06 taper, 08 taper</div>
                                                                        <div class="manufact">Micro-Mega</div>
                                                                        <div class="package">4ea/1box</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text" value="1">
                                                                        </div>
                                                                        <div class="price">
                                                                            52,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox"><span>ENDO TRAINING BLOCKS</span></label>
                                                                        </div>
                                                                        <div class="standard">0.15 - 0.35 taper .02</div>
                                                                        <div class="manufact">Dentsply Sirona</div>
                                                                        <div class="package">8ea</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text" value="1">
                                                                        </div>
                                                                        <div class="price">
                                                                            140,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 END (삭제금지) -->
                                                    <li>
                                                        <div>
                                                            <div class="thead">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_title"><span>도매상 A</span></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="price">3,000,000원</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tbody">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea
                                                                        </div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            1,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea
                                                                        </div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            1,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea
                                                                        </div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            1,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <div class="thead">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_title"><span>도매상 B</span></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="price">5,000,000원</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tbody">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea
                                                                        </div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            3,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea
                                                                        </div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            1,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea
                                                                        </div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            1,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <div class="thead">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_title"><span>도매상 C</span></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="price">5,000,000원</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tbody">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea
                                                                        </div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            3,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea
                                                                        </div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            1,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea
                                                                        </div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            1,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="tab_foot">
                                            <div class="sum_wrap">
                                                합계 99,999,999원
                                            </div>
                                            <div class="notification">
                                                <div class="noti_box_wrap">
                                                    <button class="btn_box_close"
                                                        onclick="closeNotice(this);">&#10005;</button>
                                                    <div class="tit warning">주문 중복 주의</div>
                                                    <div class="desc">주문하기 버튼을 누르면 해당 재료상 사이트에 담긴 장바구니 제품들은 삭제됩니다. 주문하기
                                                        진행 중일 때 재료상 사이트에 주문을 넣지 않도록 주의해 주세요.</div>
                                                </div>
                                            </div>
                                            <div class="btn_order_wrap">
                                                <button class="btn_order"
                                                    onclick="openLayerPop('order_payment');">주문하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="empty">
                                        <p>주문내역이 없습니다.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <div class="col">
                                                <div class="total_month_wrap">
                                                    <!-- <select name="" id="" class="sel_month">
                                                        <option value="">11월 주문금액</option>
                                                    </select> -->
                                                    <input type="text" class="inp_month">
                                                    <div class="sum_month">99,999,999원</div>
                                                </div>
                                                <div class="comm_search_wrap">
                                                    <select name="" id="" class="sel_search">
                                                        <option value="">재료상 전체</option>
                                                    </select>
                                                    <span class="bar"></span>
                                                    <input type="text" placeholder="제품명" class="inp_search">
                                                    <button class="btn_search"></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab_body">
                                            <div class="list_style_03">
                                                <dl>
                                                    <dt>
                                                        <div class="order_date">2021.11.23.</div>
                                                    </dt>
                                                    <dd>
                                                        <div class="order_list">
                                                            <ul>
                                                                <li class="complete">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;"
                                                                                    class="title">동원아이팜</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31
                                                                                    </div>
                                                                                    <span
                                                                                        class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span
                                                                                        class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외
                                                                                            3건</div>
                                                                                        <div class="sum">64,852원</div>
                                                                                    </a>
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div
                                                                                                            class="title">
                                                                                                            하루온팩(더큰사이즈)
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="stock">
                                                                                                            50/50개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div
                                                                                                            class="descript">
                                                                                                            750밀리리터1(EA)
                                                                                                            / 제조사 / 포장단위
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="price">
                                                                                                            14,852원
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div
                                                                                                            class="title">
                                                                                                            하루온팩(더큰사이즈)
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="stock">
                                                                                                            50/50개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div
                                                                                                            class="descript">
                                                                                                            750밀리리터1(EA)
                                                                                                            / 제조사 / 포장단위
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="price">
                                                                                                            14,852원
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div
                                                                                                            class="title">
                                                                                                            하루온팩(더큰사이즈)
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="stock">
                                                                                                            50/50개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div
                                                                                                            class="descript">
                                                                                                            750밀리리터1(EA)
                                                                                                            / 제조사 / 포장단위
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="price">
                                                                                                            14,852원
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="complete">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;" class="title">지오영
                                                                                    네트웍스</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31
                                                                                    </div>
                                                                                    <span
                                                                                        class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span
                                                                                        class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <!-- <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외 3건</div>
                                                                                        <div class="sum">64,852원</div>
                                                                                    </a> -->
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">타나민 정 80mg</div>
                                                                                                        <div class="stock">0/3개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">120밀리그램 90(정) / 포장단위 / 제조</div>
                                                                                                        <div class="price">0원<span class="disabled">(64,852원)</span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </dd>
                                                </dl>
                                                <dl>
                                                    <dt>
                                                        <div class="order_date">2021.11.22.</div>
                                                    </dt>
                                                    <dd>
                                                        <div class="order_list">
                                                            <ul>
                                                                <li class="complete">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;"
                                                                                    class="title">동원아이팜</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31
                                                                                    </div>
                                                                                    <span
                                                                                        class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span
                                                                                        class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외
                                                                                            3건</div>
                                                                                        <div class="sum">64,852원</div>
                                                                                    </a>
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                        <div class="stock">50/50개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">750밀리리터1(EA) / 제조사 / 포장단위</div>
                                                                                                        <div class="price">14,852원</div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                        <div class="stock">50/50개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">750밀리리터1(EA) / 제조사 / 포장단위</div>
                                                                                                        <div class="price">14,852원</div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                        <div class="stock">50/50개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">750밀리리터1(EA) / 제조사 / 포장단위</div>
                                                                                                        <div class="price">14,852원</div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="fail">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;" class="title">지오영
                                                                                    네트웍스</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31
                                                                                    </div>
                                                                                    <span
                                                                                        class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span
                                                                                        class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <!-- <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외 3건</div>
                                                                                        <div class="sum">64,852원</div>
                                                                                    </a> -->
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">타나민 정 80mg</div>
                                                                                                        <div class="stock">0/3개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">120밀리그램 90(정) / 포장단위 / 제조</div>
                                                                                                        <div class="price">0원<span class="disabled">(64,852원)</span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="somefail">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;"
                                                                                    class="title">백제약품</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31
                                                                                    </div>
                                                                                    <span
                                                                                        class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span
                                                                                        class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외2건</div>
                                                                                        <div class="sum">14,852원<span class="disabled">(20,000원)</span></div>
                                                                                    </a>
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                        <div class="stock">50/50개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">750밀리리터1(EA) / 제조사 / 포장단위</div>
                                                                                                        <div class="price">14,852원</div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li class="somefail">
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">리스테린(쿨민트)</div>
                                                                                                        <div class="stock">0/3개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">10G / 포장단위 / 제조</div>
                                                                                                        <div class="price">0원<span class="disabled">(5,852원)</span></div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>
                                        <div class="tab_foot">
                                            <div class="btn_inquiry_wrap">
                                                <button class="btn_inquiry">구매내역 조회</button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tutorial_step tutorial_step_4">
                    <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                    <div class="clip_step"></div>
                    <div class="layer_step">
                        <div class="layer_step_inner">
                            <div class="txt">4. 제품들을 한눈에 확인해 보세요.</div>
                            <button class="btn_next" onclick="nextLayerPop(5)">다음</button>
                        </div>
                    </div>
                </div>
                <div class="tutorial_step tutorial_step_5">
                    <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                    <div class="clip_step"></div>
                    <div class="layer_step">
                        <div class="layer_step_inner">
                            <div class="txt">5. 장바구니에 담긴 제품들을 바로 주문해 보세요.</div>
                            <button class="btn_next" onclick="nextLayerPop(6)">다음</button>
                        </div>
                    </div>
                </div>
            </article>
        </div>

        <!-- 빠른주문 사용안내 팝업 -->
        <div class="quickorder_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="img">
                        <img src="/resources/images/quickorder/img_qorder_pop.png" alt="">
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_disable" onclick="">다시보지 않기</button>
                    <button class="btn_yellow" onclick="nextLayerPop(1)">자세히 보기</button>
                </div>
            </div>
        </div>

        <!-- 연동하기 팝업 -->
        <div class="interlock_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">건화약품 연동하기</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                                <div class="desc">(건화약품 한줄 소개멘트)</div>
                            </div>
                            <div class="col">
                                <div class="tit">건화약품 연락처</div>
                                <div class="desc">02-7468-4114</div>
                            </div>
                            <div class="col">
                                <div class="tit">건화약품 주소</div>
                                <div class="desc">서울시 종로구 하마로 143길, 기호빌딩</div>
                            </div>
                            <div class="col">
                                <div class="tit">건화약품 홈페이지</div>
                                <div class="desc">www.건화약품.co.kr</div>
                            </div>
                            <div class="col">
                                <div class="desc">※ 등록하신 계정 정보는 암호화 되어 안전하게 관리됩니다.<br>연동관련 문의사항은 메디밸류 고객센터(02-780-3921)로
                                    연락 부탁 드립니다.</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_disable" onclick="closeLayerPop(this);">닫기</button>
                    <button class="btn_blue" onclick="">연동하기</button>
                </div>
            </div>
        </div>

        <!-- 재료상 추가 요청 팝업 -->
        <div class="request_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">재료상 추가 요청</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                                <div class="desc">재료상 정보를 입력해 주시면 재료상 추가가 진행됩니다.</div>
                            </div>
                            <div class="col">
                                <div class="tit">재료상 이름</div>
                                <div class="inp">
                                    <input type="text" placeholder="재료상 이름을 입력해 주세요.">
                                </div>
                            </div>
                            <div class="col">
                                <div class="tit">재료상 연락처</div>
                                <div class="inp">
                                    <input type="text" placeholder="재료상 연락처를 입력해 주세요.">
                                </div>
                            </div>
                            <div class="col">
                                <div class="desc">※ 등록하신 계정 정보는 암호화 되어 안전하게 관리됩니다.<br>연동관련 문의사항은 메디밸류 고객센터(02-780-3921)로
                                    연락 부탁 드립니다.</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_disable" onclick="closeLayerPop(this);">닫기</button>
                    <button class="btn_blue" onclick="">요청하기</button>
                </div>
            </div>
        </div>

        <!-- 재품 상세 팝업 -->
        <div class="detail_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">CleanCord<span class="cate">[코드/지혈용품]</span></div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="row">
                                <div class="image">
                                    <div class="img">
                                        <img src="/resources/images/dummy/640x480.png" alt="">
                                    </div>
                                </div>
                                <div class="text">
                                    <ul>
                                        <li>
                                            <div>
                                                <div class="tit">제품명</div>
                                                <div class="desc">CleanCord</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">제조사</div>
                                                <div class="desc">SS GLOBAL/한국</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">포장단위</div>
                                                <div class="desc">300cm/ea</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">규격 | 5종류</div>
                                                <div class="desc scrolly">
                                                    <ul>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col">
                                <div class="spec">
                                    <div class="desc">전자상거래 등에서의 상품정보제공고시</div>
                                    <ul>
                                        <li>
                                            <div>
                                                <div class="tit">제조사/수입사</div>
                                                <div class="desc">SS GLOBAL/한국</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">상품코드</div>
                                                <div class="desc">01033000059</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">중량/용량</div>
                                                <div class="desc">300cm/ea</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">취급주의사항</div>
                                                <div class="desc">제품 안에 사용 설명서를 참고하세요</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">사용기한</div>
                                                <div class="desc">제품 박스를 참고하세요.</div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_blue" onclick="closeLayerPop(this);">확인</button>
                </div>
            </div>
        </div>

        <!-- 주문하기 팝업 -->
        <div class="order_pop order_payment_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">주문결제</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="row">
                                <div class="order_prd_wrap">
                                    <div class="order_prd">
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">주문제품</div>
                                                <div class="util">
                                                    <div class="txt">합계 12,000,000원</div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_list">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <div class="txt">
                                                                    <div class="hd">
                                                                        <div class="title">백제약품</div>
                                                                        <div class="badge">
                                                                            <div class="price">64,852원</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="bd">
                                                                        <div class="sub">
                                                                            <ul>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <div class="txt">
                                                                    <div class="hd">
                                                                        <div class="title">백제약품</div>
                                                                        <div class="badge">
                                                                            <div class="price">64,852원</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="bd">
                                                                        <div class="sub">
                                                                            <ul>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <div class="txt">
                                                                    <div class="hd">
                                                                        <div class="title">백제약품</div>
                                                                        <div class="badge">
                                                                            <div class="price">64,852원</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="bd">
                                                                        <div class="sub">
                                                                            <ul>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order_info_wrap">
                                    <div class="order_info">
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">주문자</div>
                                                <div class="util">
                                                    <div class="button">
                                                        <button class="btn_modify">수정하기</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">받는분</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">김성민</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">휴대폰</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">010-0000-0000</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">이메일</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">123456789@hanmail.net</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">쿠폰/포인트</div>
                                                <div class="util">
                                                    <div class="info">
                                                        쿠폰/포인트 사용 안내 <a href="javascript:;">?<span
                                                                class="info_box">할인쿠폰과 포인트 중 하나의 혜택만 사용하실 수
                                                                있습니다.</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">쿠폰적용</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="row">
                                                                <select name="" id="" class="sel_basic">
                                                                    <option value="">사용가능한 쿠폰이 없습니다.</option>
                                                                </select>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">포인트적용</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="row">
                                                                <input type="text" class="inp_basic"><button
                                                                    class="btn_basic">모두사용</button>
                                                            </div>
                                                            <div class="subdesc">
                                                                <div class="text">현재 포인트 : <span
                                                                        class="color_orange">0</span>포인트</div>
                                                                <ul>
                                                                    <li>
                                                                        <div>- 보유 포인트 1천원 이상부터 사용가능</div>
                                                                    </li>
                                                                    <li>
                                                                        <div>- 총 결제 금액의 5% 까지 사용가능</div>
                                                                    </li>
                                                                    <li>
                                                                        <div>- 적립금 내역 : 내 계정 > 포인트 쿠폰</div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">결제금액</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic order_bg_box">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">제품금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">12,000,000원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl class="sub">
                                                        <dt>
                                                            <div class="text">└ 상품금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">12,000,000원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl class="sub">
                                                        <dt>
                                                            <div class="text">└ 상품할인금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">12,000,000원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송비</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">12,000원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">쿠폰할인금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_orange">12,000,000원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">적립금사용</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_orange">12,000,000원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl class="total">
                                                        <dt>
                                                            <div class="text">최종결제금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">99,999,999원</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="order_info">
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">배송정보</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송지</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">경기도 시흥시 서울대학로278번길 19-13 경기도 시흥시
                                                                서울대학로278번길 19-13</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">상세정보</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">108동 2층 235~236호 (정왕동, 시흥배곧 C1블럭 호반 써밋플레이스
                                                                아파트)</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송요청사항</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="row">
                                                                <div class="comment_wrap">
                                                                    <input type="text" class="inp_basic" placeholder="배송요청사항을 직접 입력합니다.">
                                                                    <div class="comment">
                                                                        <ul>
                                                                            <li>
                                                                                <a href="javascript:;">배송 전 연락 부탁드립니다.</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="javascript:;">부재시 경비실에 맡겨주세요.</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="javascript:;">부재시 전화 주시거나 문자 남겨주세요.</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="javascript:;">안전한 배송 부탁드립니다.</a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">결제수단</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <div class="radio_wrap">
                                                        <label class="label_radio">
                                                            <input type="radio" name="rdo_payment"><span>무통장입금</span>
                                                        </label>
                                                        <label class="label_radio">
                                                            <input type="radio" name="rdo_payment"><span>신용카드</span>
                                                        </label>
                                                        <label class="label_radio">
                                                            <input type="radio" name="rdo_payment"><span>내통장결제</span>
                                                        </label>
                                                        <label class="label_radio">
                                                            <input type="radio" name="rdo_payment"><span>메디캐쉬</span>
                                                        </label>
                                                    </div>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">보유메디캐쉬</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="row flex_end">
                                                                <div class="text word_keep"><span
                                                                        class="color_orange">10,000,000,000</span>원
                                                                </div><button class="btn_basic">충전하기</button><button
                                                                    class="btn_basic">새로고침</button>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">메디캐쉬사용</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="row">
                                                                <input type="text" class="inp_basic"><button
                                                                    class="btn_basic">모두사용</button>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">세금계산서 정보</div>
                                                <div class="util">
                                                    <div class="button">
                                                        <button class="btn_modify">수정하기</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic order_small">
                                                    <div class="radio_wrap flex_start">
                                                        <label class="label_radio">
                                                            <input type="radio" name="rdo_invoice"><span>신청</span>
                                                        </label>
                                                        <label class="label_radio">
                                                            <input type="radio" name="rdo_invoice"><span>미신청</span>
                                                        </label>
                                                    </div>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">사업자번호</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">646-81-02195</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">대표자명</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">김성민</div>
                                                        </dd>
                                                        <dt>
                                                            <div class="text">회사명</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">김성민</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">업태</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">보건업</div>
                                                        </dd>
                                                        <dt>
                                                            <div class="text">종목</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">치과의원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">이메일</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">xcobain@hanmail.net</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">개인정보 수집/제공</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <div class="check_2_wrap">
                                                        <label class="label_check_2">
                                                            <input type="checkbox"><span>결제 진행 필수 동의</span>
                                                        </label>
                                                    </div>
                                                    <div class="terms_wrap">
                                                        <ul>
                                                            <li>
                                                                <div>
                                                                    <div class="txt">개인정보 수집 이용 및 위탁 동의 (필수)</div>
                                                                    <a href="javascript:;" class="btn_terms" onclick="openLayerPop('personal_terms');">약관보기</a>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div>
                                                                    <div class="txt">결제대행 서비스 약관 동의 (필수)</div>
                                                                    <a href="javascript:;" class="btn_terms" onclick="openLayerPop('service_terms');">약관보기</a>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_disable" onclick="closeLayerPop(this);">닫기</button>
                    <button class="btn_blue btn_payment" onclick="openLayerPop('order_complete');">결제하기</button>
                </div>
            </div>
        </div>

        <!-- 주문완료 팝업 -->
        <div class="order_pop order_complete_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">주문완료</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="row">
                                <div class="order_prd_wrap">
                                    <div class="order_prd">
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">주문제품</div>
                                                <div class="util">
                                                    <div class="txt">합계 12,000,000원</div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_list">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <div class="txt">
                                                                    <div class="hd">
                                                                        <div class="title">백제약품</div>
                                                                        <div class="badge">
                                                                            <div class="price">64,852원</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="bd">
                                                                        <div class="sub">
                                                                            <ul>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <div class="txt">
                                                                    <div class="hd">
                                                                        <div class="title">백제약품</div>
                                                                        <div class="badge">
                                                                            <div class="price">64,852원</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="bd">
                                                                        <div class="sub">
                                                                            <ul>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div>
                                                                                        <div class="row">
                                                                                            <div class="title">
                                                                                                하루온팩(더큰사이즈)</div>
                                                                                            <div class="stock">50/50개
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="stand">
                                                                                                750밀리리터1(EA)</div>
                                                                                            <div class="price">14,852원
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="manu">SS
                                                                                                GLOBAL/한국</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order_info_wrap">
                                    <div class="order_info">
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">받는사람 정보</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">받는사람</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">의료법인사과나무의료재단 중산사과나무치과병원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">받는주소</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text ellipsis_off">경기도 시흥시 서울대학로278번길 19-13 108동
                                                                2층 235~236호 (정왕동, 시흥배곧 C1블럭 호반 써밋플레이스 아파트)</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송요청사항</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">직접 받고 부재 시 문 앞</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">결제정보</div>
                                                <div class="util">
                                                    <div class="info">입금일은 주문일로 부터 3일</div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">입금기한</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">2021년 12월 15일 00:12분 까지<br>미입금시 취소</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">입금금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">12,000,000원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">입금계좌</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="row">
                                                                <div class="clipboard_wrap">
                                                                    <div class="txt_clip">하나은행</div><input type="text"
                                                                        class="inp_basic inp_clip"
                                                                        value="547-910035-44104" readonly>
                                                                </div>
                                                                <button class="btn_basic btn_clip"
                                                                    onclick="copyClipBoard(this);">복사하기</button>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">입금주</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_blue">메디밸류</div>
                                                        </dd>
                                                    </dl>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">세금계산서 정보</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic order_small">
                                                    <div class="radio_wrap flex_start">
                                                        <label class="label_radio">
                                                            <input type="radio" name="rdo_invoice" onclick="return false;" checked><span>신청</span>
                                                        </label>
                                                        <label class="label_radio">
                                                            <input type="radio" name="rdo_invoice" onclick="return false;"><span>미신청</span>
                                                        </label>
                                                    </div>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">사업자번호</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">646-81-02195</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">대표자명</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">김성민</div>
                                                        </dd>
                                                        <dt>
                                                            <div class="text">회사명</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">김성민</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">업태</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">보건업</div>
                                                        </dd>
                                                        <dt>
                                                            <div class="text">종목</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">치과의원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">이메일</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">xcobain@hanmail.net</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="order_info">
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">배송정보</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송정보</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">자체배송</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">판매업체</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">오라피트 / 메디밸류</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">결제금액</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic order_bg_box">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">결제수단</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">무통장입금</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">결제금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">12,000,000원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송비</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">21,000원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl class="total">
                                                        <dt>
                                                            <div class="text">최종결제금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_blue">12,021,000원</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_disable" onclick="">주문상세보기</button>
                    <button class="btn_blue" onclick="">주문계속하기</button>
                </div>
            </div>
        </div>

        <!-- 개인정보수집 약관 팝업 -->
        <div class="terms_pop personal_terms_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">개인정보 수집 이용 및 위탁 동의</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                                <div class="terms_txt">
                                    <p>개인정보처리방침</p>
                                    <p>&lt;(주)메디밸류&gt;('http://www.medivalue.co.kr'이하 '회사')은(는) 「개인정보 보호법」 제30조에 따라 정부주체의
                                        개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립 · 공개합니다.○ 이
                                        개인정보처리방침은 2021년 6월 1부터 적용됩니다.</p>
                                    <h5>제1조(개인정보의 처리 목적)</h5>
                                    <p>회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 겨우에는
                                        법률에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.1. 회원가입 및 관리<br>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인
                                        식별 · 인증, 회원자격 유지 · 관리, 서비스 부정이용 방지, 비인가 사용방지 및 서비스 제공 및 계약의 이행, 각종 고지 · 통지, 서비스 이용 및
                                        상담, 문의 등 원활한 의사소통 경로 확보, 맞춤형 회원 서비스 제공, 거점 기반 서비스 제공, 고충처리 목적 등으로 개인정보를 처리합니다.<br>2.
                                        재화 또는 서비스 제공<br>물품배송, 서비스 제공, 계약서 · 청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 요금결제 · 정산을 목적으로
                                        개인정보를 처리합니다.<br>3. 마케팅 및 광고에의 활용신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회
                                        제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로
                                        개인정보를 처리합니다.</p>
                                    <h5>제2조(개인정보의 처리 및 보유 기간)</h5>
                                    <p>1. 회사는 법령에 따른 개인정보 보유 · 이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유 · 이용기간 내에서 개인정보를 처리
                                        · 보유합니다.<br>2. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>①홈페이지 회원가입 및 관리: 회원 탈퇴 시까지<br>다만,
                                        다음의 사유에 해당하는 경우에는 해당 사유 종료시까지<br>-관계 법령 위반에 따른 수사조사 등이 진행 중인 경우에는 해당 수사조사 종료
                                        시까지<br>-홈페이지 이용에 따른 채권 채무관계 잔존 시에는 해당 채권 채무관계 정산시까지<br>②재화 또는 서비스 제공: 재화·서비스 공급완료 및
                                        요금결제·정산 완료시까지<br>다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지<br>-『전자상거래 등에서 소비자 보호에 관한
                                        법률』<br>①계약 또는 청약철회 등에 관한 기록: 5년<br>②대금결제 및 재화 등의 공급에 관한 기록: 5년<br>③소비자의 불만 또는 분쟁처리에
                                        관한 기록: 3년<br>④표시·광고에 관한 기록: 6개월<br>-『정보통신 이용촉진 및 정보보호 등에 관한 법률』<br>본인 확인에 대한 기록:
                                        6개월<br>- 『통신비밀보호법』<br>인터넷 로그기록자료, 접속지 추적자료: 3개월</p>
                                    <h5>제3조(개인정보의 제3자 제공)</h5>
                                    <p>1. 회사는 인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」
                                        제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>2.단, 원활한 서비스 제공을 위해 상품 구매 시 서비스 제공 업체로
                                        이용자의 개인정보를 제3자 제공에 동의하는 경우에는 서비스 제공 및 배송, 본인확인 등을 위하여 필요한 최소한의 개인정보만을 서비스 제공 업체에게
                                        제공합니다.<br>판매업체<br>-개인정보를 제공받는 자 : 판매업체<br>-제공받는 자의 개인정보 이용목적 : 서비스 제공 및 배송<br>-제공하는
                                        개인정보 항목: 로그인ID, 성명, 주소, 전화번호, 메일주소, 구매상품정보, 의료기관명, 의료기관전화번호, 은행계좌정보<br>-제공받는 자의
                                        보유.이용기간: 구매완료일로부터 5년</p>
                                    <h5>제4조(개인정보처리 위탁)</h5>
                                    <p>1. 회사는 활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>-결제 서비스<br>-위탁받는 자 (수탁자) :
                                        토스페이먼트(주)<br>-위탁하는 업무의 내용 : 구매 및 요금 결제<br>2. 회사는 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무
                                        수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에
                                        명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>3. 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보
                                        처리방침을 통하여 공개하도록 하겠습니다.<br>제5조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)<br>1. 정보주체는 회사에 대해 언제든지
                                        개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.<br>2. 1항에 따른 권리 행사는 회사에 대해 「개인정보 보호법」 시행령
                                        제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체 없이 조치하겠습니다.<br>3.제1항에
                                        따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한
                                        고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>4.개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조
                                        제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.<br>5.개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집
                                        대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br>6.회사는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구
                                        시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.<br>제6조(처리하는 개인정보의 항목 작성)<br>1. 회사는 다음의 개인정보
                                        항목을 처리하고 있습니다.<br>-홈페이지 회원 가입 및 관리<br>필수항목 : 로그인ID, 이름, 면허번호, 의료기관명, 생년월일, 이메일, 주소,
                                        전화번호, 휴대폰, 요양기관기호 및 명칭, 담당자명<br>선택항목 : 추천인<br>-재화 또는 서비스 제공<br>필수항목 : 로그인ID, 이름,
                                        면허번호, 의료기관명, 생년월일, 이메일, 주소, 전화번호, 휴대폰, 상호, 사업자번호 및 사업자등록정보, 사업자 주소, 은행계좌정보, 요양기관기호 및
                                        명칭, 담당자명<br>선택항목 : 추천인<br>-회사의 서비스 이용과정에서 IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 블랑 이용기록,
                                        모바일 기기정보(앱 버전, OS버전), ADID/IDFA(광고식별자)등의 정보가 자동으로 생성되어 수집될 수 있습니다.<br>-진행하는 이벤트에 따라
                                        수집항목이 상이할 수 있으므로 응모 시 별도 동의를 받으며, 목적 달성 즉시 파기합니다.<br></p>
                                    <h5>제7조(개인정보의 파기)</h5>
                                    <p>1.회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>2.이용자로부터
                                        동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를
                                        별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다. 별도 보존되는 개인정보는 법률에 의한 경우가 아니고서는 보존목적 이외의 다른
                                        목적으로 이용되지 않습니다.<br>3.개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>①파기절차<br>회사는 파기 사유가 발생한 개인정보를
                                        선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>②파기방법<br>-회사는 전자적 파일 형태의 정보는 기록을 재생할 수
                                        없는 기술적 방법을 사용합니다.<br>-종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다</p>
                                    <h5>제8조(개인정보의 안전성 확보 조치)</h5>
                                    <p>회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.<br>1.관리적 조치: 내부관리계획 수립 시행, 정기적 직원 교육
                                        등<br>2.기술적 조치: 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정도 등의 암호화, 보안프로그램 설치등<br>3.물리적
                                        조치: 전산실, 자료보관실 등의 접근 통제</p>
                                    <h5>제9조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항)</h5>
                                    <p>1.(주)메디밸류 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를
                                        사용합니다.<br>2.쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC
                                        컴퓨터내의 하드디스크에 저장되기도 합니다.<br>-쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기
                                        검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br>-쿠키의 설치•운영 및 거부 : 웹브라우저 상단의
                                        도구&gt;인터넷 옵션&gt;개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에
                                        어려움이 발생할 수 있습니다.</p>
                                    <h5>제10조 (개인정보 보호책임자)</h5>
                                    <p>1. (주)메디밸류 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와
                                        같이 개인정보 보호책임자를 지정하고 있습니다.<br>-개인정보 보호책임자<br>•성명 :홍하석<br>•직책 :개발<br>•직급 :팀장<br>•연락처 :
                                        info@medivalue.co.kr,<br>-개인정보 보호 담당부서<br>•부서명 :개발팀<br>•담당자 :홍하석<br>•연락처 :
                                        info@medivalue.co.kr,<br>2.이용자께서는 회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제
                                        등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 사용자의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br>
                                    </p>
                                    <h5>제11조(개인정보 열람청구)</h5>
                                    <p>정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.<br>회사는 정보주체의 개인정보 열람청구가 신속하게
                                        처리되도록 노력하겠습니다.<br>-개인정보 열람청구 접수·처리 부서<br>•부서명 : 개발팀<br>•담당자 : 홍하석<br>•연락처 :
                                        info@medivalue.co.kr,</p>
                                    <h5>제12조(권익침해 구제방법)</h5>
                                    <p>사용자는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수
                                        있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.<br>1. 개인정보분쟁조정위원회 : (국번없이)
                                        1833-6972 (www.kopico.go.kr)<br>2. 개인정보침해신고센터 : (국번없이) 118
                                        (privacy.kisa.or.kr)<br>3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br>4. 경찰청 : (국번없이) 182
                                        (cyberbureau.police.go.kr)<br>「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의
                                        처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는
                                        바에 따라 행정심판을 청구할 수 있습니다.<br>※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를
                                        참고하시기 바랍니다.</p>
                                    <h5>제13조(개인정보 처리방침 변경)</h5>
                                    <p>본 개인정보 처리방침을 개정할 경우에는 최소 7일전에 홈페이지 또는 이메일을 통해 변경 및 내용 등을 공지하겠습니다. 다만 이용자의 소중한 권리 또는
                                        의무에 중요한 내용변경이 발생하는 경우 시행일로부터 최소 30일 전에 공지하도록 하겠습니다.<br>이 개인정보처리방침은 2021년 6월 1부터
                                        적용됩니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_blue" onclick="closeLayerPop(this);">확인</button>
                </div>
            </div>
        </div>

        <div class="terms_pop service_terms_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">결제대행 서비스 약관 동의</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                                <div class="terms_txt">
                                    <p>구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</p>
                                    <h5>개인정보 수집·이용동의</h5>
                                    <p>수집 목적: 온라인 쇼핑 구매자에 대한 상품 배송<br>수집 항목: 결제정보, 의료기관명, 의료기관 전화번호, 수취인명, 휴대전화번호, 수취인주소<br>보유 기간: 업무 목적 달성 후 파기(단, 타 법령에 따라 법령에서 규정한 기간동안 보존)</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_blue" onclick="closeLayerPop(this);">확인</button>
                </div>
            </div>
        </div>

        <!-- 결제대행서비스 약관 팝업 -->


    </section>
    <!-- BODY END -->
    
	</jsp:body>
</layout:basicFrameNew>