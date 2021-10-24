<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">저런~ 에러났어요~</h1>
	<h2 align="center">${ requestScope.errorMessage }</h2>
	
	<script>
		(function(){
			const errorCode = "${ requestScope.errorCode }";
			
			let errorMessage = "";
			
			switch(errorCode){
				case "insertPost" : 
					errorMessage = "게시글을 등록하는 도중 오류가 발생했습니다!";
					break;
				case "listPostForUser" : 
					errorMessage = "게시글을 불러오는 도중 오류가 발생했습니다!";
					break;
				case "selectDetailPost" : 
					errorMessage = "해당 게시글을 불러오는 도중 오류가 발생했습니다!";
					break;
				case "insertPost" : 
					errorMessage = "해당 게시글을 수정하는 도중 오류가 발생했습니다!";
					break;
				case "insertNotice" : 
					errorMessage = "해당 공지사항을 추가하는 도중 오류가 발생했습니다!";
					break;
				case "modifyNotice" : 
					errorMessage = "해당 공지사항을 수정하는 도중 오류가 발생했습니다!";
					break;	
				case "deleteNotice" : 
					errorMessage = "해당 공지사항을 삭제하는 도중 오류가 발생했습니다!";
					break;	
				/* 아래꺼 복사해서 쓰세요. */
				/* case "string" : 
					errorMessage = "실패멘트";
					break; */
			}
			
		})();
	
	</script>
</body>
</html>