<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<title>타이틀 넣어요</title>

</head>
<body>
    <div class="row justify-content-center" align="center">
    <div class="col-2" style="width: 300px; height: 270px">
            <div clsss="upload p-2" id="upload_thumb_div">
              <img clsss="upload" id="upload_thumb" src="${ pageContext.servletContext.contextPath }${ requestScope.userList.profileImgPath }" width="225" height="225" style="object-fit: cover; border-radius:50%;">
            </div>
              <label for="proPicThumb" class="btn btn-info btn-lg rounded-pill" style="font-size: 30px; position: relative; top: -40px;" >📷</label>
              <input class="form-control" type="file" name="proPicThumb" id="proPicThumb" onChange="proPicPreview();" hidden accept="image/*"><br>
          </div>
        </div>
</body>
 <script>
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
</script>
</html>