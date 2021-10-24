<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>ClickMe - 관리자페이지 > 게시글 관리 페이지</title>
</head>
<body>

	<!-- header 영역 -->
	<jsp:include page="../common/menubar.jsp"/>
	
	<br>
	<h1 align="left">관리자 페이지</h1>
	
	<br><hr>
	
	<div align="center">
		<form action="${pageContext.servletContext.contextPath}/post/list/admin" method="get">
			<fieldset>
				<legend align="center">게시글 검색 옵션</legend>
				<div class="col mb-2">
					<label class="col-form-label" for="sellerId">작성자 아이디</label>
					<input type="text" class="col-form-control" name="sellerId" placeholder="작성자의 아이디를 입력해 주세요." value="${ param.sellerId }">
				</div>
				<div class="col mb-2">
					<label class="col-form-label" for="title">제목</label>
					<input type="text" class="col-form-control" name="title" placeholder="게시글의 제목을 입력해 주세요." value="${ param.title }">
				</div>
				<div class="col mb-2">
					<label class="col-form-label" for="content">내용</label>
					<input type="text" class="col-form-control" name="content" placeholder="게시글의 내용을 입력해 주세요." value="${ param.content }">
				</div>
				<div class="col mb-2">
					<label class="col-form-label" for="authCode">감정상태</label>
					<select class="col-form-control" name="authCode">
						<option value="default" ${ (param.authCode eq "default") ? "selected" : "" }>-선택-</option>
						<option value="1" ${ (param.authCode eq "1") ? "selected" : "" }>감정전</option>
						<option value="2" ${ (param.authCode eq "2") ? "selected" : "" }>감정중</option>
						<option value="3" ${ (param.authCode eq "3") ? "selected" : "" }>감정완료</option>
						<option value="4" ${ (param.authCode eq "4") ? "selected" : "" }>감정반려</option>
					</select>
				</div>
				<div class="col mb-2">
					<label class="col-form-label" for="blindYn">블라인드</label>
					<input class="col-form-check-input" type="radio" name="blindYn" id="both" value="both" checked>
					<label class="form-check-label" for="blind">both</label>
					<input class="col-form-check-input" type="radio" name="blindYn" id="Y" value="Y" ${ (param.blindYn eq "Y") ? "checked" : "" }>
					<label class="form-check-label" for="Y">Y</label>
					<input class="col-form-check-input" type="radio" name="blindYn" id="N" value="N" ${ (param.blindYn eq "N") ? "checked" : "" }>
					<label class="form-check-label" for="N">N</label>
				</div>
				<!-- 
				<div class="price-range">
					<label>가격대</label>
					<input type="number" name="itemPriceMin" placeholder="min">
					~
					<input type="number" name="itemPriceMax" placeholder="max">
				</div>
				 -->
				<div class="submit-button" align="center">
					<button class="btn btn-primary" type="submit">검색</button>
				</div>
			</fieldset>
		</form>
	</div>
	
	<br><br><hr>
	
	<h2 align="center">게시글 리스트</h2>
	<div class="post-list" align="center">
		<table border="1">
			<thead>
				<tr>
					<th width="100px">게시글코드</th>
					<th width="100px">감정상태</th>
					<th width="400px">제목</th>
					<th width="150px">판매자</th>
					<th width="100px">블라인드</th>
					<th width="100px">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${ requestScope.postList }">
				<tr>
					<td>${post.code}</td>
					<td>${post.authStatus}</td>
					<td>${post.title}</td>
					<td>${post.sellerId}</td>
					<td>${post.blindYn}</td>
					<td>${post.time}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		if(document.getElementsByTagName("td")) {
			const $singleRow = document.getElementsByTagName("td");
			for(let i = 0; i < $singleRow.length; i++) {
				
				$singleRow[i].onmouseenter = function() {
					this.parentNode.style.backgroundColor = "orangered";
					this.parentNode.style.cursor = "pointer";
				}
				
				$singleRow[i].onmouseout = function() {
					this.parentNode.style.backgroundColor = "white";
				}
				
				$singleRow[i].onclick = function() {
					const code = this.parentNode.children[0].innerText;
					location.href = "${ pageContext.servletContext.contextPath }/post/list/detailTest?code=" + code;
				}
				
			}
			
		}
	</script>
	
	<!-- 페이징 영역 -->
	<jsp:include page="/WEB-INF/views/post/postPagenationForAdmin.jsp"/>
	
	<!-- footer 영역 -->
	<jsp:include page="../common/footer.jsp"/>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>