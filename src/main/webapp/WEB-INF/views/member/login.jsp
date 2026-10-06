<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - YA900</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body {
	margin: 0;
	background: linear-gradient(to bottom, #111936 0%, #111936 15%, #0b1026 25%, #171f46
		35%, #252f67 48%, #71809f 65%, #aeb7ca 76%, #d5dae5 86%, #eef1f8 94%,
		#eef1f8 100%);
	color: #18213f;
	font-family: Arial, sans-serif;
	min-height: 100vh;
}

.header {
	width: 100%;
	height: 100px;
	background: linear-gradient(135deg, #0b1026, #171f46);
	color: white;
	display: flex;
	align-items: center;
	padding: 0 50px;
	border-bottom: 1px solid #303b70;
	box-shadow: 0 3px 15px rgba(11, 16, 38, 0.18);
}

.logo {
	font-size: 30px;
	font-weight: bold;
	color: white;
	letter-spacing: 1px;
}

.login-container {
	width: 100%;
	min-height: calc(100vh - 170px);
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 70px 20px;
}

.login-box {
	width: 420px;
	padding: 40px;
	background: #ffffff;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 8px 25px rgba(17, 25, 54, 0.12);
}

.login-title {
	margin: 0 0 30px;
	text-align: center;
	font-size: 26px;
	font-weight: bold;
	color: #111936;
}

.login-input {
	width: 100%;
	height: 45px;
	padding: 0 12px;
	margin-bottom: 10px;
	border: 1px solid #c7cee0;
	border-radius: 6px;
	background: #ffffff;
	color: #18213f;
	font-size: 14px;
	outline: none;
	transition: 0.2s ease;
}

.login-input:focus {
	border-color: #476aaa;
	box-shadow: 0 0 0 2px rgba(71, 106, 170, 0.12);
}

.login-input::placeholder {
	color: #9aa3b7;
}

.login-option {
	margin: 10px 0 20px;
	font-size: 14px;
	color: #68718a;
}

.login-option input {
	margin-right: 5px;
	accent-color: #476aaa;
}

.login-btn {
	width: 100%;
	height: 45px;
	background: #111936;
	color: white;
	border: 1px solid #111936;
	border-radius: 6px;
	cursor: pointer;
	font-size: 15px;
	transition: 0.2s ease;
}

.login-btn:hover {
	background: #476aaa;
	border-color: #476aaa;
}

.login-links {
	margin-top: 22px;
	text-align: center;
	font-size: 13px;
	color: #c7cee0;
}

.login-links a {
	color: #68718a;
	text-decoration: none;
	margin: 0 8px;
	transition: 0.2s ease;
}

.login-links a:hover {
	color: #476aaa;
	text-decoration: underline;
}

.footer {
	width: 100%;
	height: 70px;
	background: #eef1f8;
	color: #838ec9;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 13px;
	border: none;
}
</style>
</head>

<body>

	<header class="header">
		<div class="logo">YA900</div>
	</header>


	<main class="login-container">

		<div class="login-box">

			<h2 class="login-title">로그인</h2>


			<form action="${pageContext.request.contextPath}/login" method="post">

				<input type="text" class="login-input" id="id" name="id"
					placeholder="아이디" required> <input type="password"
					class="login-input" id="pw" name="pw" placeholder="비밀번호" required>


				<div class="login-option">

					<label> <input type="checkbox"> 로그인 상태 유지
					</label>

				</div>


				<button type="submit" class="login-btn">로그인</button>

			</form>


			<div class="login-links">

				<a href="${pageContext.request.contextPath}/finduserid"> 아이디 찾기
				</a> | <a href="${pageContext.request.contextPath}/finduserpw"> 비밀번호
					찾기 </a> | <a href="${pageContext.request.contextPath}/signup"> 회원가입
				</a>

			</div>

		</div>

	</main>


	<footer class="footer"> 개인정보처리방침 | 전체 서비스 | 문제 신고 | 고객센터 </footer>

</body>
</html>