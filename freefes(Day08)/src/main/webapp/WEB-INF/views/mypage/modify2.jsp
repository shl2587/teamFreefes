<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>


DTO : ${dto}
<div class="item">
	<img src="${login.profile_img }" width="200">
</div>


<form method="POST" enctype="multipart/form-data" action="${cpath }/upload_img">
	<p>
		<div class="img">
		</div>
		<input type="file" name="profile_img" multiple>
		<input type="submit" value="이미지 변경"> 
	</p>
</form>

<form method="POST" action="${cpath }/upload_pw">
	<p>
		<input type="password" name="userpw2" placeholder="비밀번호" >
		<span id="passCheckMessage"></span>
		<br>
<!-- 		<input type="password" name="userpw2" placeholder="비밀번호 확인" > -->
<!-- 		<span id="userpw2_Message"></span> -->
		<input type="submit" value="비밀번호 변경"> 
	</p>
</form>

<form method="POST" action="${cpath }/upload_nickname">
	<p>
		<input type="text" name="nickname" value="${login.nickname }" >
		<input type="submit" value="닉네임 변경"> 
	</p>
</form>

<form method="POST" action="${cpath }/upload_phonenumber">
	<p>
		<input type="text" name="phonenumber" placeholder="연락처 수정" >
		<input type="submit" value="연락처 변경"> 
	</p>
</form>

<form method="POST" action="${cpath }/upload_address">
	<p>
		<input type="text" name="address" placeholder="주소 변경" >
		<input type="submit" value="주소 변경"> 
	</p>
</form>

<script>
	const passCheckMessage = document.getElementById('passCheckMessage');
	const userpw2 = document.querySelector('input[name="userpw2"]')
	passCheckMessage.innerText = '비밀번호는 8자리 이하 20자리 이상이여야 하며 대소영문자와 특수문자가 포함되어야합니다.';
	passCheckMessage.style.color = 'black';
	
	async function passCheckHandler(){
		
		if(userpw2.value == ''){
			passCheckMessage.innerText = '비밀번호는 8자리 이하 20자리 이상이여야 하며 대소영문자와 특수문자가 포함되어야합니다.';
			passCheckMessage.style.color = 'black';
			return
		}
		const url = '${cpath}/passCheck/' + userpw2.value
		const count = await fetch(url).then(resp => resp.text())
		console.log(count)
		if(count == 0) {
			passCheckMessage.innerText = '대소영문자와 특수문자 숫자를 포함하지 않았습니다.'
			passCheckMessage.style.color = 'red'
		}
		else if(count == -1){
			passCheckMessage.innerText = '8자리 이상 20자리 이하의 비밀번호여야 합니다.'
			passCheckMessage.style.color = 'red'
		}
		else{	// count 값이 0이 아닌 값이 들어가기 때문에 실행이 되고 있음
			passCheckMessage.innerText = '비밀번호 사용 가능합니다.'
			passCheckMessage.style.color = 'blue'
		}
	}
	  // "input" 이벤트에 함수 연결
    userpw2.addEventListener('input', passCheckHandler);
	
</script>

</body>
</html>