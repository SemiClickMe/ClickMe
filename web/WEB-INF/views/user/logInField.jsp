<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<form id="loginForm"
		action="${ pageContext.servletContext.contextPath }/user/login"
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
		<input type="submit" value="로그인" id="login">
	</form>
</body>
</html>