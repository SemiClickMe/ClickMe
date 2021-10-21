<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ClickMe - 관리자페이지 > 게시글 관리 페이지</title>
</head>
<body>
	<h1 align="left">관리자 페이지</h1>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button><br>
	
	<br><hr>
	
	<h2>게시글 관리 페이지</h2>
	<div class="post-search-form">
		<form action="${pageContext.servletContext.contextPath}/post/list/admin" method="get" style="display: inline-block">
			<fieldset>
				<legend align="center">게시글 검색 옵션</legend>
				<div class="seller-id">
					<label>작성자 아이디</label>
					<input type="text" name="sellerId" placeholder="작성자의 아이디를 입력해 주세요." value="${ param.sellerId }">
				</div>
				<div class="title">
					<label>제목</label>
					<input type="text" name="title" placeholder="게시글의 제목을 입력해 주세요." value="${ param.title }">
				</div>
				<div class="content">
					<label>내용</label>
					<input type="text" name="content" placeholder="게시글의 내용을 입력해 주세요." value="${ param.content }">
				</div>
				<div class="authentic">
					<label>감정상태</label>
					<select name="authCode">
						<option value="default" ${ (param.authCode eq "default") ? "selected" : "" }>-선택-</option>
						<option value="1" ${ (param.authCode eq "1") ? "selected" : "" }>감정전</option>
						<option value="2" ${ (param.authCode eq "2") ? "selected" : "" }>감정중</option>
						<option value="3" ${ (param.authCode eq "3") ? "selected" : "" }>감정완료</option>
						<option value="4" ${ (param.authCode eq "4") ? "selected" : "" }>감정반려</option>
					</select>
				</div>
				<div class="blindness">
					<label>블라인드</label>
					<input type="radio" name="blindYn" id="both" value="both" checked>
					<label for="blind">both</label>
					<input type="radio" name="blindYn" id="Y" value="Y" ${ (param.blindYn eq "Y") ? "checked" : "" }>
					<label for="Y">Y</label>
					<input type="radio" name="blindYn" id="N" value="N" ${ (param.blindYn eq "N") ? "checked" : "" }>
					<label for="N">N</label>
				</div>
				<!-- 
				<div class="price-range">
					<label>가격대</label>
					<input type="number" name="itemPriceMin" placeholder="min">
					~
					<input type="number" name="itemPriceMax" placeholder="max">
				</div>
				 -->
				<div class="submit-button"><button type="submit">검색</button></div>
			</fieldset>
		</form>
	</div>
	
	<br>
	
	<h2>게시글 리스트</h2>
	<div class="post-list">
		<table border="1">
			<caption>게시글 검색 결과</caption>
			<thead>
				<tr>
					<th>게시글코드</th>
					<th width="100px">감정상태</th>
					<th width="600px">제목</th>
					<th width="150px">판매자</th>
					<th>블라인드</th>
					<th>작성날짜</th>
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
	
	<h2>Paging 영역 입니다.</h2>
</body>
</html>