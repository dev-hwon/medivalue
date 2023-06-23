<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
	    <link href="/resources/css/mobile/order.css" rel="stylesheet" >
	</jsp:attribute>
    <jsp:body>
        <div class="m_contents">
            <section class="section sec_order_complete">
                <div class="container">
                    <div class="tx_complete">
                        결제가 정상적으로<br />
                        처리되었습니다.
                    </div>
                    <div class="tx_sub_info">
                        메디밸류를 통해 <em>10,000원</em>이나<br />
                        저렴하게 구매 하셨어요
                    </div>
                    <a href="/" class="link_home">홈 화면으로 이동하기</a>
                </div>
            </section>
        </div>
        <layout:MobileStoreFooterFrame />
    </jsp:body>
</layout:MobileStoreFrame>
