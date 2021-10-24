<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resource/css/board.css">
    <style>
      .accordion-body{
        background-color: #E0EEF7;
      }
    </style>
      <title>클릭미 FAQ페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
    <div class="hi">
        <section>
        	<article style="background-color: #FEE9DF;">
			  <h1 align="center" style="margin-top: 30px; background-color: rgba( 255, 255, 255, 0.5 );">클릭미 FAQ</h1>
			  <div align="left" style="margin-top: 20px;">
			      <div class="accordion accordion-flush" id="FaQAccordion">
			        <div class="accordion-item">
			          <h2 class="accordion-header" id="FaQAccordionHead01">
			            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse01" aria-expanded="false" aria-controls="FaQAccordionCollapse01">
			            Q . 회원가입은 어떻게 하나요?
			            </button>
			          </h2>
			          <div id="FaQAccordionCollapse01" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead01" data-bs-parent="#FaQAccordion">
			            <div class="accordion-body">
			            오른쪽 위 회원 가입페이지에서 회원가입을 신청해주세요.<br>
			            쉽고 빠르게 가입가능합니다.
			            </div>
			          </div>
			        </div>
			        <div class="accordion-item">
			          <h2 class="accordion-header" id="FaQAccordionHead02">
			            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse02" aria-expanded="false" aria-controls="FaQAccordionCollapse02">
			            Q . 비밀번호를 잊어버렸어요 
			            </button>
			          </h2>
			          <div id="FaQAccordionCollapse02" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead02" data-bs-parent="#FaQAccordion">
			            <div class="accordion-body">
			            가입하신 이메일로 초기화된 비밀번호를 보내드립니다.
			            </div>
			          </div>
			        </div>
			        <div class="accordion-item">
			          <h2 class="accordion-header" id="FaQAccordionHead03">
			            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse03" aria-expanded="false" aria-controls="FaQAccordionCollapse03">
			            Q . 회원정보를 수정하고 싶어요
			            </button>
			          </h2>
			          <div id="FaQAccordionCollapse03" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead03" data-bs-parent="#FaQAccordion">
			            <div class="accordion-body">
			            고객님의 로그인 정보로 접속하신 후 마이페이지나 오른쪽위 정보수정에서 수정이 가능합니다.
			            </div>
			          </div>
			        </div>
			        <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead04">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse04" aria-expanded="false" aria-controls="FaQAccordionCollapse04">
			            Q . 회원 탈퇴하고 싶어요
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse04" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead04" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                회원 탈퇴를 원하시면 회원전문 고객센터로 연락주시기 바랍니다.<br>
			                ※ 고객센터 : 555-1111-2222
			              </div>
			            </div>
			          </div>
			          <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead05">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse05" aria-expanded="false" aria-controls="FaQAccordionCollapse05">
			            Q . 개인정보 열람 및 오류를 정정하고 싶어요.
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse05" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead05" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                개인정보 열람 또는 오류 정정이 필요한 경우 아래의 경로를 통해 문의 접수를 부탁드립니다.<br>
			                접수 시 아래 첨부된 서식을 작성 후 함께 전달 주시면 더욱 빠른 처리가 가능합니다.<br>
			                - 1:1 문의 : MY > 고객센터 > 1:1 문의<br>
			                - 전화 상담 : 555-1111-2222
			            </div>
			            </div>
			          </div>
			          <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead06">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse06" aria-expanded="false" aria-controls="FaQAccordionCollapse06">
			            Q . 법인으로 가입 가능한가요?
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse06" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead06" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                법인회원으로는 가입이 불가하며, 개인회원으로만 가입이 가능합니다.
			            </div>
			            </div>
			          </div>
			          <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead07">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse07" aria-expanded="false" aria-controls="FaQAccordionCollapse07">
			            Q . 비밀번호 초기화를 했는데 비밀번호가 오지 않아요.
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse07" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead07" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                메일로 비밀번호를 지속적으로 받지 못하시는 경우, 스팸메일함을 확인해 주세요.<br>
			                확인되지 않는다면 나이스 고객센터로 문의를 부탁드립니다.
			            </div>
			            </div>
			          </div>
			          <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead08">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse08" aria-expanded="false" aria-controls="FaQAccordionCollapse08">
			            Q . 외국 국적도 회원가입을 할 수 있나요?
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse08" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead08" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                클릭미는 국적에 상관없이 누구나 가입 가능합니다
			            </div>
			            </div>
			          </div>
			          <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead09">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse09" aria-expanded="false" aria-controls="FaQAccordionCollapse09">
			            Q . 블랙리스트를 해제하고 싶어요
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse09" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead09" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                해제를 원하시면 회원전문 고객센터로 연락주시기 바랍니다.<br>
			                ※ 고객센터 : 555-1111-2222
			            </div>
			            </div>
			          </div>
			          <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead10">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse10" aria-expanded="false" aria-controls="FaQAccordionCollapse10">
			            Q . 이메일을 변경하고 싶어요
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse10" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead10" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                이메일 변경을 원하시면 회원전문 고객센터로 연락주시기 바랍니다.<br>
			                ※ 고객센터 : 555-1111-2222
			                </div>
			            </div>
			          </div>
			          <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead11">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse11" aria-expanded="false" aria-controls="FaQAccordionCollapse11">
			            Q . 감정서비스가 무엇인가요?
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse11" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead11" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                제품의 정품확인을 위하여 신청하시면 감정후 확인서를 발급하실 수 있는 서비스 입니다.
			            </div>
			            </div>
			          </div>
			          <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead12">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse12" aria-expanded="false" aria-controls="FaQAccordionCollapse12">
			                Q . 판매금지 물품이 있나요?
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse12" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead12" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                가품∙이미테이션 (상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품)등은 판매 불가능 합니다.
			            </div>
			            </div>
			          </div>
			          <div class="accordion-item">
			            <h2 class="accordion-header" id="FaQAccordionHead13">
			              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#FaQAccordionCollapse13" aria-expanded="false" aria-controls="FaQAccordionCollapse13">
			            Q &#46; 거래 상대방이 거래 약속을 안 지켰어요! 어떻게 해야 하나요?
			              </button>
			            </h2>
			            <div id="FaQAccordionCollapse13" class="accordion-collapse collapse" aria-labelledby="FaQAccordionHead13" data-bs-parent="#FaQAccordion">
			              <div class="accordion-body">
			                  즉시 고객센터로 신고 부탁드립니다.<br>
			                ※ 고객센터 : 555-1111-2222
			            </div>
			            </div>
			          </div>
			      </div>
			    </div>
		     </article>
	      </section>
       <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </div>		    
</body>
</html>