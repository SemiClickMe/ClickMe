<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	<style type="text/css">

	.form-control{
	height: 40px !important;
	
	}
	</style>
<title>Insert title here</title>
<!-- 변수값 변경 -->
	<c:choose> 
		<c:when test="${ requestScope.userList.gender eq 'F' }">
			<c:set var="genderKor" value="여자"/>
		</c:when> 
		<c:when test="${ requestScope.userList.gender eq 'M' }">
			<c:set var="genderKor" value="남자"/>
		</c:when>
	</c:choose>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
<div style="height: 50px"></div>
	<h1 align="center">'${ requestScope.userList.id }'님의 개인 페이지 입니다.</h1>
	<div style="height: 20px"></div>
	<form action="${pageContext.servletContext.contextPath}/user/statusModifyPic" method="POST" encType="multipart/form-data">
	<jsp:include page="profilePicViewer.jsp"/>
	<div align="center" class="container justify-content-end">
		   <input type="hidden" name="code" value="${ requestScope.userList.code }">
			<table class="table table-striped w-50 align-middle text-end">
				<tbody>
					<tr>
						<td class="col-2">아이디</td>
						<td class="col-2"><input class="form-control" name="id" type="text" value="${ requestScope.userList.id }" aria-label="Id" disabled readonly></td>
						<td class="col-1">이메일</td>
						<td class="col-4"><input class="form-control" name="email" type="email" value="${ requestScope.userList.email }" aria-label="UserEmail"></td>
						<td></td>
					</tr>
					<tr>
						<td class="col-1">핸드폰번호</td>
						<td class="col-4"><input class="form-control" name="phoneNum" type="text" value="${ requestScope.userList.phone }" aria-label="UserPhone"></td>
						<td class="col-1">이름</td>
						<td class="col-4"><input class="form-control" name="name" type="text" value="${ requestScope.userList.name }" aria-label="UserName" disabled readonly></td>
						<td></td>					
					</tr>
					<tr>
						<td class="col-2">생년월일</td>
						<td class="col-2"><input class="form-control" name="bdate" type="date" value="${ requestScope.userList.date }" aria-label="Userbdate" disabled readonly></td>
						<td class="col-1">성별</td>
						<td class="col-4"><input class="form-control" name="gender" type="hidden" value="${ requestScope.userList.gender }" aria-label="UserGender" readonly>
						<input class="form-control" name="gender1" type="text" value="${genderKor}" aria-label="UserGender" disabled readonly></td>
						<td></td>
					</tr>
					<tr>
						<td class="col-2">예치금</td>
						<td class="col-2"><input class="form-control" name="deposit" type="text" value="${ requestScope.userList.deposit }" aria-label="UserDeposit" disabled readonly></td>
						<td class="col-2">가입날짜</td>
						<td class="col-4"><input class="form-control" name="enrollDate" type="date" value="${ requestScope.userList.enrollDate }" aria-label="UserEnrollDate" disabled readonly></td>
						<td></td>					
					</tr>
				</tbody>
			</table>
			<button class="btn btn-danger" onclick="history.back();" type="button">취소</button>
			<button class="btn btn-secondary" type="submit">정보 수정</button>
		</div>	
	</form>
	<div style="height: 50px;"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>