<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="resources/css/profile/profile__main.css" />
    <link rel="”stylesheet”" href="”icono.min.css”" />
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css" />
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-latest.js"
    ></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>
  <body>
  
  
    <jsp:include page="../common/mainMenu.jsp"/>
    
    
    
    <section class="visual__section">
      <div class="inner">
        <div class="visual__left">
          <div class="avatar">
            <img src="resources/assets/profile.png" alt="logo" />
          </div>
          <div>
            <div class="main__info">
              <input type="hidden" name="email" value="${pUser.email }" id="main-info-email" />
              <input type="hidden" name="uno" value="${pUser.userNo }" id="main-info-userno" />
              <strong>${ pUser.userName }</strong> <span>Apple.Inc</span>
              <span>Front-end Amazone AWS, github에 관심</span>
            </div>
            <ul class="people__info">
              <li>팔로잉 <strong>102</strong></li>
              <li>팔로워 <strong>502</strong></li>
              <li>연결 <strong>102</strong></li>
            </ul>
          </div>
        </div>
        <button id="popup_open_btn" class="btn visual__right">지원이력</button>
      </div>
    </section>

    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <ul>
            <li class="nav-active">PROFILE</li>
            <li>POST</li>
            <li onClick='location.href="list.bk?uno=${loginUser.userNo}"'>LIKE</a></li>
          </ul>
        </div>

        <div class="content__wrapper">
          <div class="section__content__title">
            <strong>한줄 소개</strong>
            <div onclick="oneLineToggle();" class="edit__field">
              <i id="one-line-btn" class="material-icons">create</i>
            </div>
          </div>
          <span class="just__text" id="one-line-info">
		
            		${pUser.userInfo}<br />

          </span>
          <div id="one-line-input" class="edit-disable">
            <textarea id="one-line-user-info"></textarea>
            <button type="button" onclick="sendUserInfo();" class="btn">등록</button>
          </div>
        </div>
        
        
        <div class="main__main__section">
          <div class="main__section__left">
            <div class="content__wrapper">
              <ul class="left__info">
                <li>TOP</li>
                <li>한줄 소개</li>
                <li>활동분야</li>
                <li>업무분야</li>
                <li>프로젝트</li>
                <li>학력</li>
                <li>인맥</li>
              </ul>
            </div>
          </div>
          <div class="main__section__right">
          
          
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>활동분야</strong>
                <div onclick="userFiledToggle();" class="edit__field">
                  <i class="material-icons" id="user-filed-btn">create</i>
                </div>
              </div>
              <ul  id="user-filed-list" class="section__content__box">
              
               		<c:forEach var="i" items="${skillList}" varStatus="status">
               			<li >
						<span class="compindus__box">${ i.skillName }</span>
						<i id="${i.skillName }" class="material-icons">close</i>
						</li>
	              	</c:forEach>
              </ul>
              <div id="user-filed-input" class="edit-disable">
              		<!-- 기술 검색  -->
	              	
	              	
	              	
	              	<input type="text" id="user-filed-search" />
	              
	              	<!-- 기술 관련 검색어 자리  -->
	              	<div id="user-filed-search-list">
					

					
	              	</div>
	              	
	              	<br />
	              	<!-- 기술 관련 검색어 입력 결과자리  -->
						<ul class="result_tag"></ul>
	              	
	              	<br />
					
					<button type="button" id="user-filed-final-btn" class="btn">등록</button>

              </div>
            </div>
            
            
            
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>업무분야</strong>
                <div onclick="positionToggle();" class="edit__field">
                  <i id="position-btn" class="material-icons">create</i>
                </div>
              </div>
              
              <span class="just__text" id="position-name"> 
				<c:choose>
					<c:when test="${pUser.userPosi eq '0' }">
						기획자
					</c:when>
					
					<c:when test="${pUser.userPosi eq '1' }">
						개발자
					</c:when>
					
					<c:when test="${pUser.userPosi eq '2' }">
						디자이너
					</c:when>
					
				</c:choose>		
              </span>
            	
	           <div id="position-input" class="edit-disable">
	           <!-- select 박스 크기 조정 하는방법 -->
	            <select id="position-num">
	            	<option value="0">기획자</option>
	            	<option value="1">개발자</option>
	            	<option value="2">디자이너</option>
	            
	            </select>
	            <button type="button" onclick="sendUserPosi();" class="btn">등록</button>
	          </div>
	          
            </div>
            
            
            
            
			<div class="content__wrapper">

				<div class="section__content__title">

					<strong>프로젝트</strong>

					<div onclick="projectToggle()" class="edit__field">
						<i id="project-btn" class="material-icons">create</i>
					</div>
					
				</div>
				<span class="just__text" id="project-name">
				  <div>
					<ul class="user__project__section">
					  <li>야후코리아 페쇄</li>
					  <li>백엔드</li>
					  <li>2020/01/01 ~ 2020/04/05</li>
					</ul> 
				  </div>
				</span>
				<div class="edit-disable" id="project-input">

				  <form action="update.project" method="post">
					
					  <span>프로젝트명 : </span>
					  <input type="text" name="projectName" placeholder="예) 야후코리아 폐쇄">
					  <br>
					  <br>
					 
					  <span>주요업무 : </span> 
					  <input type="text" name="pPosition" placeholder=" 주요업무를 입력해주세요 예) Front-end"> 
					  <br>
					  <br>
					
					  <span>기간 : </span>
					  <input type="text" name="projectStart" placeholder="시작기간을 입력해주세요 예) 2020.01.01"> ~
					  <input type="text" name="projectEnd" placeholder="마친기간을 입력해주세요">
					  <br> <br><br>
						<div id="">
						  <button type="button" onclick="sendUserProject();" class="btn">등록</button>
						</div>
				   
				  </form>

				</div>

			</div>
			<div class="content__wrapper">
				<div class="section__content__title">
					<strong>최종학력</strong>
					<div onclick="threeLineToggle()" class="edit__field">
						<i id="one-line-btn" class="material-icons">create</i>
					</div>
				</div>
				<span class="just__text" id="three-line-edu">

					${loginUser.userEdu} </span>

				<div id="three-line-input" class="edit-disable">
					<textarea name="userEdu" id="three-line-user-edu"
						placeholder="예) 한국대학교 이순신학과 졸업"></textarea>
					<button type="button" class="btn" onclick="sendUserEdu();">등록</button>
				</div>

			</div>

			<div class="content__wrapper">
				<div class="section__content__title">
				  <strong>인맥</strong>
				</div>
				
				<div class="connection__section__wrapper">
  
					<div class="section__member section__connection">
						<div class="section__header">
						  <strong>팔로워</strong>
						</div>
  
						<!--팔로워 리스트-->
						
						<c:forEach var="follower" items="${pCon.get('followers')}">
						
							<form action="test.conn" method="post" class="submitNo" onclick="submit();">
								<input type="hidden" name="userNo" value="${follower.userNo}"/>
								<div class="content__profile">
									<img
									  class="circle"
									  src="${pageContext.request.contextPath}/${follower.userAvatar}"
										 alt="PROFILE"
									/>
									<div class="content__introduce">
									  <strong>${follower.userName}</strong>
									  <p>${follower.userComp}</p>
									</div>
								</div><!--content__profile-->
							</form>
						
						</c:forEach>
  
					 
					  
					</div><!--section__member-->
  
					<div class="section__member section__connection">
  
						<div class="section__header">
						  <strong>팔로잉</strong>
						</div>
		
						<!--팔로잉 리스트-->
						<c:forEach var="following" items="${pCon.get('followings')}">
						
							<form action="test.conn" method="post" class="submitNo" onclick="submit();">
								<input type="hidden" name="userNo" value="${following.userNo}"/>
							
								<div class="content__profile">
									<img
									  class="circle"
									  src="${pageContext.request.contextPath}/${following.userAvatar}"
									  alt="PROFILE"
									/>
									<div class="content__introduce">
									  <strong>${following.userName}</strong>
									  <p>${following.userComp}</p>
									</div>
								</div><!--content__profile-->
							</form>
						
						</c:forEach>
  
						
					
					</div><!--section__member-->
	  
					<div class="section__member section__connection">
	  
						<div class="section__header">
						  <strong>연결</strong>
						</div>
  
						<!--연결 리스트(자료구조 아님!)-->
						<c:forEach var="connection" items="${pCon.get('connections') }">
						
							<form action="test.conn" method="post" class="submitNo" onclick="submit();">
								<input type="hidden" name="userNo" value="${connection.userNo}"/>
								<div class="content__profile">
									<img
									  class="circle"
									  src="${pageContext.request.contextPath}/${connection.userAvatar}"
									  alt="PROFILE"
									/>
									<div class="content__introduce">
									  <strong>${connection.userName}</strong>
									  <p>${connection.userComp}</p>
									</div>
								</div><!--content__profile-->
							</form>
						
						</c:forEach>
					
					</div><!--section__member-->
  
  
				</div><!--connection__section__wrapper-->
				
  
				  <div class="section__more-member">
					  
					  <button id="moreBtn" class="btn visual__right" 
							  onclick="loadMore(${loginUser.userNo},${frPi.currentPage},${frPi.maxPage}
																	  ,${fgPi.currentPage},${fgPi.maxPage}
																	  ,${cnPi.currentPage},${cnPi.maxPage});">
						  MORE
					   </button>
					  
				  </div>
			  
			   
		  
  
			  </div><!--content__wrapper-->
  
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>경력</strong>
                <div class="edit__field">
                  <i id="edit__career" class="material-icons">create</i>
                </div>
              </div>
              <span class="just__text">
                구글코리아 2002 ~ 2006 프론트엔드 엔지니어<br />
                야후코리아 2006 ~ 2009 프론트엔드 엔지니어
              </span>
            </div>
          </div>
        </div>
      </div>

    </main>
	<jsp:include page="../common/footer.jsp" />
	<script defer>


		//팔로워,팔로잉,연결 모두 현재페이지가 마지막 페이지면 more버튼 비활성화.
		if(    ${frPi.currentPage}==${frPi.maxPage}
				&& ${fgPi.currentPage}==${fgPi.maxPage}
		&& ${cnPi.currentPage}==${cnPi.maxPage}){

			let moreBtn = document.querySelector('#moreBtn');
			moreBtn.setAttribute('disabled',true);

		}

		//리스트 로드 중지 플래그
		let stopFrLoad = false;
		let stopFgLoad = false;
		let stopCnLoad = false;

		//리스트 추가해주는 메소드
		const loadList = (list,area)=>{
			list.forEach((v)=>{ //리스트의 각 요소 v에 대해

				//유저이미지나 회사 비어있는 경우 ''로 대체
				if(v.userAvatar==undefined) v.userAvatar='';
				if(v.userComp==undefined) v.userComp='';

				let profile ='<form action="test.conn" method="post" class="submitNo" onclick="submit();">'
						+'<input type="hidden" name="userNo" value="'+v.userNo+'"/>'
						+'<div class="content__profile">'
						+'<img'
						+' class="circle"'
						+' src="${pageContext.request.contextPath}/'+v.userAvatar+'"'
						+' alt="PROFILE"'+'/>'
						+'<div class="content_introduce">'
						+'<strong>'+v.userName+'</strong>'
						+'<p>'+v.userComp+'</p>'
						+'</div>'
						+'</div>'
						+'</form>';
				area.insertAdjacentHTML('beforeend',profile);
			});
		};

		//팔로워, 팔로잉, 연결 각각의 현재페이지가 마지막페이지면 리스트로드 중지플래그 활성화해주는 메소드
		const comparePage = (pCon)=>{

			if(pCon.data.piBox[0].currentPage==pCon.data.piBox[0].maxPage){//follower
				stopFrLoad=true;
			}
			if(pCon.data.piBox[1].currentPage==pCon.data.piBox[1].maxPage){//following
				stopFgLoad=true;
			}
			if(pCon.data.piBox[2].currentPage==pCon.data.piBox[2].maxPage){//connection
				stopCnLoad=true;
			}

		};


		//more버튼 속성 변경 메소드
		const changeMoreBtn=(pCon)=>{

			//팔로워,팔로잉,연결 모두 현재페이지가 마지막 페이지면 more버튼 비활성화.
			if(    stopFrLoad==true
					&& stopFgLoad==true
					&& stopCnLoad==true){
				let moreBtn = document.querySelector('#moreBtn');
				moreBtn.setAttribute('disabled',true);
			}else{
				//버튼이 비활성화되어있지 않으면 세팅
				document.querySelector('#moreBtn').setAttribute('onclick',
						'loadMore('+${loginUser.userNo}+','
				+pCon.data.piBox[0].currentPage+','//follower
				+pCon.data.piBox[0].maxPage+','
				+pCon.data.piBox[1].currentPage+','//following
				+pCon.data.piBox[1].maxPage+','
				+pCon.data.piBox[2].currentPage+','//connection
				+pCon.data.piBox[2].maxPage+')'
			);
			}
		}


		//***** Main Method *****
		//*이미 불러온페이지와 axios 후 방금 불러온 페이지에 따라 플래그 활성화,비활성화됨. 로직 헷갈릴 수 있다
		//more버튼 누를 때 실행되는 메소드
		const loadMore = function(userNo,frCp,frMp,fgCp,fgMp,cnCp,cnMp){


			//이미 불러온페이지가 마지막페이지가 아니면 다음페이지(현재페이지+1) 세팅
			//이미 불러온페이지가 마지막페이지면 stopLoad플래그 활성화 (안해주면 axios실행시 똑같은리스트 또불러올수있음)
			if(frCp<frMp){
				frCp++;//follower
			}else{
				stopFrLoad=true;
			}
			if(fgCp<fgMp){
				fgCp++;//following
			}else{
				stopFgLoad=true;
			}
			if(cnCp<cnMp){
				cnCp++;//connection
			}else{
				stopCnLoad=true;
			}


			axios.get('loadConnection.us',{
				params:{//유저번호, 불러올 다음페이지 세팅
					userNo:userNo,
					frCp:frCp,
					fgCp:fgCp,
					cnCp:cnCp
				}
			})
					.then(function(pCon){

						console.log('loadMore통신 성공');


						//넘어온 팔로워,팔로잉,연결 리스트 추가해주자 (stopLoad false인 경우만)
						if(!stopFrLoad){
							const frList = pCon.data.followers;//리스트를 출력해줄 구역 Dom 가져오기
							let frArea = document.querySelector(".section__connection:first-child");//팔로워
							loadList(frList,frArea);
						}
						if(!stopFgLoad){
							const fgList = pCon.data.followings;
							let fgArea = document.querySelector(".section__connection:nth-child(2)");//팔로잉
							loadList(fgList,fgArea);
						}
						if(!stopCnLoad){
							const cnList = pCon.data.connections;
							let cnArea = document.querySelector(".section__connection:nth-child(3)");//연결
							loadList(cnList,cnArea);
						}

						//팔로잉,팔로워,연결 각각 방금 불러온 페이지가 마지막페이지면 stopLoad 활성화
						comparePage(pCon);

						//more버튼 속성 변경(stopLoad전부 활성화되어있으면 disabled)
						//하나라도 비활성화면 매개변수 세팅
						changeMoreBtn(pCon);


						console.log('loadMore통신 마무리!');
					})
					.catch(function (error){
						console.log(error);
					})
		};


		/* 한줄소개 업데이트 */
		function sendUserInfo(){

			const userInfo = document.querySelector("#one-line-user-info").value;
			const userNo = document.querySelector("#main-info-userno").value;
			const email = document.querySelector("#main-info-email").value;
			console.log(userNo);
			location.href ="update.us?userInfo=" + userInfo + "&userNo=" + Number(userNo) + "&email=" + email;

		}

		/* 업무분야 업데이트 */
		function sendUserPosi(){

			const userPosi = document.querySelector("#position-num").value;
			const userNo = document.querySelector("#main-info-userno").value;
			const email = document.querySelector("#main-info-email").value;

			location.href ="update.position.us?userPosi=" + userPosi + "&userNo=" + userNo + "&email=" + email;

		}



		/* 한줄 소개 토글 */
		const oneLineToggle = () => {
			document
					.querySelector("#one-line-info")
					.classList.toggle("edit-disable");
			document
					.querySelector("#one-line-input")
					.classList.toggle("edit-disable");

			if (document.querySelector("#one-line-btn").innerText === "create") {
				document.querySelector("#one-line-btn").innerText = "close";
			} else {
				document.querySelector("#one-line-btn").innerText = "create";
			}
		};


		/* 포지션용 토글  */
		const positionToggle = () => {
			document
					.querySelector("#position-name")
					.classList.toggle("edit-disable");
			document
					.querySelector("#position-input")
					.classList.toggle("edit-disable");

			if (document.querySelector("#position-btn").innerText === "create") {
				document.querySelector("#position-btn").innerText = "close";
			} else {
				document.querySelector("#position-btn").innerText = "create";
			}
		};


		/*유저사용기술 토글 */
		const userFiledToggle = () => {
			document
					.querySelector("#user-filed-list")
					.classList.toggle("edit-disable");
			document
					.querySelector("#user-filed-input")
					.classList.toggle("edit-disable");

			if (document.querySelector("#user-filed-btn").innerText === "create") {
				document.querySelector("#user-filed-btn").innerText = "close";
			} else {
				document.querySelector("#user-filed-btn").innerText = "create";
			}
		};




		document.querySelector("#user-filed-search").addEventListener("keyup", () => {

			const skill = document.querySelector("#user-filed-search").value;
			console.log(skill);
			console.log(skill.length);

			if(skill.length>0)	{

				axios.get('search.sk', {
					params: {
						skillName: skill
					}
				})
						.then(function (response) {

							let searchResult = "";
							response.data.forEach(v=>{

								searchResult += "<span id='" + v.skillName + "'>" + v.skillName + "</span> <br>"

							})


							document.getElementById("user-filed-search-list").innerHTML = searchResult


						})
						.catch(function (error) {
							console.log(error);
						})
						.then(function () {
							// ...
						});

			}


		});


		/* 2. result tag에 버튼 만들어주기 */
		document.querySelector("#user-filed-search-list").addEventListener("click", function (e) {
			/* 검색결과리스트의 기술 이름 클릭시 기술이름 값 가져오기 */

			let tagName = e.target.innerText;

			createTag(tagName);



		})


		/* resultTag 생성용 함수 */
		let tagList = document.querySelector(".result_tag");
		let TagList = [];
		const TAG_LS = "tag";

		function filter(toDo) {
			return toDo.id === 1;
		}

		/* 태그 삭제용 함수 */
		function deleteTag(event) {
			const btn = event.target;
			const li = btn.parentNode;
			tagList.removeChild(li);

			const cleanTag = TagList.filter(function(toDo) {
				return toDo.id !== parseInt(li.id);
			});
			TagList = cleanTag;
			saveTag();
		}

		function saveTag() {
			localStorage.setItem(TAG_LS, JSON.stringify(TagList)); // 자바스크립트object를 string으로 변환
		}

		function handleSubmit(event) {

			document.querySelector(".result_tag").innerHTML= "";
		}


		/* 태그 생성용 함수 */
		function createTag(tagName) {
			const li = document.createElement("li");
			const delBtn = document.createElement("i");

			delBtn.innerText = "close";
			delBtn.className = "material-icons"

			const span = document.createElement("span");
			const newId = TagList.length + 1;
			span.innerText = tagName;
			li.appendChild(span);
			li.appendChild(delBtn);
			li.id = newId;

			delBtn.addEventListener("click", deleteTag);
			tagList.appendChild(li);

			const TagObj = {
				skillName : tagName,
				id: newId
			};

			TagList.push(TagObj);
			saveTag();

		}



		const loadSkills = ()=>{


			let userSkillList = "";

			TagList.forEach(s => {

				userSkillList += s.skillName +" "

			})


			axios.get('insert.field.us',{
				params:{
					skillName:userSkillList ,
					userNo : ${pUser.userNo}
				}
			})
					.then(function(response){

						console.log(response)

						let skillList = response.data

						/* 설정한 태그를 지워주는 함수 */


						/* 종료후 토글 바꿔주기 */
						document
								.querySelector("#user-filed-list")
								.classList.toggle("edit-disable");
						document
								.querySelector("#user-filed-input")
								.classList.toggle("edit-disable");


						if (document.querySelector("#user-filed-btn").innerText === "create") {
							document.querySelector("#user-filed-btn").innerText = "close";
						} else {
							document.querySelector("#user-filed-btn").innerText = "create";
						}

						/* 활동 분야에 값 넣어주기 */


					})
					.catch(function(error){
						console.log(error);

					})


		}

		document.querySelector("#user-filed-final-btn").addEventListener("click", (e) => {

			loadSkills();
			location.reload()
		})



		document.querySelector("#user-filed-list").addEventListener("click",function(e) {
			/* 삭제할 기술 이름 */
			console.log(e.target.id)
			let deleteSkill = e.target.id;

			/* 버튼 클릭시 html에서 사라지게 하기  */
			document.getElementById(deleteSkill).parentNode.remove();

			/* 백엔드로 삭제할 기술이름 넘겨주기 */

			axios.get("delete.field.us",{
				params:{
					skillName: deleteSkill,
					userNo : ${pUser.userNo}

				}
			})
					.then(function(response){

						console.log(response)
					})
					.catch(function(error){

						console.log(error);
					})


		})


		/* 최종학력 */

		function sendUserEdu() {

			const userEdu = document.querySelector("#three-line-user-edu").value;
			const userNo = document.querySelector("#main-info-userno").value;
			const email = document.querySelector("#main-info-email").value;

			location.href ="update.edu.us?userEdu=" + userEdu + "&userNo=" + userNo + "&email=" + email;

		}

		/*프로젝트 */

		function sendUserProject() {
			const projectName = document.querySelector("#projectName").value;
			const position = document.querySelector("#pPosition").value;
			const pStart = document.querySelector("projectStart").value;
			const pEnd = document.querySelector("projectEnd").value;
			location.href="insert.project.us?userProject=" + projectName + "&userNo" + userNo;

		}



		/*최종학력 아이콘 버튼용*/
		const threeLineToggle = () => {

			document
					.querySelector("#three-line-edu")
					.classList.toggle("edit-disable");

			document
					.querySelector("#three-line-input")
					.classList.toggle("edit-disable");

			if (document.querySelector("#one-line-btn").innerText === "create") {
				document.querySelector("#one-line-btn").innerText = "close";
			} else {
				document.querySelector("#one-line-btn").innerText = "create";
			}
		};

		/* 프로젝트 아이콘 버튼용*/

		const projectToggle = () => {
			document
					.querySelector("#project-name")
					.classList.toggle("edit-disable");

			document
					.querySelector("#project-input")
					.classList.toggle("edit-disable");

			if(document.querySelector("#project-btn").innerText === "create") {
				document.querySelector("#project-btn").innerText = "close"
			}else{
				document.querySelector("#project-btn").innerText = "create";
			}
		}






	</script>
  </body>
</html>
