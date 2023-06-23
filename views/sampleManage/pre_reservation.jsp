<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
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
    				<a href="javascript:;" data-clipboard-text="https://medivalue.co.kr" class="btn_share"><img src="/resources/images/pre_reservation/ico_share.png" alt="" /></a>
    			</div>
    		</div>
    	</header>
        <div id="container" class="main">
            <main>
                <section class="sec_visual">
                    <div class="text font_gmarket">
                    	<div class="title">
                    		<p>기공 플랫폼에</p>
                    		<p class="color_yellow">금융을 더하다</p>
                    	</div>
                    	<div class="desc color_yellow">정산 받는게 이렇게 쉬울 일이야?</div>
                    </div>
                    <div class="content">
                    	<div class="info color_yellow font_gmarket">
                    		<div class="date">
                    			<div class="img"><img src="/resources/images/pre_reservation/ico_bell.png" alt="" /></div>
                    			<div class="txt">12.19 - 12.23</div>
                    		</div>
                    		<div class="desc">
                    			<p>선정산 3000만원</p>
                    			<p>선착순 30명, 한정</p>
                    		</div>
                    	</div>
                    	<div class="image">
                    		<img src="/resources/images/pre_reservation/img_visual_01.png" alt="" />
                    	</div>
                    </div>
                </section>
                <section class="sec_quickbar">
                	<div class="inner">
                		<ul>
                			<li><a href="javascript:scrollToMove('sec_form');">빠른사전예약!</a></li>
                			<li><a href="javascript:scrollToMove('sec_qna');">기공플랫폼은?</a></li>
                		</ul>
                	</div>
                </section>
                <section class="sec_reason">
                	<div class="inner">
                		<div class="subtitle font_gmarket">신개념 기공 플랫폼</div>
                		<div class="maintitle font_gmarket">MVP 기공 플랫폼을<br>써야하는 <span>4가지 이유</span></div>
                		<div class="reason_list">
                			<ul>
                				<li>
                					<div>
                						<div class="title">결제대금 선정산</div>
                						<div class="desc">아직도 클리닉 정산을 기다리시나요?<br>정산 기다림 없이 바로바로 당.일.정.산!</div>
                					</div>
                				</li>
                				<li>
                					<div>
                						<div class="title">의뢰주문서 전산화</div>
                						<div class="desc">번거로운 수기 입력은 그만<br>인터넷으로 주고받는 손쉬운 주문서</div>
                					</div>
                				</li>
                				<li>
                					<div>
                						<div class="title">강력한 보안</div>
                						<div class="desc">변조/위조 걱정은 그만!<br>블록체인 기반 강력한 보안 구현</div>
                					</div>
                				</li>
                				<li>
                					<div>
                						<div class="title">업무 간소화</div>
                						<div class="desc">접수부터 정산까지 원스톱!<br>업무에 소요되는 시간을 줄여보세요</div>
                					</div>
                				</li>
                			</ul>
                		</div>
                	</div>
                </section>
                <section class="sec_form">
                	<div class="inner">
                		<div class="subtitle font_gmarket">사전예약 한정혜택</div>
                		<div class="maintitle font_gmarket">먼저, 정산해드립니다<br>클리닉 대금 <span>3천만원!</span></div>
                		<div class="form_wrap">
                			<div class="title">지금 바로 <b>사전 예약</b> 신청하세요</div>
                			<div class="image">
                				<img src="/resources/images/pre_reservation/img_form_01.png" />
                			</div>
                			<div class="desc">간략하게 신청 정보를 입력해주시면 완료됩니다. (선착순 마감)</div>
                			<div class="input">
                				<ul>
                					<li>
                						<input type="text" placeholder="사업자명 또는 사업자 번호를 입력해주세요" />
                					</li>
                					<li>
                						<select class="sel_tel">
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
                							<input type="checkbox" class="chk_agree" />
                							<span>[필수] 개인정보 수집 및 이용 동의</span>
                						</label>
                					</li>
                					<li>
                						<label class="radio_group">
                							<input type="checkbox" class="chk_agree" />
                							<span>[필수] 기공 플랫폼 정보 수신 동의</span>
                						</label>
                					</li>
                					<li>
                						<label class="radio_group">
                							<input type="checkbox" class="chk_agree" />
                							<span>[필수] 만 14세 이상입니다. </span>
                						</label>
                					</li>
                				</ul>
                			</div>
                			<div class="button">
                				<button type="button" onclick="preReservHandler();">사전예약하기</button>
                			</div>
                		</div>
                	</div>
                </section>
                <section class="sec_qna">
                	<div class="inner">
                		<div class="subtitle font_gmarket">QnA</div>
          				<div class="maintitle font_gmarket">자주묻는 질문</div>
          				<div class="qna_wrap">
          					<div class="image">
                				<img src="/resources/images/pre_reservation/img_qna_01.png" />
                			</div>
                			<div class="qna_list">
                				<ul>
                					<li>
                						<div>
                							<a href="javascript:;">기공 플랫폼 MVP가 뭔가요?</a>
                							<div class="answer">내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요.</div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">사용하면 어떤점이 좋나요?</a>
                							<div class="answer">내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요.</div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">기공 플랫폼 선정산이 뭔가요?</a>
                							<div class="answer">내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요.</div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">선정산을 받으면, 신용도가 떨어질까요?</a>
                							<div class="answer">내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요.</div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">기공 플랫폼 MVP는 언제 정식 오픈하나요?</a>
                							<div class="answer">내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요. 내용을 입력하세요.</div>
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
        				<div class="desc">메디밸류는 원활한 사전예약 서비스를 위해 다음과 같이 개인정보를 수집하고 있습니다.</div>
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
        								<td>이벤트 참여,<br>기공 플랫폼 관련<br>소식 전달</td>
        								<td>휴대폰번호,<br>사업자명</td>
        								<td>이벤트<br>종료일로부터<br>1년</td>
        							</tr>
        						</tbody>
        					</table>
        				</div>
        				<div class="title">[필수] 개인정보처리 위탁 안내</div>
        				<div class="desc">메디밸류는 원활한 사전예약 서비스를 위해 다음과 같이 개인정보를 위탁하고 있습니다.</div>
        			</div>
        			<div class="foot">
        				<button class="btn_ok" onclick="closePopup(this);">확인</button>
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
        				<button class="btn_ok" onclick="closePopup(this);">확인</button>
        			</div>
        		</div>
        	</div>
        </div>
                
        <!-- INTRO -->
        <div class="intro_popup">
        	<div class="content">
        		<img src="/resources/images/pre_reservation/img_intro_full.png">
        	</div>
        </div>
    </div>
</body>
</html>