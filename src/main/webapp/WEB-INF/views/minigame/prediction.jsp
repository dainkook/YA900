<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YA900 승부예측</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background: linear-gradient(
		to bottom,
		#111936 0%,
		#111936 12%,
		#171f46 22%,
		#252f67 32%,
		#71809f 43%,
		#aeb7ca 55%,
		#d5dae5 70%,
		#eef1f8 85%,
		#eef1f8 100%
	);
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #222;
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
   본문
========================= */

.container {
	width: 100%;
	max-width: 1310px;
	margin: 40px auto 60px;
	padding: 0 20px;
}

/* =========================
   제목
========================= */

.title {
	height: 70px;
	background: #f5f6f8;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	display: flex;
	align-items: center;
	padding: 0 25px;
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 20px;
	box-shadow: 0 4px 12px rgba(20, 30, 60, 0.08);
}

/* =========================
   요약 카드
========================= */

.summary {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
	margin-bottom: 20px;
}

.summary-card {
	background: #fff;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	padding: 25px 20px;
	text-align: center;
	font-size: 14px;
	box-shadow: 0 4px 12px rgba(20, 30, 60, 0.07);
}

.summary-card strong {
	display: block;
	margin-top: 12px;
	min-height: 25px;
	font-size: 22px;
	color: #476aaa;
}

/* =========================
   공통 박스
========================= */

.box {
	background: #fff;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	padding: 25px;
	margin-bottom: 20px;
	min-width: 0;
	box-shadow: 0 4px 12px rgba(20, 30, 60, 0.07);
}

.area-title {
	text-align: left;
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #222;
}

/* =========================
   경기 카드
========================= */

.match-card {
	border: 1px solid #e1e4e8;
	border-radius: 8px;
	padding: 18px;
	margin-bottom: 12px;
	background: #fafbfc;
	transition: 0.2s ease;
}

.match-card:last-child {
	margin-bottom: 0;
}

.match-card:hover {
	border-color: #b8c4dc;
	box-shadow: 0 3px 8px rgba(20, 30, 60, 0.06);
}

.match-info {
	display: grid;
	grid-template-columns: 1fr 1fr 80px 1fr;
	align-items: center;
	text-align: center;
	min-height: 40px;
	margin-bottom: 15px;
	font-size: 13px;
}

.match-time {
	color: #666;
}

.match-team {
	font-weight: bold;
	font-size: 15px;
	min-height: 18px;
}

.match-vs {
	font-size: 12px;
	color: #777;
	font-weight: bold;
}

/* =========================
   승부 선택 버튼
========================= */

.match-pick {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 8px;
}

.match-pick button {
	height: 42px;
	border: 1px solid #d3d8e2;
	border-radius: 5px;
	background: white;
	color: #333;
	font-size: 13px;
	cursor: pointer;
	transition: 0.2s ease;
}

