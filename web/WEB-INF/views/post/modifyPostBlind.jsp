<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 블라인드 처리 단위 테스트</h1>
	<p>
		해당 단위 테스트에서는 프론트엔드와 서블릿을 연동하여 게시글의 블라인드 속성을 수정하는 기능을 테스트 합니다.<br>
		수정할 게시글의 <b>게시글코드</b>와 변경할 해당 게시물의 <b>블라인드 속성</b>을 선택합니다.
	</p>
	
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>
	
	<h2>게시글 블라인드 처리 폼</h2>
	<form action="${pageContext.servletContext.contextPath}/post/modify/blind" method="post" style="display: inline-block">
		<fieldset>
			<legend>블라인드 처리 필드</legend>
			<label>1. 게시글 코드</label>
			<input type="number" name="code">
			<br>
			<label>2. 블라인드 여부</label>
			<input type="radio" name="blindYn" id="blind" value="Y" checked>
			<label for="blind">블라인드화</label>
			<input type="radio" name="blindYn" id="active" value="N">
			<label for="active">활성화</label>
			<br>
			<button type="submit">수정</button>
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