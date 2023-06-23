<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<footer id="footer">
	<div class="area">
		<div class="real_area">
			<div class="top clear">
				<h4>고객만족센터</h4>
				<div class="ft_gnb">
					<ul class="clear">
						<li><button type="button" onclick="javascript:location.href='/';">홈</button></li>
						<li><button type="button" class="terms" onclick="javascript:location.href='/terms/info?tab=1';">이용약관</button></li>
						<li><button type="button" class="terms2" onclick="javascript:location.href='/terms/info?tab=2';" style="color:#273791;">개인정보처리방침</button></li>
						<li><button type="button" onclick="javascript:location.href='/company/info';" >회사소개</button></li>
					</ul>
				</div>
			</div>
			<div class="btm clear">
				<div class="left">
					<strong>02-779-6551</strong>
					<button class="btn_notice" type="button" onclick="javascript:location.href='/notice/list';">공지사항</button>
					<button class="question" type="button">1:1 문의</button>
					<%--
					<button class="question" type="button" onclick="javascript:location.href='/member/mypage/question/list';">1:1 문의</button>
					 --%>
				</div>
				<div class="mid">
					<ul>
						<li>
							<h5>고객센터</h5>
							<p> 월-금요일 오전 9시-오후 6시,공휴일 휴무</p>
						</li>
						<li>
							<h5>공지사항</h5>
							<p>새로운 소식을 확인해보세요</p>
						</li>
						<li>
							<h5>24시간 접수 가능</h5>
							<p>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</p>
						</li>
					</ul>
				</div>
				<div class="right">
					<ul>
						<li class="clear">
							<p>법인명(상호) : 주식회사 메디밸류</p>
							<p>사업자등록번호 : 646-81-02195</p>
							<p><button type="button" onclick="javascript:window.open('https://www.ftc.go.kr/www/bizCommView.do?key=232&apv_perm_no=2021322024930205116&pageUnit=10&searchCnd=bup_nm&searchKrwd=%EB%A9%94%EB%94%94%EB%B0%B8%EB%A5%98&pageIndex=1');">
								사업자정보확인</button>
							</p>
						</li>
						<li class="clear">
							<p>통신판매업 : 제2022-서울영등포-3378호</p>
							<p>의료기기 : 제2022-3180034-04-70-00395호</p>
						</li>
						<li class="clear">							
							<p>주소 : 서울특별시 강남구 영동대로 417, 지하 1층(오토웨이 타워)</p>
						</li>
						<li class="clear">
							<p>대표 : 노형태</p><p>개인정보보호책임자 : 홍하석</p>
							<p>입점&middot;제휴문의 : <button type="button">info@medivalue.co.kr</button></p>
						</li>
					</ul>
					<address>Copyright &copy; MEDIVALUE Corp. All Rights Reserved</address>
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
  });
</script>
<!-- End Channel Plugin -->