<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글작성하기</title>
</head>
<body>
<% String code=request.getParameter("code");  %>
	<div align="center" id="insertCmt">
	<div style="border: 1px solid; width: 80%; padding: 5px" align="left">
    <form name="insertForm" action="${pageContext.servletContext.contextPath}/cmt/insert" method="post">
		
		<input type="hidden" maxlength="500" name="postCode" id="postCode" value=<%=code %>>
		<label>아이디</label>
		<input type="text" maxlength="500" name="loginUserId" id="loginUserId" value="${sessionScope.loginUser.id}">
		<label>이름</label>
		<input type="text" maxlength="500" name="loginUserName" id="loginUserName" value="${sessionScope.loginUser.name}">
		<br><br>
        <textarea name="content" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
        <br>
        <button type="submit">저장</button>
    </form>
	</div>
	</div>
	<br><br><br>

</body>

</html>