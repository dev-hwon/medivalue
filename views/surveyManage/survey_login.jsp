<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:surveyFrame>
    <jsp:body>
    <div id="wrap">
        <div id="container" class="main">
            <main>
                <section class="sec_intro">
                    <article>
                        <div class="inner">
                            <div class="img_wrap">
                                <a href="/survey/home"><img src="/resources/images/survey/ico_logo.png" alt="medivalue"></a>
                            </div>
                            <div class="ques_wrap">
                                <div class="img">
                                    <img src="/resources/images/survey/img_intro.png" alt="">
                                </div>
                                <div class="txt">
                                    안녕하세요 :)<br>
                                    스마트한 원장님들의 선택 메디밸류입니다!<br>
                                    저는 원장님들의 안내를 도와드릴 <span>메디</span>입니다.
                                </div>
                            </div>
                            <div class="btn_wrap">
                                <div class="desc">설문참여하시고 100%당첨 이벤트에서 경품 받아가세요!</div>
                                <a href="/survey/main" class="btn_start" >간단 설문 시작하기</a>
                            </div>
                        </div>
                    </article>
                </section>
            </main>
        </div>
    </div>
    </jsp:body>
</layout:surveyFrame>