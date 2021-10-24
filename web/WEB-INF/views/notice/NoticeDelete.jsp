<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 관리 페이지</title>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<h2 align="center">공지사항 삭제(코드) 페이지</h2>
	
	<form action="${pageContext.servletContext.contextPath}/notice/delete" method="post" style="display: inline-block">
		<fieldset>
			<legend>공지사항 삭제 필드</legend>
			<label>공지사항 코드</label>
			<input type="number" name="code" placeholder="삭제할 공지사항 코드 입력">
			<br>
			<button type="submit">삭제하기</button>
		</fieldset>
		</form>
		<br>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>