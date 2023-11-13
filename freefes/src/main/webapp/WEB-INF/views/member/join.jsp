<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<style>
/* 기본 라디오 버튼 숨기기 */
input[type="radio"].join_gender_ch {
	display: none;
}

/* 커스텀 라디오 버튼 디자인 */
input[type="radio"].join_gender_ch+label {
	position: relative;
	padding-left: 35px;
	cursor: pointer;
	display: inline-block;
	line-height: 25px;
	color: #666;
	margin-right: 15px;
}

/* 라벨 내의 원형 모양 디자인 */
input[type="radio"].join_gender_ch+label:before {
	content: "";
	position: absolute;
	left: 0;
	top: 0;
	width: 15px;
	height: 15px;
	border: 2px solid #007BFF;
	border-radius: 50%;
	background-color: #F3F4F6;
	transition: background-color 0.3s;
}

/* 선택 시 라디오 버튼 채우기 */
input[type="radio"].join_gender_ch:checked+label:before {
	background-color: #007BFF;
}

/* 선택 시 라벨 텍스트 색상 변경 */
input[type="radio"].join_gender_ch:checked+label {
	color: #007BFF;
}

select.verify1, select.verify2 {
	padding: 10px 15px;
	font-size: 13px;
	border: 1px solid #ccc;
	border-radius: 5px;
	color: #333;
	cursor: pointer;
	width: 100%;
}

.verify1_join_allmost, .verify2_join_allmost {
	width: 500px; /* 이 값을 조절하여 select의 너비를 조절 */
}

#passCheckMessage {
	color: red;
	font-size: 12px;
	margin-top: 5px;
}
.join_wrap {
	max-width: 600px;
	margin: 50px auto;
	padding: 40px;
	background-color: #ffffff;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.logo h1 {
	text-align: center;
	color: #333;
	margin-bottom: 30px;
	font-weight: 600;
}

.join_list {
	margin-top: 20px;
}

.join_list>div {
	margin-bottom: 30px;
}

input[type="password"].join_userpw_text, input[type="date"].join_birth_date,
	select, input[type="email"] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

.btn, input[type="submit"].join_submit_btn, #nickNameCheckBtn, #emailBtn
	{
	background-color: #07277d;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 15px;
	cursor: pointer;
	transition: 0.3s;
}

.btn-info {
	background-color: #07277d;
}

.btn:hover, input[type="submit"].join_submit_btn:hover,
	#nickNameCheckBtn:hover, #emailBtn:hover {
	background-color: #07277d;
}

input[type="submit"].join_submit_btn {
	background-color: #2ecc71;
	width: 100%;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 12px 0;
	cursor: pointer;
	font-size: 16px;
}

span {
	color: #e74c3c;
	font-size: 12px;
}

/* 추가 스타일 */
.box {
	margin-top: 5px;
	margin-right: 5px;
}

.logo h1 {
	text-align: center;
	color: #333;
	margin-bottom: 30px;
	font-weight: 600;
}

