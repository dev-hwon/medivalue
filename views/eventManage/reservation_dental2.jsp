<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메디밸류 기공플랫폼에 금융을 더하다</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
    <meta name="description" content="보철물 접수부터 정산까지 원스톱 서비스! 치과원장님,기공소장님 이제 간편하게 기공 업무를 해결해보세요!">
    <meta name="Keywords" content="메디밸류,medivalue,기공플랫폼,선정산,선지급,빠른정산,당일정산,치과,치과기공소">
    <link rel="shortcut icon" href="https://medivalue.co.kr/resources/images/favicon/favicon.svg">
    <link rel="apple-touch-icon-precomposed" href="https://medivalue.co.kr/resources/images/favicon/favicon.svg">
    <link rel="stylesheet" type="text/css" href="/resources/css/pre_reservation.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.10/dist/clipboard.min.js"></script>
    <script type="text/javascript" src="/resources/js/pre_reservation.js"></script>
</head>
<body>
    <div id="wrap">
    	<header>
    		<div class="inner">
    			<div class="logo">
    				<a href="/" target="_blank"><img src="/resources/images/pre_reservation/img_logo_head.png" alt="medivalue logo" /></a>
    			</div>
    			<div class="share">
    				<a href="javascript:;" data-clipboard-text="https://www.medivalue.co.kr/event/dental2" class="btn_share"><img src="/resources/images/pre_reservation/ico_share.png" alt="" /></a>
    			</div>
    		</div>
    	</header>
        <div id="container" class="main dental without_form">
            <main>
                <section class="sec_visual">
                    <div class="text font_gmarket">
                    	<div class="title_2">대면 없이. 오차 없이.</div>
                    	<div class="title">
                    		<p>기공료</p>
                    		<p>정산 내역 조회</p>
                    	</div>
                    	<div class="desc color_yellow">기공 플랫폼으로, 치과 업무를 줄이다.</div>
                    </div>
                    <div class="content">
                    	<div class="image">
                    		<img src="/resources/images/pre_reservation/img_visual_01.png" alt="" />
                    	</div>
                    </div>
                </section>
                <%-- <section class="sec_quickbar">
                	<div class="inner">
                		<ul>
                			<li><a href="javascript:scrollToMove('sec_form');">빠른사전예약!</a></li>
                			<li><a href="javascript:scrollToMove('sec_qna');">기공플랫폼은?</a></li>
                		</ul>
                	</div>
                </section> --%>
                <section class="sec_reason" id="sec_reason">
               		<div class="subtitle font_gmarket">클리닉에 꼭 필요한 기능만 담은</div>
               		<div class="maintitle font_gmarket">메디밸류 기공플랫폼을<br>써야만하는 <span>4가지 이유</span></div>
                	<div class="inner">
                		<div class="reason_list">
                			<ul>
                				<li>
                					<div>
                						<div class="title">기공 의뢰 진행 상태 확인</div>
                						<div class="desc">기공소에 의뢰한 기공물<br>클릭 한 번으로 진행 상태 조회</div>
                					</div>
                				</li>
                				<li>
                					<div>
                						<div class="title">간편하고 쉬워진 정산</div>
                						<div class="desc">기공소와 같이 조회 할 수 있어<br>정산 내역 확인도 간편하게</div>
                					</div>
                				</li>
                				<li>
                					<div>
                						<div class="title">스마트한 리메이크 관리</div>
                						<div class="desc">매번 헷갈리는 기공 의뢰<br>Ai기반으로 자동 구분</div>
                					</div>
                				</li>
                				<li>
                					<div>
                						<div class="title">치과 업무를 한 곳에서</div>
                						<div class="desc">재료 구매부터 기공 업무까지<br>하나의 서비스로  처리 가능</div>
                					</div>
                				</li>
                			</ul>
                		</div>
                	</div>
                </section>
                <%-- <c:if test="${fd_time==2}">end</c:if> --%>
                
                <section class="sec_form <c:if test="${fd_time==2}">end</c:if>" id="sec_form">
               		<div class="subtitle font_gmarket">메디밸류 가입혜택</div>
               		<div class="maintitle font_gmarket">지금 가입 상담 신청하고<br>특별한 혜택 받아가세요~!</div>
                	<div class="inner">
                		<%-- <div class="form_wrap">
                			<div class="title color_yellow">지금 바로 사전 예약 신청하세요</div>
                			<div class="desc">사전 예약 신청시, 조건없이 선정산 한도 3,000만원!</div>
                			<div class="input">
                				<ul>
                					<li>
                						<input type="text" placeholder="치과명을 입력해주세요" />
                					</li>
                					<li>
                						<select class="sel_tel" id="mobile_type" name="mobile_type">
                							<option value="02">02</option>
                							<option value="031">031</option>
                							<option value="032">032</option>
                							<option value="010">010</option>
                							<option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                						</select>
                						<input type="tel" class="inp_tel" minlength="7" maxlength="8" placeholder="전화번호를 입력해주세요" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                					</li>
                				</ul>
                			</div>
                			<div class="agree">
                				<ul>
                					<li>
                						<label class="radio_group">
                							<input type="checkbox" class="chk_agree_all" />
                							<span>아래 내용을 확인하였으며, 모두 동의 합니다.</span>
                						</label>
               							<a href="javascript:;" class="btn_link" onclick="openTermPopup();">약관 보기</a>
                					</li>
                					<li>
                						<label class="radio_group">
                							<input type="checkbox" class="chk_agree" id="agree_yn_private"  name="agree_yn_private" value="Y" />
                							<span>[필수] 개인정보 수집 및 이용 동의</span>
                						</label>
                					</li>
                					<li>
                						<label class="radio_group">
                							<input type="checkbox" class="chk_agree" id="agree_yn_service"  name="agree_yn_service" value="Y"/>
                							<span>[필수] 메디밸류 정보 수신 동의</span>
                						</label>
                					</li>
                					<li>
                						<label class="radio_group">
                							<input type="checkbox" class="chk_agree" id="agree_yn_age"  name="agree_yn_age" value="Y"/>
                							<span>[필수] 만 14세 이상입니다. </span>
                						</label>
                					</li>
                				</ul>
                			</div>
                			<div class="button button_1">
                				<button type="button" onclick="preReservHandler();">가입 상담 신청 하기</button>
                			</div>
                		</div> --%>
                	</div>
                </section>
                <section class="sec_qna" id="sec_qna">
               		<div class="subtitle font_gmarket">QnA</div>
       				<div class="maintitle font_gmarket">자주묻는 질문</div>
                	<div class="inner">
          				<div class="qna_wrap">
          					<div class="image">
                				<img src="/resources/images/pre_reservation/img_qna_01.png" />
                			</div>
                			<div class="qna_list">
                				<ul>
                					<li>
                						<div>
                							<a href="javascript:;">기공 의뢰를 새로 다시 써야 하나요?</a>
                							<div class="answer"><div class="ans_inner">아니요! 기존에 거래하던 방식 그대로 기공소로 기공물 의뢰를 진행하면 됩니다.</div></div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">기공 장부는 어떻게 전산화되나요?</a>
                							<div class="answer"><div class="ans_inner">기존의 방식대로 기공소에 기공 의뢰를 요청하면, 치과로부터 전달받은 기공 의뢰를 기공소에서 메디밸류 기공 플랫폼에 전산 입력 합니다.</div></div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">기공 장부는 얼마나 보관되나요?</a>
                							<div class="answer"><div class="ans_inner">기기공소에서 기공 장부 작성 시 자동으로 저장되며, 변조/위조의 걱정 없이 영구적으로 보관됩니다.</div></div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">메디밸류 기공 플랫폼은 어떤 점이 좋은가요?</a>
                							<div class="answer"><div class="ans_inner">기공소로 요청한 기공 의뢰 진행 상황을 실시간으로 확인 할 수 있습니다. 또한, 기공소와 통합으로 관리되는 기공 거래 장부를 통해서 정산 금액 불일치 문제를 해결 할 수 있습니다.</div></div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">기공 플랫폼은 무료인가요?</a>
                							<div class="answer"><div class="ans_inner">기공 플랫폼은 무료입니다. 메디밸류 가입 후 누구나 무료로 사용 할 수 있습니다.</div></div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">메디밸류는 어떤 회사인가요?</a>
                							<div class="answer"><div class="ans_inner">메디밸류는 <b>AI기술로 의료재료 및 의료환경을 혁신</b>하는 <b>메디컬 특화 솔루션 업체</b>입니다. 현재 치과 재료 가격 비교 부터 구매까지 원스톱 서비스를 제공하는 <b>의료 커머스 플랫폼</b>을 운영중이며 <b>전국 16개 치과 협회 및 3,000여 개 치과가 이용</b>하고 있습니다.</div></div>
                						</div>
                					</li>
                				</ul>
                			</div>
          				</div>
                	</div>
                </section>
            </main>
        </div>
        <footer>
        	<div class="inner">
        		<div class="logo">
    				<a href="/" target="_blank"><img src="/resources/images/pre_reservation/img_logo_foot.png" alt="medivalue logo" /></a>
    			</div>
    			<div class="link">
    				<ul>
    					<li>상담문의 <a href="tel:02-779-6551">02-779-6551</a></li>
    					<li>홈페이지 <a href="www.medivalue.co.kr" target="_blank">www.medivalue.co.kr</a></li>
    				</ul>
    			</div>
        	</div>
        </footer>
        
        <!-- 약관 팝업 -->
        <div class="comm_popup terms_popup">
        	<div class="bg" onclick="closePopup(this);"></div>
        	<div class="content">
        		<div class="popup_inner">
        			<div class="head">
        				<div class="title">이용약관 동의</div>
        				<button type="button" class="btn_close" onclick="closePopup(this);"><img src="/resources/images/pre_reservation/ico_popup_close.png" /></button>
        			</div>
        			<div class="body">
        				<div class="title">[필수] 개인정보 수집 및 이용 동의</div>
        				<div class="desc">메디밸류는 원활한 가입 상담 신청 서비스를 위해 다음과 같이 개인정보를 수집하고 있습니다.</div>
        				<div class="table_list">
        					<table>
        						<colgroup>
        							<col style="width:33.3333%" />
        							<col style="width:33.3333%" />
        							<col style="width:33.3333%" />
        						</colgroup>
        						<thead>
        							<tr>
        								<th>수집 및 이용 목적</th>
        								<th>항목</th>
        								<th>보유 및 이용기간</th>
        							</tr>
        						</thead>
        						<tbody>
        							<tr>
        								<td>이벤트 참여,<br>메디밸류 소식 전달</td>
        								<td>휴대폰번호,<br>사업자명</td>
        								<td>이벤트<br>종료일로부터<br>1년</td>
        							</tr>
        						</tbody>
        					</table>
        				</div>
        			</div>
        			<div class="foot">
        				<button type="button" class="btn_ok" onclick="closePopup(this);">확인</button>
        			</div>
        		</div>
        	</div>
        </div>
        
        <!-- 공통 경고창 팝업 -->
        <div class="comm_popup alert_popup">
        	<div class="bg" onclick="closePopup(this);"></div>
        	<div class="content">
        		<div class="popup_inner">
        			<div class="head">
        				<div class="title"></div>
        				<button type="button" class="btn_close" onclick="closePopup(this);"><img src="/resources/images/pre_reservation/ico_popup_close.png" /></button>
        			</div>
        			<div class="body">
        				<div class="alert"></div>
        			</div>
        			<div class="foot">
        				<button type="button" class="btn_ok" onclick="closePopup(this);">확인</button>
        			</div>
        		</div>
        	</div>
        </div>
                
        <!-- INTRO -->
        <%-- <div class="intro_popup">
        	<div class="content">
        		<img src="/resources/images/pre_reservation/img_intro_full.png">
        	</div>
        </div> --%>
    </div>
    <!-- Google tag (gtag.js) --> 	
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-MTCWTP79BC"></script>
	<script> 
		window.dataLayer = window.dataLayer || [];	
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date()); 
		gtag('config', 'G-MTCWTP79BC');
	</script>
</body>
</html>