<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글작성하기</title>
</head>
<button
	onclick="location.href='${pageContext.servletContext.contextPath}'"
	name="backToHome">홈으로</button>
<br>
<br>
<body>
	<div style="border: 1px solid; width: 600px; padding: 5px">
    <form name="insertForm" action="${pageContext.servletContext.contextPath}/cmt/insert" method="post">

        <%-- <input type="hidden" name="brdno" value="<c:out value="[게시물 번호 삽입]"/> --%>
        <textarea name="rememo" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
        <a href="#" onclick="fn_formSubmit()">저장</a>
    </form>
</div>
</body>

</html>