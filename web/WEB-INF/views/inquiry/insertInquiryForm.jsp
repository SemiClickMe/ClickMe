<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.servletContext.contextPath}/inquiry/insert" method="post">
		1:1문의 제목 : <input type="text" name="inqTitle"><br>
		1:1문의 내용 : <input type="text" name="inqContent"><br>
	<button type="submit">등록하기</button>
	</form>
</body>
</html>