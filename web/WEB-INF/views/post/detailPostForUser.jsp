<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">게시글 상세 내용</h1><br>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button><br>
	
	<br><hr>
	
	<div class="border border-1 border-dark rounded mx-auto">
		<form class="">
			<div class="row mb-4">
				<div class="col-sm-1">
					No. ${requestScope.detailPost.code}
				</div>
				<div class="col-sm-2">
					${requestScope.detailPost.authStatus}
				</div>
				<div class="col-sm-2 offset-md-1">
					views : ${requestScope.detailPost.view}
				</div>
				<div class="col-sm-2">
					likes : ${requestScope.detailPost.likeCount}
				</div><div class="col-sm-2">
					report : ${requestScope.detailPost.reportCount}
				</div>
			</div>
			<div class="row mb-4">
				<label for="inputSellerId" class="col-sm-1 col-form-label">작성자</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="inputSellerId" value="${requestScope.detailPost.sellerId}" readonly>
				</div>
				<label for="inputItemPrice" class="col-sm-1 col-form-label">가격</label>
				<div class="col-sm-2">
					<input type="number" class="form-control" id="inputItemPrice" value="${requestScope.detailPost.itemPrice}" readonly>
				</div>
				<label for="inputTime" class="col-sm-1 col-form-label">작성시간</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="inputTime" value="${requestScope.detailPost.time}" readonly>
				</div>
			</div>
			<div class="row mb-4">
				<label for="inputTitle" class="col-sm-1 col-form-label">제목</label>
				<label class="col-sm-1 col-form-label">${requestScope.detailPost.catName}</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="inputTitle" value="${requestScope.detailPost.title}" readonly>
				</div>
			</div>
			<div class="row mb-4">
				<label for="inputContent" class="col-sm-1 col-form-label">내용</label>
				<div class="col-sm-9">
					<textarea class="form-control" rows="10" id="inputContent" readonly>${requestScope.detailPost.content}</textarea>
				</div>
			</div>
			<div class="row mb-4">
				<label for="inputTitle" class="col-sm-1 col-form-label">사진</label>
				<div class="col-sm-9">
				<c:forEach var="detailPost" items="${requestScope.detailPost.imgFileList}">
					<div class="row"><img src="${pageContext.servletContext.contextPath}${detailPost.origPath}"></div>
				</c:forEach>
				</div>
			</div>
			<div class="col mb-4 justify-content-center">
				<button type="button" class="btn btn-primary" onclick="location.href=">수정하기</button>
				<button type="button" class="btn btn-primary" onclick="location.href=">삭제하기</button>
				<button type="button" class="btn btn-primary" onclick="history.back()">뒤로가기</button>
			</div>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>