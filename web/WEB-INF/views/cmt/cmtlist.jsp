<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 테스트 페이지</title>
</head>
<body>
	<%-- Comment, Recomment 전체값 조회 테이블 --%>
	
	<div style="border: 1px solid; width: 600px; padding: 5px">
    <form name="insertForm" action="${pageContext.servletContext.contextPath}/cmt/insert" method="post">
		
		<label>아이디</label>
		<input type="text" maxlength="500" name="loginUserId" id="loginUserId" value="${sessionScope.loginUser.id}">
		<label>이름</label>
		<input type="text" maxlength="500" name="loginUserName" id="loginUserName" value="${sessionScope.loginUser.name}">
		<br><br>
        <textarea name="content" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
        <button type="submit">저장</button>
    </form>
    
	</div>
	
 	<%-- <table id ="cmtlistTable" border="1" >
		<tbody>
			<c:forEach var="cmt" items="${requestScope.cmtList}">
				<tr>
					<td>${cmt.code}</td>
					<td>${cmt.postCode}</td>
					<td>${cmt.content}</td>
					<td>${cmt.time}</td>
					<td>${cmt.yn}</td>
					<td><input type=submit name="cmtCode" id="${cmt.code}" value="버튼${cmt.code}" 
						onClick="location.href='${pageContext.servletContext.contextPath}/cmt/blind'"></td>
					
					<td><a href="#"><button
								onclick="location.href='${pageContext.servletContext.contextPath}/recomment/insert'"
								name="insertRecomment">대댓글작성하기</button></a></td>
				</tr>
			</c:forEach>
	</table> --%>
	<br><br><br>

</body>
</html>