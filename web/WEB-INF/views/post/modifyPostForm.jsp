<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<!-- header 영역 -->
	<jsp:include page="../common/menubar.jsp"/>
	
	<form action="${pageContext.servletContext.contextPath}/post/modify" method="post">
		<input type="text" class="visually-hidden" name="code" value="${requestScope.postInfo.code}">
		<div class="row mb-2">
			<label for="inputTitle" class="col-sm-1 col-form-label">제목</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="inputTitle" name="title" value="${requestScope.postInfo.title}">
			</div>
		</div>
		<div class="row mb-2">
			<label class="col-sm-1 col-form-label" for="catCode">카테고리</label>
			<select class="col-sm-2 col-form-select" name="catCode">
				<option value="1" ${ (requestScope.postInfo.catName eq "판매") ? "selected" : "" }>판매</option>
				<option value="2" ${ (requestScope.postInfo.catName eq "구매") ? "selected" : "" }>구매</option>
				<option value="3" ${ (requestScope.postInfo.catName eq "기타") ? "selected" : "" }>기타</option>
			</select>
		</div>
		<div class="row mb-2">
			<label for="inputContent" class="col-sm-1 col-form-label">내용</label>
			<div class="col-sm-9">
				<textarea class="form-control" rows="10" id="inputContent" name="content">${requestScope.postInfo.content}</textarea>
			</div>
		</div>
		<div class="row mb-2">
			<label for="inputItemPrice" class="col-sm-1 col-form-label">가격</label>
			<div class="col-sm-2">
				<input type="number" class="form-control" id="inputItemPrice" name="itemPrice" value="${requestScope.postInfo.itemPrice}">
			</div>
		</div>
		<div class="col mb-2" align="center">
			<button type="submit" class="btn btn-primary">수정하기</button>
			<button type="button" class="btn btn-primary" onclick="${ pageContext.servletContext.contextPath }/post/list/detail?code=${requestScope.postInfo.code}">취소하기</button>
		</div>
	</form>
	
	<!-- footer 영역 -->
	<jsp:include page="../common/footer.jsp"/>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>