<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LOGIN || NUKA-COLA</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
      integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
      crossorigin="anonymous"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/login.css" />
  </head>
  <body>
    <jsp:include page="../common/mainMenu.jsp" />

    <c:if test="${!empty alertMsg }">
      <script>
        alert("${alertMsg}");
      </script>
      <c:remove var="alertMsg" scope="session" />
    </c:if>

    <!-- 컨텐츠 -->
    <main>
      <div class="inner">
        <section class="section__login">
          <h1>
            당신의 파트너가 함께 하는&nbsp;곳 <br /><strong>누카콜라</strong
            >입니다.
          </h1>
          <form method="post" name="loginform">
            <div class="login__title">
              <h2>LOGIN</h2>
            </div>
            <div class="input__box">
              <label for="">이메일</label>
              <input type="text" name="email" />
            </div>
            <small class="forgot-email" id="find-email-btn"
              >이메일이 기억나지 않으세요?</small
            >
            <div class="input__box">
              <label for="">비밀번호</label>
              <input type="text" name="userPwd" />
            </div>
            <div class="login__btn__wrapper">
              <button type="button" id="find-pwd-btn" class="btn">
                비밀번호 찾기
              </button>
              <button
                class="btn btn-blue"
                onclick="javascript: form.action='login.me'"
              >
                로그인
              </button>
              <a 
               class="btn btn-facebook"
               href="javascript:void(0);"
               onclick="fbLoginAction();"
               >
			 </a>
              
              <a
                class="btn btn-katok"
                href="https://kauth.kakao.com/oauth/authorize?client_id=9cbaf3231e03e46ca8f9be8ce62f4866&redirect_uri=http://localhost:8888/nukacola/kakaologin.me&response_type=code"
              ></a>
            </div>
          </form>
        </section>
        <div class="section__banner">
          <div class="img__wrapper">
            <img src="resources/assets/loginImage.jpg" alt="" />
          </div>
          <ul class="login__nav">
            <li>
              <span>회원이신가요?</span>
              <b>LOGIN</b>
            </li>
            <li onClick='location.href="signupForm.me"'>
              <span>처음방문이신가요?</span>
              <b>SIGNUP</b>
            </li>
            <li onClick='location.href=""'>
              <span>돌러보기</span>
              <b>MORE</b>
            </li>
          </ul>
        </div>
      </div>
    </main>

    <!-- 이메일찾기 모달 -->
    <div id="find-email-modal" class="modal__wrapper">
      <div id="find-email-modal-box" class="modal__box">
        <h1 id="find-email-modal-title">이메일 찾기</h1>
        <form id="find-email-modal-form" class="modal__form">
          <div class="input__box">
            <label for="">이름</label>
            <input type="text" />
          </div>
          <div class="input__box">
            <label for="">생년월일</label>
            <input type="text" />
          </div>
          <div class="input__box">
            <label for="">본인확인 질문</label>
            <select name="are-u" id="">
              <option value="출신 초등학교 이름">출신초등학교 이름은?</option>
              <option value="어머니의 성함">어머니의 성함은?</option>
              <option value="나의 보물 1호">나의 보물 1호는?</option>
            </select>
          </div>
          <div class="input__box">
            <label for="">질문의 답</label>
            <input type="text" />
          </div>
          <div class="login__btn__wrapper">
            <button type="button" id="find-email-close" class="btn">
              닫기
            </button>
            <button type="button" class="btn btn-blue">찾기</button>
          </div>
        </form>
      </div>
    </div>

    <!-- 비밀번호 찾기 모달 -->
    <div id="find-pwd-modal" class="modal__wrapper">
      <div id="find-pwd-modal-box" class="modal__box">
        <h1 id="find-pwd-modal-title">비밀번호 찾기</h1>
        <form id="find-pwd-modal-form" class="modal__form">
          <div class="input__box">
            <label for="">이메일</label>
            <input type="text" />
          </div>
          <div class="input__box">
            <label for="">생년월일</label>
            <input type="text" />
          </div>
          <div class="input__box">
            <label for="">본인확인 질문</label>
            <select name="are-u">
              <option value="출신 초등학교 이름">출신초등학교 이름은?</option>
              <option value="어머니의 성함">어머니의 성함은?</option>
              <option value="나의 보물 1호">나의 보물 1호는?</option>
            </select>
          </div>
          <div class="input__box">
            <label for="">질문의 답</label>
            <input type="text" />
          </div>
          <div class="login__btn__wrapper">
            <button type="button" class="btn find-pwd-close">닫기</button>
            <button type="button" id="find-pwd-submit" class="btn btn-blue">
              찾기
            </button>
          </div>
        </form>
        <!-- 비번변경 -->
        <form id="edit-pwd-modal-form" class="modal__form">
          <div class="input__box">
            <label for="">비밀번호</label>
            <input id="password" type="text" />
          </div>
          <div class="input__box">
            <label for="">비밀번호 확인</label>
            <input id="password-check" type="text" />
          </div>
          <small id="alert_check_pwd" class="signup-check"
            >비밀번호를 확인해주세요</small
          >
          <div class="login__btn__wrapper">
            <button type="button" class="btn find-pwd-close">닫기</button>
            <button type="button" id="edit-pwd-submit" class="btn btn-blue">
              변경
            </button>
          </div>
        </form>
      </div>
    </div>

    <script defer>
      // 이메일모달오픈
      document
        .querySelector("#find-email-btn")
        .addEventListener("click", () => {
          document
            .querySelector("#find-email-modal")
            .classList.toggle("modal-active");
        });
      // 이메일모달닫기
      document
        .querySelector("#find-email-close")
        .addEventListener("click", () => {
          document.querySelector("#find-email-modal").style.animation =
            "modalFadeOut 0.3s ease-in-out forwards";
          document.querySelector("#find-email-modal-box").style.animation =
            "modalSlideClose 0.3s ease-in-out forwards";
          setTimeout(() => {
            document
              .querySelector("#find-email-modal")
              .classList.toggle("modal-active");

            document.querySelector("#find-email-modal").style.animation =
              "modalFadeIn 0.3s ease-in-out forwards";

            document.querySelector("#find-email-modal-box").style.animation =
              "modalSlideOpen 0.3s ease-in-out forwards";
          }, 300);
        });

      // 비번모달오픈
      document.querySelector("#find-pwd-btn").addEventListener("click", () => {
        document
          .querySelector("#find-pwd-modal")
          .classList.toggle("modal-active");
      });
      // 비번모달닫기
      document.querySelectorAll(".find-pwd-close").forEach((v) => {
        v.addEventListener("click", () => {
          document.querySelector("#find-pwd-modal").style.animation =
            "modalFadeOut 0.3s ease-in-out forwards";
          document.querySelector("#find-pwd-modal-box").style.animation =
            "modalSlideClose 0.3s ease-in-out forwards";
          setTimeout(() => {
            document
              .querySelector("#find-pwd-modal")
              .classList.toggle("modal-active");

            document.querySelector("#find-pwd-modal").style.animation =
              "modalFadeIn 0.3s ease-in-out forwards";

            document.querySelector("#find-pwd-modal-box").style.animation =
              "modalSlideOpen 0.3s ease-in-out forwards";
          }, 300);
        });
      });

      //비밀번호 찾기
      document
        .querySelector("#find-pwd-submit")
        .addEventListener("click", () => {
          //로직추가
          document.querySelector("#find-pwd-modal-title").innerText =
            "비밀번호 변경";
          document.querySelector("#find-pwd-modal-form").style.display = "none";
          document.querySelector("#edit-pwd-modal-form").style.display =
            "initial";
        });
      // 비밀번호확인 체크
      document
        .querySelector("#password-check")
        .addEventListener("input", (e) => {
          if (document.querySelector("#password").value !== e.target.value) {
            document.querySelector("#alert_check_pwd").style.display = "block";
            console.log(document.querySelector("#password").value);
          } else {
            document.querySelector("#alert_check_pwd").style.display = "none";
          }
        });
      
      // 페이스북
      
      	 (function(d, s, id){
		     var js, fjs = d.getElementsByTagName(s)[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement(s); js.id = id;
		     js.src = "//connect.facebook.net/en_US/sdk.js";
		     fjs.parentNode.insertBefore(js, fjs);
		   }(document, 'script', 'facebook-jssdk'));
      
		  window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '730629367865439',
		      cookie     : true,
		      xfbml      : true,
		      version    : 'v9.0'
		    });
		  

		  FB.getLoginStatus(function(response) {
			  
				console.log('statusChangeCallback');
				console.log(response);
				
				if(response.status === 'connected') {
					$("#result").append("status : connected");	
				}else{
					$("#result").append(response);
				}
		  	});
		  };
  
		  function fbLoginAction() {
			  FB.login(function(response) {
				  var fbname;
			  	  var accessToken = response.authResponse.accessToken;
			  	  FB.api('/me?fields=id,name,age_range,birthday,gender,email', function(response){
			  		  var fb_data = jQuery.parseJSON(JSON.stringify(response));
			  		  var data = "<br/>fb_id : " + fb_data.id;
			  		  data += "<br/>email : " + fb_data.email;
			  		  data += "<br/>name : " + fb_data.name;
			  		  
			  		  $("#result").append(data);
			  		  
			  	  });
			  
			  }, {scope: 'public_profile, email'});
			  	  
		  }


    </script>
  </body>
</html>
