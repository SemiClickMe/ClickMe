<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="logoutForm"
		action="${ pageContext.servletContext.contextPath }/user/logout"
		method="post">
		<table>
			<tr>
				<td><label class="text">ID : </label></td>
				<td><input type="text" name="userId"></td>
			</tr>
			<tr>
				<td><label class="text">PWD : </label></td>
				<td><input type="password" name="userPwd"></td>
			</tr>
		</table>
		<input type="submit" value="로그아웃" id="logout">
	</form>
</body>
</html>