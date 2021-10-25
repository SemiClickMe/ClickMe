<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글작성하기</title>
</head>
<body>
	<form action="${pageContext.servletContext.contextPath}/cmt/blind" id="blindCmt" method="post">
		<fieldset>
			<legend>댓글 블라인드</legend>
			<label>댓글 코드를 입력하세요</label>
			<br>
			<input type="number" name="code" value="${ requestScope.cmtCode }">

			<button type="submit">수정</button>
			<input type="button" value="조회" onClick="location.href='${pageContext.servletContext.contextPath}/cmt/list'">
		</fieldset>
	</form>

</body>
</html>