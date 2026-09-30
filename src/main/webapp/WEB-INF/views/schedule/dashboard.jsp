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
	background-color: #f5f6f8;
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #222;
}

.header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 80px;
	background-color: white;
	border-bottom: 1px solid #ddd;
	display: flex;
	align-items: center;
	padding: 0 50px;
	z-index: 1000;
}

.logo {
	font-size: 28px;
	font-weight: bold;
	margin-right: 70px;
}

.main-menu {
	display: flex;
	gap: 45px;
}

.main-menu a {
	text-decoration: none;
	color: #222;
	font-size: 16px;
}

.user-menu {
	margin-left: auto;
	display: flex;
	gap: 10px;
}

.user-menu button {
	background-color: white;
	border: 1px solid #aaa;
	padding: 8px 15px;
	cursor: pointer;
}

.container {
	width: 900px;
	margin: 0 auto;
	background-color: white;
	min-height: 100vh;
	padding-top: 80px;
}

.title-area {
	padding: 40px;
}

.kbo-navigation {
	display: flex;
	gap: 30px;
	border-bottom: 1px solid #ddd;
	margin-bottom: 30px;
}

.kbo-navigation a {
	text-decoration: none;
	color: #777;
	font-size: 16px;
	padding: 0 5px 12px;
}

.kbo-navigation a:hover {
	color: #222;
}

.kbo-navigation a.active {
	color: #222;
	font-weight: bold;
	border-bottom: 2px solid #222;
}

.title-area h1 {
	margin: 0 0 30px;
	font-size: 26px;
}

.month-navigation {
	display: flex;
	align-items: center;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.month-arrow {
	width: 60px;
	height: 55px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 22px;
	color: #777;
	text-decoration: none;
}

.month-arrow:hover {
	background-color: #f5f5f5;
	color: #222;
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
	color: #777;
	font-size: 15px;
	text-decoration: none;
}

.month-tab:hover {
	background-color: #f5f5f5;
}

.month-tab.active {
	color: white;
	background-color: #222;
	font-weight: bold;
}

.game-area {
	padding: 0 40px 50px;
}

.month-title {
	font-size: 20px;
	font-weight: bold;
	padding: 25px 0 20px;
}

.schedule-day {
	border-top: 1px solid #ddd;
	padding: 20px 0;
}

.schedule-date {
	font-size: 17px;
	font-weight: bold;
	margin-bottom: 12px;
}

.game-card {
	border: 1px solid #ddd;
	border-radius: 6px;
	padding: 18px 20px;
	margin-bottom: 10px;
}

.game-header {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
	font-size: 13px;
	color: #777;
}

.game-content {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 40px;
}

.team {
	width: 180px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
}

.team-logo {
	width: 45px;
	height: 45px;
	object-fit: contain;
}

.team-name {
	font-size: 17px;
	font-weight: bold;
}

.score {
	font-size: 24px;
	font-weight: bold;
}

.vs {
	color: #aaa;
	margin: 0 8px;
}

.stadium {
	margin-top: 15px;
	text-align: center;
	font-size: 13px;
	color: #888;
}

.no-game {
	padding: 50px 0;
	text-align: center;
	color: #888;
	border-top: 1px solid #ddd;
}

@media ( max-width : 950px) {
	.container {
		width: 100%;
	}
}

@media ( max-width : 600px) {
	.header {
		padding: 0 20px;
	}
	.logo {
		margin-right: 30px;
	}
	.main-menu {
		gap: 15px;
	}
	.user-menu {
		display: none;
	}
	.month-arrow {
		width: 45px;
	}
	.month-tab {
		font-size: 13px;
	}
	.game-content {
		gap: 10px;
	}
	.team {
		width: 120px;
	}
}
.game-link {
	display: block;
	text-decoration: none !important;
	color: #222 !important;
}

.game-link:visited {
	color: #222 !important;
}

.game-link:hover {
	color: #222 !important;
}
</style>

</head>

<body>

<header class="header">

	<div class="logo">YA900</div>

	<nav class="main-menu">
		<a href="#">야구</a>
		<a href="#">축구</a>
		<a href="#">미니게임</a>
	</nav>

	<div class="user-menu">
		<button>로그인</button>
		<button>회원가입</button>
	</div>

</header>

<main class="container">

	<section class="title-area">

		<nav class="kbo-navigation">

			<a href="${pageContext.request.contextPath}/schedule/schedule"class="active">
				일정
			</a>

			<a href="#">
				순위
			</a>

		</nav>

		<h1>KBO 리그</h1>

		<div class="month-navigation">

			<c:choose>
				<c:when test="${month >= 7}">
					<a href="${pageContext.request.contextPath}/schedule/schedule?month=6" class="month-arrow">
						‹
					</a>
				</c:when>
			</c:choose>

			<div class="month-tabs">

				<c:choose>

					<c:when test="${month <= 6}">
						<c:forEach var="i" begin="1" end="6">
							<a
								href="${pageContext.request.contextPath}/schedule/schedule?month=${i}"
								class="month-tab ${month == i ? 'active' : ''}">
								${i}월
							</a>
						</c:forEach>

					</c:when>

					<c:otherwise>
						<c:forEach var="i" begin="7" end="12">
							<a
								href="${pageContext.request.contextPath}/schedule/schedule?month=${i}"
								class="month-tab ${month == i ? 'active' : ''}">
								${i}월
							</a>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

			<c:choose>
				<c:when test="${month <= 6}">
					<a
						href="${pageContext.request.contextPath}/schedule/schedule?month=7"
						class="month-arrow">
						›
					</a>
				</c:when>
			</c:choose>
		</div>

	</section>

	<section class="game-area">
		<div class="month-title">
			2026년 ${month}월 경기 일정
		</div>
		<div id="schedule-list">
			<c:choose>
				<c:when test="${empty list}">
					<div class="no-game">
						해당 월에 경기 일정이 없습니다.
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}">
						<div class="schedule-day">
							<div class="schedule-date">
								<fmt:formatDate value="${dto.start_date}" pattern="yyyy년 MM월 dd일" />
							</div>
							
							<a href="${pageContext.request.contextPath}/schedule/scheduledetail?game_id=${dto.game_id}" class="game-link">
							<div class="game-card">
								<div class="game-header">
									<span>
										<fmt:formatDate value="${dto.start_date}" pattern="HH:mm" />
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
										<img src="${pageContext.request.contextPath}${dto.away_logo}" class="team-logo">
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
										<img src="${pageContext.request.contextPath}${dto.home_logo}" class="team-logo">
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