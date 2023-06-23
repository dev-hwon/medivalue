<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<footer id="footer">

	<div class="top">
        <div class="inner">
            <div class="left">
                <div class="nav">
                    <ul>
                        <li><a href="/company/info" class="g_c_f_medivlae_intro">메디밸류 소개</a></li>
                        <li><a href="/terms/info?tab=1" class="g_c_f_use_agreement">이용약관</a></li>
                        <li><a href="/terms/info?tab=2" class="font_bold g_c_f_privacy_policy">개인정보처리방침</a></li>
                        <li><a href="/notice/list" class="g_c_f_notice">공지사항</a></li>
                        <li><a href="javascript:;" onclick="onChatTalk();" class="g_c_f_question">1:1 문의</a></li>
                        <li><a href="https://shopadmin.medivalue.co.kr/login.do" target="_blank" class="g_c_f_partner">파트너센터</a></li>
                    </ul>
                </div>
            </div>
            <div class="right">
                <div class="copyright">Copyright © MEDIVALUE Corp. All Rights Reserved</div>
            </div>
        </div>
    </div>
    <div class="bot">
        <div class="inner">
            <div class="left">
                <div class="list_01">
                    <ul>
                        <li>
                            <div>
                                <div class="th">고객만족센터</div>
                                <div class="td">
                                    <a href="tel:027796551">02-779-6551</a> / <a href="javascript:;" class="font_underline g_c_f_question_talk" onclick="onChatTalk();">1:1고객센터 톡</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div class="th">입점·제휴문의</div>
                                <div class="td"><a href="mailto:info@medivalue.co.kr">info@medivalue.co.kr</a></div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="list_02">
                    <ul>
                        <li>
                            <div>
                                <div class="th">운영시간</div>
                                <div class="td">[평일] 오전 9시 - 오후 6시</div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div class="th">세상의 모든 메디밸류 </div>
                                <div class="td">궁금한 내용을 자유롭게 말씀해주세요.</div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div class="th">24시간 접수 가능</div>
                                <div class="td">운영시간에 순차적으로 답변해드리겠습니다.</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="right">
                <div class="image">
                    <a href="/"><img src="/resources/images/main_renew/img_logo_ft.png" alt=""></a>
                </div>
                <div class="text">
                    <div class="title">주식회사 메디밸류</div>
                    <div class="desc">
                        <ul>
                            <li>
                                <div>대표 ㅣ 노형태, 주소 ㅣ 서울특별시 영등포구 여의공원로 115 세우빌딩, 6층</div>
                            </li>
                            <li>
                                <div>반품주소지 ㅣ 서울특별시 중구 순화동 151 포스코더샵 406호 407호</div>
                            </li>
                            <li>
                                <div>사업자등록번호 ㅣ 646-81-02195 <a href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=6468102195" class="font_underline g_c_f_company_check" target="_blank">사업자정보확인</a>, 통신판매업 ㅣ 제2022-서울영등포-3378호</div>
                            </li>
                            <li>
                                <div>의료기기 ㅣ 제2022-3180034-04-70-00395호, 개인정보보호책임자 ㅣ 홍하석</div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
	    "pluginKey": "0f535368-1d85-49c0-af56-c3a12d95d3a6"
	    <c:if test="${!empty loginInfo and loginInfo !=null}">  	
	    	,"memberId": "${loginInfo.fd_member_id}"
		</c:if>
	  	<%--
	  	"unsubscribeTexting": "${loginInfo.channelIO_sms_yn}",
	  	"unsubscribeEmail": "${loginInfo.channelIO_email_yn}",
	  	"memberId": "${loginInfo.fd_member_id}",
	  	"profile": {
	  		"id": "${loginInfo.fd_member_id}", 
	  		"name": "${loginInfo.channelIO_representative_name}",
	    	"mobileNumber": "${loginInfo.channelIO_mobile}", //fill with user phone number
	    	"email": "${loginInfo.channelIO_email}",    	
	    	"description": "${loginInfo.fd_medical_name}",    	
	    	"mou": "${loginInfo.channelIO_profile_mou}",
	    	"registrationdate": "${loginInfo.channelIO_profile_registrationdate}",
	    	"point": "${loginInfo.channelIO_profile_point}"      
	  	}
		--%>
	  });
</script>
<!-- End Channel Plugin -->
<%--
<c:if test="${!empty loginInfo and loginInfo !=null}">
	${loginInfo}
	tel : <c:out value="${loginInfo.channelIO_tel}"/>
	mobile : <c:out value="${loginInfo.channelIO_mobile}"/>
	email : <c:out value="${loginInfo.channelIO_email}"/>
	repre : <c:out value="${loginInfo.channelIO_representative_name}"/>
	addr : <c:out value="${loginInfo.channelIO_addr}"/>
	sms : <c:out value="${loginInfo.channelIO_sms_yn}"/>
	email_yn : <c:out value="${loginInfo.channelIO_email_yn}"/>
	fd_member_id : <c:out value="${loginInfo.fd_member_id}"/>
	fd_medical_name : <c:out value="${loginInfo.fd_medical_name}"/>	
</c:if>
 --%>