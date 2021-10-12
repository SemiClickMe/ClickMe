<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>${ pageContext.servletContext.contextPath }</h1>
	
	<h2>전체 1:1문의 조회</h2>
	<button onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/list'">
	1:1 문의 조회해보기
	</button>
	
	<br><hr>
	
	<h2>게시글 전체 조회 단위테스트 <a href="${pageContext.servletContext.contextPath}/post/list/allPost">forward</a></h2>
	
	<br><hr>
</body>
</html>