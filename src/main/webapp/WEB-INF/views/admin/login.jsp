<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: #eef5ff;
	font-family: Arial, "Noto Sans KR", sans-serif;
}

h1 {
	margin: 0 0 25px;
	font-size: 30px;
	color: #1769d1;
	text-align: center;
}

.container {
	width: 420px;
	padding: 45px 40px;
	background-color: white;
	border-radius: 16px;
	box-shadow: 0 8px 25px rgba(0, 80, 180, 0.12);
}

.input-box {
	margin-bottom: 20px;
}

.input-box label {
	display: block;
	margin-bottom: 8px;
	font-size: 15px;
	font-weight: bold;
	color: #333;
}

.input-box input {
	width: 100%;
	height: 50px;
	padding: 0 15px;
	border: 1px solid #d5dce5;
	border-radius: 8px;
	font-size: 15px;
	outline: none;
}

.input-box input:focus {
	border: 2px solid #2878dc;
}

.login-btn {
	width: 100%;
	height: 52px;
	margin-top: 10px;
	border: none;
	border-radius: 8px;
	background-color: #1769d1;
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
}

.login-btn:hover {
	background-color: #0f57b5;
}

.footer {
	margin-top: 20px;
	text-align: center;
	font-size: 12px;
	color: #999;
}
</style>
</head>
<body>

	<h1>관리자 로그인</h1>

	<div class="container">

		<form action="/admin/login" method="post">

			<div class="input-box">
				<label for="adminId">관리자 아이디</label> <input type="text" id="adminId"
					name="admin_id" placeholder="관리자 아이디를 입력하세요.">
			</div>

			<div class="input-box">
				<label for="adminPw">비밀번호</label> <input type="password"
					id="adminPw" name="admin_pw" placeholder="비밀번호를 입력하세요.">
			</div>

			<button type="submit" class="login-btn">로그인</button>

		</form>

		<div class="footer">ADMINISTRATOR SYSTEM</div>

	</div>
	<c:if test="${loginError != null}">
		<script>
			alert("${loginError}");
			$("#adminId").val("");
			$("#adminPw").val("");
			$("#adminId").focus();
		</script>
	</c:if>
</body>
</html>