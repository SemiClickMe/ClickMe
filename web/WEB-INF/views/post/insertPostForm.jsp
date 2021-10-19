<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">게시글 등록 & 파일 입출력 테스트</h2>
	<form action="${ pageContext.servletContext.contextPath }/post/insert" method="post" encType="multipart/form-data">
		<table align="center">
			<tr>
				<td width="100px">제목</td>
				<td colspan="3"><input type="text" size="45" name="title"></td>
			</tr>
			<tr>
				<td width="100px">카테고리</td>
				<td colspan="1">
					<select name="catCode">
						<option value="1">판매</option>
						<option value="2">구매</option>
						<option value="3">기타</option>
					</select>
				</td>
				<td width="100px">감정신청</td>
				<td colspan="1">
					<input type="radio" name="authCode" id="Y" value="1">
					<label for="Y">신청</label>
					<input type="radio" name="authCode" id="N" value="5" checked>
					<label for="N">미신청</label>
				</td>
			</tr>
			<tr>
				<td width="100px">가격</td>
				<td colspan="3"><input type="number" size="20" name="itemPrice"></td>
			</tr>
			<tr>
				<td width="100px">내용</td>
				<td colspan="3">
					<textarea name="content" rows="10" cols="50" style="resize:none;"></textarea>
				</td>
			</tr>
			<tr>
				<td>대표 이미지</td>
				<td colspan="3">
					<div class="title-img-area" id="titleImgArea">
						<img id="titleImg" width="350" height="200">
					</div>
				</td>
			</tr>
			<tr>
				<td>내용 사진</td>
				<td>
					<div class="content-img-area1" id="contentImgArea1">
						<img id="contentImg1" width="120" height="100">
					</div>
				</td>
				<td>
					<div class="content-img-area2" id="contentImgArea2">
						<img id="contentImg2" width="120" height="100">
					</div>
				</td>
				<td>
					<div class="content-img-area3" id="contentImgArea3">
						<img id="contentImg3" width="120" height="100">
					</div>
				</td>
				
			</tr>
		</table>
		<div class="thumbnail-file-area" style="display: none;">
			<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="fileValidityCheck(this,1)" accept="image/*">
			<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="fileValidityCheck(this,2)" accept="image/*">
			<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="fileValidityCheck(this,3)" accept="image/*">
			<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="fileValidityCheck(this,4)" accept="image/*">
		</div>
		<br>
		<div class="thumbnail-btn-area" style="width: 150px; margin-left: auto; margin-right: auto;">
			<button type="button" onclick="history.back()">취소하기</button>
			<button type="submit">작성완료</button>
		</div>
	</form>
	
	<script>
		
		const $titleImgArea = document.getElementById("titleImgArea");
		const $contentImgArea1 = document.getElementById("contentImgArea1");
		const $contentImgArea2 = document.getElementById("contentImgArea2");
		const $contentImgArea3 = document.getElementById("contentImgArea3");
		
		$titleImgArea.onclick = function() { 
			document.getElementById("thumbnailImg1").click(); 
		}
		
		$contentImgArea1.onclick = function() {
			document.getElementById("thumbnailImg2").click();
		}
		
		$contentImgArea2.onclick = function() {
			document.getElementById("thumbnailImg3").click();
		}
		
		$contentImgArea3.onclick = function() {
			document.getElementById("thumbnailImg4").click();
		}
		
		/* 이미지 미리보기 관련 함수(File API 활용하기) */
		function loadImg(value, num) {
			/* https://developer.mozilla.org/ko/docs/Web/API/FileReader 참고 (MDN 사이트 참고)*/
			if (value.files && value.files[0]) {			// value.files[0]는 파일 이름
				const reader = new FileReader();
				/*
					FileReader 객체는 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob 객체를
					이용해 파일의 내용을(혹은 raw data버퍼로) 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 하는 것	
					Blob(Binary large object) : 파일류의 불변하는 미가공 데이터로 텍스트와 이진 데이터의 형태로 읽을 수 있음
				*/
				reader.readAsDataURL(value.files[0]);		// Base64방식으로 파일을 FileReader에 전달 (Base64로 인코딩한 것은 브라우저가 원래 데이터로 만들게 됨)
				
				// load 이벤트의 핸들러로 읽기 동작이 성공적으로 완료 되었을 때마다 발생한다.
				reader.onload = function(e) {				// load EventListener에 function 등록 (FileReader에서 전달 받은 파일을 다 읽으면 리스너에 등록한 function이 호출 됨)
					switch(num){
					case 1:
						console.log(e.target.result);		// e.target.result는 인코딩한 결과로 img태그의 src로 사용할 수 있음
						document.getElementById("titleImg").src = e.target.result;
						break;
					case 2:
						document.getElementById("contentImg1").src = e.target.result;
						break;
					case 3:
						document.getElementById("contentImg2").src = e.target.result;
						break;
					case 4:
						document.getElementById("contentImg3").src = e.target.result;
						break;
					}
				}
			}
		}
		
		function inputFileValidityCheck(obj, num) {
			var pathPoint = obj.value.lastIndexOf('.');
			var filePoint = obj.value.substring(pathPoint + 1, obj.length);
			var fileType = filePoint.toLowerCase();
			
			if (fileType == 'jpg'
					|| fileType == 'gif'
					|| fileType == 'png'
					|| fileType == 'jpeg'
					|| fileType == 'bmp') {
				// valid file extension
				loadImg(obj, num);	// call the image preview function
			} else {
				// invalid file extension
				alert('[Error] 이미지 파일(jpg, gif, png, jpeg, bmp)만 업로드할 수 있습니다!');
				var parentObj = obj.parentNode;
				var node = parentObj.replaceChild(obj.cloneNode(true), obj);
				
				return false;
			}
			
			if (fileType == 'bmp') {
				var upload = confirm('bmp 파일은 Web 상에서 사용하기에 적절한 이미지 포맷이 아닙니다.\n그래도 해당 파일을 사용하시겠습니까?');
				if (!upload) {
					return false;
				}
			}
		}
	</script>
</body>
</html>