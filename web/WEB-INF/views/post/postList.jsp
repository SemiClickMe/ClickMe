<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>게시글 단위 테스트 서블릿 페이지</title>
</head>
<body>
	<h1>게시판 메인 페이지</h1>
	<button onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button><hr>
	
	<main>
		<!-- 검색 영역 -->
		<div class="post-search-form-div" align="center">
			<form class="form-control" action="${pageContext.servletContext.contextPath}/post/list" id="post-search-form" method="get" style="display: inline-block">
				<fieldset>
					<legend align="center">게시글 검색 옵션</legend>
					<!-- <div class="seller-id">
						<label>작성자 아이디</label>
						<input type="text" name="sellerId" placeholder="작성자의 아이디를 입력해 주세요." value="${ param.sellerId }">
					</div> -->
					<div class="title">
						<label>제목</label>
						<input type="text" name="title" placeholder="게시글의 제목을 입력해 주세요." value="${ param.title }">
					</div>
					<div class="content">
						<label>내용</label>
						<input type="text" name="content" placeholder="게시글의 내용을 입력해 주세요." value="${ param.content }">
					</div>
					<div class="authentic">
						<label>감정상태</label>
						<select name="authCode">
							<option value="0" ${ (param.authCode eq "0") ? "selected" : "" }>-전체-</option>
							<option value="1" ${ (param.authCode eq "1") ? "selected" : "" }>감정전</option>
							<option value="2" ${ (param.authCode eq "2") ? "selected" : "" }>감정중</option>
							<option value="3" ${ (param.authCode eq "3") ? "selected" : "" }>감정완료</option>
							<option value="4" ${ (param.authCode eq "4") ? "selected" : "" }>감정반려</option>
							<option value="5" ${ (param.authCode eq "5") ? "selected" : "" }>미신청</option>
						</select>
					</div>
					<div class="price-range">
						<label>가격</label>
						<input type="number" name="itemPriceRangeMin" value="${ (param.itemPriceRangeMin eq '-1') ? '' : param.itemPriceRangeMin }" placeholder="min">
						~
						<input type="number" name="itemPriceRangeMax" value="${ (param.itemPriceRangeMax eq '-1') ? '' : param.itemPriceRangeMax }" placeholder="max">
					</div>
					<div class="submit-button">
						<button type="submit">검색</button>
						<c:if test="${ !empty sessionScope.loginUser }">
						<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/post/insert'">작성하기</button>
						</c:if>
					</div>
				</fieldset>
			</form>
		</div>
		
		<!-- 게시글 앨범 리스트 영역 -->
		<div class="album bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"  id="postArea">
					<c:forEach var="post" items="${ requestScope.postList }">
					<div class="col">
						<div class="card h-100 shadow-sm"  id="singlePost">
							<img src="${ pageContext.servletContext.contextPath }${ post.thumbPath }" class="card-img-top img-thumbnail" id="card-img" alt="representative thumbnail image of the post">
							<div class="card-img-overlay">
								<h4><span class="badge rounded-pill bg-info text-dark"><c:out value="${ post.authStatus }"/></span></h4>
							</div>
							<div class="card-body" id="card-body">
								<label style="display: none;"><c:out value="${ post.code }"/></label>
								<p class="card-text"><c:out value="${ post.title }"/></p>
								<h5 class="card-text" align="right"><c:out value="${ post.itemPrice }"/> 원</h5>
							<%-- <a href="${ pageContext.servletContext.contextPath }/post/list" class="stretched-link">a태그</a> --%>
							</div>
							<div class="card-footer">
								<button type="button" class="btn btn-primary float-start"> ♡ likes <span class="badge bg-secondary"><c:out value="${ post.likes }"/></span>
								</button>
								<h4><span class="badge bg-light text-dark float-end">views <c:out value="${ post.views }"/></span></h4>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- 페이징 영역 -->
		<jsp:include page="/WEB-INF/views/post/postListPagenation.jsp"/>
	</main>
	<script>
		$("#singlePost*").click(function() {
			var code = $(this).find("label").text();
			console.log(code);
			location.href = "${ pageContext.servletContext.contextPath }/post/list/detail?code=" + code;
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>