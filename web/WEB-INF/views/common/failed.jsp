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
					errorMessage = "게시판 등록에 실패하셨습니다!";
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