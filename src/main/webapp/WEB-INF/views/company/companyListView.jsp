<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/company.css" />
  </head>
  <body>
  
  <jsp:include page="../common/mainMenu.jsp"/>
  	
  	<c:if test="${!empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
    <!-- 컨텐츠 -->
    <main class="content__section">
      <div class="inner">
        <div class="main__main__section">
          <div class="main__section__aside">
            <span>홈/ 기업</span>
            <button type="button" class="aside__btn-enrollcomp" onclick='location.href="enrollForm.co"'>기업 정보 등록</button>
            <button class="aside__btn-compinfo">기업 정보</button>
          </div>
          <div class="main__section__content">
            <div class="section__search-info">
              <strong>기업 정보 검색</strong>
              <div class="section__select-info">
                <select name="" id="">
                  <option value="">1~10명</option>
                  <option value="">11~100명</option>
                  <option value="">101~500명</option>
                  <option value="">501~1000명</option>
                  <option value="">1001~5000명</option>
                  <option value="">5000명 초과</option>
                </select>
                <select name="" id="">
                  <option value="">서울시</option>
                  <option value="">경기도</option>
                  <option value="">인천</option>
                </select>
                <select name="" id="">
                  <option value="">웹서비스</option>
                  <option value="">모바일</option>
                  <option value="">e-commerce</option>
                  <option value="">IoT</option>
                  <option value="">O2O</option>
                  <option value="">핀테크</option>
                </select>
              </div>
              <div class="section__search-btn">
                <button>서울특별시</button>
                <button>101~500명</button>
                <button>웹서비스</button>
              </div>
            </div>
            <div class="section__search-result">
              <div class="section__search-result-top">
                <span>검색결과 (${ fn:length(list) }개)</span>
                <div class="section__sort">
                  <a href="">최신순</a>
                  <a href="">인기순</a>
                </div>
              </div>
              
              <c:forEach var="c" items="${ list }">
             	 <div class="section__result__detail">
               		 <div class="logo">
                	  <img src="resources/assets/moomin.jpg" alt="logo" />
                 	 </div>
                 <div class="comp-info">
                  	<strong>${ c.compName }</strong>
                  	<span>${ c.compInfo }</span>
                  	<span class="comp-info-lo">${ c.compAddress }</span>
                 </div>
                  <div class="subscribe-btn">
                  	<button>구독</button>
                  </div>
              	</div>
              </c:forEach>
              
              
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
