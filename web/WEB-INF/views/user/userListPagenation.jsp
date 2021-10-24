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
<c:if test="${ empty requestScope.userPageList.searchUserCondition}">
	<c:set var="pageUrl">${ pageContext.servletContext.contextPath }/user/listPage?userListEntCondition=${ requestScope.userPageList.userListEntCondition }&currentPage=</c:set>
</c:if>
<c:if test="${ !empty requestScope.userPageList.searchUserCondition}">
	<c:set var="pageUrl">${ pageContext.servletContext.contextPath }/user/listPage?userListEntCondition=${ requestScope.userPageList.userListEntCondition }&searchUserCondition=${ requestScope.userPageList.searchUserCondition}&searchUserValue=${ requestScope.userPageList.searchUserValue}&currentPage=</c:set>
</c:if>
<title>리스트 페이징</title>
</head>
	<body>
		<nav aria-label="User Page navigation">
		  <ul class="pagination justify-content-center">
		  	<!-- 이전페이지 버튼 -->
			  	<c:if test="${ requestScope.userPageList.pageNo <= 1 }">
					<li class="page-item disabled"><a class="page-link">이전</a></li>
				</c:if>
				<c:if test="${ requestScope.userPageList.pageNo > 1 and requestScope.userPageList.pageNo <= 5 }">
					<li class="page-item"><a class="page-link" href="${pageUrl}1">이전</a></li>
				</c:if>
				<c:if test="${ requestScope.userPageList.pageNo > 5 }">
					<li class="page-item"><a class="page-link" href="${pageUrl}${ requestScope.userPageList.startPage - 1 }">이전</a></li>
				</c:if>
			<!-- 숫자 버튼 -->
			  <c:forEach var="S" begin="${ requestScope.userPageList.startPage }" end="${ requestScope.userPageList.endPage }" step="1">
				<c:if test="${ requestScope.userPageList.pageNo eq S }">
					<li class="page-item disabled"><a class="page-link">${ S }</a></li>
				</c:if>
				<c:if test="${ requestScope.userPageList.pageNo ne S }">
					<li class="page-item"><a class="page-link" href="${pageUrl}${ S }">${ S }</a></li>
				</c:if>
			  </c:forEach>
		    		<!-- 다음 페이지 il -->
				<c:if test="${ requestScope.userPageList.pageNo >= requestScope.userPageList.maxPage }">
					<li class="page-item disabled"><a class="page-link">다음</a></li>
				</c:if>
				<c:if test="${ requestScope.userPageList.pageNo < requestScope.userPageList.maxPage and requestScope.userPageList.endPage == requestScope.userPageList.maxPage }">
					<li class="page-item"><a class="page-link" href="${pageUrl}${ requestScope.userPageList.endPage }">다음</a></li>
				</c:if>
				<c:if test="${ requestScope.userPageList.pageNo < requestScope.userPageList.maxPage and requestScope.userPageList.endPage < requestScope.userPageList.maxPage }">
					<li class="page-item"><a class="page-link" href="${pageUrl}${ requestScope.userPageList.endPage + 1 }">다음</a></li>
				</c:if>
		  </ul>
		</nav>
	</body>
	
</html>