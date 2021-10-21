<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>나의 문의</title>
</head>
<body>
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
        <c:forEach var="inq" items="${ requestScope.inquiry }">
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
					const no = this.parentNode.children[0].innerText;
					location.href = "${ pageContext.servletContext.contextPath }/inquiry/detail/user?code=" + no;
				}
				
			}
			
		}
	</script>
</body>
</html>