<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글작성하기</title>
</head>
<button
	onclick="location.href='${pageContext.servletContext.contextPath}/cmt/list'"
	name="backToCmt">댓글리스트로</button>
<br>
<br>
<body>
	<form action="${pageContext.servletContext.contextPath}/recomment/blind" method="post">
		<fieldset>
			<legend>대댓글 블라인드</legend>
			<label>comment code</label> <input type="textfield" name="code">
			<br> <label>comment blind update</label>
			<button type="submit">수정</button>
		</fieldset>
	</form>
	<br>
	<%
		String result = (String) request.getAttribute("isDMLSuccess");
		String backgroundColor = "";
		
		if (result == null) {
			result = "미입력";
		} else if (result == "성공") {
			backgroundColor = "green";
		} else {
			backgroundColor = "red";
		}
	%>
	<label>성공 여부 : </label>
	<label><%= result %></label>
</body>
</html>