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
    				<a href="javascript:;" data-clipboard-text="https://www.medivalue.co.kr/event/reservation" class="btn_share"><img src="/resources/images/pre_reservation/ico_share.png" alt="" /></a>
    			</div>
    		</div>
    	</header>
        <div id="container" class="main">
            <main>
                <section class="sec_visual">
                    <div class="text font_gmarket">
                    	<div class="title_2">기공 장부 작성만 해도</div>
                    	<div class="title">
                    		<p>기공료 정산이</p>
                    		<p>바로 된다?!</p>
                    	</div>
                    	<div class="desc color_yellow">머나먼 기공료, 메디밸류가 먼저 땡겨드림</div>
                    </div>
                    <div class="content">
                    	<div class="info color_yellow font_gmarket">
                    		<div class="date">
                    			<div class="img"><img src="/resources/images/pre_reservation/ico_bell.png" alt="" /></div>
                    			<div class="txt">12.19 - 오픈전까지</div>
                    		</div>
                    		<div class="desc">
                    			<p>업체당 최대</p>
                    			<p>3,000만원 정산</p>
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
                <section class="sec_reason" id="sec_reason">
                	<div class="inner">
                		<div class="subtitle font_gmarket">기공소에 꼭 필요한 기능만 담은</div>
                		<div class="maintitle font_gmarket">메디밸류 기공플랫폼을<br>써야만하는 <span>4가지 이유</span></div>
                		<div class="reason_list">
                			<ul>
                				<li>
                					<div>
                						<div class="title">먼저, 정산해드립니다.</div>
                						<div class="desc">필요할 때 필요한 만큼<br>최대 3,000만 원까지 넉넉하게</div>
                					</div>
                				</li>
                				<li>
                					<div>
                						<div class="title">대신, 받아드립니다.</div>
                						<div class="desc">클리닉과 전자 기공 장부 내역만 있으면<br>자동으로 정산 요청!</div>
                					</div>
                				</li>
                				<li>
                					<div>
                						<div class="title">바로, 홍보해드립니다.</div>
                						<div class="desc">스토어 회원 3,000여 개소에 노출하여<br>새로운 거래처 확보를</div>
                					</div>
                				</li>
                				<li>
                					<div>
                						<div class="title">물론, 보관해드립니다.</div>
                						<div class="desc">번거로운 캐비닛 보관은 그만!<br>블록체인 기반으로 변조/위조/분실 없이</div>
                					</div>
                				</li>
                			</ul>
                		</div>
                	</div>
                </section>
                <%-- <c:if test="${fd_time==2}">end</c:if> --%>
                
                <section class="sec_form <c:if test="${fd_time==2}">end</c:if>" id="sec_form">
                	<div class="inner">
                		<div class="subtitle font_gmarket">사전예약 한정혜택</div>
                		<div class="maintitle font_gmarket">먼저, 정산해드립니다<br>필요할 때 필요한 만큼</div>
                		<div class="form_wrap">
                			<div class="title color_yellow">지금 바로 사전 예약 신청하세요</div>
                			<div class="desc">사전 예약 신청시, 조건없이 선정산 한도 3,000만원!</div>
                			<div class="input">
                				<ul>
                					<li>
                						<input type="text" placeholder="사업자명을 입력해주세요" />
                					</li>
                					<li>
                						<select class="sel_tel" id="mobile_type" name="mobile_type">
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
                							<span>[필수] 기공 플랫폼 정보 수신 동의</span>
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
                				<button type="button" onclick="preReservHandler();">사전예약하기</button>
                			</div>
                			<div class="button button_2">
                				<button type="button" class="off">1차 사전 예약 마감</button>
                				<button type="button" onclick="preReservHandler();">2차 사전 예약 하기</button>
                			</div>
                		</div>
                	</div>
                </section>
                <section class="sec_read">
                	<div class="inner">
                		<div class="read_list">
                			<div class="title">꼭 읽어 주세요!</div>
                			<ul>
                				<li>- 사전 신청 일정 및 모집 기공소는 당사 사정에 의해서 변경 될 수 있습니다.</li>
                				<li>- 선정산 금액은 당사 사정 또는 상황에 따라 달라 질 수 있습니다.</li>
                				<li>- 1차 30 개소 모집 완료 후, 2차 예약이 진행됩니다.</li>
                				<li>- 1, 2차 사전 예약 신청 업체는 별도의 연락을 다시 드립니다.</li>
                			</ul>
                		</div>
                	</div>
                </section>
                <section class="sec_qna" id="sec_qna">
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
                							<a href="javascript:;">메디밸류 기공 플랫폼을 사용하면 어떤점이 좋은가요?</a>
                							<div class="answer"><div class="ans_inner"><b>기공료 선정산, 기공 의뢰서 전산화, 강화된 보관 등 접수부터 정산까지 원스톱 서비스를 제공</b>하여 기공소 운영 업무를 간소화할 수 있습니다.</div></div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">메디밸류 기공 플랫폼 사전 예약 혜택이 있나요?</a>
                							<div class="answer"><div class="ans_inner">기공 플랫폼 사전 예약자 한정, 선정산 가능한 금액의 최대  한도가 2,000만원에서 <b>3,000만원으로 상향 조정</b>됩니다.</div></div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">기공 플랫폼을 통한 선정산이 뭔가요?</a>
                							<div class="answer"><div class="ans_inner">열심히 제작하였지만 제때 정산 받기 <b>힘들었던 기공료를 메디밸류가 먼저 정산해 드리는 서비스</b>입니다. 이를 통해 임차료, 인건비, 세금 등 기공소 운영 자금 문제를 먼저 해결할 수 있습니다.</div></div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">선정산은 대출인가요?</a>
                							<div class="answer"><div class="ans_inner">선정산 서비스는 <b>대출이 아닙니다.</b>  기공료 선정산은 대출과 달리 신용 조회를 하지 않기 때문에, <b>신용등급과 무관하게 자유롭게 이용</b>할 수 있습니다.</div></div>
                						</div>
                					</li>
                					<li>
                						<div>
                							<a href="javascript:;">선정산을 신청하면 언제 지급받을 수 있나요?</a>
                							<div class="answer"><div class="ans_inner">선정산 신청 후, <b>신청 당일 또는 다음날 지급</b> 됩니다. (주말/공휴일 제외)</div></div>
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
        <div class="intro_popup">
        	<div class="content">
        		<img src="/resources/images/pre_reservation/img_intro_full.png">
        	</div>
        </div>
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