<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간편현금결제 Sample Code</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<style type="text/css">
	html, body { width: 100%; height: 100%; }
	body { margin: 0; padding: 0; background-color: #fff; font-family: 'Noto Sans KR', 'Malgun Gothic', '맑은 고딕', Dotum, 'Apple SD Gothic Neo', Sans-serif; font-size: 12px; line-height: 1.4; letter-spacing: -0.03em; color: #444; }
	input, button, h1, h2 { margin: 0; padding: 0; }
	input, button { border: 0; border-radius: 0; background-color: transparent; -webkit-appearance: none; -moz-appearance: none; appearance: none; font-family: 'Kanit', 'Noto Sans KR', 'Malgun Gothic', Dotum, 'Apple SD Gothic Neo', sans-serif; letter-spacing: -0.03em; vertical-align: top; }
	input { color: #222; }
	table { border-spacing: 0; border-collapse: collapse;}
	input[type="text"] { display: inline-block; width: 100%; height: 30px; border-bottom: 1px solid #d3d3d3; vertical-align: top; }
	button { cursor: pointer; }
	h2 { padding-top: 25px; padding-bottom:5px; font-size: 20px; font-weight: 500; color: #222; line-height: 1.3; word-break: break-all; }
	.main { position: relative; padding: 0 20px 100px 20px; }
	.btn { display: inline-block; padding: 14px 10px; width: 100%; border: 1px solid #222; border-radius: 4px; background-color: #222; font-family: 'Roboto', 'Noto Sans KR'; font-size: 16px; font-weight: 500; color: #fff; line-height: 20px; white-space: nowrap; text-align: center; }
	.center {text-align: center;}
	.red {color: red; font-weight: bold;}
	.table { border-collapse: collapse; table-layout: fixed; border-spacing: 0; width: 100%; word-break: break-all;}
	.table th, .table td { border: 1px solid #ddd; padding: 5px; height: 20px; text-align: center; }
	.table th { background: #f1f2f4; font-weight: 400; }
	.hidden {display: none;}
	.res {font-size: 20px; font-weight: bold;}
</style>
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	/*
	* 결제인증(UI) 요청
	*/
	function doPassReSubmit(){
		
		//결제인증(UI) 요청 파라미터 생성
		var frm = $("form[name=settlePayForm]");
		
		$.ajax({
			type: "post",
			url: "/test/ajax/getPassReSubmitData.do",
			dataType : "json",
			data: frm.serialize(),
			success:function(data){
				var el = document.getElementsByTagName("body")[0];

				var settleForm = document.createElement("form");
				settleForm.setAttribute("id", "SETTLEBANK_FORM");
				settleForm.setAttribute("name", "SETTLEBANK_FORM");
				settleForm.setAttribute("target", "SETTLEBANK_FORM");
				settleForm.setAttribute("method", "POST");
				settleForm.setAttribute("action", "https://tbezauth.settlebank.co.kr/init.do");
				//https://tbezauth.settlebank.co.kr/std/init.do //http://localhost:8080/init.do
				
				for(var key in data){
					settleForm.appendChild(makeFormInput(key, data[key]));
				}		
				
				el.appendChild(settleForm);
				
				var userAgent = new String(navigator.userAgent);
				var mobilePhones = new Array('iphone', 'ipod', 'android', 'blackberry', 'windows ce', 'nokia', 'webos', 'opera mini', 'sonyericsson', 'opera mobi', 'iemobile', 'windows phone', 'test_app');
			    var isMobile = false;

			    for( var i = 0 ; i < mobilePhones.length ; ++i ){
			        if( userAgent.toLowerCase().indexOf(mobilePhones[i]) > -1)
			        {
			            isMobile = true;
			            break;
			        }
			    }
			    if(!isMobile){
					var windowStatus = '';
					if (userAgent.indexOf('Trident') > 0) {
						if (userAgent.indexOf('Trident/4.0') > 0) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
						else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';	
					} 
					else if (userAgent.indexOf('AppleWebKit') > 0 && userAgent.indexOf('Chrome') == -1) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
					else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
					
					var mchtPopup = window.open('', 'SETTLEBANK_FORM', windowStatus); 
					setTimeout(function(){
						if (mchtPopup == null) alert("팝업 허용 해주세요");
						else settleForm.submit();
					}, 1000);
			    }else{
			    	settleForm.submit();
			    }
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	/*
	* 결제승인(API) 요청
	*/
	function doApprovSubmit(){
		
		var frm = $("form[name=approvForm]");
		frm.find(".resData").hide();
		
		$.ajax({
			
			type: "POST",
			url: "/test/ajax/doAPIPayApprove.do",
			dataType : "text",
			data: frm.serialize(),
			success:function(data){
				frm.find(".resData").show();
				frm.find("p.res").text(decoderUft8(data));
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	/*
	* 결제취소/환불(API) 요청
	*/
	function doCancelSubmit(){
		
		var frm = $("form[name=cancelForm]");
		frm.find(".resData").hide();
		
		$.ajax({
			
			type: "POST",
			url: "/test/ajax/doAPIPayCancel.do",
			dataType : "text",
			data: frm.serialize(),
			success:function(data){
				frm.find(".resData").show();
				frm.find("p.res").text(decoderUft8(data));
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	/*
	* 망취소(API) 요청
	*/
	function doNetCancelSubmit(){
		
		var frm = $("form[name=netCancelForm]");
		frm.find(".resData").hide();
		
		$.ajax({
			
			type: "POST",
			url: "/test/ajax/doAPINetPayCancel.do",
			dataType : "text",
			data: frm.serialize(),
			success:function(data){
				frm.find(".resData").show();
				frm.find("p.res").text(decoderUft8(data));
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	/*
	* 거래결과조회(API) 요청
	*/
	function doMoInfoSubmit(){
		
		var frm = $("form[name=moInfoForm]");
		frm.find(".resData").hide();
		
		$.ajax({
			
			type: "POST",
			url: "/test/ajax/doAPIMoinfo.do",
			dataType : "text",
			data: frm.serialize(),
			success:function(data){
				frm.find(".resData").show();
				frm.find("p.res").text(decoderUft8(data));
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	/*
	* 거래내역조회(API) 요청
	*/
	function doTrInfoSubmit(){
		
		var frm = $("form[name=trInfoForm]");
		frm.find(".resData").hide();
		
		$.ajax({
			
			type: "POST",
			url: "/test/ajax/doAPITrinfo.do",
			dataType : "text",
			data: frm.serialize(),
			success:function(data){
				frm.find(".resData").show();
				frm.find("p.res").text(decoderUft8(data));
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	/*
	* 현금영수증발급조회(UI) 요청
	*/
	function doCashRcptSubmit(){
		
		var frm = $("form[name=cashRcptForm]");
		
		$.ajax({
			
			type: "post",
			url: "/test/ajax/getCashRcptData.do",
			dataType : "json",
			data: frm.serialize(),
			success:function(data){
				
				var el = document.getElementsByTagName("body")[0];

				var settleForm = document.createElement("form");
				settleForm.setAttribute("id", "SETTLEBANK_FORM");
				settleForm.setAttribute("name", "SETTLEBANK_FORM");
				settleForm.setAttribute("target", "SETTLEBANK_FORM");
				settleForm.setAttribute("method", "POST");
				settleForm.setAttribute("action", "https://tbezauth.settlebank.co.kr/cashRcptInfo.do");
				
				for(var key in data){
					settleForm.appendChild(makeFormInput(key, data[key]));
				}		
				
				el.appendChild(settleForm);
				
				var userAgent = new String(navigator.userAgent);
				var mobilePhones = new Array('iphone', 'ipod', 'android', 'blackberry', 'windows ce', 'nokia', 'webos', 'opera mini', 'sonyericsson', 'opera mobi', 'iemobile', 'windows phone', 'test_app');
			    var isMobile = false;

			    for( var i = 0 ; i < mobilePhones.length ; ++i ){
			        if( userAgent.toLowerCase().indexOf(mobilePhones[i]) > -1)
			        {
			            isMobile = true;
			            break;
			        }
			    }
			    if(!isMobile){
					var windowStatus = '';
					if (userAgent.indexOf('Trident') > 0) {
						if (userAgent.indexOf('Trident/4.0') > 0) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
						else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';	
					} 
					else if (userAgent.indexOf('AppleWebKit') > 0 && userAgent.indexOf('Chrome') == -1) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
					else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
					
					var mchtPopup = window.open('', 'SETTLEBANK_FORM', windowStatus); 
					setTimeout(function(){
						if (mchtPopup == null) alert("팝업 허용 해주세요");
						else settleForm.submit();
					}, 1000);
			    }else{
			    	settleForm.submit();
			    }
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	/*
	* 정기결제 키 발급(API) 요청
	*/
	function doRegularPayKeySubmit(){
		
		var frm = $("form[name=regularPayKeyForm]");
		frm.find(".resData").hide();
		
		$.ajax({		
			type: "POST",
			url: "/test/ajax/doAPIRegularPayKey.do",
			dataType : "text",
			data: frm.serialize(),
			success:function(data){
				frm.find(".resData").show();
				frm.find("p.res").text(decoderUft8(data));
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	/*
	* 정기결제 승인(API) 요청
	*/
	function doRegularPaymentSubmit(){
		
		var frm = $("form[name=regularPaymentForm]");
		frm.find(".resData").hide();
		
		$.ajax({		
			type: "POST",
			url: "/test/ajax/doAPIRegularPayment.do",
			dataType : "text",
			data: frm.serialize(),
			success:function(data){
				frm.find(".resData").show();
				frm.find("p.res").text(decoderUft8(data));
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	/*
	* 정기결제 해지(API) 요청
	*/
	function doUnRegistRegularSubmit(){
		
		var frm = $("form[name=unRegistRegularForm]");
		frm.find(".resData").hide();
		
		$.ajax({		
			type: "POST",
			url: "/test/ajax/doAPIUnregistRegular.do",
			dataType : "text",
			data: frm.serialize(),
			success:function(data){
				frm.find(".resData").show();
				frm.find("p.res").text(decoderUft8(data));
			},
			error:function(e){
				alert(e);
			}
		});
	}
	
	function makeFormInput(name, value){
	
		var settleInput = document.createElement("input");
		
		settleInput.setAttribute("type", "hidden");
		settleInput.setAttribute("name", name);
		settleInput.setAttribute("value", value);
		
		return settleInput;
	}
	
	function decoderUft8(str){
		if(str != undefined){
			var Ca = /\+/g;
			return decodeURIComponent(str.replace(Ca, " "));
		}
	}
	
</script>
</head>
<body>
<div class="main">
	<h1>간편현금결제  Sample</h1>
	<h2>6. 결제인증(UI)</h2>
	<form action="" name="settlePayForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${reParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<p class="red">* 주문번호는 결제인증 요청 시 매번 다르게 요청해야함.</p>
					<button type="button" class="btn" onclick="doPassReSubmit();">결제인증 요청</button>
				</td>
			</tr>
		</table>
	</form>
	<h2>7. 결제승인(API)</h2>
	<form action="" name="approvForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${approvParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
				<button type="button" class="btn" onclick="doApprovSubmit();">결제승인 요청</button></td>
			</tr>
			<tr class="hidden resData">
				<th>결제승인 응답</th>
				<td colspan="4">
					<p class="res"></p>
				</td>
			</tr>
		</table>
	</form>
	
	<h2>8. 결제취소/환불(API)</h2>
	<form action="" name="cancelForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${cancelParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<p class="red">* 취소주문번호는 결제취소/환불 요청 시 매번 다르게 요청해야함.</p>
					<button type="button" class="btn" onclick="doCancelSubmit();">결제취소/환불 요청</button>
				</td>
			</tr>
			<tr class="hidden resData">
				<th>결제취소/환불 응답</th>
				<td colspan="4">
					<p class="res"></p>
				</td>
			</tr>
		</table>
	</form>
	
	<h2>9. 망취소(API)</h2>
	<form action="" name="netCancelForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${netCancelParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<button type="button" class="btn" onclick="doNetCancelSubmit();">망취소 요청</button>
				</td>
			</tr>
			<tr class="hidden resData">
				<th>망취소 응답</th>
				<td colspan="4">
					<p class="res"></p>
				</td>
			</tr>
		</table>
	</form>
	
	<h2>10. 거래결과조회(API)</h2>
	<form action="" name="moInfoForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${moInfoParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<button type="button" class="btn" onclick="doMoInfoSubmit();">거래결과조회 요청</button>
				</td>
			</tr>
			<tr class="hidden resData">
				<th>거래결과조회 응답</th>
				<td colspan="4">
					<p class="res"></p>
				</td>
			</tr>
		</table>
	</form>
	
	<h2>11. 거래내역조회(API)</h2>
	<form action="" name="trInfoForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${trInfoParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<button type="button" class="btn" onclick="doTrInfoSubmit();">거래내역조회 요청</button>
				</td>
			</tr>
			<tr class="hidden resData">
				<th>거래내역조회 응답</th>
				<td colspan="4">
					<p class="res"></p>
				</td>
			</tr>
		</table>
	</form>
	
	<h2>12. 현금영수증발행조회(UI)</h2>
	<form action="" name="cashRcptForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${cashRcpInfoParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<button type="button" class="btn" onclick="doCashRcptSubmit();">현금영수증발행조회</button>
				</td>
			</tr>
		</table>
	</form>
	
	<h2>13. 정기결제 키 발급(API)</h2>
	<form action="" name="regularPayKeyForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${regularpayKeyParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<button type="button" class="btn" onclick="doRegularPayKeySubmit();">정기결제 키 발급 요청</button>
				</td>
			</tr>
			<tr class="hidden resData">
				<th>정기결제 키 발급 응답</th>
				<td colspan="4">
					<p class="res"></p>
				</td>
			</tr>
		</table>
	</form>
	
	<h2>14. 정기결제 승인(API)</h2>
	<form action="" name="regularPaymentForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${regularPaymentParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<button type="button" class="btn" onclick="doRegularPaymentSubmit();">정기결제 승인 요청</button>
				</td>
			</tr>
			<tr class="hidden resData">
				<th>정기결제 승인 응답</th>
				<td colspan="4" width="1000px">
					<p class="res"></p>
				</td>
			</tr>
		</table>
	</form>
	
	<h2>15. 정기결제 해지(API)</h2>
	<form action="" name="unRegistRegularForm" method="POST">
		<table class="table">
			<tr>
				<th>parameter</th>
				<th>parameter 명</th>
				<th>필수</th>
				<th>설명</th>
				<th>데이터</th>
			</tr>
			<c:forEach items="${unRegistRegularParams }" var="data">
				<tr>
					<td>${data.parameter}</td>
					<td>${data.parameter_name }</td>
					<td class="center"><c:if test="${data.option eq '필수'}">●</c:if><c:if test="${data.option eq '선택'}">○</c:if></td>
					<td class="red" >${data.etc}</td>
					<td><input type="text" name="${data.parameter}" value="${data.value}"/> </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<button type="button" class="btn" onclick="doUnRegistRegularSubmit();">정기결제 해지 요청</button>
				</td>
			</tr>
			<tr class="hidden resData">
				<th>정기결제 해지 응답</th>
				<td colspan="4">
					<p class="res"></p>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>