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
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
		<div style="height: 50px"></div>
		<div align="center"style="height: 600px">
		<img style="width: 800px" src="${pageContext.servletContext.contextPath}/source/image/warring.jpg">
		<h1 align="center" style=" font-size: 60px; position: relative; top : -400px;">${ requestScope.message }</h1>
		</div>
		
		<c:forEach var="users" items="${ requestScope.userLists }">
			<h2 align="center"><br>ID : ${ users.id }<br></h2>
		</c:forEach>
		
		<div align="center" >
		<button class="btn btn-danger" style="font-size: 200%;" onclick="location.href='${pageContext.servletContext.contextPath}'" type="button">메인으로</button>
		</div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

<script>

window.onload = function() {
	
	var message = '${ requestScope.message }';

	alert(message);
}
</script>
</html>