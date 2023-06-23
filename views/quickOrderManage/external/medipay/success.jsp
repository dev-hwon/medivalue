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
<script type="text/javascript">

	$(function () {
	    //최종 결제 금액, 주문 번호, 페이먼츠 키
        let order_info = JSON.parse('${order_info}');
        opener.productQuickOrder.confirmOrderResult(order_info);
        window.close();
	});

</script>
</head>
<body>
</body>
</html>

