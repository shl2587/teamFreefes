<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
.hidden {
		display: none;
	}
	
	#modal-overlay {
		width: 100%;
		height: 100%;
		position: fixed;
		background-color: rgba(0, 0, 0, 0.3);
		top: 0;
		left: 0;
		z-index: 1;
	}
	#modal-content {
		width: fit-content;
		height: fit-content;
		position: fixed;
		top: 50%;
		left: 50%;
		z-index: 2;
		transform: translate(-50%, -50%);
		box-shadow: 5px 5px 5px grey;
		border-radius: 10px;
		background-color: white;
	}
	#login-auth {
		width: 500px;
		height: 150px;
		text-align: center;
		
	}
	.center {
		display: flex;
		width: 80%;
		margin: auto;
		justify-content: space-around;
		align-items: center;
	}
	#loginInfo {
		text-align: right;
		padding-right: 20px;
		height: 30px;
		line-height: 30px;
	}
</style>

<h3>이메일로 찾기</h3>

<form method="POST">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="email" name="email" placeholder="E-mail" required></p>
	<p><input type="submit" value="전송"></p>
</form>

</body>
</html>