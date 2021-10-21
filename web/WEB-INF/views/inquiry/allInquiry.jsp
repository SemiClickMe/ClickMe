<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>1:1문의 리스트</title>
</head>
<body>
	<h1 align="center">1:1문의 전체 조회해보기</h1>
	<button class="btn btn-danger" onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/list/noreply'">아직 답변되지않은 문의 조회</button>
	<button class="btn btn-success" onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/list/answered'">답변이 완료 된 문의 조회</button>
	<button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/list'">전체 문의 조회</button>
	  <table class="table table-striped table-dark">
        <thead>
          <tr>
            <th scope="col">1:1문의코드</th>
            <th scope="col">문의유형코드</th>
            <th scope="col">사용자코드</th>
            <th scope="col">문의제목</th>
            <th scope="col">문의내용</th>
            <th scope="col">문의날짜</th>
            <th scope="col">답변내용</th>
            <th scope="col">답변일자</th>
            <th scope="col">답변여부</th>
          </tr>
        </thead>
        <c:forEach var="inq" items="${ requestScope.inqList }">
			<tr>
				<td>${ inq.code }</td>
				<td>${ inq.inqTypeCode }</td>
				<td>${ inq.userCode }</td>
				<td>${ inq.inqTitle }</td>
				<td>${ inq.inqContent }</td>
				<td>${ inq.inqTime }</td>
				<td>${ inq.ansContent }</td>
				<td>${ inq.ansTime }</td>
				<td>${ inq.ansYn }</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="input-group justify-content-center" align="center">
			<form id="searchInput" action="${ pageContext.servletContext.contextPath }//inquiry/list/option" method="get" style="display:inline-block">
			<div class="input-group mb-3" align="center">		
			    <select id="searchOption" class="form-select" name="searchOption" style="width:110px;">
					<option value="default" selected>카테고리</option>
					<option value="userCode" ${ (param.searchOption eq "userCode") ? "selected" : "" }>작성자</option>
					<option value="inqTitle" ${ (param.searchOption eq "inqTitle") ? "selected" : "" }>제목</option>
					<option value="inqTypeCode" ${ (param.searchOption eq "inqTypeCode") ? "selected" : "" }>분류코드</option>
				</select>	
		        <input type="search" id="searchValue" class="form-control w-50" name="searchValue" value="${ param.searchValue }"/>

				<button class="btn btn-dark" type="submit">검색하기</button>
				</div>
			</form>
		</div>
	
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
					location.href = "${ pageContext.servletContext.contextPath }/inquiry/detail?code=" + no;
				}
				
			}
			
		}
	</script>
</body>
</html>