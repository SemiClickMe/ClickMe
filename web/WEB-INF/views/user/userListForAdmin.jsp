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
	<h1 align="center"> 관리자용 사용자 리스트 페이지</h1>
	<div align="center" class="container justify-content-end">
		<form action="user/statusModify" method="POST">
			<table class="table table-striped align-middle text-end">
			  <thead>
			    <tr>
			      <th scope="col">코드</th>
			      <th scope="col">현재 상태</th>
			      <th scope="col">아이디</th>
			      <th scope="col">이메일</th>
			      <th scope="col">핸드폰 번호</th>
			      <th scope="col">이름</th>
			      <th scope="col">생년월일</th>
			      <th scope="col">성별</th>
			      <th scope="col">예치금</th>
			      <th scope="col">최종로그인</th>
			      <th scope="col">가입일</th>
			    </tr>
			  </thead>
			  <tbody>
				  <c:forEach var="users" items="${ requestScope.userList }">
						<tr>
							<td>${ users.code }</td>
							<td>${ users.entCode }</td>
							<td>${ users.id }</td>
							<td>${ users.psw }</td>
							<td>${ users.email }</td>
							<td>${ users.phone }</td>
							<td>${ users.name }</td>
							<td>${ users.date }</td>
							<td>${ users.gender }</td>
							<td>${ users.authority }</td>
							<td>${ users.deposit }</td>
							<td>${ users.profileOrigName }</td>
							<td>${ users.profileUuidName }</td>
							<td>${ users.profileImgPath }</td>
							<td>${ users.lastLogin }</td>
							<td>${ users.enrollDate }</td>
						</tr>
					</c:forEach>
			    <tr>
			      <td scope="row">코드</td>
			      <td>현재 상태</td>
			      <td>아이디</td>
			      <td>이메일</td>
			      <td>핸드폰 번호</td>
			      <td>이름</td>
			      <td>생년월일</td>
			      <td>성별</td>
			      <td>예치금</td>
			      <td>최종로그인</td>
			      <td>가입일</td>
			    </tr>
			  </tbody>
			</table>
		</form>
	</div>
</body>
</html>