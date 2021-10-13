<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 단위 테스트 서블릿 페이지</title>
</head>
<body>
	<h1 align="center">게시글 검색 조회 단위 테스트</h1>

	<h2>검색 폼</h2>
	<form action="${pageContext.servletContext.contextPath}/post/list/searchPost" method="get" style="display: inline-block">
		<fieldset>
			<legend>게시글 검색 필드</legend>
			<label>검색옵션</label>
			<select name="searchOption">
				<option value="default" selected>옵션선택</option>
				<option value="sellerCode" ${ (param.searchOption eq "sellerCode") ? "selected" : "" }>작성자</option>
				<option value="title" ${ (param.searchOption eq "title") ? "selected" : "" }>제목</option>
				<option value="content" ${ (param.searchOption eq "content") ? "selected" : "" }>내용</option>
			</select>
			<label>검색값</label>
			<input type="search" name="searchValue" placeholder="검색할 내용을 입력해 주세요" value="${ param.searchValue }"/>
			<button type="submit">검색</button>
		</fieldset>
	</form>
	
	<h2>게시글 목록</h2>
	<table border="1">
		<caption>게시글 검색 결과</caption>
		<thead>
			<tr>
				<td>게시글코드</td>
				<td>판매자</td>
				<td>구매자</td>
				<td>카테고리</td>
				<td>감정상태코드</td>
				<td>제목</td>
				<td width="400px">내용</td>
				<td>좋아요</td>
				<td>작성시간</td>
				<td>판매유무</td>
				<td>신고횟수</td>
				<td>블라인드</td>
				<td>가격</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="post" items="${ requestScope.searchedPostList }">
				<tr>
					<td>${post.code}</td>
					<td>${post.sellerCode}</td>
					<td>${post.buyerCode}</td>
					<td>${post.catCode}</td>
					<td>${post.authCode}</td>
					<td>${post.title}</td>
					<td>${post.content}</td>
					<td>${post.likeCount}</td>
					<td>${post.time}</td>
					<td>${post.soldYn}</td>
					<td>${post.reportCount}</td>
					<td>${post.blindYn}</td>
					<td>${post.itemPrice}</td>
					<td>${post.view}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>