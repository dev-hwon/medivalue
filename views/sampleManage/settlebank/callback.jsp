<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PASS PAY Sample Code</title>
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
	.table { border-collapse: collapse; table-layout: fixed; border-spacing: 0; width: 100%; }
	.table th, .table td { border: 1px solid #ddd; padding: 5px; height: 20px; text-align: center; }
	.table th { background: #f1f2f4; font-weight: 400; }
	.hidden {display: none;}
	.res {font-size: 20px; font-weight: bold;}
</style>
<script src="/resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	window.resizeTo("1000", "700");
</script>
</head>
<body>
<div class="main">
	<h1>Callback Data</h1>
	<table class="table">
		<tr>
			<th>parameter</th><th>parameter 명</th><th>데이터</th>
		</tr>
		<tr>
			<td>resultCd</td><td>결과코드</td><td>${data.resultCd }</td>
		</tr>
		<tr>
			<td>errCd</td><td>실패코드</td><td>${data.errCd }</td>
		</tr>
		<tr>
			<td>resultMsg</td><td>결과메시지</td><td>${data.resultMsg }</td>
		</tr>
		<tr>
			<td>mercntId</td><td>가맹점아이디</td><td>${data.mercntId }</td>
		</tr>
		<tr>
			<td>ordNo</td><td>주문번호</td><td>${data.ordNo }</td>
		</tr>
		<tr>
			<td>authNo</td><td>인증번호</td><td>${data.authNo }</td>
		</tr>
		<tr>
			<td>trPrice</td><td>거래금액</td><td>${data.trPrice }</td>
		</tr>
		<tr>
			<td>discntPrice</td><td>할인금액</td><td>${data.discntPrice }</td>
		</tr>
		<tr>
			<td>payPrice</td><td>결제금액</td><td>${data.payPrice }</td>
		</tr>
		<tr>
			<td>trDay</td><td>거래일자</td><td>${data.trDay }</td>
		</tr>
		<tr>
			<td>trTime</td><td>거래시간</td><td>${data.trTime }</td>
		</tr>
		<tr>
			<td>mercntParam1</td><td>가맹점데이터1</td><td>${data.mercntParam1 }</td>
		</tr>
		<tr>
			<td>mercntParam2</td><td>가맹점데이터2</td><td>${data.mercntParam2 }</td>
		</tr>
	</table>
</div>
</body>
</html>