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
	<h1 align="left">관리자 페이지</h1>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button><br>
	
	<br><hr>
	
	<h2>게시글 상세 내용</h2>
	<form action="" style="display: inline-block;">
		<fieldset>
			<legend>게시글 상세 내용</legend>
			<div>
				<label>게시글번호</label>
				<input type="number" value="${ requestScope.detailPost.code }" readonly="readonly">
			</div>
			<div>
				<label>글 제목</label>
				<input type="text" value="${ requestScope.detailPost.title }" size="60" readonly="readonly">
			</div>
			<fieldset>
				<legend>관리자가 수정 가능한 속성</legend>
					<div style="width:200px; float: left;">
						<label>감정상태</label>
						<select name="authStatus">
							<!-- 나중에 파라미터로 넘겨줄 때는 int형 코드로 넘기는 것이 편하다. -->
							<option value="1" ${ (requestScope.detailPost.authStatus eq "감정전") ? "selected" : "" }>감정전</option>
							<option value="2" ${ (requestScope.detailPost.authStatus eq "감정중") ? "selected" : "" }>감정중</option>
							<option value="3" ${ (requestScope.detailPost.authStatus eq "감정완료") ? "selected" : "" }>감정완료</option>
							<option value="4" ${ (requestScope.detailPost.authStatus eq "감정반려") ? "selected" : "" }>감정반려</option>
						</select>
					</div>
					<div style="width:200px; float: left;">
						<label>블라인드</label>
						<input type="radio" name="blindYn" id="Y" value="Y" ${ (requestScope.detailPost.blindYn eq "Y") ? "checked" : "" }>
						<label for="Y">Y</label>
						<input type="radio" name="blindYn" id="N" value="N" ${ (requestScope.detailPost.blindYn eq "N") ? "checked" : "" }>
						<label for="N">N</label>
					</div>
					<div style="width:200px;">
						<label>카테고리</label>
						<select name="catName">
							<!-- 나중에 파라미터로 넘겨줄 때는 int형 코드로 넘기는 것이 편하다. -->
							<option value="1" ${ (requestScope.detailPost.catName eq "판매") ? "selected" : "" }>판매</option>
							<option value="2" ${ (requestScope.detailPost.catName eq "자유") ? "selected" : "" }>자유</option>
						</select>
					</div>
			</fieldset>
			<div>
				<label>상품가격</label>
				<input type="number" value="${ requestScope.detailPost.itemPrice }" readonly="readonly">
			</div>
			<div>
				<label>작성자 ID</label>
				<input type="text" value="${ requestScope.detailPost.sellerId }" readonly="readonly">
			</div>
			<div>
				<label>구매자 ID</label>
				<input type="text" value="${ requestScope.detailPost.buyerId }" readonly="readonly">
			</div>
			<div>
				<label>작성날짜</label>
				<input type="date" value="${ requestScope.detailPost.time }" readonly="readonly">
			</div>
			<div>
				<label>판매유무</label>
				<input type="text" value="${ requestScope.detailPost.soldYn }" readonly="readonly">
			</div>
			<div>
				<label>좋아요</label>
				<input type="number" value="${ requestScope.detailPost.likeCount }" readonly="readonly">
			</div>
			<div>
				<label>신고횟수</label>
				<input type="number" value="${ requestScope.detailPost.view }" readonly="readonly">
			</div>
			<div>
				<label>글 내용</label>
				<textarea rows="10" cols="50" readonly="readonly"><c:out value="${ requestScope.detailPost.content }"></c:out></textarea>
			</div>
			<div>
				<label>갤러리</label>
			</div>
		</fieldset>
		<br>
		<div>
			<button type="submit" onclick="">적용</button>
			<button type="button" onclick="history.back()">목록으로</button>
		</div>
	</form>
	
</body>
</html>