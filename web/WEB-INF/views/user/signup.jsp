<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>sample board semiproject</title>
    <link rel="stylesheet" href="resource/css/board.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">

</head>

<body>
    <div class="layoutMiddle">

        <!-- 헤더 -->
        <header>
            <img src="source/image/logo-removebg.png" alt="타이틀 로고" class="titleImage">
            <div class=buttonlist>
                <button>로그인</button>
                <button>회원가입</button>
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
                <div class="signup_field p-3">
                   
                    <article class="signup_cs p-3">
                        <br>
                        <div class="container">
                            <div class="col">
                                <div class="row g-1">
                                    <div class="col-4 order-md-last" style="background-color: black;">
                                        <p class="fs-2 fw-bold text-center">프로필 사진</p>
                                        <img src="resource/upload/profile/bart.jpg" class="rounded mx-auto d-block" alt="haha"
                                            id="profilePic">
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                            data-bs-target="#profileModal">
                                            사진 업로드
                                        </button>
                                    </div>
                                    <div class="col-8" style="background-color:burlywood;">
                                        <div class="row g-3" id="signup">
                                            <div class="col-6 offset-3">
                                                <p class="fs-2 fw-bold text-center"> 회원가입 </p>
                                                <form action="userSignup" method="post">
                                                <div class="form-floating m-3">
                                                    <input type="text" class="form-control" name="id" id="floatingInput"
                                                        placeholder="id" autofocus>
                                                    <label for="floatingInput">아이디</label>
                                                </div>
                                                <div class="form-floating m-3">
                                                    <input type="password" class="form-control" name="password" id="floatingPassword"
                                                        placeholder="Password">
                                                    <label for="floatingPassword">비밀번호</label>
                                                </div>
                                                <div class="form-floating m-3">
                                                    <input type="email" class="form-control" name="email" id="floatingemail"
                                                        placeholder="email">
                                                    <label for="floatingemail">이메일</label>
                                                </div>
                                                <div class="form-floating m-3">
                                                    <input type="tel" class="form-control" name="phoneNum" id="floatingPhoneNum"
                                                        placeholder="phoneNum">
                                                    <label for="floatingPhoneNum">전화번호</label>
                                                </div>
                                                <div class="form-floating m-3">
                                                    <input type="text" class="form-control" name="name" id="floatingName"
                                                        placeholder="name">
                                                    <label for="floatingName">이름</label>
                                                </div>
                                                <div class="form-floating m-3">
                                                    <input type="date" class="form-control" name="bdate" id="floatingBdate"
                                                        placeholder="bdate" value="1999-07-22">
                                                    <label for="floatingBdate">생년월일</label>
                                                </div>
                                                <div class="form-floating m-3">
                                                    <select class="form-select m-2" id="floatingGenderSelect" name="gender" aria-label="gender">
                                                      <option selected>성별을 정해주세요</option>
                                                      <option value="M">남</option>
                                                      <option value="F">여</option>
                                                    </select>
                                                    <label for="floatingGenderSelect">성별선택</label>
                                                </div>
                                                <button class="offset-2 w-75 btn btn-primary btn" type="submit">회원가입</button>
                                            </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- <button class="w-50 btn btn-primary btn-lg" type="submit">회원 가입</button>   -->
                                </div>

                            </div>
                        </div>

                    </article>
                </div>
            </section>

        </div>


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
    <!--모달페이지-->
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profileModalLabel">프로필 사진</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    프로필 사진 넣기
                    <div class="mb-3">
                        <label for="formFile" class="form-label">프로필사진 업로드</label>
                        <input class="form-control" type="file" id="formFile">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">올리기</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>

</html>