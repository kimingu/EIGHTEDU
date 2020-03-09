<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int money = (int)request.getAttribute("money");
	String userName = (String)request.getAttribute("userName");
	int userCode = (int)request.getAttribute("userCode");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/updateUserPoint.us">
		<input type="hidden" name="userCode" value="<%=userCode %>">
		<input type="hidden" name="point" value="<%=money %>">
	</form>
	<script>
		var IMP = window.IMP; // 생략가능
		IMP.init('imp23257133'); 
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'eightedu 결제테스트',
		    amount : <%=money %>,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : "<%=userName%>",
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		    <%-- m_redirect_url : '<%=request.getContextPath()%>/updateUserPoint.us' --%>
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.\n';
		        //msg += '고유ID : ' + rsp.imp_uid;
		        //msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount + '원\n'
		        //msg += '카드 승인번호 : ' + rsp.apply_num;
		        msg += '주문자 : ' + rsp.buyer_name; 
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    $("form").submit();
		   // window.close();
		   
		});
	</script>

</body>
</html>