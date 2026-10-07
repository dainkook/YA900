<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

html, body {
	height: 100%;
}

body {
	margin: 0;
	display: flex;
	flex-direction: column;
	background: #fff;
	color: #222;
	font-family: 'Noto Sans KR', system-ui, sans-serif;
	font-size: 13px;
}

/* 공통 */
.box {
	border: 1px solid #cfcfcf;
	padding: 24px 28px;
	min-width: 0;
}

.row {
	display: flex;
	flex-wrap: wrap;
	gap: 16px;
}

h1 {
	margin: 0;
	font-size: 18px;
}

h2 {
	margin: 0 0 20px;
	font-size: 16px;
	text-align: center;
}

.btn {
	min-height: 44px;
	padding: 0 40px;
	border: 1px solid #777;
	background: #fff;
	color: #222;
	font: inherit;
	cursor: pointer;
}

/* 사이트 헤더 */

.header {
	width: 100%;
	height: 100px;
	min-height: 100px;
	flex-shrink: 0;
	background: linear-gradient(135deg, #0b1026, #171f46);
	color: white;
	display: flex;
	align-items: center;
	padding: 0 50px;
	position: sticky;
	top: 0;
	z-index: 1000;
	border-bottom: 1px solid #303b70;
	box-shadow: 0 3px 15px rgba(11, 16, 38, 0.18);
}

.logo {
	font-size: 30px;
	font-weight: bold;
	margin-right: 60px;
	color: white;
	letter-spacing: 1px;
}
.header>.logo:hover {
	cursor:pointer;
}
.main-menu {
	height: 100%;
	display: flex;
	align-items: center;
	gap: 40px;
}

.menu-item {
	position: relative;
	height: 100%;
	display: flex;
	align-items: center;
}

.menu-item>a {
	font-size: 18px;
	font-weight: bold;
	text-decoration: none;
	color: #f7f8ff;
	padding: 10px 5px;
	transition: color 0.2s ease;
}

.menu-item>a:hover {
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

/* =========================
   로그인 / 회원가입
========================= */
.member-menu {
	font-size: 14px;
	margin-left: auto;
}

.login-btn, .sign-btn {
	border: 1px solid #7180b1;
	background: transparent;
	color: white;
	border-radius: 5px;
	transition: 0.2s ease;
}

.login-btn:hover, .sign-btn:hover {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

.user-menu {
	margin-left: auto;
	display: flex;
	gap: 8px;
}

.user-menu button {
	background: transparent;
	border: 1px solid #7180b1;
	border-radius: 5px;
	padding: 8px 15px;
	color: white;
	cursor: pointer;
	transition: 0.2s ease;
}

.user-menu button:hover {
	background: #476aaa;
	border-color: #476aaa;
}

/* 본문 */
.wrap {
	flex: 1 0 auto;
	width: 100%;
	max-width: 992px;
	margin: 0 auto;
	padding: 108px 16px 40px;
	display: flex;
	flex-direction: column;
	gap: 16px;
}

.quiz-start {
	flex: 7 1 480px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	gap: 12px;
	text-align: center;
	padding: 32px 24px;
}

.quiz-start h2 {
	margin-bottom: 8px;
}

.quiz-start p {
	margin: 0;
	color: #555;
}

.quiz-start .btn {
	margin-top: 12px;
}

.my-point {
	flex: 3 1 240px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	padding: 24px;
}

.my-point h2 {
	margin: 0;
}

.point-value {
	height: 64px;
	border: 1px solid #cfcfcf;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 16px;
	font-weight: 700;
}

.my-point .btn {
	width: 100%;
	padding: 0;
	font-size: 12px;
}

.info {
	flex: 1 1 380px;
}

.info ul {
	margin: 0;
	padding: 0 0 0 18px;
	list-style: disc;
	display: flex;
	flex-direction: column;
	gap: 12px;
	color: #333;
}

.table-scroll {
	overflow-x: auto;
}

table {
	width: 100%;
	min-width: 480px;
	border-collapse: collapse;
	font-size: 12px;
	text-align: center;
}

th {
	padding: 10px 8px;
	border-top: 1px solid #cfcfcf;
	border-bottom: 1px solid #777;
	font-weight: 700;
}

td {
	height: 44px;
	border-bottom: 1px solid #e3e3e3;
}

/* 사이트 푸터 */
.site-footer {
	border-top: 1px solid #cfcfcf;
	padding: 28px 16px;
	text-align: center;
	font-size: 10px;
	color: #777;
}
</style>
</head>

<body>

	<div class="header">

		<div class="logo" onclick="location.href='/'">YA900</div>


		<nav class="main-menu">


			<div class="menu-item">
				<a href="#">야구</a>

				<div class="sub-menu">
				    <a href="#">예매</a>
				    <a href="${pageContext.request.contextPath}/schedule/schedule">경기일정</a> 
				    <a href="${pageContext.request.contextPath}/schedule/rankdetail">팀순위</a> 
				    <a href="${pageContext.request.contextPath}/schedule/rankdetail?tab=pitcher">선수순위</a> 
				    <a href="${pageContext.request.contextPath}/board/board?cpage=1">게시판</a>
				</div>
			</div>


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


			<div class="menu-item">
				<a href="#">미니게임</a>

				<div class="sub-menu">
					<a href="${pageContext.request.contextPath}/quiz">상식 퀴즈</a> 
					<a href="${pageContext.request.contextPath}/myteam">나만의 팀</a> 
					<a href="${pageContext.request.contextPath}/prediction">승부예측</a> 
					<a href="#">게임 랭킹</a>
				</div>
			</div>
		</nav>

		<div class="member-menu">
		    <button class="login-btn"
		            onclick="location.href='${pageContext.request.contextPath}/login'">
		        로그인
		    </button>
		
		    <button class="sign-btn"
		            onclick="location.href='${pageContext.request.contextPath}/signup'">
		        회원가입
		    </button>
		</div>

	</div>

	<main class="wrap">

		<div class="box">
			<h1>야구 상식퀴즈</h1>
		</div>

		<div class="row">
			<section class="box quiz-start">
				<h2>오늘의 야구 상식퀴즈</h2>
				<p>문제 수</p>
				<p>획득 가능 포인트</p>
				<button type="button" class="btn">퀴즈 시작</button>
			</section>

			<section class="box my-point">
				<h2>내 포인트</h2>
				<div class="point-value"></div>
				<button type="button" class="btn">포인트 내역</button>
			</section>
		</div>

		<div class="row">
			<section class="box info">
				<h2>퀴즈 안내</h2>
				<ul>
					<li>문제 수</li>
					<li>문제당 포인트</li>
					<li>정답 확인</li>
					<li>랭킹 반영</li>
				</ul>
			</section>

			<section class="box info">
				<h2>최근 기록</h2>
				<ul>
					<li>최근 점수</li>
					<li>최고 점수</li>
					<li>참여 횟수</li>
					<li>정답률</li>
				</ul>
			</section>
		</div>

		<section class="box">
			<h2>퀴즈 랭킹</h2>
			<div class="table-scroll">
				<table>
					<thead>
						<tr>
							<th style="width: 20%">순위</th>
							<th style="width: 45%">사용자</th>
							<th style="width: 35%">점수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

		<section class="box">
			<h2>포인트 내역</h2>
			<div class="table-scroll">
				<table>
					<thead>
						<tr>
							<th style="width: 30%">날짜</th>
							<th style="width: 40%">내용</th>
							<th style="width: 30%">포인트</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

	</main>

	<footer class="site-footer">YA900</footer>
</body>
</html>