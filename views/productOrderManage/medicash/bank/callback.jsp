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
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(function () {

		let orderId = '${data.orderId}';
		let resultCd = '${data.resultCd}';
		let errCd = '${data.errCd}';
		let resultMsg = '${data.resultMsg}';
		let trPrice = '${data.trPrice}';
		let trDay = '${data.trDay}';
		let trTime = '${data.trTime}';
		let trNo = '${data.trNo}';

		opener.window.location.replace("/order/result/medicash/success/settlebank/bank/" + orderId
				+ "?resultCd=" + resultCd
				+ "&errCd=" + errCd
				+ "&resultMsg=" + resultMsg
				+ "&trPrice=" + trPrice
				+ "&trDay=" + trDay
				+ "&trTime=" + trTime
                + "&trNo=" + trNo);

		window.close();
	});

</script>
</head>
<body>
<div class="main">
<%--	<h1>Callback Data</h1>--%>
<%--	<table class="table">--%>
<%--		<tr>--%>
<%--			<td colspan="5">--%>
<%--				<button type="button" class="btn" onclick="confirm();">완료</button>--%>
<%--			</td>--%>
<%--		</tr>--%>
<%--	</table>--%>
</div>
</body>
</html>