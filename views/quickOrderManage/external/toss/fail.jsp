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
	    let message = '${message}';
        if (message === '' || message == null) {
            alert('결제를 완료하지 못하였습니다.');
        } else {
            alert(message);
        }

        opener.productQuickOrder.getOrderInfo();
        window.close();
	});

</script>
</head>
<body>
</body>
</html>