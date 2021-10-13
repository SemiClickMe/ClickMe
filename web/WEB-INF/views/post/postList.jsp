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
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>
	<table border="1">
		<caption>전체 게시글 목록 조회 결과</caption>
		<thead>
			<tr>
				<td>게시글코드</td>
				<td>판매자</td>
				<td>구매자</td>
				<td>카테고리</td>
				<td>감정상태코드</td>
				<td>제목</td>
				<td>내용</td>
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
			<c:forEach var="post" items="${ requestScope.postList }">
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