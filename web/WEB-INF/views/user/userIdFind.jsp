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
<title>타이틀 넣어요</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<div style="height: 80px"></div>
	    <h1 align="center">아이디 찾기</h1>
	    <div align="center" class="container justify-content-end">
		<form action="${pageContext.servletContext.contextPath}/user/idFinder" method="POST">
		   <input type="hidden" name="code" value="${ requestScope.userList.code }">
			<table class="table table-striped w-50 align-middle text-end">
				<tbody>
					<tr>
						<td class="col-1">이름</td>
						<td class="col-4"><input class="form-control" name="name" type="text" value="${ requestScope.userList.name }" aria-label="UserName"></td>
						<td class="col-1" style="width: 30px !important;">이메일</td>
						<td class="col-4"><input class="form-control" name="email" type="email" value="${ requestScope.userList.email }" aria-label="UserEmail" style="width: 240px;"></td>
					</tr>
				</tbody>
			</table>
			<button class="btn btn-danger" onclick="history.back();" type="button">취소</button>
			<button class="btn btn-secondary" type="submit">아이디 찾기</button>
		</form>
	</div>
		<div style="height: 80px"></div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script type="text/javascript">
(function () {
  'use strict'

  var forms = document.querySelectorAll('.needs-validation')

  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
</script>
</html>