<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 단위 테스트 서블릿 페이지</title>
</head>
<body>
	<h1>게시글 등록 단위 테스트</h1>
	<p>
		해당 단위 테스트에서는 프론트엔드와 서블릿을 연동하여 데이터베이스에 게시글을 추가할 수 있는지를 테스트 합니다.<br>
		<u>이미지 업로드와 리뷰, 댓글 기능은 추후 업데이트 될 예정</u>입니다.
	</p>
	
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>
	
	<h2>게시글 등록 폼</h2>
	<form action="${pageContext.servletContext.contextPath}/post/insert" method="post" style="display: inline-block">
		<fieldset>
			<legend>게시글 등록 필드</legend>
			<label>1. 판매자 코드</label>
			<select name="sellerCode">
				<option value="1">1 : admin</option>
				<option value="2">2 : user01</option>
				<option value="3">3 : user02</option>
				<option value="4">4 : user03</option>
			</select><br>
			<label>2. 게시글 제목</label>
			<input type="text" name="title" size="50" placeholder="게시글 제목을 입력해주세요."/><br>
			<label>3. 게시글 내용</label>
			<textarea name="content" rows="10" cols="50" placeholder="게시글 내용을 작성해 주세요." style="resize: vertical;"></textarea><br>
			<label>4. 제품 금액</label>
			<input type="number" name="itemPrice" value="0"/>&nbsp;[KRW]
			<br>
			<button type="submit">등록</button>
		</fieldset>
	</form>
	
	<br>
	
	<%
		String result = (String) request.getAttribute("isDMLSuccess");
		String backgroundColor = "";
		
		if (result == null) {
			result = "아직 submit 버튼을 누르지 않았습니다!";
			backgroundColor = "orange";
		} else if (result == "success") {
			backgroundColor = "green";
		} else {
			backgroundColor = "red";
		}
	%>
	<label>성공 여부 : </label>
	<label style="background-color: <%= backgroundColor %>"><%= result %></label>
</body>
</html>