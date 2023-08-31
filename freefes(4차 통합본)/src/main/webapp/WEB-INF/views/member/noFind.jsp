<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<div>
    <p>이름과 이메일이 일치하지 않습니다.</p>
    <p>잠시 후 이전 페이지로 이동합니다...</p>
</div>

<%-- 자동으로 이전 페이지로 리다이렉트하는 스크립트 --%>
<script>
    setTimeout(function() {
        history.go(-1); // 뒤로 가기
    }, 3000); // 3초 후에 실행
</script>

</body>
</html>