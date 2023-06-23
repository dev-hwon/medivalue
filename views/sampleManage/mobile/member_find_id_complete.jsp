<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
	    <link href="/resources/css/mobile/member.css" rel="stylesheet" >
	</jsp:attribute>
    <jsp:body>
        <!-- 관리자에서 이미지등록시 이미지내용도 입력할수있게... -->
        <div class="m_contents m_member">
            <div class="container">
                <div class="tx_tit">고객님의 아이디 찾기가<br />완료되었습니다</div>
                <div class="tx_desc tx_find_id">아이디: dkgkjgja</div>
                <div class="btn_wrap">
                    <a href="member_login" class="btn_common btn_blue_on link_login">로그인</a>
                    <a href="member_find_pw" class="btn_common btn_blue link_find_pw">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </jsp:body>
</layout:MobileStoreFrame>
