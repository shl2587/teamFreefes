<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage/mypage.jsp" %>
<style>
 /* 기본 스타일 */
body {
    font-family: Arial, sans-serif;
    background-color: #f6f8fa;
    margin: 0;
    padding: 0;
}

h1 {
    font-size: 32px;
    color: #333;
    text-align: center;
    border-bottom: 3px solid #007BFF;
    padding: 20px 0;
    margin-bottom: 30px;
    background-color: #f9f9f9;
}

pre {
    background-color: #fff;
    border: 1px solid #e1e4e8;
    border-radius: 4px;
    padding: 20px;
    font-size: 15px;
    line-height: 1.6;
    white-space: pre-wrap; /* pre 태그에서 줄바꿈을 반영하도록 설정 */
    margin: 20px;
}

p {
    text-align: center;
    margin-top: 30px;
    font-size: 16px;
}

button {
    background-color: #007BFF;
    color: #ffffff;
    border: none;
    border-radius: 4px;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    margin: 20px;
    display: block;
    width: 200px;
    text-align: center;
    margin-left: auto;
    margin-right: auto;
}

button:hover {
    background-color: #0056b3;
}

input[type="checkbox"] {
    margin-right: 10px;
}
    
</style>
<h1>탈퇴 안내</h1>
<pre>
회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.

사용하고 계신 아이디(${login.userid })는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.

탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.
회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.

메일	메일 계정 및 보관 중인 메일 삭제
VIBE	'좋아요'한 컨텐츠 유저 이용 기록 삭제
modoo!(모두)	등록된 홈페이지 및 게시물 삭제

탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.
올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
게시판형 서비스 중 "그라폴리오"의 댓글은 삭제됩니다.

freefes 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.
freefes 아이디로 로그인하여 사용 중이던 외부 사이트를 방문하여
다른 로그인 수단을 준비하거나, 데이터를 백업한 후 freefes 회원을 탈퇴해야 합니다.

freefes 아이디로 로그인을 통해 연동된 사이트 확인
탈퇴 후에는 아이디${login.userid } 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
또한, freefes 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.
</pre>

<p><input type="checkbox" name="log_bye_check">동의를 한다면 체크해주세요</p>

<button id="log_bye">회원탈퇴</button>

</body>
</html>

<script>
    const log_bye_check = document.querySelector('input[name="log_bye_check"]');
    const log_bye = document.getElementById('log_bye');

    // 초기상태에서 버튼 비활성화
    log_bye.disabled = true;

    log_bye_check.addEventListener('change', function() {
        if(this.checked) {
            log_bye.disabled = false;
        } else {
            log_bye.disabled = true;
        }
    })

    log_bye.addEventListener('click', function() {
        if(log_bye_check.checked) {
           window.location.href = "member_bye";
        }
    })
</script>
