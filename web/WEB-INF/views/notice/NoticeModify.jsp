<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 단위 테스트 서블릿 페이지</title>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<br><br>
 	<h2 align="center">공지사항 수정 페이지입니다. </h2>
	<form action="${pageContext.servletContext.contextPath}/notice/modify" method="post" style="display: inline-block">
		<br><br>
		<fieldset align="center">
			<legend>공지사항 수정 필드</legend>
			<label>공지사항 코드</label><br>
			<input type="number" name="code" placeholder="수정하실 공지사항의 코드를 입력해주세요."/><br>
			<label>공지사항 제목</label><br>
			<input type="text" name="title" size="50" placeholder="수정할 제목을 입력해주세요."/><br>
			<label>공지사항 내용</label><br>
			<textarea name="content" rows="10" cols="50" placeholder="수정할 내용을 작성해 주세요." style="resize: vertical;"></textarea><br>
		<button type="submit">수정하기</button>
		</fieldset>
	</form>
	<br>
<jsp:include page="../common/footer.jsp"/>
<fieldset align="center">	
	<%
		String result = (String) request.getAttribute("isDMLSuccess");
		String backgroundColor = "";
		
		if (result == null) {
			result = "아직 '수정하기' 버튼을 누르지 않았습니다!";
			backgroundColor = "orange";
		} else if (result == "success") {
			backgroundColor = "green";
		} else {
			backgroundColor = "red";
		}
	%>
	<label>성공 여부 : </label>
	<label style="background-color: <%= backgroundColor %>"><%= result %></label>
	</fieldset>
</body>
</html>