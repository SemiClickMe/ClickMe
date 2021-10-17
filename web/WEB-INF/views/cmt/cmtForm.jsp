<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글작성하기</title>
</head>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button><br><br>
<body>
	<form action="${pageContext.servletContext.contextPath}/cmt/insert" method="post">
		내용 <textarea rows="5" name="content" required></textarea>
	<button type="submit">등록하기</button>
	<button type="reset" id="cancleCmt">취소하기</button>
	</form>
</body>
</html>