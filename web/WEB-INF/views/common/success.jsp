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
