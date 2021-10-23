<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resource/css/board.css">
<title>Insert title here</title>
</head>
<body>
		<div class="layoutMiddle">
        <!-- 헤더 -->
        <header>
            <img src="${ pageContext.servletContext.contextPath }/source/image/logo-removebg.png" alt="타이틀 로고" class="titleImage" onclick="location.href='${pageContext.servletContext.contextPath}'">
            <div class=buttonlist>
          	<c:if test="${ empty sessionScope.loginUser }">
                <button onclick="location.href='${pageContext.servletContext.contextPath}/logIn'">로그인</button>
                <button onclick="location.href='${pageContext.servletContext.contextPath}/signup'">회원가입</button>
            </c:if>
            <c:if test="${ sessionScope.loginUser.authority eq 'N' }">   
             	<div class=buttonlist>
             	<button onclick="location.href='${ pageContext.servletContext.contextPath }/user/logout'">로그아웃</button>
             	<button onclick="location.href='${ pageContext.servletContext.contextPath }/user/testViewMyPage'">정보수정</button>
             	</div>
             </c:if>
             <c:if test="${ sessionScope.loginUser.authority eq 'Y' }">
             	<div class=buttonlist>
	             	<button onclick="location.href='${ pageContext.servletContext.contextPath }/user/logout'">로그아웃</button>
	             	<button onclick="location.href='${ pageContext.servletContext.contextPath }/adminPage'">관리페이지</button>
             	</div>
             </c:if>
            </div>
            
        </header>
        </div>
        <nav>
            <div class="nav_bar">
                <a href="${ pageContext.servletContext.contextPath }/post/list" id="board">게시판</a>
                <a href="${ pageContext.servletContext.contextPath }/notice/list/allNotice" id="contact">공지사항</a>
                <a href="${ pageContext.servletContext.contextPath }/inquiry/list" id="contact">1:1문의</a>
                <a href="#" id="contact">매거진</a>
            </div>
        </nav>
        
</body>
</html>