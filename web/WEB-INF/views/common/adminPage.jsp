<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
<div style="width:1000px;">
	<table class="table">
		<tbody>
			<tr>
				<th scope="row">유저</th>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/usertest'">회원
						테스트 페이지로 이동</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/signup'">가입
						페이지로 이동</button></td>
			</tr>
			<tr>
				<th scope="row">관리자</th>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/list'">1:1
						문의 조회해보기</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/inquiryForm'">1:1
						문의 작성페이지</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/select/user'">1:1
						문의 조회 for 회원</button></td>
			</tr>
			<tr>
				<th scope="row" rowspan="5">게시글</th>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/post/list/allPost'">전체
						게시글 조회</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/post/list/searchPost'">게시글
						검색 조회</button></td>
			</tr>
			<tr>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/postInsertForm'">게시글
						작성</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/modifyPostBlind'">게시글
						블라인드 처리</button></td>
			</tr>
			<tr>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/modifyPostForm'">작성한
						게시글 수정</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/deletePostForm'">DB에서
						게시글 삭제</button></td>
			</tr>
			<tr>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/post/list/admin'">
						게시글 관리<br>(관리자) - 개발중
					</button></td>
			</tr>
			<tr>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/post/insert'">
						게시판 등록<br>(사진포함)
					</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/post/list'">
						게시판 메인<br>(사진포함)
					</button></td>
			</tr>
			<tr>
				<th scope="row" rowspan="2">댓글</th>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/cmt/list'">전체
						댓글 조회</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/cmt/insert'">댓글
						작성</button></td>
			</tr>
			<tr>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/cmt/blind'">댓글
						삭제/블라인드</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/recomment/blind'">대댓글
						삭제/블라인드</button></td>
			</tr>
			<tr>
				<th scope="row">결제 정보 추가</th>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/payment/add'">결제</button></td>
			</tr>
			<tr>
				<th scope="row" rowspan="3">공지사항</th>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/notice/list/allNotice'">공지사항
						전체 조회</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/notice/list/searchNotice'">공지사항
						검색 조회</button></td>
			</tr>
			<tr>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/noticeInsertForm'">공지사항
						등록 - 관리자용</button></td>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/noticeDeleteForm'">공지사항
						삭제 - 관리자용</button></td>
			</tr>
			<tr>
				<td><button class="btn btn-primary"
						onclick="location.href='${pageContext.servletContext.contextPath}/noticeModifyForm'">공지사항
						수정 - 관리자용</button></td>
			</tr>
		</tbody>
	</table>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>