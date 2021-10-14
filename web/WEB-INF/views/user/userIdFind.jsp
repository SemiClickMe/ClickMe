<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>타이틀 넣어요</title>
</head>
<body>
	<div style="height: 200px"></div>
	    <h1 align="center">아이디 찾기</h1>
	    <div align="center" class="container justify-content-end">
		<form action="${pageContext.servletContext.contextPath}/user/idFinder" method="POST">
		   <input type="hidden" name="code" value="${ requestScope.userList.code }">
			<table class="table table-striped w-50 align-middle text-end">
				<tbody>
					<tr>
						<td class="col-1">이메일</td>
						<td class="col-4"><input class="form-control" name="email" type="email" value="${ requestScope.userList.email }" aria-label="UserEmail"></td>
						<td class="col-1">이름</td>
						<td class="col-4"><input class="form-control" name="name" type="text" value="${ requestScope.userList.name }" aria-label="UserName"></td>
					</tr>
				</tbody>
			</table>
			<button class="btn btn-danger" onclick="history.back();" type="button">취소</button>
			<button class="btn btn-secondary" type="submit">아이디 찾기</button>
		</form>
	</div>
</body>
</html>