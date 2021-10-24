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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<c:if test="${ !empty requestScope.userModifyalert }"> 
<script>
	alert('${ requestScope.userModifyalert }');
	location.href="listPage"; 
</script>
 </c:if>
<title>관리자용 사용자 리스트 페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<div align="center" class="container">
		<h1 align="center"> 관리자용 사용자 리스트 페이지</h1>
		<div align="left">
		<div class="btn-group" role="group" aria-label="User ent button group">
		  <input type="radio" class="btn-check" name="userListEntCondition" id="btnradio1" autocomplete="off" value="all">
		  <label class="btn btn-outline-primary" for="btnradio1">🧑 전체회원</label>
		
		  <input type="radio" class="btn-check" name="userListEntCondition" id="btnradio2" autocomplete="off" value="active">
		  <label class="btn btn-outline-primary" for="btnradio2">👨‍🦲 활동회원</label>
		
		  <input type="radio" class="btn-check" name="userListEntCondition" id="btnradio3" autocomplete="off" value="blacked">
		  <label class="btn btn-outline-primary" for="btnradio3">😈블랙리스트</label>
		  
		  <input type="radio" class="btn-check" name="userListEntCondition" id="btnradio4" autocomplete="off" value="inactive">
		  <label class="btn btn-outline-primary" for="btnradio4">💤 휴면회원</label>
		  
		  <input type="radio" class="btn-check" name="userListEntCondition" id="btnradio5" autocomplete="off" value="withdraw">
		  <label class="btn btn-outline-primary" for="btnradio5">👤 탈퇴회원</label>
		</div>
		</div>
		<form action="${pageContext.servletContext.contextPath}/user/entModify" method="post" id="form1">
			<table class="table table-striped text-center" id="userTable">
			  <thead>
			    <tr>
			      <th scope="col">체크</th>
			      <th scope="col">코드</th>
			      <th scope="col">현재 상태</th>
			      <th scope="col" align=center>아이디</th>
			      <th scope="col">이메일</th>
			      <th scope="col">핸드폰</th>
			      <th scope="col">이름</th>
			      <th scope="col">생년월일</th>
			      <th scope="col">성별</th>
			      <th scope="col">예치금</th>
			      <th scope="col">최종로그인</th>
			      <th scope="col">가입일</th>
			    </tr>
			  </thead>

			  <tbody>
			      <c:forEach var="users" items="${ requestScope.userList }">
					<tr class="userListAdmin">
						<td>
							<div class="user-check">
							  <input class="form-check-input" type="checkbox" value="${ users.code }" name="userNum">
							  <label class="form-check-label" for="userflexCheck">
							  </label>
							</div>
						</td>
						<td class="usercode">${ users.code }</td>
						<td class="userEntCode">${ users.entCode }</td>
						<td class="userId table-primary" style="font-weight: bold; font-size: 150%; line-height: 1.0em;">${ users.id }</td>
						<td>${ users.email }</td>
						<td>${ users.phone }</td>
						<td>${ users.name }</td>
						<td>${ users.date }</td>
						<td>${ users.gender }</td>
						<td>${ users.deposit }</td>
						<td>${ users.lastLogin }</td>
						<td>${ users.enrollDate }</td>
					</tr>
				  </c:forEach>
			  </tbody>
			
		  </table>
		   </form>
		  <div id="entModifyButtons"  align="left">
		  회원 상태 변경<br>	  
		  <button class="btn btn-outline-primary mb-1" type="button" onclick="entCheckbox_check('1');">👨‍🦲 활동회원</button>
		  <button class="btn btn-outline-primary mb-1" type="button" onclick="entCheckbox_check('2');">😈 블랙리스트</button>
		  <br>
		  <button class="btn btn-outline-primary" type="button" onclick="entCheckbox_check('3');">💤 휴면회원</button>
		  <button class="btn btn-outline-primary" type="button" onclick="entCheckbox_check('4');">👤 일반탈퇴</button>
		  <button class="btn btn-outline-primary" type="button" onclick="entCheckbox_check('5');">👤 강제탈퇴</button>
		  </div>
			<!-- 페이징 처리를 위한 jsp를 include -->
		<jsp:include page="/WEB-INF/views/user/userListPagenation.jsp"/>
			<!-- 검색기능 -->
		<div class="input-group justify-content-center" align="center">
			<form id="searchInput" action="${ pageContext.servletContext.contextPath }/user/listPage" method="get" style="display:inline-block">
			<div class="input-group mb-3" align="center">		
			    <input type="hidden" name="currentPage" value="1">
			    <input type="hidden" name="userListEntCondition" value="${ requestScope.userPageList.userListEntCondition }">
			    <select id="searchUserCondition" class="form-select w-25" style=" width:110px !important;" name="searchUserCondition">
					<option value="" ${ requestScope.userPageList.searchUserCondition }>선택</option>
					<option value="code" ${ requestScope.userPageList.searchUserCondition eq "code"? "selected": "" }>회원코드</option>
					<option value="id" ${ requestScope.userPageList.searchUserCondition eq "id"? "selected": "" }>아이디</option>
					<option value="name" ${ requestScope.userPageList.searchUserCondition eq "name"? "selected": "" }>이름</option>
				</select>	
		        <input type="search" id="searchUserValue" class="form-control w-50" name="searchUserValue" style=" width:130px !important; height: 40px !important;" value="${ requestScope.userPageList.searchUserValue }">
				<button class="btn btn-dark" type="submit" style="margin-left: -10px">검색하기</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>

