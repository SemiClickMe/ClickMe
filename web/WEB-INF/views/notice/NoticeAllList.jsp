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
	<jsp:include page="../common/menubar.jsp"/>
	<div>
	<h1 align="center">전체 공지사항 목록 조회 결과</h1>
	<button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/notice/list/allNotice'">전체 공지사항 조회</button>
	<button type="reset" class="btn btn-danger" onclick="location.href='${pageContext.servletContext.contextPath}'">돌아가기</button>
	<br>
	<div class="input-group justify-content-center" align="center">
			<form id="searchInput" action="${ pageContext.servletContext.contextPath }/notice/list/option" method="get" style="display:inline-block">
			<div class="input-group mb-3" align="center">		
			    <select id="searchOption" class="form-select" name="searchOption" style="width:110px;">
					<option value="default" selected>카테고리</option>
					<option value="code" ${ (param.searchOption eq "code") ? "selected" : "" }>공지사항 코드</option>
					<option value="title" ${ (param.searchOption eq "title") ? "selected" : "" }>공지사항 제목</option>
					<option value="content" ${ (param.searchOption eq "content") ? "selected" : "" }>공지사항 내용</option>
				</select>	
		        <input type="search" id="searchValue" class="form-control w-50" name="searchValue" value="${ param.searchValue }"/>
		        <button class="btn btn-dark" type="submit">검색하기</button>
				</div>
			</form>
		</div>
	<table align="center" border="1">
		<thead>	
			<tr>
				<th scope="col">공지사항 코드</th>
				<th scope="col">공지사항 제목</th>
				<th scope="col">공지사항 내용</th>
				<th scope="col">공지사항 등록 시간</th>
			</tr>
		</thead>
		<c:forEach var="notice" items="${ requestScope.noticeList }">
				<tr>
					<td>${notice.code}</td>
					<td>${notice.title}</td>
					<td>${notice.content}</td>
					<td>${notice.time}</td>
				</tr>
			</c:forEach>
	</table>
	</div>
	
	
	 <button class="btn btn-primary" onclick="location.href='${ pageContext.servletContext.contextPath }/notice/insert'">등록하기</button>
	
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
					const code = this.parentNode.children[0].innerText;
					location.href = "${ pageContext.servletContext.contextPath }/notice/detail?code=" + code;
				}
				
			}
			
		}
	</script> 
</body>
</html>