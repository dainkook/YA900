<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>일정/기록</title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background: linear-gradient(to bottom, #111936 0%, #111936 12%, #171f46 22%, #252f67 32%, #71809f 43%, #aeb7ca 55%, #d5dae5 70%, #eef1f8 85%, #eef1f8 100%);
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #18213f;
	min-height: 100vh;
}

.header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 80px;
	background: linear-gradient(135deg, #0b1026, #171f46);
	color: white;
	display: flex;
	align-items: center;
	padding: 0 50px;
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

.main-menu {
	height: 100%;
	display: flex;
	align-items: center;
	gap: 40px;
}

.main-menu a {
	text-decoration: none;
	color: #f7f8ff;
	font-size: 16px;
	font-weight: bold;
	padding: 10px 5px;
	transition: 0.2s ease;
}

.main-menu a:hover {
	color: #aebee7;
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

.container {
	width: 1050px;
	margin: 0 auto;
	background: #f5f6f8;
	min-height: 100vh;
	padding-top: 80px;
	box-shadow: 0 0 30px rgba(17, 25, 54, 0.08);
}

.title-area {
	padding: 35px 35px 0;
}

.kbo-navigation {
	height: 55px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 45px;
	border-bottom: 1px solid #d6dceb;
	background: white;
	border-radius: 8px 8px 0 0;
}

.kbo-navigation a {
	text-decoration: none;
	color: #8b93a8;
	font-size: 15px;
	font-weight: 500;
	padding: 18px 5px;
	transition: 0.2s ease;
}

.kbo-navigation a:hover {
	color: #476aaa;
}

.kbo-navigation a.active {
	color: #111936;
	font-weight: bold;
	border-bottom: 2px solid #476aaa;
}

.title-area h1 {
	margin: 30px 0 25px;
	font-size: 25px;
	color: #111936;
}

.month-navigation {
	display: flex;
	align-items: center;
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.05);
}

.month-arrow {
	width: 60px;
	height: 55px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px;
	color: #68718a;
	text-decoration: none;
	transition: 0.2s ease;
}

.month-arrow:hover {
	background: #f1f3f8;
	color: #476aaa;
}

.month-tabs {
	flex: 1;
	display: grid;
	grid-template-columns: repeat(6, 1fr);
}

.month-tab {
	height: 55px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #8b93a8;
	font-size: 15px;
	text-decoration: none;
	transition: 0.2s ease;
}

.month-tab:hover {
	background: #f5f7fb;
	color: #476aaa;
}

.month-tab.active {
	color: white;
	background: #476aaa;
	font-weight: bold;
}

.game-area {
	padding: 0 35px 60px;
}

.month-title {
	font-size: 19px;
	font-weight: bold;
	color: #111936;
	padding: 30px 5px 20px;
}

.schedule-day {
	padding: 20px 0 10px;
}

.schedule-date {
	font-size: 16px;
	font-weight: bold;
	color: #36405d;
	margin-bottom: 12px;
	padding-left: 5px;
}

.game-card {
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 10px;
	padding: 18px 20px;
	margin-bottom: 10px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.05);
	transition: 0.2s ease;
}

.game-card:hover {
	transform: translateY(-2px);
	border-color: #476aaa;
	box-shadow: 0 8px 22px rgba(17, 25, 54, 0.09);
}

.game-header {
	display: flex;
	justify-content: space-between;
	margin-bottom: 18px;
	font-size: 13px;
	color: #8b93a8;
}

.game-header span:last-child {
	color: #476aaa;
	font-weight: bold;
}

.game-content {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 45px;
}

.team {
	width: 220px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 12px;
}

.team-logo {
	width: 45px;
	height: 45px;
	object-fit: contain;
}

.team-name {
	font-size: 17px;
	font-weight: bold;
	color: #18213f;
}

.score {
	min-width: 85px;
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	color: #111936;
}

.vs {
	color: #9aa2b5;
	margin: 0 7px;
	font-size: 20px;
}

.stadium {
	margin-top: 15px;
	padding-top: 12px;
	border-top: 1px solid #eef0f5;
	text-align: center;
	font-size: 13px;
	color: #8b93a8;
}

.no-game {
	background: white;
	padding: 60px 0;
	text-align: center;
	color: #8b93a8;
	border: 1px solid #d6dceb;
	border-radius: 10px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.05);
}

.game-link {
	display: block;
	text-decoration: none !important;
	color: #18213f !important;
}

.game-link:visited {
	color: #18213f !important;
}

.game-link:hover {
	color: #18213f !important;
}

@media (max-width: 1100px) {
	.container {
		width: 100%;
	}
}

