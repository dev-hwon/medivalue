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
                <div class="logo"><img src="/resources/images/mobile/m_f_logo.svg" alt="medivalue" /></div>
                <div class="tx_desc">
                    로그인이 필요한 서비스입니다<br />
                    아이디와 비밀번호를 입력해 주세요
                </div>
                <form name="form_member_login">
                    <div class="input_wrap">
                        <input type="text" class="input_text input_id required" name="id" placeholder="아이디" />
                    </div>
                    <div class="input_wrap">
                        <input type="password" class="input_text input_pw required" name="password" placeholder="비밀번호" />
                    </div>
                    <div class="tx_msg ok">
                        정상 확인되었습니다.
                    </div>
                    <div class="tx_msg error">
                        아이디 또는 비밀번호를 잘못 입력했습니다<br />
                        다시 확인해주세요
                    </div>
                    <!--
                        1. 아이디/비번을 정상입력시(맞든틀리든 기입할경우) 활성화시키는건지..
                        2. 아이디/비번이 정확하게 입력된 상태면 활성화되는건지 모르겠음...

                        2번일경우 정상확인되었습니다. 영역이 왜 필요한건지 모르겠음..

                        1. 에러메세지 뜨는데 앨럿메세지 필요한건지 모르겠음..

                        걍모르겠어서 일단 만들어놓음..
                     -->
                    <button type="submit" class="btn_common btn_login on">로그인</button>
                </form>
                <div class="member_find_link">
                    <a href="member_find_id">아이디 찾기</a>
                    <a href="member_find_pw">비밀번호 찾기</a>
                </div>
            </div>
        </div>
        <script>
            let form = $("form[name=form_member_login]");
            form.submit(function(e){
                e.preventDefault();
                if ( ! $('[name=id]').val()) {
                    mvLayer.alert("아이디와 비밀번호를\n확인해주세요", function(res){
                        if(res) {
                            $('[name=id]').focus();
                        }
                    });
                    return false;
                }
                if( ! $('[name=password]').val()) {
                    mvLayer.alert("아이디와 비밀번호를\n확인해주세요", function(res){
                        if(res) {
                            $('[name=password]').focus();
                        }
                    });
                    return false;
                }
            })
        </script>
    </jsp:body>
</layout:MobileStoreFrame>
