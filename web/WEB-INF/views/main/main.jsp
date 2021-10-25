<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="resource/css/board.css">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">

<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>

    <div class="hi">


	        <!-- 이미지 캐러셀 1 -->
	        <section>
	        	<article>
			       	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="5000">
								<img src="source/image/main_carousel_image_1.jpg" class="d-block w-100" alt="main_carousel_image_1">
							</div>
							<div class="carousel-item">
								<img src="source/image/main_carousel_image_2.jpg" class="d-block w-100" alt="main_carousel_image_2">
							</div>
							<div class="carousel-item">
								<img src="source/image/main_carousel_image_3.jpg" class="d-block w-100" alt="main_carousel_image_3">
							</div>
							<div class="carousel-item">
								<img src="source/image/main_carousel_image_4.jpg" class="d-block w-100" alt="main_carousel_image_4">
							</div>
							<div class="carousel-item">
								<img src="source/image/main_carousel_image_5.jpg" class="d-block w-100" alt="main_carousel_image_5">
							</div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
	        	</article>
	        </section>
	        <br>
	        <!-- 이미지 캐러셀 2 -->
	        <section>
	        	<article>
			       	<div id="carouselExampleInterval2" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="3000">
								<img src="source/image/main_carousel_image_7.jpg" class="d-block w-100" alt="main_carousel_image_1">
							</div>
							<div class="carousel-item">
								<img src="source/image/main_carousel_image_6.jpg" class="d-block w-100" alt="main_carousel_image_2">
							</div>
							<div class="carousel-item">
								<img src="source/image/main_carousel_image_8.jpg" class="d-block w-100" alt="main_carousel_image_3">
							</div>
							<div class="carousel-item">
								<img src="source/image/main_carousel_image_9.jpg" class="d-block w-100" alt="main_carousel_image_4">
							</div>
							<div class="carousel-item">
								<img src="source/image/main_carousel_image_10.jpg" class="d-block w-100" alt="main_carousel_image_5">
							</div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
	        	</article>
	        </section>
        <jsp:include page="../common/footer.jsp"/>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>