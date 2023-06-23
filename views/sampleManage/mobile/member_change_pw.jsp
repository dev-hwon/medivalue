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
                <div class="tx_tit">비밀번호 변경</div>
                <form name="form_member_change_pw" class="form_find">
                    <div class="input_wrap">
                        <label>비밀번호 변경</label>
                        <input type="password" class="input_text input_pw required" name="password" placeholder="변경할 비밀번호를 입력해 주세요" />
                    </div>
                    <div class="tx_msg tx_msg_password"></div>
                    <div class="input_wrap">
                        <label>변경 비밀번호 확인</label>
                        <input type="password" class="input_text input_pw_confirm required" name="password_confirm" placeholder="변경할 비밀번호를 다시 입력해 주세요" />
                    </div>
                    <div class="tx_msg tx_msg_password_confirm"></div>
                    <button type="submit" class="btn_common btn_blue btn_find">변경완료</button>
                </form>
            </div>
        </div>

        <script>
            let form = $("form[name=form_member_change_pw]");
            let isChangeable = false;
            function checkPassword() {
                let pw = $("input[name=password]").val();
                let pw_confirm = $("input[name=password_confirm]").val();
                if( pw.length === 0 || pw_confirm.length === 0 ) {
                    $(".tx_msg_password_confirm").text('');
                    return isChangeable = false;;
                }
                if( pw_confirm.length < 4 ) {
                    return isChangeable = false;;
                }
                if( pw === pw_confirm ) {
                    $(".tx_msg_password_confirm").text('비밀번호가 일치합니다.').addClass('ok').removeClass('error')
                    return isChangeable = true;
                } else {
                    $(".tx_msg_password_confirm").text('비밀번호가 일치하지 않습니다.').addClass('error').removeClass('ok')
                    return isChangeable = false;
                }
            }
            $("input[name=password]").on("input", function(){
                checkPassword();
            }).on("focusout", function (){
                if( $(this).val().length === 0) {
                    $(".tx_msg_password").text('');
                    return;
                }
                if( $(this).val().length < 4) {
                    $(".tx_msg_password").text('영문 4자~16자, 문자와 숫자를 조합해 주세요.').addClass('error')
                } else {
                    $(".tx_msg_password").text('');
                }
            });
            $("input[name=password_confirm]").on("input", function(){
                checkPassword();
            });
            form.submit(function(e){
                e.preventDefault();
                if(isChangeable) {
                    mvLayer.alert("정상적으로 처리되었습니다");
                    // 로그인페이지로 리다이렉트
                } else {
                    mvLayer.alert("비밀번호를 확인해주세요");
                }
            })
        </script>
    </jsp:body>
</layout:MobileStoreFrame>
