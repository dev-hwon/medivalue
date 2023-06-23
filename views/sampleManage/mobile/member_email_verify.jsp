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
        <div class="m_contents m_member">
            <div class="container">
                <div class="tx_tit">고객님의 아이디 찾기가<br />완료되었습니다</div>
                <div class="tx_desc tx_verify">
                    입력하신 <em>test@naver.com</em>으로<br />
                    인증번호가 발송되며<br />
                    인증 후 비밀번호가 재발급됩니다<br /><br />

                    전송량이 많은 경우<br />
                    이메일 전송이 지연될 수 있습니다<br /><br />
                    <em>인증번호 발급 후 30분 이내 입력해주세요.</em>
                </div>
                <form name="form_email_verify">
                    <div class="input_wrap">
                        <input type="text" class="input_text" name="verify" placeholder="인증번호를 기입해 주세요" />
                        <button type="button" class="btn_re_send">재전송</button>
                    </div>
                    <button type="button" class="btn_common btn_blue_on btn_verify_my_email">인증하기</button>
                </form>
                <div class="btn_wrap">
                    <button type="button" class="btn_common btn_blue btn_send_verify_number">인증번호 받기</button>
                </div>
            </div>
        </div>
        <script>
            $('.btn_send_verify_number').on('click', function(){
                mvLayer.alert('고객님의 메일로 인증 번호가\n전송되었습니다\n메일이 확인되지 않는 경우\n스팸편지함을 확인해주세요', function(res){
                    console.log('확인누르면 뭔가가(?) 되야겠음...');
                })
            });
        </script>
    </jsp:body>
</layout:MobileStoreFrame>
