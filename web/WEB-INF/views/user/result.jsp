<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2 align="center">${ requestScope.signupUser }</h2>
<h2 align="center">${ requestScope.userList }</h2>
<h2 align="center">${ requestScope.userCount }</h2>
<div style="height: 50px"></div>
<div align="center">
<img style="width: 800px" src="${pageContext.servletContext.contextPath}/source/image/warring.jpg">
<h1 align="center" style=" font-size: 60px; position: relative; top : -350px;">${ requestScope.message }</h1>
</div>

<c:forEach var="users" items="${ requestScope.userLists }">
	<h2 align="center"><br>ID : ${ users.id }<br></h2>
</c:forEach>

<div align="center" >
<button class="btn btn-danger" style="font-size: 200%;" onclick="location.href='${pageContext.servletContext.contextPath}'" type="button">메인으로</button>
</div>
<br>
<%-- ${ requestScope.user1Pic }	
<br>
${ requestScope.user1Pic.profileImgPath } --%>
<br>
${ requestScope.user1Pic.profileImgPath }
<br>



<script>

<!-- 	<script>
		window.onload = function() {
			
			var message = '${ requestScope.message }';

			alert(message);
/* 			location.href = '${pageContext.servletContext.contextPath}'; */
		}
-->

</script>
	
	
</body>
</html>