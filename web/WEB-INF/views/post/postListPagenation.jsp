<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<c:if test="${ (empty requestScope.postPageCriteria.title) && (empty requestScope.postPageCriteria.content) && (empty requestScope.postPageCriteria.authCode) && (empty requestScope.postPageCriteria.itemPriceRangeMin) && (empty requestScope.postPageCriteria.itemPriceRangeMax) }">
	<c:set var="pageUrl">${ pageContext.servletContext.contextPath }/post/list?currentPage=</c:set>
</c:if>
<c:if test="${ (!empty requestScope.postPageCriteria.title) || (!empty requestScope.postPageCriteria.content) || (!empty requestScope.postPageCriteria.authCode) || (!empty requestScope.postPageCriteria.itemPriceRangeMin) || (!empty requestScope.postPageCriteria.itemPriceRangeMax) }">
	<c:set var="pageUrl">${ pageContext.servletContext.contextPath }/post/list?title=${ requestScope.postPageCriteria.title }&content=${ requestScope.postPageCriteria.content }&authCode=${ requestScope.postPageCriteria.authCode }&itemPriceRangeMin=${ requestScope.postPageCriteria.itemPriceRangeMin }&itemPriceRangeMax=${ requestScope.postPageCriteria.itemPriceRangeMax }&currentPage=</c:set>
</c:if>
<%-- <c:if test="${ empty requestScope.postPageCriteria.title }">
	<c:set var="pageUrl">${ pageContext.servletContext.contextPath }/post/list?currentPage=</c:set>
</c:if>
<c:if test="${ !empty requestScope.postPageCriteria.title }">
	<c:set var="pageUrl">${ pageContext.servletContext.contextPath }/post/list?title=${ requestScope.postPageCriteria.title }&content=${ requestScope.postPageCriteria.content }&authCode=${ requestScope.postPageCriteria.authCode }&itemPriceRangeMin=${ requestScope.postPageCriteria.itemPriceRangeMin }&itemPriceRangeMax=${ requestScope.postPageCriteria.itemPriceRangeMax }&currentPage=</c:set>
</c:if> --%>
<title>타이틀 넣어요</title>
</head>
	<body>
		<nav aria-label="User Page navigation">
			<ul class="pagination justify-content-center">
		  		<!-- 이전페이지 버튼 -->
			  	<c:if test="${ requestScope.postPageCriteria.pageNo <= 1 }">
					<li class="page-item disabled"><a class="page-link">이전</a></li>
				</c:if>
				<c:if test="${ requestScope.postPageCriteria.pageNo > 1 and requestScope.postPageCriteria.pageNo <= 5 }">
					<li class="page-item"><a class="page-link" href="${pageUrl}1">이전</a></li>
				</c:if>
				<c:if test="${ requestScope.postPageCriteria.pageNo > 5 }">
					<li class="page-item"><a class="page-link" href="${pageUrl}${ requestScope.postPageCriteria.startPage - 1 }">이전</a></li>
				</c:if>
				<!-- 숫자 버튼 -->
				<c:forEach var="S" begin="${ requestScope.postPageCriteria.startPage }" end="${ requestScope.postPageCriteria.endPage }" step="1">
				<c:if test="${ requestScope.postPageCriteria.pageNo eq S }">
					<li class="page-item disabled"><a class="page-link">${ S }</a></li>
				</c:if>
				<c:if test="${ requestScope.postPageCriteria.pageNo ne S }">
					<li class="page-item"><a class="page-link" href="${pageUrl}${ S }">${ S }</a></li>
				</c:if>
				</c:forEach>
	    		<!-- 다음 페이지 버튼 -->
				<c:if test="${ requestScope.postPageCriteria.pageNo >= requestScope.postPageCriteria.maxPage }">
					<li class="page-item disabled"><a class="page-link">다음</a></li>
				</c:if>
				<c:if test="${ requestScope.postPageCriteria.pageNo < requestScope.postPageCriteria.maxPage and requestScope.postPageCriteria.endPage == requestScope.postPageCriteria.maxPage }">
					<li class="page-item"><a class="page-link" href="${pageUrl}${ requestScope.postPageCriteria.endPage }">다음</a></li>
				</c:if>
				<c:if test="${ requestScope.postPageCriteria.pageNo < requestScope.postPageCriteria.maxPage and requestScope.postPageCriteria.endPage < requestScope.postPageCriteria.maxPage }">
					<li class="page-item"><a class="page-link" href="${pageUrl}${ requestScope.postPageCriteria.endPage + 1 }">다음</a></li>
				</c:if>
			</ul>
		</nav>
	</body>
	
</html>