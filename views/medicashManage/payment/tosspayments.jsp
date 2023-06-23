<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TossPayments</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://js.tosspayments.com/v1"></script>
<script type="text/javascript">

	$(function () {
        var clientKey = '${client_key}';
        let tossPayments = TossPayments(clientKey);
        tossPayments.requestPayment('카드', {
            amount: ${total_payment},
            orderId: '${orderId}',
            orderName: '${order_name}',
            customerName: '${member_name}',
            successUrl: window.location.origin + '${success_url}',
            failUrl: window.location.origin + '${fail_url}'
        }).catch(function (error) {
            if(error.code === 'USER_CANCEL') {
                alert("카드결제를 취소하셨습니다.");
            }else if(error.code === 'UNAUTHORIZED_KEY') {
                alert("토스 인증키가 잘못되었습니다.");
            }
            window.close();
        });

	});

</script>
</head>
<body>
</body>
</html>
