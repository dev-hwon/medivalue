<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
	    <link href="/resources/css/mobile/evt.css" rel="stylesheet" >
	</jsp:attribute>
    <jsp:body>
        <!-- 관리자에서 이미지등록시 이미지내용도 입력할수있게... -->
        <div class="m_contents">
            <section class="section sec_top_banner">
                <div class="container container_full">
                    <img src="http://via.placeholder.com/720x180" alt="이미지제목"/>
                </div>
            </section>
            <section class="section sec_controller">
                <div class="container">
                    <div class="row row_gap_32 row_between">
                        <div class="col col_sort">
                            <button type="button" class="btn_sorting">전체보기<i class="ic_svg icon_arrow"></i></button>
                            <ul>
                                <li><button type="button" value="전체보기">전체보기</button></li>
                                <li><button type="button" value="진행중">진행중</button></li>
                                <li><button type="button" value="종료됨">종료됨</button></li>
                            </ul>
                        </div>
                        <div class="col"></div>
                    </div>
                </div>
            </section>
            <section class="section sec_evt_list">
                <div class="container">
                    <ul>
                        <li class="item">
                            <a href="" >
                                <div class="item_labels">
                                    <div class="label_ing">진행중</div>
                                    <div class="label_expire">종료됨</div>
                                </div>
                                <div class="item_banner">
                                    <img src="http://via.placeholder.com/656x200" alt="이미지제목"/>
                                </div>
                                <div class="item_info">
                                    <div class="tx_tit tx_shortening_2">이벤트 제목 노출 영역 이벤트 제목 노출</div>
                                    <div class="tx_period">2023/4/1 ~ 5/1</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <button type="button" class="btn_more_ist">더보기(20)<i class="ic_svg icon_arrow"></i></button>
                </div>
            </section>
        </div>
        <script>
            let controller = $(".sec_controller");
            let evtlist = $(".sec_list");
            function fixedController() {
                let current_scroll_value = $(window).scrollTop();
                if (current_scroll_value > evtlist.offset().top) {
                    controller.addClass("fixed_top").css('top', $('header').outerHeight());
                    controller.next().css("margin-top", controller.outerHeight());
                } else {
                    controller.removeClass("fixed_top").attr("style", "");
                    controller.next().attr("style", "");
                }
            }
            $(window).on("load scroll", function () {
                fixedController();
            });

            // 리스트상단_소팅
            $('.col_sort .btn_sorting').on('click', function(){
                $(this).parent().toggleClass('active');
            });
            $('.col_sort ul li button').on('click', function(){
                let catename = $(this).val();
                $('.sec_controller .selected').text(catename);
                $(this).parents('.col_sort').removeClass('active');
            });
        </script>
    </jsp:body>
</layout:MobileStoreFrame>
