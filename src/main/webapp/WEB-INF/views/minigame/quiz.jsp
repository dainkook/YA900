<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YA900 야구 상식 퀴즈</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

html, body {
	margin: 0;
	min-height: 100%;
}

body {
	background: linear-gradient(to bottom, #111936 0%, #111936 12%, #171f46 22%, #252f67 32%,
		#71809f 43%, #aeb7ca 55%, #d5dae5 70%, #eef1f8 85%, #eef1f8 100%);
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #18213f;
	min-height: 100vh;
}

/* =========================
   HEADER
========================= */

.header {
	width: 100%;
	height: 100px;
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
	cursor: pointer;
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

.menu-item > a {
	font-size: 18px;
	font-weight: bold;
	text-decoration: none;
	color: #f7f8ff;
	padding: 10px 5px;
	transition: color 0.2s ease;
}

.menu-item > a:hover {
	color: #aebee7;
}

/* =========================
   SUB MENU
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
   LOGIN / SIGNUP
========================= */

.member-menu {
	font-size: 14px;
	margin-left: auto;
	display: flex;
	align-items: center;
	gap: 10px;
	white-space: nowrap;
}

.member-menu form {
	display: flex;
	margin: 0;
}

.member-menu span {
	color: white;
	font-weight: bold;
	white-space: nowrap;
}

.login-btn,
.sign-btn {
	border: 1px solid #7180b1;
	background: transparent;
	color: white;
	border-radius: 5px;
	padding: 6px 10px;
	cursor: pointer;
	white-space: nowrap;
	transition: 0.2s ease;
}

.login-btn:hover,
.sign-btn:hover {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

/* =========================
   CONTAINER
========================= */

.wrap {
	width: 1310px;
	max-width: calc(100% - 40px);
	margin: 110px auto 40px;
}

/* =========================
   COMMON BOX
========================= */

.box {
	background: white;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
	padding: 25px;
}

/* =========================
   TITLE
========================= */

.wrap > .box:first-child {
	height: 70px;
	display: flex;
	align-items: center;
	margin-bottom: 18px;
}

h1 {
	margin: 0;
	font-size: 24px;
	font-weight: bold;
}

h2 {
	margin: 0 0 20px;
	font-size: 21px;
	font-weight: bold;
	text-align: center;
	color: #222;
}

/* =========================
   ROW
========================= */

.row {
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
}

/* =========================
   QUIZ START
========================= */

.quiz-start {
	flex: 2;
	min-height: 300px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.quiz-start p {
	margin: 6px 0;
	font-size: 14px;
	color: #666;
}

/* =========================
   MY POINT
========================= */

.my-point {
	flex: 1;
	min-height: 300px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.my-point h2 {
	margin-bottom: 25px;
}

.point-value {
	width: 80%;
	height: 70px;
	border: 1px solid #e0e3e7;
	border-radius: 7px;
	background: #f7f8fa;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	font-weight: bold;
	color: #476aaa;
	margin-bottom: 20px;
}

/* =========================
   BUTTON
========================= */

.btn {
	height: 45px;
	min-width: 150px;
	padding: 0 25px;
	border: none;
	border-radius: 7px;
	background: #476aaa;
	color: white;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.15s ease;
}

.btn:hover {
	background: #3d5e97;
	box-shadow: 0 3px 8px rgba(71, 106, 170, 0.2);
}

/* =========================
   INFO
========================= */

.info {
	flex: 1;
	min-height: 230px;
}

.info ul {
	margin: 0;
	padding-left: 20px;
	display: flex;
	flex-direction: column;
	gap: 14px;
	color: #555;
	font-size: 14px;
}

.info li {
	padding-left: 4px;
}

/* =========================
   TABLE
========================= */

.table-scroll {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
	text-align: center;
}

th {
	height: 45px;
	background: #f7f8fa;
	border-top: 1px solid #e1e4e8;
	border-bottom: 1px solid #d5d9df;
	font-weight: bold;
	color: #555;
}

td {
	height: 48px;
	border-bottom: 1px solid #eee;
	color: #444;
}

tbody tr:hover {
	background: #f7f9fc;
}

/* =========================
   BOTTOM BOX
========================= */

.wrap > section.box {
	margin-bottom: 20px;
}

/* =========================
   FOOTER
========================= */

.site-footer {
	width: 100%;
	border-top: 1px solid #d8dce3;
	padding: 28px 16px;
	text-align: center;
	font-size: 11px;
	color: #777;
	background: rgba(255, 255, 255, 0.5);
	margin-top: 20px;
}

/* =========================
   QUICK MENU
========================= */

.quick-menu {
	width: 280px;
	position: fixed;
	left: -250px;
	top: 50%;
	transform: translateY(-50%);
	border: 1px solid #3b4778;
	transition: left 0.5s ease;
	z-index: 1000;
	background: #111936;
	color: white;
	box-shadow: 5px 8px 25px rgba(10, 15, 35, 0.18);
}

.quick-menu:hover {
	left: 0;
}

.quick-menu div {
	width: 100%;
	height: 55px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	border-bottom: 1px solid #303b68;
}

.quick-menu div:last-child {
	border-bottom: none;
}

.quick-menu div:hover {
	background: #252f67;
}

.quick-menu .menu,
.quick-menu .menu:hover {
	background: #476aaa;
	color: white;
}

/* =========================
   RESPONSIVE
========================= */

@media (max-width: 900px) {

	.header {
		padding: 0 25px;
	}

	.logo {
		margin-right: 30px;
	}

	.main-menu {
		gap: 20px;
	}

	.wrap {
		width: 100%;
		max-width: calc(100% - 30px);
	}

	.row {
		flex-direction: column;
	}

	.quiz-start,
	.my-point,
	.info {
		width: 100%;
	}

}

@media (max-width: 600px) {

	.header {
		height: 80px;
		padding: 0 15px;
	}

	.logo {
		font-size: 24px;
		margin-right: 20px;
	}

	.main-menu {
		gap: 10px;
	}

	.menu-item > a {
		font-size: 14px;
	}

	.member-menu {
		display: none;
	}

	.wrap {
		margin-top: 40px;
		max-width: calc(100% - 20px);
	}

	.box {
		padding: 20px;
	}

	h1 {
		font-size: 20px;
	}

	h2 {
		font-size: 18px;
	}

	.quick-menu {
		display: none;
	}
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
					<a href="#">예매</a> 
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
					<a href="#">게임 랭킹</a>
				</div>
			</div>
		</nav>

		<div class="member-menu">

    <c:choose>

        <c:when test="${not empty sessionScope.id}">
            <span>${sessionScope.id}님</span>

            <button class="login-btn"
                    onclick="location.href='${pageContext.request.contextPath}/mypage'">
                마이페이지
            </button>

            <form action="${pageContext.request.contextPath}/logout"
                  method="post">
                <button type="submit" class="sign-btn">
                    로그아웃
                </button>
            </form>
        </c:when>

        <c:otherwise>
            <button class="login-btn"
                    onclick="location.href='${pageContext.request.contextPath}/login'">
                로그인
            </button>

            <button class="sign-btn"
                    onclick="location.href='${pageContext.request.contextPath}/signup'">
                회원가입
            </button>
        </c:otherwise>

    </c:choose>
			
			
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