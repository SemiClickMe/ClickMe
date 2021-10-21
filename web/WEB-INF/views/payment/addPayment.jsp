<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="${pageContext.servletContext.contextPath}/payment/add" method="post">
	
		<fieldset>
			<label>게시글 코드</label>
			<input type="textfield" name="postCode">
			<br><br>
			<label>결제방법 선택</label>
			<input type="radio" name="method" id="deposit" value="예치금">
			<label for="deposit">예치금</label>
			<input type="radio" name="method" id="bill" value="무통장">
			<label for="bill">무통장입금</label>
			<input type="radio" name="method" id="card" value="신용카드">
			<label for="card">신용카드</label>
			<br>
			<br>
			<br>
			<button type="submit">입력</button>
		</fieldset>
	</form>
</body>
</html>