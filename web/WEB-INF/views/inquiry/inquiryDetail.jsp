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
	<h2 align="center">1:1문의 내용</h2>
		<div class="table-area">
			<table align="center">
				<tr>
					<td>문의제목 : </td>
					<td colspan="3"><p><c:out value="${ requestScope.inquiry.inqTitle }"/></p></td>
				</tr>
				<tr>
					<td>작성자 :</td>
					<td><p><c:out value="${ requestScope.inquiry.userCode }"/></p></td>
					<td>작성일 :</td>
					<td><p><c:out value="${ requestScope.inquiry.inqTime }"/></p></td>
				</tr>
				<tr>
					<td>문의내용 :</td>
					<td colspan="3">
						<textarea style="resize:none; width:90%; height:200px;" readonly><c:out value="${ requestScope.inquiry.inqContent }"/></textarea>
					</td>
				</tr>
			</table>
			<br>
		</div>
</body>
</html>