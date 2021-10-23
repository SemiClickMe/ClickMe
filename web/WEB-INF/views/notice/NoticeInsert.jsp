<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 등록 단위 테스트</h1>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>
	
	<h2>공지사항 등록 폼</h2>
	<form action="${pageContext.servletContext.contextPath}/notice/insert" method="post" style="display: inline-block">
		<fieldset>
			<legend>게시글 등록 필드</legend>
			<label>1.공지사항 제목</label>
			<input type="text" name="title" size="50" placeholder="등록할 공지사항의 제목을 입력해주세요."/><br>
			<label>2.공지사항 내용</label>
			<textarea name="content" rows="10" cols="50" placeholder="등록할 공지사항의 내용을 작성해 주세요." style="resize: vertical;"></textarea><br>
			<br>
			<button type="submit">등록하기</button>
		</fieldset>
	</form>
	
	<br>
	
	
	<fieldset align="center">	
	<%
		String result = (String) request.getAttribute("isDMLSuccess");
		String backgroundColor = "";
		
		if (result == null) {
			result = "아직 '등록하기' 버튼을 누르지 않았습니다!";
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