let userListMenu = document.getElementsByName('userListEntCondition');
let searchCon = "${ userPageList.searchUserCondition }";

function goPostForm() {
	if (!searchCon || this.value != "all" )
		{
		location.href="listPage?userListEntCondition="+ this.value +"&searchUserCondition=${ requestScope.userPageList.searchUserCondition}&searchUserValue=${ requestScope.userPageList.searchUserValue}&currentPage=1";
		} else {
			location.href= "listPage?userListEntCondition="+ this.value +"&currentPage=1"
		}

	}

// 선택한 요소에 click 이벤트 리스너를 등록함.

	userListMenu[0].addEventListener("click", goPostForm);

for(let i = 1 ; i < userListMenu.length; i ++ ){
	userListMenu[i].addEventListener("click", goPostForm);
}


for ( let i = 0 ; i < userListMenu.length; i ++ ){
	if (userListMenu[i].value == "${ requestScope.userPageList.userListEntCondition }")
		{
		userListMenu[i].checked = true;
		}
}

function entCheckbox_check(entCodeNum) {
	
        let entchecked = document.getElementsByName("userNum");
 		let ent_checker = false;
        for (let i = 0; i < entchecked.length; i++) {

         	if ( entchecked[i].checked == true ) {
         		console.log(i);
         		ent_checker = true;
        		}
        	}
        
        if (ent_checker){
         	let entModifyForm = document.forms['form1']; 

    		let entModifyinput   = document.createElement('input'); 
    		entModifyinput.type   = 'hidden'; 
    		entModifyinput.name  = 'entCode'; 
    		entModifyinput.value  = entCodeNum; 
    		entModifyForm.appendChild(entModifyinput); 
    	
    	 	entModifyForm.submit();
        	
        	
        } else { alert("수정할 사람을 체크해주세요!"); }
        
}

let userIdBar = document.getElementsByClassName('userId');
let userCodes = document.getElementsByName("userNum");

for ( let i = 0 ; i < userIdBar.length ; i++ ){
	
/* 	console.log(userIdBar[i]); */
	
	userIdBar[i].style.cursor = "pointer";
	userIdBar[i].addEventListener('click', function (){viewUserInfor(userCodes[i].value)});
	
} 


function viewUserInfor(num) {
	
	console.log(num);
	
    var viewUserInforForm = document.createElement('form');
    viewUserInforForm.name = 'newForm';
    viewUserInforForm.method = 'post';
    viewUserInforForm.action = '${pageContext.servletContext.contextPath}/user/statusPageAdmin';

	var userCodeinput = document.createElement('input');
	userCodeinput.setAttribute("type", "hidden");
	userCodeinput.setAttribute("name", "userNum");
	userCodeinput.setAttribute("value", num);


	viewUserInforForm.appendChild(userCodeinput);


	document.body.appendChild(viewUserInforForm);
	

	viewUserInforForm.submit();
}

window.onload = function () {

	let userEntCodeList = document.getElementsByClassName('userEntCode');
	
	let j = 0;
	
 	while( j < userEntCodeList.length)  {
		let x = userEntCodeList[j];
 		switch (x.innerText) {
		  case '1':
			x.innerText = "👨‍🦲";
		    break;
		  case '2':
			x.innerText = "😈";
		    break;
		  case '3':
			x.innerText = "💤";
		    break;
		  case '4':
			x.innerText = "👤";
		    break;
		  case '5':
			x.innerText = "👤 강제탈퇴";
		    break;
		} 
	  j++; 
	} 
	
}

</script>
</html>