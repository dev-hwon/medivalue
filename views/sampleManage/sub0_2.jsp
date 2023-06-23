<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				$(".all_chk_cb").click(function(){
					if($(".all_chk_cb").prop("checked")){
						$("input[name=acc]").prop("checked",true);
					}else{
						$("input[name=acc]").prop("checked",false);
					}
				})
	
				$(".nm_chk").on("click", function  () {
					if ($(".nm_chk:checked").length == $(".nm_chk").length) {
						$(".all_chk_cb").prop("checked",true);
					}
				});
				
				
				console.log($(".nm_chk:checked").length);
	
	
				var $termsView=$("#sub0_2 .cnt1 .area .real_area .join_wrap .txt ul li.join_li28 .chk_wrap .terms_chk > button");
				var $termsClose=$("#sub0_2 .cnt1 .area .real_area .join_wrap .txt ul li.join_li28 .chk_wrap .terms_chk .terms_popup .terms_close, #sub0_2 .cnt1 .area .real_area .join_wrap .txt ul li.join_li28 .chk_wrap .terms_chk .terms_popup .terms_btn");
	
	
				$termsView.on("click", function  () {
					$(this).next().css("display","block");
					$("#black").css("display","block");
				});
	
				$termsClose.on("click", function  () {
					$(this).parent().css("display","none");
					$("#black").css("display","none");
				});
	
				$("#black").on("click", function  () {
					$termsClose.click()
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub0_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="join_wrap">
							<div class="tit">
								<h3>회원가입</h3>
								<p><span><img src="/resources/images/main/join_mark1.jpg" width="8" height="8" border="0" alt="" /></span>필수입력사항</p>
							</div>
							
							<div class="txt">
								<ul>
									<li class="join_li1 clear">
										<h4>아이디<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinId">
											<label for="joinId">6자 이상의 영문 혹은 영문과 숫자를 조합</label>
										</div>
										<button class="dup_btn">중복확인</button>
									</li>
												
									<li class="join_li2 clear">
										<h4>비밀번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinPw" >
											<label for="joinPw">비밀번호를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li3 clear">
										<h4>비밀번호확인<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinPwRe" >
											<label for="joinPwRe">비밀번호를 한번 더 입력해주세요</label>
										</div>
										<p class="pw_caution">X 비밀번호가 일치하지 않습니다</p>
									</li>
	
									<li class="join_li4 clear">
										<h4>이름<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinName" >
											<label for="joinName">이름(대표자)를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li5 clear">
										<h4>면허번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinLic" >
											<label for="joinLic">면허번호를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li6 clear">
										<h4>의료기관명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinIns" >
											<label for="joinIns">의료기관명을 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li7 clear">
										<h4>생년월일<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinBirth" >
											<label for="joinBirth">YYYY / MM / DD</label>
										</div>
										
										<div class="chk_wrap">
											<input id="genderChk1" type="radio" name="gender">
											<label for="genderChk1">남</label>
										</div>
	
										<div class="chk_wrap">
											<input id="genderChk2" type="radio" name="gender">
											<label for="genderChk2">여</label>
										</div>
	
										<div class="chk_wrap">
											<input id="genderChk3" type="radio" name="gender">
											<label for="genderChk3">선택안함</label>
										</div>
									</li>
	
									<li class="join_li8 clear">
										<h4>이메일<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinEmail">
											<label for="joinEmail">예 : anyprice@gmail.com</label>
										</div>
										<button class="dup_btn">중복확인</button>
									</li>
	
									<li class="join_li9 clear">
										<h4>주소<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont_wrap">
											<div class="form_cont">
												<input type="text" id="joinAddr1">
												<label for="joinAddr1">상세주소를 검색해주세요</label>
											</div>
											<div class="form_cont">
												<input type="text" id="joinAddr2">
												<label for="joinAddr2">나머지 주소를 입력해주세요</label>
											</div>
										</div>
										<button class="addr_sch_btn"><img src="/resources/images/main/addr_sch_btn.jpg" width="13" height="13" border="0" alt="" />검색</button>
									</li>
	
									<li class="join_li10 clear">
										<h4>전화번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinTel">
											<label for="joinTel">숫자만 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li11 clear">
										<h4>휴대폰<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinMobile">
											<label for="joinMobile">숫자만 입력해주세요</label>
										</div>
										<button class="get_au_btn">인증받기</button>
									</li>
	
									<li class="join_li12 clear">
										<h4>추천인</h4>
										<div class="form_cont">
											<input type="text" id="joinPerson">
											<label for="joinPerson">추천인 아이디를 입력해주세요</label>
										</div>
										<button class="per_sch_btn">검색</button>
									</li>
	
									<li class="join_li13 clear">
										<h4>메일수신여부<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="chk_wrap chkw1">
											<input id="mailRecive1" type="radio" name="mailRecive">
											<label for="mailRecive1">수신함</label>
										</div>
	
										<div class="chk_wrap">
											<input id="mailRecive2" type="radio" name="mailRecive">
											<label for="mailRecive2">수신안함</label>
										</div>
									</li>
	
									<li class="join_li14 clear">
										<h4>SMS수신여부<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="chk_wrap chkw1">
											<input id="smsRecive1" type="radio" name="smsRecive">
											<label for="smsRecive1">수신함</label>
										</div>
	
										<div class="chk_wrap">
											<input id="smsRecive2" type="radio" name="smsRecive">
											<label for="smsRecive2">수신안함</label>
										</div>
									</li>
	
									<li class="join_li15 clear">
										<h4>상호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinMu">
											<label for="joinMu">띄어쓰기 없이 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li16 clear">
										<h4>사업자번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinBusiNum">
											<label for="joinBusiNum">사업자번호 입력 시 '-'를 제외하고 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li17 clear">
										<h4>대표자명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinCeo">
											<label for="joinCeo">이름(대표자)를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li18 clear">
										<h4>업태<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinIndus1">
											<label for="joinIndus1">업태를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li19 clear">
										<h4>종목<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinIndus2">
											<label for="joinIndus2">종목을 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li20 clear">
										<h4>사업자주소<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										
										<div class="form_cont_wrap">
											<div class="chk_wrap">
												<input id="addrSame" type="checkbox">
												<label for="addrSame">위의 주소와 동일</label>
											</div>
	
											<div class="form_cont">
												<input type="text" id="joinBa1">
												<label for="joinBa1">상세주소를 검색해주세요</label>
											</div>
										
											<div class="form_cont">
												<input type="text" id="joinBa2">
												<label for="joinBa2">나머지 주소를 입력해주세요</label>
											</div>
										</div>
	
										<button class="ba_sch_btn"><img src="/resources/images/main/addr_sch_btn.jpg" width="13" height="13" border="0" alt="" />검색</button>
									</li>
	
									<li class="join_li21 clear">
										<h4>예금주명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinDep">
											<label for="joinDep">예금주 명을 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li22 clear">
										<h4>환불계좌은행<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<select name="" id="">
											<option value="">은행을 선택하세요</option>
											<option value="">은행을 선택하세요</option>
											<option value="">은행을 선택하세요</option>
											<option value="">은행을 선택하세요</option>
										</select>
									</li>
	
									<li class="join_li23 clear">
										<h4>환불계좌번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinRef">
											<label for="joinRef">계좌번호를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li24 clear">
										<h4>요양기관기호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinHeal1">
											<label for="joinHeal1">요양기관기호를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li25 clear">
										<h4>요양기관명칭<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinHeal2">
											<label for="joinHeal2">요양기관명칭을 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li26 clear">
										<h4>담당자명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinIn">
											<label for="joinIn">이름(담당자)를 입력해주세요</label>
										</div>
	
										<div class="chk_wrap">
											<input id="inSame1" type="checkbox">
											<label for="inSame1">대표자와 동일</label>
										</div>
									</li>
	
									<li class="join_li27 clear">
										<h4>담당자연락처<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinInNum">
											<label for="joinInNum">이름(담당자)를 입력해주세요</label>
										</div>
	
										<div class="chk_wrap">
											<input id="inSame2" type="checkbox">
											<label for="inSame2">대표자와 동일</label>
										</div>
									</li>
	
									<li class="join_li28 clear">
										<h4>이용약관동의<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										
										<div class="chk_wrap">
											<div class="all_chk">
												<input id="terms1" type="checkbox" name="acc" class="all_chk_cb">
												<label for="terms1">전체 동의합니다</label>
											</div>
	
											<div class="terms_chk">
												<input id="terms2" type="checkbox" name="acc" class="nm_chk">
												<label for="terms2">이용약관 동의 (필수)</label>
												<button class="terms_view">약관보기</button>
	
												<div class="terms_popup">
													<button class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h4>이용약관동의 <span>(필수)</span></h4></div>
													<div class="terms_txt">
														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>

														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>

														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>

														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
													</div>
	
													<button class="terms_btn">확인</button>
												</div>
											</div>
	
											<div class="terms_chk">
												<input id="terms3" type="checkbox" name="acc" class="nm_chk">
												<label for="terms3">개인정보처리방침 동의 (필수)</label>
												<button class="terms_view">약관보기</button>
	
												<div class="terms_popup">
													<button class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h4>개인정보처리방침 동의 <span>(필수)</span></h4></div>
													<div class="terms_txt">
														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
													</div>
	
													<button class="terms_btn">확인</button>
												</div>
											</div>
	
											<div class="terms_chk">
												<input id="terms4" type="checkbox" name="acc" class="nm_chk">
												<label for="terms4">개인정보처리방침 동의 (선택)</label>
												<button class="terms_view">약관보기</button>
	
												<div class="terms_popup">
													<button class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h4>개인정보처리방침 동의 <span>(선택)</span></h4></div>
													<div class="terms_txt">
														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
														<h5>제1조(목적)</h5>
														<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
														<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
													</div>
	
													<button class="terms_btn">확인</button>
												</div>
											</div>
	
											<div class="terms_chk">
												<input id="terms5" type="checkbox" name="acc" class="nm_chk">
												<label for="terms5">본인은 만 14세 이상입니다 (필수)</label>
											</div>
										</div>
									</li>
	
									<li class="join_li29">
										<button class="join_btn">가입하기</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>