@media (max-width: 750px) {
	.header {
		padding: 0 20px;
	}

	.logo {
		margin-right: 30px;
	}

	.main-menu {
		gap: 20px;
	}

	.container {
		width: 100%;
	}

	.title-area {
		padding: 25px 15px 0;
	}

	.game-area {
		padding: 0 15px 50px;
	}

	.game-content {
		gap: 15px;
	}

	.team {
		width: 150px;
	}

	.team-name {
		font-size: 15px;
	}

	.month-arrow {
		width: 45px;
	}

	.month-tab {
		font-size: 13px;
	}
}

@media (max-width: 600px) {
	.user-menu {
		display: none;
	}

	.main-menu {
		gap: 15px;
	}

	.main-menu a {
		font-size: 14px;
	}

	.game-content {
		gap: 5px;
	}

	.team {
		width: 120px;
		flex-direction: column;
	}

	.score {
		min-width: 55px;
		font-size: 20px;
	}

	.team-logo {
		width: 40px;
		height: 40px;
	}
}

::-webkit-scrollbar {
	width: 8px;
	height: 8px;
}

::-webkit-scrollbar-track {
	background: #e6eaf3;
}

::-webkit-scrollbar-thumb {
	background: #476aaa;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	background: #7189c2;
}
</style>

</head>

<body>

	<header class="header">

		<div class="logo">YA900</div>

		<nav class="main-menu">
			<a href="#">야구</a> <a href="#">축구</a> <a href="#">미니게임</a>
		</nav>

		<div class="user-menu">
			<button class="login-btn"
				onclick="location.href='/member/login'">로그인</button>
			<button class="sign-btn"
				onclick="location.href='member/signup'">회원가입</button>
		</div>

	</header>

	<main class="container">

		<section class="title-area">

			<nav class="kbo-navigation">

				<a href="${pageContext.request.contextPath}/schedule/schedule"class="active"> 
					일정 
					</a> 
					<a href="${pageContext.request.contextPath}/schedule/rankdetail">
					랭킹 및 기록 
					</a>

			</nav>

			<h1>KBO 리그</h1>

			<div class="month-navigation">

				<c:choose>
					<c:when test="${month >= 7}">
						<a
							href="${pageContext.request.contextPath}/schedule/schedule?month=6"
							class="month-arrow"> ‹ </a>
					</c:when>
				</c:choose>

				<div class="month-tabs">

					<c:choose>

						<c:when test="${month <= 6}">
							<c:forEach var="i" begin="1" end="6">
								<a
									href="${pageContext.request.contextPath}/schedule/schedule?month=${i}"
									class="month-tab ${month == i ? 'active' : ''}"> ${i}월 </a>
							</c:forEach>

						</c:when>

						<c:otherwise>
							<c:forEach var="i" begin="7" end="12">
								<a
									href="${pageContext.request.contextPath}/schedule/schedule?month=${i}"
									class="month-tab ${month == i ? 'active' : ''}"> ${i}월 </a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

				<c:choose>
					<c:when test="${month <= 6}">
						<a
							href="${pageContext.request.contextPath}/schedule/schedule?month=7"
							class="month-arrow"> › </a>
					</c:when>
				</c:choose>
			</div>

		</section>

		<section class="game-area">
			<div class="month-title">2026년 ${month}월 경기 일정</div>
			<div id="schedule-list">
				<c:choose>
					<c:when test="${empty list}">
						<div class="no-game">해당 월에 경기 일정이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list}">
							<div class="schedule-day">
								<div class="schedule-date">
									<fmt:formatDate value="${dto.start_date}"
										pattern="yyyy년 MM월 dd일" />
								</div>

								<a
									href="${pageContext.request.contextPath}/schedule/scheduledetail?game_id=${dto.game_id}"
									class="game-link">
									<div class="game-card">
										<div class="game-header">
											<span> <fmt:formatDate value="${dto.start_date}"
													pattern="HH:mm" />
											</span>
											<c:choose>
												<c:when test="${dto.start_date lt now}">
													<span>경기종료</span>
												</c:when>

												<c:otherwise>
													<span>경기예정</span>
												</c:otherwise>

											</c:choose>

										</div>

										<div class="game-content">

											<div class="team">
												<img
													src="${pageContext.request.contextPath}${dto.away_logo}"
													class="team-logo">
												<div class="team-name">${dto.away_team}</div>
											</div>

											<div class="score">
												<c:choose>
													<c:when test="${dto.start_date lt now}"> ${dto.away_score}

												<span class="vs">:</span>

												${dto.home_score}
											</c:when>
													<c:otherwise>
												-
												<span class="vs">:</span>
												-
											</c:otherwise>
												</c:choose>
											</div>
											<div class="team">
												<div class="team-name">${dto.home_team}</div>
												<img
													src="${pageContext.request.contextPath}${dto.home_logo}"
													class="team-logo">
											</div>
										</div>
										<div class="stadium">${dto.location}</div>

									</div>
							</div>
							</a>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
	</main>

</body>
</html>