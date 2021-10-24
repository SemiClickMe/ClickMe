<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
</style>

    <title>회원가입</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
         <div class="container" align="center">
	         <div class="col-8" style="background-color: #F7E0DB; border: solid #638B9A; margin: 20px; width: 700px">
	         <form action="${pageContext.servletContext.contextPath}/user/proAndPicUp" method="post" class="needs-validation" encType="multipart/form-data" novalidate>
	             <div class="row justify-content-center" id="signup">
	              <p class="fs-2 fw-bold text-center"> 회원가입 </p>
	              <div class="col-4">
	                <div class="upload p-2" id="upload_thumb_div">
	                  <img class="upload" id="upload_thumb" src="${pageContext.servletContext.contextPath}/resource/upload/profile/default_profile.jpg" width="225" height="225" style="object-fit: cover; border-radius:50%;">
       	              <div class="">
	                  <label for="proPicThumb" class="btn btn-info btn-lg rounded-pill" style="font-size: 30px; position: relative; top: -30px; left: 75px;" >📷</label>
	                  <input class="form-control" type="file" name="proPicThumb" id="proPicThumb" onChange="proPicPreview();" hidden accept=".jpg, .png"><br>
	                </div>
                  </div>
	              </div>    
	                 <div class="col-6" align="center">
						<div class="form-floating m-3">
	                        <input type="text" class="form-control" name="id" id="floatingId" placeholder="id" pattern="^([a-z0-9_]){6,16}$" autocomplete="off" required>
	                           <label for="floatingId">아이디</label>
	                           <div class="check_text" id="id_cc" style="margin-top: 10px; margin-bottom: -10px; font-weight: bold; font-size: 110%"></div>
	                           <div class="invalid-feedback">
	                            아이디는 숫자와 알파벳소문자 6~16자 조합만 가능합니다.
	                          </div>
	                       </div>
	                       <div class="form-floating m-3">
	                        <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password"  required>
	                           <label for="floatingPassword">비밀번호</label>
	                           <div class="invalid-feedback">
	                            비밀번호를 입력해 주세요.
	                          </div>
	                       </div>
	                       <div class="form-floating m-3">
	                           <input type="email" class="form-control" name="email" id="floatingemail" placeholder="email" autocomplete="off" required>
	                           <label for="floatingemail">이메일</label>
	                           <div class="invalid-feedback">
	                            이메일은 필수 입력사항입니다.
	                          </div>
	                       </div>
	                       <div class="form-floating m-3">
	                           <input type="tel" class="form-control" name="phoneNum" id="floatingPhoneNum" placeholder="phoneNum" autocomplete="off" required>
	                           <label for="floatingPhoneNum">전화번호</label>
	                           <div class="invalid-feedback">
	                            전화번호는 필수 입력사항입니다.
	                          </div>
	                       </div>
	                       <div class="form-floating m-3">
	                           <input type="text" class="form-control" name="name" id="floatingName" placeholder="name" pattern="^[가-힣]{2,5}$" autocomplete="off" required>
	                           <label for="floatingName">이름</label>
	                           <div class="invalid-feedback">
	                            한글이름을 입력해 주세요
	                          </div>
	                       </div>
	                       <div class="form-floating m-3">
	                           <input type="date" class="form-control" name="bdate" id="floatingBdate" placeholder="bdate" value="1999-07-22" required>
	                           <label for="floatingBdate">생년월일</label>
	                           <div class="invalid-feedback">
	                            
	                          </div>
	                       </div>
	                       <div class="form-floating m-3" style="position: relative; left: 10px">
	                           <select class="form-select" id="floatingGenderSelect" required name="gender" aria-label="gender">
	                             <option value="">성별을 정해주세요</option>
	                             <option value="M">남</option>
	                             <option value="F">여</option>
	                           </select>
	                           <label for="floatingGenderSelect">성별선택</label>
	                       </div>
	                       <div class="invalid-feedback">성별을 선택해 주세요</div>
	                   	</div>
	                      <button class="col-12 w-50 btn btn-primary btn-lg" id="signUpButton" type="submit" disabled>회원가입</button>
	                      </div>
						</form>
	                <br>
	              </div>
	        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

<script>
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

function proPicPreview() {


let fileInfo = document.getElementById("proPicThumb").files[0];

let reader = new FileReader();

  reader.onload = function() {

      document.getElementById("upload_thumb").src = reader.result;

  };

if( fileInfo ) {

      reader.readAsDataURL( fileInfo );

  }

}


$("#floatingId").keyup(function(){
	var userId = $('#floatingId').val();
	$.ajax({
		url: "${pageContext.servletContext.contextPath}/user/oneSelect",
		type: "get",
		data: { userId : userId},
		success: function(data){
			console.log(data);
			if(data >= 1){
				$("#id_cc").text("❌ 사용중인 아이디 입니다.");
				$("#id_cc").css("color", "red");
				$("#signUpButton").attr("disabled", true);
				console.log(document.getElementById("signUpButton").disabled);
			} else {
				$("#id_cc").text("😊 사용중이 아닌 아이디 입니다.");
				$("#id_cc").css("color", "green");
				$("#signUpButton").attr('disabled', false);
				console.log(document.getElementById("signUpButton").disabled);	
			}
				
		},
		error: function(request, status, error){
			alert("code:" + request.status + "\n" 
					+ "message:" + request.responseText + "\n"
					+ "error:" + error);
		}
	});
});



  </script>

</html>