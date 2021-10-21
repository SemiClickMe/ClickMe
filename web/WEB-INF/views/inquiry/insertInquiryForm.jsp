<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 작성 페이지</title>
</head>
<body>
	<form action="${pageContext.servletContext.contextPath}/inquiry/insert"
		method="post">
		<table>
			<tr>
				<td>문의 타입</td>
				<td><select name="type">
						<option value="1">홈페이지 사용문의</option>
						<option value="2">거래문의</option>
						<option value="3">계정문의</option>
						<option value="3">기타</option>
				</select></td>
			</tr>
			<tr>
				<td>1:1문의 제목</td>
				<td colspan="3"><input type="text" name="inqTitle"
					style="width: 400px;"></td>
			</tr>
			<tr>
				<td>1:1문의 내용</td>
				<td colspan="3"><textarea name="inqContent" cols="60"
						style="resize: none;"></textarea></td>
			</tr>
		</table>
		<br>
		<div align="center">
			<button type="reset">취소하기</button>
			<button type="submit">등록하기</button>
		</div>
	</form>
</body>
</html>