<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 전체 조회 단위 테스트 서블릿 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1 align="center">전체 게시글 목록 조회 결과</h1>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>
	<table align="center" border="1">
			<tr>
				<td>공지사항 코드</td>
				<td>공지사항 제목</td>
				<td>공지사항 내용</td>
				<td>공지사항 등록 시간</td>
			</tr>
			<c:forEach var="notice" items="${ requestScope.noticeList }">
				<tr>
					<td>${notice.code}</td>
					<td>${notice.title}</td>
					<td>${notice.content}</td>
					<td>${notice.time}</td>
				</tr>
			</c:forEach>
	</table>
	
	<script>
		if(document.getElementsByTagName("td")) {
			const $tds = document.getElementsByTagName("td");
			for(let i = 0; i < $tds.length; i++) {
				
				$tds[i].onmouseenter = function() {
					this.parentNode.style.backgroundColor = "orangered";
					this.parentNode.style.cursor = "pointer";
				}
				
				$tds[i].onmouseout = function() {
					this.parentNode.style.backgroundColor = "white";
				}
				
				$tds[i].onclick = function() {
					/* 게시물 번호까지 알아왔으니 이제 상세보기는 할 수 있겠죠? */
					const no = this.parentNode.children[0].innerText;
					/* location.href = "${ pageContext.servletContext.contextPath }/notice/detail?code=" + no; */
					console.log(no);
				}
				
			}
			
		}
	</script>
</body>
</html>