<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		(function(){
			const successCode = "${ requestScope.successCode }";
			
			let successMessage = "";
			let movePath = "";
			
			switch(successCode){
				case "insertPost" : 
					successMessage = "게시글 등록에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/post/list";
					break;
				case "modifyPost" : 
					successMessage = "게시글 수정에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/post/list/detail?code=${ code }";
					break;
				case "deletePost" : 
					successMessage = "게시글 삭제에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/post/list";
					break;
				case "insertNotice" : 
					successMessage = "공지사항 추가에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/notice/list/allNotice";
					break;
				case "deleteNotice" : 
					successMessage = "공지사항 삭제에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/notice/delete";
					break;	
				case "modifyNotice" : 
					successMessage = "공지사항 수정에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/notice/modify";
					break;
				case "insertCmt" : 
					successMessage = "댓글 입력에 성공했습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/cmt/list";
					break;
				/* 아래꺼 복사해서 쓰세요. */
				/* case "string" : 
					successMessage = "성공멘트";
					movePath = "${ pageContext.servletContext.contextPath }서블릿-URL-Mapping";
					break; */
			}

			alert(successMessage);
			
			location.replace(movePath);
		})();
	
	</script>
</body>
</html>
