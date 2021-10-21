<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>1:1문의 작성 페이지</title>
</head>
<body>
	<form action="${pageContext.servletContext.contextPath}/inquiry/insert"
		method="post">
		<select class="form-select" aria-label="Default select example" name="type">
						<option value="1">홈페이지 사용문의</option>
						<option value="2">거래문의</option>
						<option value="3">계정문의</option>
						<option value="3">기타</option>
		</select>
		<div class="mb-3">
			<label class="form-label">작성자</label>
			<p><c:out value="${ sessionScope.loginUser.id }" /></p>
		</div>
		<div class="mb-3">
			<label class="form-label">1:1문의 제목</label> <input type="text" class="form-control"
				name="inqTitle" aria-describedby="inquiryHelp">
			<div id="inquiryHelp" class="form-text">거래관련 문의는 게시글 번호를 입력해주세요.</div>
		</div>
		<div class="mb-3">
			<label class="form-label">1:1문의 내용</label>
			<input type="text" class="form-control" name="inqContent">
		</div>
		<button type="submit" class="btn btn-primary">등록하기</button>
		<button type="reset" class="btn btn-danger" onclick="location.href='${pageContext.servletContext.contextPath}'">취소하기</button>
	</form>
</body>
</html>