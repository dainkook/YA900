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

/* =========================
   HEADER
========================= */
.header {
    width: 100%;
    min-height: 100px;
    height: auto;
    background: linear-gradient(135deg, #0b1026, #171f46);
    color: white;

    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 15px;

    padding: 15px clamp(15px, 4vw, 50px);

    position: sticky;
    top: 0;
    z-index: 1000;

    border-bottom: 1px solid #303b70;
    box-shadow: 0 3px 15px rgba(11, 16, 38, 0.18);
}

.logo {
    font-size: clamp(22px, 2.2vw, 30px);
    font-weight: bold;
    margin-right: clamp(10px, 3vw, 60px);
    color: white;
    letter-spacing: 1px;
    cursor: pointer;
    flex-shrink: 0;
}

.main-menu {
    height: 100%;
    display: flex;
    align-items: center;
    gap: clamp(12px, 3vw, 40px);
    flex-shrink: 1;
}

.menu-item {
    position: relative;
    height: 100%;
    display: flex;
    align-items: center;
}

.menu-item > a {
    font-size: clamp(14px, 1.4vw, 18px);
    font-weight: bold;
    text-decoration: none;
    color: #f7f8ff;
    padding: 10px 5px;
    white-space: nowrap;
    transition: color 0.2s ease;
}

.menu-item > a:hover {
    color: #aebee7;
}


/* =========================
   서브 메뉴
========================= */
.sub-menu {
	position: absolute;
	top: 100%;
	left: 50%;
	transform: translateX(-50%) translateY(-10px);
	width: 130px;
	background: #171f46;
	border: 1px solid #394575;
	display: flex;
	flex-direction: column;
	opacity: 0;
	visibility: hidden;
	transition: opacity 0.2s ease, transform 0.2s ease;
	box-shadow: 0 10px 25px rgba(8, 12, 30, 0.25);
}

.menu-item:hover .sub-menu {
	opacity: 1;
	visibility: visible;
	transform: translateX(-50%) translateY(0);
}

.sub-menu a {
	padding: 13px 15px;
	text-decoration: none;
	color: #f5f7ff;
	font-size: 14px;
	border-bottom: 1px solid #35406b;
}

.sub-menu a:last-child {
	border-bottom: none;
}

.sub-menu a:hover {
	background: #252f67;
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

	<div class="header">

		<div class="logo" onclick="location.href='/'">YA900</div>

		<!-- 메인 메뉴 -->
		<nav class="main-menu">

			<!-- 야구 -->
			<div class="menu-item">
				<a href="#">야구</a>

				<div class="sub-menu">
					<a href="${pageContext.request.contextPath}/#reservation">예매</a> 
					<a href="${pageContext.request.contextPath}/schedule/schedule">경기일정</a> 
					<a href="${pageContext.request.contextPath}/schedule/rankdetail">팀순위</a> 
					<a href="${pageContext.request.contextPath}/schedule/rankdetail?tab=pitcher">선수순위</a> 
					<a href="${pageContext.request.contextPath}/board/board?cpage=1">게시판</a>
				</div>
			</div>

			<!-- 축구 -->
			<div class="menu-item">
				<a href="#">축구</a>

				<div class="sub-menu">
					<a href="#">예매</a> 
					<a href="#">경기일정</a> 
					<a href="#">팀순위</a> 
					<a href="#">선수순위</a> 
					<a href="#">게시판</a>
				</div>
			</div>

			<!-- 미니게임 -->
			<div class="menu-item">
				<a href="#">미니게임</a>

				<div class="sub-menu">
					<a href="${pageContext.request.contextPath}/quiz">상식 퀴즈</a> 
					<a href="${pageContext.request.contextPath}/myteam">나만의 팀</a> 
					<a href="${pageContext.request.contextPath}/prediction">승부예측</a> 
				</div>
			</div>
		</nav>
	</div>


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