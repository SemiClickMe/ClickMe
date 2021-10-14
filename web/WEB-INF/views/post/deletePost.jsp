<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 단위 테스트 서블릿 페이지</title>
</head>
<body>
	<h1>게시글 삭제 단위 테스트</h1>
	<p>
		해당 단위 테스트에서 언급하는 '삭제'란, <b>실제로 데이터베이스 상에 존재하는 게시글을 삭제(DELETE)</b>한다는 의미입니다. 
		관리자만 접근할 수 있는 기능으로, 실제 프로젝트에 반영될 지는 아직 미정입니다.
	</p>
	
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>
	
	<h2>게시글 삭제 폼</h2>
	<form action="${pageContext.servletContext.contextPath}/post/delete" method="post" style="display: inline-block">
		<fieldset>
			<legend>삭제 필드</legend>
			<label>1. 게시글 코드</label>
			<input type="number" name="code" placeholder="삭제할 게시글 코드 입력">
			<br>
			<button type="submit">삭제</button>
		</fieldset>
	</form>
	
	<br>
	
	<%
		String result = (String) request.getAttribute("isDMLSuccess");
		String backgroundColor = "";
		
		if (result == null) {
			result = "아직 submit 버튼을 누르지 않았습니다!";
			backgroundColor = "orange";
		} else if (result == "success") {
			backgroundColor = "green";
		} else {
			backgroundColor = "red";
		}
	%>
	<label>성공 여부 : </label>
	<label style="background-color: <%= backgroundColor %>"><%= result %></label>
</body>
</html>