.match-pick button:hover {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

/* 선택된 버튼을 나중에 사용할 경우 */
.match-pick button.active {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

/* =========================
   테이블
========================= */

.table-scroll {
	overflow-x: auto;
}

table {
	width: 100%;
	min-width: 520px;
	border-collapse: collapse;
	font-size: 13px;
	text-align: center;
}

th {
	padding: 13px 8px;
	background: #f5f6f8;
	border-top: 1px solid #dfe2e7;
	border-bottom: 1px solid #c8cdd5;
	font-weight: bold;
	color: #333;
}

td {
	height: 48px;
	border-bottom: 1px solid #e5e7eb;
	color: #444;
}

tbody tr:hover {
	background: #f8f9fb;
}

/* =========================
   내 예측 테이블
========================= */

.my-table tbody tr:first-child td {
	border-top: 1px solid #e1e4e8;
}

.my-table td {
	height: 52px;
	border-bottom: 1px solid #e1e4e8;
}

/* =========================
   제출 버튼
========================= */

.save-area {
	text-align: center;
	margin-top: 20px;
}

.save-btn {
	width: 130px;
	height: 42px;
	border: 1px solid #476aaa;
	border-radius: 5px;
	background: #476aaa;
	color: white;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s ease;
}

.save-btn:hover {
	background: #3d5e97;
	border-color: #3d5e97;
}

/* =========================
   푸터
========================= */

.footer {
	border-top: 1px solid rgba(255, 255, 255, 0.4);
	margin-top: 70px;
	padding: 30px 16px;
	text-align: center;
	font-size: 10px;
	color: #555;
}

/* =========================
   반응형
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

	.menu-item > a {
		font-size: 16px;
	}

	.container {
		max-width: 100%;
		margin-top: 30px;
	}

	.summary {
		grid-template-columns: 1fr;
	}

	.match-info {
		grid-template-columns: 1fr 1fr 50px 1fr;
	}

}

@media (max-width: 600px) {

	.header {
		height: auto;
		min-height: 100px;
		padding: 20px;
		flex-wrap: wrap;
	}

	.logo {
		margin-right: 20px;
	}

	.main-menu {
		order: 3;
		width: 100%;
		justify-content: center;
		gap: 15px;
		margin-top: 15px;
	}

	.menu-item > a {
		font-size: 14px;
	}

	.member-menu {
		margin-left: auto;
	}

	.container {
		padding: 0 12px;
		margin-top: 20px;
	}

	.title {
		height: 60px;
		font-size: 19px;
	}

	.box {
		padding: 18px;
	}

	.match-info {
		grid-template-columns: 1fr;
		gap: 8px;
	}

	.match-vs {
		display: none;
	}

	.match-pick {
		grid-template-columns: 1fr 1fr 1fr;
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
	<div class="container">

		<div class="title">승부예측</div>

		<div class="summary">
			<div class="summary-card">
				보유 포인트 <strong></strong>
			</div>
			<div class="summary-card">
				예측 참여 <strong></strong>
			</div>
			<div class="summary-card">
				적중률 <strong></strong>
			</div>
		</div>

		<section class="box">
			<div class="area-title">오늘의 경기</div>

			<div class="match-card">
				<div class="match-info">
					<div class="match-time"></div>
					<div class="match-team"></div>
					<div class="match-vs">VS</div>
					<div class="match-team"></div>
				</div>
				<div class="match-pick">
					<button type="button">승</button>
					<button type="button">무승부</button>
					<button type="button">승</button>
				</div>
			</div>

			<div class="match-card">
				<div class="match-info">
					<div class="match-time"></div>
					<div class="match-team"></div>
					<div class="match-vs">VS</div>
					<div class="match-team"></div>
				</div>
				<div class="match-pick">
					<button type="button">승</button>
					<button type="button">무승부</button>
					<button type="button">승</button>
				</div>
			</div>

			<div class="match-card">
				<div class="match-info">
					<div class="match-time"></div>
					<div class="match-team"></div>
					<div class="match-vs">VS</div>
					<div class="match-team"></div>
				</div>
				<div class="match-pick">
					<button type="button">승</button>
					<button type="button">무승부</button>
					<button type="button">승</button>
				</div>
			</div>
		</section>

		<section class="box">
			<div class="area-title">내 예측</div>

			<div class="table-scroll">
				<table class="my-table">
					<colgroup>
						<col style="width: 16%">
						<col style="width: 40%">
						<col style="width: 24%">
						<col style="width: 20%">
					</colgroup>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="save-area">
				<button type="button" class="save-btn">예측 제출</button>
			</div>
		</section>

		<section class="box">
			<div class="area-title">예측 내역</div>

			<div class="table-scroll">
				<table>
					<thead>
						<tr>
							<th style="width: 16%">날짜</th>
							<th style="width: 34%">경기</th>
							<th style="width: 20%">예측</th>
							<th style="width: 15%">결과</th>
							<th style="width: 15%">포인트</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

	</div>

	<footer class="footer"> YA900 </footer>
</body>
</html>