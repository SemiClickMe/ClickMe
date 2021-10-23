<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 관리 페이지</title>
</head>
<body>
 	<h1 align="center">관리자용 공지사항 삭제 페이지입니다.</h1>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>
	
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
		
		<fieldset align="center">	
		<%
		String result = (String) request.getAttribute("isDMLSuccess");
		String backgroundColor = "";
			
		if (result == null) {
			result = "아직 '삭제하기' 버튼을 누르지 않았습니다!";
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