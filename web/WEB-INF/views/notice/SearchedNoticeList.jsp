<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 단위 테스트 서블릿 페이지</title>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<h1 align="center">공지사항 검색 조회 단위 테스트</h1>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>

	<h2 align="center"><b>어떤 공지사항을 찾고 싶으신가요?</b></h2>
			<form action="${pageContext.servletContext.contextPath}/notice/list/searchNotice" method="get" style="display: inline-block">
			<fieldset>
			<legend align="center"><b>공지사항 검색 필드</b></legend>
			<label>검색옵션</label>
			<select name="searchOption">
				<option value="default" selected>옵션선택</option>
				<option value="code" ${ (param.searchOption eq "code") ? "selected" : "" }>코드</option>
				<option value="title" ${ (param.searchOption eq "title") ? "selected" : "" }>제목</option>
				<option value="content" ${ (param.searchOption eq "content") ? "selected" : "" }>내용</option>
			</select>
			<label>검색값</label>
			<input type="search" name="searchValue" placeholder="검색할 내용을 입력해 주세요" value="${ param.searchValue }"/>
			<button type="submit">검색</button>
			</fieldset>
			</form>
	<jsp:include page="../common/footer.jsp"/>
	<h2 align="center">공지사항 검색 결과입니다.</h2>
	<table border="1" align="center">
		<caption>공지사항 검색 결과</caption>
		<thead>
			<tr>
				<td>공지사항코드</td>
				<td>공지사항제목</td>
				<td>공지사항내용</td>
				<td>공지사항작성시간</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${ requestScope.searchedNoticeList }">
				<tr>
					<td>${notice.code}</td>
					<td>${notice.title}</td>
					<td>${notice.content}</td>
					<td>${notice.time}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>