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
<div style="height: 60px"></div>
<div align="center" style="height: 600px">
<img style="width: 800px" src="${pageContext.servletContext.contextPath}/source/image/frame_g.jpg">
<h1 align="center" style="font-size: 60px; position: relative; top : -450px;">당신의 아이디는</h1>
<h1 align="center" style="color:#CE848F;  font-size: 60px; position: relative; top : -400px; margin-top: -70px;">"${ requestScope.userLists[0].id }"</h1>
<h1 align="center" style="font-size: 60px; position: relative; top : -420px;">입니다.</h1>
</div>
<div align="center" >
<button class="btn btn-danger" style="font-size: 200%;" onclick="location.href='${pageContext.servletContext.contextPath}'" type="button">메인으로</button>
</div>
</body>
<script>

window.onload = function() {
	
	var message = '${ requestScope.message }';

	alert(message);
}
</script>
</html>