/* Adjustments for input fields */
input[type="email"], input[type="password"].join_userpw_text {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

input[type="text"].join_userid_text, input[type="password"].join_userpw_text,
	input[type="text"].join_name_text, input[type="date"].join_birth_date,
	input[type="text"].join_nickname_text, input[type="text"].join_phonenumber,
	input[type="text"].join_answer1, input[type="text"].join_answer2 {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
	width: 570px;
}

/* Adjustments for buttons */
.btn, input[type="submit"].join_submit_btn, #nickNameCheckBtn, #emailBtn
	{
	background-color: #07277d;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 15px;
	cursor: pointer;
	transition: 0.3s;
}

.nicknameBox {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.nickname {
	border: 1px solid blue;
}

.addressBox {
	width: 400px; /* 상자의 너비 설정. 필요한 크기로 조절 가능 */
	margin: 20px auto; /* 상자를 페이지의 중앙에 위치시키기 */
	border: 1px solid #ccc; /* 상자 주위에 경계선 추가 */
	padding: 20px; /* 내부 패딩 설정 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 상자에 약간의 그림자 추가 */
}

.addressBox div {
	margin-bottom: 10px; /* 각 div 사이의 간격 */
}

.form-control {
	width: 100%; /* 입력 필드의 너비 설정 */
	padding: 10px; /* 입력 필드의 패딩 설정 */
	border: 1px solid #ccc; /* 입력 필드의 경계선 */
	border-radius: 4px; /* 입력 필드 모서리 둥글게 */
	box-sizing: border-box; /* 패딩과 경계가 너비에 포함되도록 설정 */
}

.btn-info {
	background-color: #007bff; /* 버튼 배경색 */
	color: white; /* 버튼 텍스트 색 */
	padding: 10px 20px; /* 버튼 내부 패딩 */
	border: none; /* 경계 제거 */
	border-radius: 4px; /* 모서리 둥글게 */
	cursor: pointer; /* 마우스 오버 시 손가락 모양 표시 */
	transition: background-color 0.3s; /* 배경색 트랜지션 효과 */
}

.btn-info:hover {
	background-color: #0056b3; /* 마우스 오버 시 버튼 배경색 */
}

.email {
	align-items: center;
	width: 100%;
}

input[type="text"].email_front, input[type="text"].email_back_input,
	input[type="text"].email_back_input {
	padding: 10px; /* 패딩 변경 */
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
	height: 38px; /* 전체 높이를 36px로 설정 */
	box-sizing: border-box; /* 패딩과 보더를 높이에 포함 */
}

select.email_back_input {
	padding: 10px 8px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 12px;
	width: 170px;
	height: 38px;
	box-sizing: border-box;
}

.email_back {
	display: flex;
}

.join_meail_Btn_mes {
	display: flex;
	justify-content: center; /* 버튼을 가로 중앙에 배치합니다. */
	margin: 4px;
}

.join_efront_eback {
	display: flex;
	justify-content: center;
	align-items: center; /* 세로 중앙 배치를 위한 속성 */
	text-align: center;
	width: 593px;
}

.email_front {
	justify-content: center;
	padding: 0px;
	justify-content: center;
}

.email_front, .gol, .email_back {
	flex: 1; /* flex-grow를 1로 설정하여 꽉 차게 만듭니다. */
}

#emailCheckMessage {
	display: block;
	text-align: center;
}

.verify1_select_all, .verify2_select_all {
	font-size: 13px;
	border: 1px solid #ccc;
	border-radius: 5px;
	color: #333;
	cursor: pointer;
	width: 100%;
}

.verify1 select, .verify2 select {
	font-size: 13px;
	border: 1px solid #ccc;
	border-radius: 5px;
	color: #333;
	cursor: pointer;
	width: 596px; /* Set the width to 100% for consistent width */
}

.verify1, .verify2 {
	width: 100%; /* Set the width to 100% for consistency */
}

.verify2_join_allmost, .verify1_join_allmost {
	margin-bottom: 33px;
}

.verify1_join_allmost {
	margin-top: 33px;
}

/* 기본 스타일링 */
.address_all_list {
	width: 400px;
	margin: 20px auto;
	border: 1px solid #e0e0e0;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.form-control {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

/* 제목 스타일링 */
.address_all_title, .address_detail_title, .address_postnumber_title {
	font-weight: bold;
	margin-bottom: 10px;
	color: #333;
}

/* 버튼 스타일링 */
.searchBtn {
	text-align: center;
}

.btn-info {
	background-color: #07277d;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 4px;
	transition: background-color 0.3s;
}

.btn-info:hover {
	background-color: #138496;
}
input[type="text"].email_front_input, input[type="text"].email_back_input_text, select.email_back_input_select{
	padding: 10px; /* 패딩 변경 */
	width: 200px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
	height: 38px; /* 전체 높이를 36px로 설정 */
	box-sizing: border-box; /* 패딩과 보더를 높이에 포함 */
}

</style>

<div class="join_wrap">
	<div class="logo">
		<h1>회원가입</h1>
	</div>
	<form method="POST" id="joinFrom">
		<div class="join_list">

			<div class="userid_div">
				<input type="text" name="userid" placeholder="아이디"
					class="join_userid_text" required> <br> <span
					id="dupMessage"></span>
			</div>

			<div class="password">
				<div class="password1">
					<input type="password" name="userpw" placeholder="비밀번호"
						class="join_userpw_text" required>
				</div>
				<div class="password2" id="passCheckMessage"></div>

			</div>

			<div class="name">
				<input type="text" name="name" placeholder="이름"
					class="join_name_text" required>
			</div>

			<div class="birth_all">
				<div class="birth_ko">생년월일&nbsp;</div>
				<div class="birth_eng">
					<input type="date" name="birth" class="join_birth_date" required>
				</div>
			</div>

			<div class="join_select_wm">
				<input type="radio" class="join_gender_ch" id="m" name="gender"
					value="m"><label for="m">남자</label> <input type="radio"
					class="join_gender_ch" id="w" name="gender" value="w"><label
					for="w">여자</label>
			</div>
			<div class="address_all_list">
				<div class="address_all_title">주소 전체</div>
				<div class="address_all">
					<input id="roadFullAddr" class='form-control' name="address">
				</div>

				<div>
					<input id="roadAddrPart1" class='form-control' type="hidden">
				</div>

				<div>
					<input id="engAddr" class='form-control' type="hidden">
				</div>
				<div>
					<input id="jibunAddr" class='form-control' type="hidden">
				</div>

				<div class="address_detail_title">고객입력 상세주소</div>
				<div class="address_detail">
					<input id="addrDetail" class='form-control'>
				</div>

				<div>
					<input id="siNm" class='form-control' type="hidden">
				</div>

				<div class="address_postnumber_title">우편번호</div>
				<div class="address_postnumber">
					<input id="zipNo" class='form-control'>
				</div>

				<div>
					<input id="admCd" class='form-control' type="hidden">
				</div>

				<div>
					<input id="rn" class='form-control' type="hidden">
				</div>

				<div>
					<input id="rnMgtSn" class='form-control' type="hidden">
				</div>

				<div>
					<input id="detBdNmList" class='form-control' type="hidden">
				</div>

				<div>
					<input id="bdMgtSn" class='form-control' type="hidden">
				</div>

				<div class="searchBtn">
					<input type="button" class='btn btn-info' value="주소검색"
						onclick="goPopup();">
				</div>
			</div>


			<!-- 사용하실 데이터는 오픈해주시면 됩니다. jusoCallBack 에러 방지용 -->
			<input type='hidden' id="bdNm" class='form-control'> <input
				type='hidden' id="bdKdcd" class='form-control'> <input
				type='hidden' id="sggNm" class='form-control'> <input
				type='hidden' id="roadAddrPart2" class='form-control'> <input
				type='hidden' id="liNm" class='form-control'> <input
				type='hidden' id="emdNm" class='form-control'> <input
				type='hidden' id="lnbrMnnm" class='form-control'> <input
				type='hidden' id="lnbrSlno" class='form-control'> <input
				type='hidden' id="udrtYn" class='form-control'> <input
				type='hidden' id="buldMnnm" class='form-control'> <input
				type='hidden' id="buldSlno" class='form-control'> <input
				type='hidden' id="mtYn" class='form-control'> <input
				type='hidden' id="emdNo" class='form-control'>
		</div>

		<div>
			<div class="nicknameBox">
				<input class="join_nickname_text" type="text" name="nickname"
					placeholder="닉네임" required> <input id="nickNameCheckBtn"
					type="button" class="btn-info" value="닉네임 중복확인">
			</div>
			<span id="nickCheckMessage"></span>
		</div>

		<div class="email_all">
			<div class="join_efront_eback">
				<div class="email_front_div">
					<input type="text" name="email_front" placeholder="E-Mail"
						class="email_front_input" required>
				</div>
				<div class="gol">@</div>
				<div class="email_back">
					<input type="text" class="email_back_input_text"
						name="email_back_input" id="email_back_input"> <select
						class="email_back_input_select" id="email_back_select"
						onchange="updateEmailInput()">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="kakao.com">kakao.com</option>
					</select>
				</div>
			</div>
			<div class="join_meail_Btn_mes">
				<input id="emailBtn" type="button" class="btn-info" value="사용가능 이메일">
			</div>
			<span id="emailCheckMessage"></span> <input type="hidden"
				name="email" id="full_email">
		</div>


		<div class="phonenumber">
			<input type="text" name="phonenumber" placeholder="전화번호"
				class="join_phonenumber" required>
		</div>
		<div class="verify1_join_allmost">
			<div class="verify1">
				<select name="verify1" class="verify1_select_all">
					<option value="당신의 출신 도시는 어디인가요?">당신의 출신 도시는 어디인가요?</option>
					<option value="당신의 가장 친한 친구의 이름은 무엇인가요?">당신의 가장 친한 친구의 이름은
						무엇인가요?</option>
					<option value="당신의 반려동물의 이름은 무엇인가요?">당신의 반려동물의 이름은 무엇인가요?</option>
					<option value="당신의 좋아하는 음식은 무엇인가요?">당신의 좋아하는 음식은 무엇인가요?</option>
					<option value="당신의 어릴 적 별명은 무엇인가요?">당신의 어릴 적 별명은 무엇인가요?</option>
				</select>
			</div>
			<input type="text" name="answer1" class="join_answer1"
				placeholder="답변1">
		</div>

		<div class="verify2_join_allmost">
			<div class="verify2">
				<select name="verify2" class="verify2" class="verify2_select_all">
					<option value="가장 기억에 남는 여행지는 어디인가요?">가장 기억에 남는 여행지는
						어디인가요?</option>
					<option value="당신의 최애 도서나 영화는 무엇인가요?">당신의 최애 도서나 영화는
						무엇인가요?</option>
					<option value="당신의 첫사랑 이름은 무엇인가요?">당신의 첫사랑 이름은 무엇인가요?</option>
					<option value="가장 기억에 남는 선물은 무엇인가요?">가장 기억에 남는 선물은 무엇인가요?</option>
					<option value="가장 기억에 남는 학창 시절의 순간은 무엇인가요?">가장 기억에 남는 학창
						시절의 순간은 무엇인가요?</option>
				</select>
			</div>
			<div class="answer2">
				<input type="text" name="answer2" class="join_answer2"
					placeholder="답변2">
			</div>
		</div>
		<div>
			<input type="submit" class="join_submit_btn" value="가입신청">
		</div>
</div>
</form>
</div>

<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
// document.domain = "http://www.juso.go.kr/";

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr,jibunAddr,zipNo,admCd,rnMgtSn,bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	document.getElementById('roadFullAddr').value = roadFullAddr;
	document.getElementById('roadAddrPart1').value = roadAddrPart1;
	document.getElementById('addrDetail').value = addrDetail;
	document.getElementById('roadAddrPart2').value = roadAddrPart2;
	document.getElementById('engAddr').value = engAddr;
	document.getElementById('jibunAddr').value = jibunAddr;
	document.getElementById('zipNo').value = zipNo;
	document.getElementById('admCd').value = admCd;
	document.getElementById('rnMgtSn').value = rnMgtSn;
	document.getElementById('bdMgtSn').value = bdMgtSn;
	document.getElementById('detBdNmList').value = detBdNmList;
	//** 2017년 2월 제공항목 추가 **/
	document.getElementById('bdNm').value = bdNm;
	document.getElementById('bdKdcd').value = bdKdcd;
	document.getElementById('siNm').value = siNm;
	document.getElementById('sggNm').value = sggNm;
	document.getElementById('emdNm').value = emdNm;
	document.getElementById('liNm').value = liNm;
	document.getElementById('rn').value = rn;
	document.getElementById('udrtYn').value = udrtYn;
	document.getElementById('buldMnnm').value = buldMnnm;
	document.getElementById('buldSlno').value = buldSlno;
	document.getElementById('mtYn').value = mtYn;
	document.getElementById('lnbrMnnm').value = lnbrMnnm;
	document.getElementById('lnbrSlno').value = lnbrSlno;
	//** 2017년 3월 제공항목 추가 **/
	document.getElementById('emdNo').value = emdNo;
}
function goPopup(){
	var width=570;
	var height=420;
	var posx = 0
	var posy = 0
	posx = (screen.width - width)/2-1;
	posy = (screen.height - height)/2-1;
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	var pop = window.open("jusoPopup","pop","width=" + width + ",height="+height+", scrollbars=yes, resizable=yes"); 
	pop.moveTo(posx,posy);
	pop.focus();
}
</script>

<script>
    // 1. ID 중복 확인
    const dupMessage = document.getElementById('dupMessage');
    const userid = document.querySelector('input[name="userid"]');
    dupMessage.innerText = '중복확인';
    dupMessage.style.color = 'black';

    async function dupCheckHandler() {
        if (userid.value == '') {
            userid.focus();
            alert('먼저 사용할 ID를 입력해주세요');
            dupMessage.innerText = '중복확인';
            dupMessage.style.color = 'black';
            return;
        } else {
            const url = '${cpath}/dupCheck/' + userid.value;
            const count = await fetch(url).then(resp => resp.text());
            console.log(count);
            if (count == 0) {
                dupMessage.innerText = '사용 가능한 ID입니다';
                dupMessage.style.color = 'blue';
            } else {
                dupMessage.innerText = '이미 사용중인 ID입니다';
                dupMessage.style.color = 'red';
                userid.select();
                return;
            }
        }
    }
    userid.addEventListener('input', dupCheckHandler);

    // 2. 비밀번호 확인
    const passCheckMessage = document.getElementById('passCheckMessage');
    const userpw = document.querySelector('input[name="userpw"]');
    passCheckMessage.innerText = '비밀번호는 8자리 이하 20자리 이상이여야 하며 대소영문자와 특수문자가 포함되어야합니다.';
    passCheckMessage.style.color = 'black';

    async function passCheckHandler() {
        if (userpw.value == '') {
            passCheckMessage.innerText = '비밀번호는 8자리 이하 20자리 이상이여야 하며 대소영문자와 특수문자가 포함되어야합니다.';
            passCheckMessage.style.color = 'black';
            return;
        }
        const url = '${cpath}/passCheck/' + userpw.value;
        const count = await fetch(url).then(resp => resp.text());
        console.log(count);
        if (count == 0) {
            passCheckMessage.innerText = '대소영문자와 특수문자 숫자를 포함하지 않았습니다.';
            passCheckMessage.style.color = 'red';
            return;
        } else if (count == -1) {
            passCheckMessage.innerText = '8자리 이상 20자리 이하의 비밀번호여야 합니다.';
            passCheckMessage.style.color = 'red';
            return;
        } else {
            passCheckMessage.innerText = '비밀번호 사용 가능합니다.';
            passCheckMessage.style.color = 'blue';
        }
    }
    userpw.addEventListener('input', passCheckHandler);

    // 3. 닉네임 확인
    const nickNameCheckBtn = document.getElementById('nickNameCheckBtn');

    async function nickNameCheckHandler() {
        const nickCheckMessage = document.getElementById('nickCheckMessage');
        const nickname = document.querySelector('input[name="nickname"]');
        console.log(nickname);
        if (nickname.value == '') {
            nickCheckMessage.innerText = '빈칸을 채워 주세요';
            nickCheckMessage.style.color = 'red';
            return;
        }
        const url = '${cpath}/nicknNameCheck/' + nickname.value;
        const count = await fetch(url).then(resp => resp.text());
        console.log(count);
        if (count != 0) {
            nickCheckMessage.innerText = '닉네임이 중복됩니다!';
            nickCheckMessage.style.color = 'red';
            return;
        } else if (count == 0) {
            nickCheckMessage.innerText = '닉네임을 사용할 수 있습니다.';
            nickCheckMessage.style.color = 'blue';
        }
    }
    nickNameCheckBtn.addEventListener('click', nickNameCheckHandler);
    nickNameCheckBtn.addEventListener('mousedown', () => {
        nickNameCheckHandler();
    });

    // 4. 이메일 확인
   function updateFullEmail() {
    var emailFront = document.querySelector('.email_front_input').value;
    var emailBack = document.querySelector('.email_back_input_text').value;
    document.getElementById('full_email').value = emailFront + '@' + emailBack;
}

function updateEmailInput() {
    var selectedValue = document.getElementById('email_back_select').value;
    if (selectedValue) {
        document.getElementById('email_back_input').value = selectedValue;
    }
    updateFullEmail();
}

function submitForm() {
    updateFullEmail();
    alert('Email: ' + document.getElementById('full_email').value);
}

document.querySelector('.email_front_input').addEventListener('input', updateFullEmail);
document.querySelector('.email_back_input_text').addEventListener('input', updateFullEmail);

const emailBtn = document.getElementById('emailBtn');

async function emailCheckHandler() {
    const emailCheckMessage = document.getElementById('emailCheckMessage');
    const email_front = document.querySelector('.email_front_input').value;
    const email_back = document.querySelector('.email_back_input_text').value;

    const email = email_front + "@" + email_back;

    if (!email_front || !email_back) {
        emailCheckMessage.innerText = '빈칸을 채워 주세요';
        emailCheckMessage.style.color = 'red';
        return;
    } else {
        console.log('이메일 체크');
        const url = '${cpath}/emailCheck/' + email;
        const count = await fetch(url).then(resp => resp.text());

        if (count == 0) {
            emailCheckMessage.innerText = '이메일이 중복됩니다!';
            emailCheckMessage.style.color = 'red';
        } else {
            emailCheckMessage.innerText = '이메일을 사용할 수 있습니다.';
            emailCheckMessage.style.color = 'blue';
        }
    }
}

emailBtn.addEventListener('click', emailCheckHandler);
emailBtn.addEventListener('mousedown', () => {
    emailCheckHandler();
});

    // 5. 폼 제출 확인
    document.querySelector('form').addEventListener('submit', function (e) {
        const dupMsg = document.getElementById('dupMessage').innerText;
        const passMsg = document.getElementById('passCheckMessage').innerText;
        const nickMsg = document.getElementById('nickCheckMessage').innerText;
        const emailMsg = document.getElementById('emailCheckMessage').innerText;

        if (dupMsg === '이미 사용중인 ID입니다' ||
            passMsg === '대소영문자와 특수문자 숫자를 포함하지 않았습니다.' ||
            passMsg === '8자리 이상 20자리 이하의 비밀번호여야 합니다.' ||
            nickMsg === '닉네임이 중복됩니다!' ||
            emailMsg === '이메일이 중복됩니다!' ||
            emailMsg === '빈칸을 채워 주세요' ||
            nickMsg === '빈칸을 채워 주세요') {
            alert('입력하신 정보에 문제가 있습니다. 다시 확인해주세요.');
            e.preventDefault(); // 기본 동작 막기 (폼 제출 막기)
        }
    })
</script>

</body>
</html>