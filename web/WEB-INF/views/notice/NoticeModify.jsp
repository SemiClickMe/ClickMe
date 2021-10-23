<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 단위 테스트 서블릿 페이지</title>
</head>
<body>
	<h1 align="center">관리자용 공지사항 수정 페이지입니다.</h1>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>
	
	<h2 align="center">공지사항 수정 폼입니다.<br>
	1. 수정을 원하시는 코드를 입력해주세요. <br>
	2. 해당 코드의 제목을 수정해주세요.<br>
	3. 해당 코드의 내용을 수정해주세요.<br>
	</h2>
		<form action="${pageContext.servletContext.contextPath}/notice/modify" method="post" style="display: inline-block">
		<fieldset align="center">
			<legend align="center">공지사항 수정 필드</legend>
			<label>1. 공지사항 코드</label><br>
			<input type="number" name="code" placeholder="수정하실 공지사항의 코드를 입력해주세요."/><br>
			<label>2. 공지사항 제목</label><br>
			<input type="text" name="title" size="50" placeholder="수정할 제목을 입력해주세요."/><br>
			<label>3. 공지사항 내용</label><br>
			<textarea name="content" rows="10" cols="50" placeholder="수정할 내용을 작성해 주세요." style="resize: vertical;"></textarea><br>
			<br>
			<button type="submit">수정하기</button>
		</fieldset>
	</form>
	<br>
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