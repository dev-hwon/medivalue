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
                <div class="tx_tit">비밀번호 찾기</div>
                <form name="form_member_find_pw" class="form_find">
                    <div class="input_wrap">
                        <label>이름</label>
                        <input type="text" class="input_text input_realname required" name="realname" placeholder="고객님의 이름을 입력해주세요" />
                    </div>
                    <div class="input_wrap input_wrap_mail">
                        <label>아이디</label>
                        <input type="text" class="input_text input_id required" name="id" placeholder="아이디를 입력해주세요" />
                    </div>
                    <div class="input_wrap input_wrap_mail">
                        <label>이메일</label>
                        <input type="text" class="input_text input_email required" name="email" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요" />
                    </div>
                    <button type="submit" class="btn_common btn_blue btn_find">찾기</button>
                </form>
            </div>
        </div>

        <script>
            let form = $("form[name=form_member_find_pw]");
            form.submit(function(e){
                e.preventDefault();
                if ( ! $('[name=realname]').val()) {
                    mvLayer.alert("가입시 등록하신 정보를\n확인해주세요", function(res){
                        if(res) {
                            $('[name=realname]').focus();
                        }
                    });
                    return false;
                }
                if ( ! $('[name=id]').val()) {
                    mvLayer.alert("가입시 등록하신 정보를\n확인해주세요", function(res){
                        if(res) {
                            $('[name=id]').focus();
                        }
                    });
                    return false;
                }
                if( ! $('[name=email]').val()) {
                    mvLayer.alert("가입시 등록하신 정보를\n확인해주세요", function(res){
                        if(res) {
                            $('[name=email]').focus();
                        }
                    });
                    return false;
                }
            })
        </script>
    </jsp:body>
</layout:MobileStoreFrame>
