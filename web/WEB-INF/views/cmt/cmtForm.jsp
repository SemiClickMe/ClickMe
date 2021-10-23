<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글작성하기</title>
</head>
<button
	onclick="location.href='${pageContext.servletContext.contextPath}'"
	name="backToHome">홈으로</button>
<br>
<br>
<body>
	<div style="border: 1px solid; width: 600px; padding: 5px">
    <form name="insertForm" action="${pageContext.servletContext.contextPath}/cmt/insert" method="post">
		
		<label>postCode</label>
		<input type="textfield" name="postCode">
		<br><br>
        <textarea name="content" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
        <button onclick="${pageContext.servletContext.contextPath}/cmt/list">저장</button>
    </form>
</div>
</body>

</html>