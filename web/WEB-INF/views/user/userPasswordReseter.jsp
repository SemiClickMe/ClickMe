<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>비밀번호 초기화</title>
<style type="text/css">
	#user_pwd_container{
		width: 600px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<div style="height: 50px">
	</div>
	<div align="center" class="container rounded-3 border border-3 border-info" id="user_pwd_container">
		<h1 align="center"> 비밀 번호 초기화</h1>
		<div align="left">
		</div>
		<div align="Center" id="userpwd_innercontainer">
			<form class="form-floating needs-validation" action="${pageContext.servletContext.contextPath}/user/pswReset" method="POST" novalidate>
				<div class="form-floating col-5 mb-3">
				  <input type="text" class="form-control" id="floatingId" placeholder="ID" name="id" required>
				  <label for="floatingId">아이디</label>
				    <div class="invalid-feedback">
				      아이디를 입력해 주세요
				    </div>
				</div>
				<div class="form-floating col-5 mb-3">
				  <input type="text" class="form-control" id="floatingName" placeholder="Name" name="name" required>
				  <label for="floatingName">이름</label>
				   <div class="invalid-feedback">
				     이름을 입력해주세요
				   </div>
				</div>
				<div class="form-floating col-5 mb-3">
				  <input type="email" class="form-control" id="floatingEmail" placeholder="name@example.com" name="email" required>
				  <label for="floatingEmail">이메일 주소</label>
				   <div class="invalid-feedback">
				      이메일을 입력해주세요
				   </div>
				</div>
				  <div class="col-4" align="center">
				  	<button type="button" onclick="history.back();" class="btn btn-danger mb-3">취소</button>
				    <button type="submit" class="btn btn-primary mb-3">초기화 하기</button>
				  </div>
			</form>
		</div>
	</div>
	<div style="height: 50px"></div>
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