<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/ClickMe/resource/css/board.css">
<title>Insert title here</title>
</head>
<body>
		<div class="layoutMiddle">
        <!-- 헤더 -->
        <header>
            <img src="/ClickMe/source/image/logo-removebg.png" alt="타이틀 로고" class="titleImage" onclick="location.href='${pageContext.servletContext.contextPath}'" style="cursor:pointer">
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
                <a href="${ pageContext.servletContext.contextPath }/notice/list/allNotice" id="nitice">공지사항</a>
                <a href="${ pageContext.servletContext.contextPath }/inquiry/select/user" id="contact">1:1문의</a>
                <a href="#" id="magazine">매거진</a>
                <a href="${ pageContext.servletContext.contextPath }/userFaQ" id="faq">자주묻는질문</a>
            </div>
        </nav>
</body>
</html>