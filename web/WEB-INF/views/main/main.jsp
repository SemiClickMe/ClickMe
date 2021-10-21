<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <link rel="stylesheet" href="resource/css/board.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">

<title>Insert title here</title>
</head>
<body>

    <div class="layoutMiddle">

        <!-- 헤더 -->
        <header>
            <img src="source/image/logo-removebg.png" alt="타이틀 로고" class="titleImage">
            <div class=buttonlist>
            <c:if test="${ empty sessionScope.loginUser }">
                <button onclick="location.href='${pageContext.servletContext.contextPath}/logIn'">로그인</button>
                <button>회원가입</button>
            </c:if>
            <c:if test="${ !empty sessionScope.loginUser }">   
             	<div class=buttonlist>
             	<button onclick="location.href='${ pageContext.servletContext.contextPath }/user/logout'">로그아웃</button>
             	<button>정보수정</button>
             	</div>
             </c:if>      
            </div>
            <div class="search-container">
                <input type="text" name="search">
                <button type="submit">검색하기</button>
            </div>
        </header>

        <!-- 네비게이션 바 -->
        <nav>
            <div class="nav_bar">
                <a href="#" id="main">여성</a>
                <a href="#" id="about">남성</a>
                <a href="#" id="post">브랜드</a>
                <a href="#" id="contact">공지사항</a>
                <a href="#" id="contact">고객지원</a>
            </div>
        </nav>

        <div class="wrap">
            <aside>
                <div class="sidebar">
                    <img src="source/icon/user.png" id="icon">
                    <img src="source/icon/cart.png" id="icon">
                    <img src="source/icon/heart.png" id="icon">
                    <img src="source/icon/clock.png" id="icon">
                    <button onclick="topFunction()" title="top" id="topbutton">Top </button>
                </div>
            </aside>

            <section>
                <div class="main_field p-3">
                    
                    <article class="main_cs p-3">
                         <br>

							<div class="container">
							
							<table class="table">
								  <tbody>
								    <tr>
								      <th scope="row">유저</th>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/usertest'">회원 테스트 페이지로 이동</button></td>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/signup'">가입 페이지로 이동</button></td>
								    </tr>
								    <tr>
								      <th scope="row"> 관리자</th>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/list'">1:1 문의 조회해보기</button></td>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/inquiryForm'">1:1 문의 작성페이지</button></td>
								    </tr>
								    <tr>
								      <th scope="row" rowspan="4">게시글</th>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/post/list/allPost'">전체 게시글 조회</button></td>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/post/list/searchPost'">게시글 검색 조회</button></td>
								    </tr>
								    <tr>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/postInsertForm'">게시글 작성</button></td>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/modifyPostBlind'">게시글 블라인드 처리</button></td>
								    </tr>
								    <tr>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/modifyPostForm'">작성한 게시글 수정</button></td>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/deletePostForm'">DB에서 게시글 삭제</button></td>
								    </tr>
								    <tr>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/post/list/admin'">게시글 관리(관리자) - 개발중</button></td>
								      <td><button class="btn btn-primary">게시판(회원) - 개발중</button></td>
								    </tr>
								    <tr>
								      <th scope="row" rowspan="2">댓글</th>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/cmt/list'">전체 댓글 조회</button></td>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/cmt/insert'">댓글 작성</button></td>
								    </tr>
								    <tr>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/cmt/blind'">댓글 삭제/블라인드</button></td>
								      <td><button class="btn btn-primary" onclick="location.href='${pageContext.servletContext.contextPath}/recomment/blind'">대댓글 삭제/블라인드</button></td>
								    </tr>
								  </tbody>
								</table>
							  </div>
                    </article>
                </div>
            </section>
        <footer>
            <hr class="solidLines">
            <div class="bottombar">
                <a href="#" id="company-intro">회사소개</a>
                <a href="#" id="privacy-statement">개인정보취급방침</a>
                <a href="#" id="terms-of-use">이용약관</a>
                <a href="#" id="financial">전자금융거래 이용약관</a>
                <a href="#" id="sitemap">사이트맵</a>
                <div class="sns">
                    <img src="source/icon/instagram.png" id="snsicon">
                    <img src="source/icon/facebook.png" id="snsicon">
                    <img src="source/icon/kakao-talk.png" id="snsicon">
                    <img src="source/icon/youtube.png" id="snsicon">
                </div>
            </div>
            <hr class="solidLines">
            <div class="siteintro">
                (주) 머스트잇<br>
                대표 : 더조은 ㅣ 소재지 : 00시 00구 00로 000길 00-00 (00동,00층 클릭미)<br>
                사업자등록 : XXX-XX-XX ㅣ 통신판매업신고 : 서울강남 00000호<br>
                개인정보관리책임자 : ㅁㅁㅁ ㅣ E-MAIL : help@gmail.co.kr | 호스팅 : 클릭미<br>
                <br>
                고객센터<br>
                <br>
                1566-3516 ㅣ 평일 10:00 ~ 18:00 ㅣ 점심시간 12:30 ~ 13:30 ㅣ 주말 및 공휴일 휴무<br>
                상품, 배송, 재고 등의 문의는 상품페이지 하단 [상품문의 등록]을 이용하시면 판매자로부터<br>
                더욱 정확한 답변을 받으실 수 있습니다.<br>

            </div>
            <hr class="solidLines">
        </footer>
    </div>
    </div>
</body>
</html>