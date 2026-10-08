<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>경기 상세</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background: linear-gradient(to bottom, #111936 0%, #111936 12%, #171f46 22%, #252f67
		32%, #71809f 43%, #aeb7ca 55%, #d5dae5 70%, #eef1f8 85%, #eef1f8 100%);
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
.container {
	width: 1050px;
	margin: 0 auto;
	background: #f5f6f8;
	min-height: 100vh;
	padding-top: 30px;
	box-shadow: 0 0 30px rgba(17, 25, 54, 0.08);
}
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

.quick-menu .menu, .quick-menu .menu:hover {
	background: #476aaa;
	color: white;
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

.game-info {
	padding: 35px 40px 30px;
	background: white;
	border-bottom: 1px solid #d6dceb;
	box-shadow: 0 3px 12px rgba(17, 25, 54, 0.04);
}

.game-date {
	text-align: center;
	font-size: 14px;
	color: #68718a;
	margin-bottom: 25px;
}

.game-teams {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 70px;
}

.team {
	width: 180px;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.team-logo {
	width: 70px;
	height: 70px;
	object-fit: contain;
	margin-bottom: 12px;
}

.team-name {
	font-size: 22px;
	font-weight: bold;
	color: #111936;
	margin-bottom: 8px;
}

.team-score {
	font-size: 32px;
	font-weight: bold;
	color: #476aaa;
}

.vs {
	font-size: 18px;
	font-weight: bold;
	color: #8b93a8;
}

.game-status {
	text-align: center;
	font-size: 13px;
	color: #68718a;
	margin-top: 15px;
}

/* 예매 버튼 */
.reservation-btn {
	display: block;
	margin: 20px auto 10px;
	padding: 10px 24px;
	background: #476aaa;
	color: white;
	border: none;
	border-radius: 7px;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.2s ease;
}

.reservation-btn:hover {
	background: #38598f;
	transform: translateY(-1px);
	box-shadow: 0 4px 10px rgba(71, 106, 170, 0.25);
} /* 경기 예정 */
.status-upcoming {
	display: inline-block;
	padding: 6px 13px;
	background: #f1f3f8;
	color: #68718a;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
}

.main-layout {
	display: flex;
	align-items: flex-start;
	width: 1050px;
	gap: 0;
}

.game-detail {
	width: 700px;
	background: white;
	border-right: 1px solid #d6dceb;
	flex-shrink: 0;
}

.detail-navigation {
	display: flex;
	border-bottom: 1px solid #d6dceb;
	padding: 0 30px;
	background: white;
}

.detail-navigation button {
	flex: 1;
	height: 55px;
	background: white;
	border: none;
	border-bottom: 3px solid transparent;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	color: #8b93a8;
	transition: 0.2s ease;
}

.detail-navigation button:hover {
	color: #476aaa;
}

.detail-navigation button.active {
	color: #111936;
	font-weight: bold;
	border-bottom-color: #476aaa;
}

.content {
	padding: 30px 30px 60px;
}

.tab-content {
	display: none;
}

.tab-content.active {
	display: block;
}

.section-title {
	font-size: 19px;
	font-weight: bold;
	color: #111936;
	margin-bottom: 18px;
}

.compare-box {
	display: flex;
	align-items: stretch;
	border: 1px solid #d6dceb;
	border-radius: 10px;
	overflow: hidden;
	margin-bottom: 35px;
	background: #fbfcff;
}

.compare-team {
	width: calc(50% - 30px);
	padding: 20px;
	text-align: center;
	min-height: 200px;
}

.compare-team h3 {
	margin: 0 0 15px;
	font-size: 17px;
	color: #111936;
}

.compare-team-logo {
	width: 55px;
	height: 55px;
	object-fit: contain;
	margin-bottom: 10px;
}

.compare-vs {
	width: 60px;
	flex-shrink: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	font-weight: bold;
	color: #8b93a8;
	border-left: 1px solid #e4e7f0;
	border-right: 1px solid #e4e7f0;
	background: #f5f7fc;
}

.compare-row {
	display: flex;
	justify-content: space-between;
	padding: 10px 0;
	border-top: 1px solid #e4e7f0;
	font-size: 14px;
	color: #68718a;
}

.compare-row span:last-child {
	font-weight: bold;
	color: #111936;
}

.player-section {
	margin-bottom: 35px;
}

.player-compare {
	display: flex;
	align-items: stretch;
	border: 1px solid #d6dceb;
	border-radius: 10px;
	overflow: hidden;
	width: 100%;
	background: #fbfcff;
}

.player-compare-team {
	width: calc(50% - 30px);
	padding: 20px;
	min-height: 260px;
}

.player-compare-vs {
	width: 60px;
	flex-shrink: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	font-weight: bold;
	color: #8b93a8;
	border-left: 1px solid #e4e7f0;
	border-right: 1px solid #e4e7f0;
	background: #f5f7fc;
}

.player-team-name {
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	color: #111936;
	margin-bottom: 20px;
}

.player-info {
	display: flex;
	align-items: center;
	gap: 15px;
	margin-bottom: 20px;
}

.player-image {
	width: 60px;
	height: 60px;
	border-radius: 8px;
	object-fit: contain;
	border: 1px solid #d6dceb;
	background: #f5f6f8;
}

.player-name {
	font-size: 16px;
	font-weight: bold;
	color: #111936;
}

.player-detail {
	font-size: 13px;
	color: #8b93a8;
	margin-top: 6px;
}

.player-stat {
	margin-top: 15px;
}

.player-stat-row {
	display: flex;
	justify-content: space-between;
	padding: 9px 0;
	border-top: 1px solid #e4e7f0;
	font-size: 14px;
	color: #68718a;
}

.player-stat-row span:last-child {
	font-weight: bold;
	color: #111936;
}

.key-player {
	display: flex;
	align-items: center;
	gap: 15px;
	margin-bottom: 20px;
}

.key-player-image {
	width: 60px;
	height: 60px;
	border-radius: 8px;
	object-fit: contain;
	border: 1px solid #d6dceb;
	background: #f5f6f8;
}

.key-player-name {
	font-size: 16px;
	font-weight: bold;
	color: #111936;
}

.key-player-detail {
	font-size: 13px;
	color: #8b93a8;
	margin-top: 6px;
}

.key-player-stat {
	margin-top: 15px;
}

.key-player-stat-row {
	display: flex;
	justify-content: space-between;
	padding: 9px 0;
	border-top: 1px solid #e4e7f0;
	font-size: 14px;
	color: #68718a;
}

.key-player-stat-row span:last-child {
	font-weight: bold;
	color: #111936;
}

.lineup-table, .record-table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 8px;
	overflow: hidden;
}

.lineup-table th, .lineup-table td, .record-table th, .record-table td {
	padding: 13px 10px;
	border-bottom: 1px solid #e4e7f0;
	text-align: center;
	font-size: 14px;
}

.lineup-table th, .record-table th {
	background: #f1f3f8;
	color: #111936;
	font-weight: bold;
}

.lineup-table tbody tr:hover, .record-table tbody tr:hover {
	background: #f7f9fd;
}

.lineup-player {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
}

.lineup-player-image {
	width: 35px;
	height: 35px;
	border-radius: 6px;
	object-fit: contain;
	border: 1px solid #d6dceb;
	background: #f5f6f8;
}

.lineup-player-name {
	font-size: 14px;
	font-weight: 500;
	color: #36405d;
}

.lineup-empty {
	color: #b0b6c5;
}

.lineup-notice {
	padding: 70px 20px;
	text-align: center;
	color: #68718a;
	background: #fbfcff;
	border: 1px solid #d6dceb;
	border-radius: 8px;
	font-size: 14px;
}

.open-talk {
	width: 350px;
	height: 620px;
	flex-shrink: 0;
	display: flex;
	flex-direction: column;
	background: white;
	position: sticky;
	top: 100px;
	border-left: 1px solid #d6dceb;
}

.open-talk-header {
	height: 55px;
	padding: 0 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	background: linear-gradient(135deg, #111936, #171f46);
	color: white;
	border-bottom: 1px solid #303b70;
}

.open-talk-title {
	font-size: 16px;
	font-weight: bold;
}

.open-talk-count {
	font-size: 12px;
	color: #aebee7;
}

.chat-list {
	flex: 1;
	padding: 15px;
	overflow-y: auto;
	background: #f5f6f8;
}

.chat-item {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	margin-bottom: 18px;
}

/* 작성자 */
.chat-user {
	font-size: 12px;
	font-weight: bold;
	color: #68718a;
	margin-bottom: 5px;
}

/* 채팅 말풍선 */
.chat-message {
	display: inline-block;
	max-width: 80%;
	padding: 9px 12px;
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 4px 12px 12px 12px;
	font-size: 13px;
	line-height: 1.5;
	color: #36405d;
	box-shadow: 0 2px 7px rgba(17, 25, 54, 0.04);
	word-break: break-word;
}

/* 내가 보낸 채팅 */
.chat-item.my-chat {
	align-items: flex-end;
}

.chat-item.my-chat .chat-user {
	color: #476aaa;
}

.chat-item.my-chat .chat-message {
	background: #111936;
	color: white;
	border: none;
	border-radius: 12px 4px 12px 12px;
	text-align: left;
}

/* 내가 보낸 채팅 */
.chat-item.my-chat {
	align-items: flex-end;
}

.chat-item.my-chat .chat-user {
	justify-content: flex-end;
	color: #476aaa;
}

.chat-item.my-chat .chat-message {
	background: #111936;
	color: white;
	border: none;
	border-radius: 12px 4px 12px 12px;
	text-align: left;
}

/* 입력창 */
.chat-input-area {
	border-top: 1px solid #d6dceb;
	padding: 12px;
	background: white;
}

.chat-input-area {
	padding: 10px 12px 12px;
	background: #f5f6f8;
}

.chat-input {
	display: flex;
	align-items: center;
	gap: 7px;
	padding: 5px;
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 9px;
	box-shadow: 0 2px 6px rgba(17, 25, 54, 0.04);
}

/* 메시지 입력 */
.chat-input input {
	flex: 1;
	height: 34px;
	padding: 0 9px;
	border: none;
	outline: none;
	background: transparent;
	color: #36405d;
	font-size: 13px;
}

.chat-input input::placeholder {
	color: #a0a7b8;
}

.chat-input input:focus {
	background: transparent;
}

/* 등록 버튼 */
.chat-input button {
	width: 50px;
	height: 32px;
	border: none;
	border-radius: 7px;
	background: #111936;
	color: white;
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s ease;
}

.chat-input button:hover {
	background: #476aaa;
}
.chat-input input {
	flex: 1;
	height: 38px;
	border: 1px solid #c7cee0;
	border-radius: 6px;
	padding: 0 10px;
	outline: none;
	color: #36405d;
	background: #fafbfe;
}

.chat-input input:focus {
	border-color: #476aaa;
	background: white;
}

/* 신고 버튼 */
.report-btn {
	width: 22px;
	height: 22px;
	margin-left: 4px;
	padding: 0;
	border: none;
	background: transparent;
	color: red;
	font-size: 13px;
	cursor: pointer;
	transition: 0.2s ease;
}

.report-btn:hover {
	color: #b00000;
	transform: scale(1.15);
}

.report-btn:hover::after {
	opacity: 1;
}

::-webkit-scrollbar {
	width: 8px;
	height: 8px;
}

::-webkit-scrollbar-track {
	background: #e6eaf3;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb {
	background: #476aaa;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	background: #7189c2;
}

@media ( max-width : 1100px) {
	.container {
		width: 100%;
	}
	.main-layout {
		width: 100%;
	}
	.game-detail {
		width: calc(100% - 320px);
	}
	.open-talk {
		width: 320px;
	}
}

@media ( max-width : 750px) {
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
	.main-layout {
		display: block;
		width: 100%;
	}
	.game-detail {
		width: 100%;
		border-right: none;
	}
	.open-talk {
		width: 100%;
		height: 500px;
		position: static;
		border-top: 1px solid #d6dceb;
	}
	.game-teams {
		gap: 30px;
	}
	.team {
		width: 150px;
	}
	.team-name {
		font-size: 18px;
	}
}

@media ( max-width : 600px) {
	.user-menu {
		display: none;
	}
	.main-menu {
		gap: 15px;
	}
	.main-menu a {
		font-size: 14px;
	}
	.game-teams {
		gap: 10px;
	}
	.team {
		width: 120px;
	}
	.team-logo {
		width: 55px;
		height: 55px;
	}
	.team-name {
		font-size: 16px;
	}
	.team-score {
		font-size: 25px;
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
		
	<div class="quick-menu">
		    <div class="menu">QUICK MENU</div>
		    <div onclick="location.href='${pageContext.request.contextPath}/'">홈</div>
		    <div onclick="location.href='${pageContext.request.contextPath}/#reservation'">예매</div>
		    <div onclick="location.href='${pageContext.request.contextPath}/board/board?cpage=1'">게시판</div>
		    <div onclick="location.href='${pageContext.request.contextPath}/mypage'">마이페이지</div>
		</div>
	<main class="container">
		<section class="title-area">
			<nav class="kbo-navigation">
				<a href="${pageContext.request.contextPath}/schedule/schedule">일정 </a> 
				<a href="${pageContext.request.contextPath}/schedule/rankdetail">랭킹 및 기록 </a>
			</nav>
		</section>
		<section class="game-info">
			<div class="game-date">
				<fmt:formatDate value="${schedule.start_date}" pattern="yyyy년 MM월 dd일 HH:mm" />
			</div>

			<div class="game-teams">
				<div class="team">
					<img src="${schedule.away_logo}" class="team-logo" alt="${schedule.away_team} 로고">
					<div class="team-name">${schedule.away_team}</div>
					<div class="team-score">${schedule.away_score}</div>
				</div>

				<div class="vs">VS</div>

				<div class="team">
					<img src="${schedule.home_logo}" class="team-logo" alt="${schedule.home_team} 로고">
					<div class="team-name">${schedule.home_team}</div>
					<div class="team-score">${schedule.home_score}</div>
				</div>
			</div>

			<div class="game-status">
			    <c:choose>
			        <c:when test="${schedule.start_date gt now}">
			            <span>경기예정</span>
			        </c:when>
			
			        <c:when test="${schedule.start_date ge threeHoursAgo}">
			            <span>진행중</span>
			        </c:when>
			
			        <c:otherwise>
			            <span>경기종료</span>
			        </c:otherwise>
			    </c:choose>
			</div>

				<c:if test="${schedule.start_date gt now}">
				   		<button type="button" class="reservation-btn"
						        onclick="openBooking(event, '${pageContext.request.contextPath}/booking/${schedule.game_id}')">
						    예매하기
						</button>
				</c:if>
		</section>

		<div class="main-layout">

			<section class="game-detail">

				<nav class="detail-navigation">
					<button type="button" class="tab-button active"
						onclick="showTab('power_${schedule.game_id}',this)">전력</button>
					<button type="button" class="tab-button"
						onclick="showTab('lineup_${schedule.game_id}',this)">라인업</button>
					<button type="button" class="tab-button"
						onclick="showTab('record_${schedule.game_id}',this)">기록</button>
				</nav>

				<section class="content">

					<div id="power_${schedule.game_id}" class="tab-content active">

						<div class="section-title">팀 전력</div>

						<div class="compare-box">

							<c:forEach var="team" items="${teamList}">
								<c:if test="${team.team_id == schedule.away_id}">

									<div class="compare-team">

										<img src="${schedule.away_logo}" class="compare-team-logo" alt="${schedule.away_team} 로고">

										<h3>${team.team_name}</h3>

										<div class="compare-row">
											<span>승률</span> <span> 
											<fmt:formatNumber value="${team.win_rate}" pattern="0.000" />
											</span>
										</div>

										<div class="compare-row">
											<span>타율</span> <span> 
											<fmt:formatNumber value="${team.batting_avg}" pattern="0.000" />
											</span>
										</div>

										<div class="compare-row">
											<span>ERA</span> <span> 
											<fmt:formatNumber value="${team.era}" pattern="0.00" />
											</span>
										</div>

									</div>

								</c:if>
							</c:forEach>

							<div class="compare-vs">VS</div>

							<c:forEach var="team" items="${teamList}">
								<c:if test="${team.team_id == schedule.home_id}">

									<div class="compare-team">

										<img src="${schedule.home_logo}" class="compare-team-logo" alt="${schedule.home_team} 로고">

										<h3>${team.team_name}</h3>

										<div class="compare-row">
											<span>승률</span> <span> 
											<fmt:formatNumber value="${team.win_rate}" pattern="0.000" />
											</span>
										</div>

										<div class="compare-row">
											<span>타율</span> <span> 
											<fmt:formatNumber value="${team.batting_avg}" pattern="0.000" />
											</span>
										</div>

										<div class="compare-row">
											<span>ERA</span> <span> 
											<fmt:formatNumber value="${team.era}" pattern="0.00" />
											</span>
										</div>

									</div>

								</c:if>
							</c:forEach>

						</div>

						<div class="player-section">

							<div class="section-title">선발 투수</div>

							<div class="player-compare">

								<c:set var="awayPitcherFound" value="false" />

								<c:forEach var="pitcher" items="${pitcherList}">
									<c:if test="${!awayPitcherFound && pitcher.player_team == schedule.away_team}">

										<c:set var="awayPitcherFound" value="true" />

										<div class="player-compare-team">
											<div class="player-team-name">${schedule.away_team}</div>
											<div class="player-info">

												<img src="${pitcher.player_image}" class="player-image" alt="${pitcher.player_name}">

												<div>
													<div class="player-name">${pitcher.player_name}</div>
													<div class="player-detail">${pitcher.player_team}</div>
												</div>

											</div>

											<div class="player-stat">

												<div class="player-stat-row">
													<span>승</span> 
													<span>${pitcher.wins}</span>
												</div>

												<div class="player-stat-row">
													<span>패</span> 
													<span>${pitcher.losses}</span>
												</div>

												<div class="player-stat-row">
													<span>이닝</span> 
													<span>${pitcher.innings}</span>
												</div>

												<div class="player-stat-row">
													<span>평균자책</span> 
													<span> <fmt:formatNumber value="${pitcher.era}" pattern="0.00" />
													</span>
												</div>

											</div>

										</div>

									</c:if>
								</c:forEach>

								<div class="player-compare-vs">VS</div>

								<c:set var="homePitcherFound" value="false" />

								<c:forEach var="pitcher" items="${pitcherList}">
									<c:if test="${!homePitcherFound && pitcher.player_team == schedule.home_team}">

										<c:set var="homePitcherFound" value="true" />

										<div class="player-compare-team">

											<div class="player-team-name">${schedule.home_team}</div>
											<div class="player-info">

												<img src="${pitcher.player_image}" class="player-image" alt="${pitcher.player_name}">

												<div>
													<div class="player-name">${pitcher.player_name}</div>

													<div class="player-detail">${pitcher.player_team}</div>
												</div>

											</div>

											<div class="player-stat">

												<div class="player-stat-row">
													<span>승</span> 
													<span>${pitcher.wins}</span>
												</div>

												<div class="player-stat-row">
													<span>패</span>
													<span>${pitcher.losses}</span>
												</div>

												<div class="player-stat-row">
													<span>이닝</span> 
													<span>${pitcher.innings}</span>
												</div>

												<div class="player-stat-row">
													<span>평균자책</span> 
													<span> 
													<fmt:formatNumber value="${pitcher.era}" pattern="0.00" />
													</span>
												</div>

											</div>

										</div>

									</c:if>
								</c:forEach>

							</div>
						</div>

						<div class="player-section">

							<div class="section-title">타자 키플레이어</div>

							<div class="player-compare">

								<c:set var="awayHitterFound" value="false" />

								<c:forEach var="hitter" items="${hitterList}">
									<c:if
										test="${!awayHitterFound && hitter.player_team == schedule.away_team}">

										<c:set var="awayHitterFound" value="true" />

										<div class="player-compare-team">

											<div class="player-team-name">${schedule.away_team}</div>

											<div class="key-player">

												<img src="${hitter.player_image}" class="key-player-image" alt="${hitter.player_name}">

												<div>
													<div class="key-player-name">${hitter.player_name}</div>
													<div class="key-player-detail">${hitter.player_team}</div>
												</div>

											</div>

											<div class="key-player-stat">

												<div class="key-player-stat-row">
													<span>타율</span> 
													<span> 
													<fmt:formatNumber value="${hitter.batting_avg}" pattern="0.000" />
													</span>
												</div>

												<div class="key-player-stat-row">
													<span>안타</span> <span>${hitter.hits}</span>
												</div>

												<div class="key-player-stat-row">
													<span>홈런</span> <span>${hitter.home_runs}</span>
												</div>

												<div class="key-player-stat-row">
													<span>타점</span> <span>${hitter.runs_batted_in}</span>
												</div>

											</div>

										</div>

									</c:if>
								</c:forEach>

								<div class="player-compare-vs">VS</div>

								<c:set var="homeHitterFound" value="false" />

								<c:forEach var="hitter" items="${hitterList}">
									<c:if
										test="${!homeHitterFound && hitter.player_team == schedule.home_team}">

										<c:set var="homeHitterFound" value="true" />

										<div class="player-compare-team">

											<div class="player-team-name">${schedule.home_team}</div>

											<div class="key-player">

												<img src="${hitter.player_image}" class="key-player-image"
													alt="${hitter.player_name}">

												<div>
													<div class="key-player-name">${hitter.player_name}</div>

													<div class="key-player-detail">${hitter.player_team}
													</div>
												</div>

											</div>

											<div class="key-player-stat">

												<div class="key-player-stat-row">
													<span>타율</span> <span> <fmt:formatNumber
															value="${hitter.batting_avg}" pattern="0.000" />
													</span>
												</div>

												<div class="key-player-stat-row">
													<span>안타</span> <span>${hitter.hits}</span>
												</div>

												<div class="key-player-stat-row">
													<span>홈런</span> <span>${hitter.home_runs}</span>
												</div>

												<div class="key-player-stat-row">
													<span>타점</span> <span>${hitter.runs_batted_in}</span>
												</div>

											</div>

										</div>

									</c:if>
								</c:forEach>

							</div>
						</div>

					</div>

					<div id="lineup_${schedule.game_id}" class="tab-content">

						<div class="section-title">선발 라인업</div>

						<c:choose>
							<c:when test="${empty lineupList}">
								<div class="lineup-notice">출전 선수 명단이 확정되면 업데이트 됩니다.</div>
							</c:when>

							<c:otherwise>
								<table class="lineup-table">
									<thead>
										<tr>
											<th>타순</th>
											<th>원정팀</th>
											<th>포지션</th>
											<th>홈팀</th>
											<th>포지션</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="order" begin="1" end="9">
											<tr>
												<td>${order}</td>

												<td><c:set var="awayLineupFound" value="false" /> <c:forEach
														var="lineup" items="${lineupList}">
														<c:if
															test="${lineup.team == 'away' && lineup.batting_order == order}">
															<c:set var="awayLineupFound" value="true" />

															<div class="lineup-player">
																<img src="${lineup.player_image}"
																	class="lineup-player-image" alt="${lineup.player_name}">
																<span class="lineup-player-name">${lineup.player_name}</span>
															</div>
														</c:if>
													</c:forEach> <c:if test="${!awayLineupFound}">
														<span class="lineup-empty">-</span>
													</c:if></td>

												<td><c:set var="awayPositionFound" value="false" /> <c:forEach
														var="lineup" items="${lineupList}">
														<c:if
															test="${lineup.team == 'away' && lineup.batting_order == order}">
															<c:set var="awayPositionFound" value="true" />
                                        ${lineup.position}
                                    </c:if>
													</c:forEach> <c:if test="${!awayPositionFound}">
														<span class="lineup-empty">-</span>
													</c:if></td>

												<td><c:set var="homeLineupFound" value="false" /> <c:forEach
														var="lineup" items="${lineupList}">
														<c:if
															test="${lineup.team == 'home' && lineup.batting_order == order}">
															<c:set var="homeLineupFound" value="true" />

															<div class="lineup-player">
																<img src="${lineup.player_image}"
																	class="lineup-player-image" alt="${lineup.player_name}">
																<span class="lineup-player-name">${lineup.player_name}</span>
															</div>
														</c:if>
													</c:forEach> <c:if test="${!homeLineupFound}">
														<span class="lineup-empty">-</span>
													</c:if></td>

												<td><c:set var="homePositionFound" value="false" /> <c:forEach
														var="lineup" items="${lineupList}">
														<c:if
															test="${lineup.team == 'home' && lineup.batting_order == order}">
															<c:set var="homePositionFound" value="true" />
                                        ${lineup.position}
                                    </c:if>
													</c:forEach> <c:if test="${!homePositionFound}">
														<span class="lineup-empty">-</span>
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:otherwise>
						</c:choose>

					</div>
					<div id="record_${schedule.game_id}" class="tab-content">

						<div class="section-title">팀 기록</div>

						<table class="record-table">

							<thead>
								<tr>
									<th>항목</th>
									<th>원정팀</th>
									<th>홈팀</th>
								</tr>
							</thead>

							<tbody>

								<c:forEach var="awayTeam" items="${teamList}">

									<c:if test="${awayTeam.team_id == schedule.away_id}">

										<c:forEach var="homeTeam" items="${teamList}">

											<c:if test="${homeTeam.team_id == schedule.home_id}">

												<tr>
													<td>경기</td>
													<td>${schedule.away_team}</td>
													<td>${schedule.home_team}</td>
												</tr>

												<tr>
													<td>승</td>
													<td>${awayTeam.wins}</td>
													<td>${homeTeam.wins}</td>
												</tr>

												<tr>
													<td>패</td>
													<td>${awayTeam.losses}</td>
													<td>${homeTeam.losses}</td>
												</tr>

												<tr>
													<td>무</td>
													<td>${awayTeam.draws}</td>
													<td>${homeTeam.draws}</td>
												</tr>

												<tr>
													<td>타율</td>
													<td><fmt:formatNumber value="${awayTeam.batting_avg}"
															pattern="0.000" /></td>
													<td><fmt:formatNumber value="${homeTeam.batting_avg}"
															pattern="0.000" /></td>
												</tr>

												<tr>
													<td>ERA</td>
													<td><fmt:formatNumber value="${awayTeam.era}"
															pattern="0.00" /></td>
													<td><fmt:formatNumber value="${homeTeam.era}"
															pattern="0.00" /></td>
												</tr>

											</c:if>

										</c:forEach>

									</c:if>

								</c:forEach>

							</tbody>

						</table>

					</div>

				</section>
			</section>

			<aside class="open-talk">

				<div class="open-talk-header">
					<div class="open-talk-title">오픈톡</div>
					<div class="open-talk-count">${schedule.away_team} vs
						${schedule.home_team}</div>
				</div>

				<div class="chat-list" id="chatList_${schedule.game_id}"></div>

				<div class="chat-input-area">

					<div class="chat-input">

						<input type="text" id="chat" placeholder="메시지를 입력하세요">

						<button type="button" id="chatBtn">등록</button>

					</div>

				</div>

			</aside>

		</div>
	</main>

	<script>
  function showTab(tabId,button){
    const tabs=button.closest(".game-detail").querySelectorAll(".tab-content");
    const buttons=button.closest(".detail-navigation").querySelectorAll(".tab-button");
    tabs.forEach(function(tab){
      tab.classList.remove("active");
    });
    buttons.forEach(function(btn){
      btn.classList.remove("active");
    });
    document.getElementById(tabId).classList.add("active");
    button.classList.add("active");
  }

  $("#chatBtn").on("click", function() {
      let chat = $("#chat").val();

      if("${id}" == "") {
          alert("로그인이 필요한 서비스입니다.");
          return;
      }

      if(chat.trim() == "") {
          alert("메시지를 입력해주세요.");
          return;
      }

      $.ajax({
          url:"/board/chat",
          type:"post",
          data:{
              contents:chat,
              game_id:"${schedule.game_id}"
          },
          dataType:"text"
      }).done(function(resp) {
          if(resp == "success") {
              $("#chat").val("");
              loadChat();
          }
      });
  });
  
  function timeAgo(regdate) {
	    let now = new Date();
	    let date = new Date(regdate);
	    let diff = Math.floor((now - date) / 1000);
	    let minute = Math.floor(diff / 60);
	    let hour = Math.floor(diff / 3600);
	    let day = Math.floor(diff / 86400);

	    if(diff < 60) {
	        return "방금 전";
	    } else if(minute < 60) {
	        return minute + "분 전";
	    } else if(hour < 24) {
	        return hour + "시간 전";
	    } else {
	        return day + "일 전";
	    }
	}

  function loadChat() {
      $.ajax({
          url:"/board/chatList",
          type:"get",
          data:{
              game_id:"${schedule.game_id}"
          },
          dataType:"json"
      }).done(function(resp) {
          let chatList = $(".chat-list");
          chatList.empty();

          for(let i = 0; i < resp.length; i++) {
        	  let chat = $("<div>");
        	  let info = $("<div>");
        	  let content = $("<div>");

        	  chat.addClass("chat-item");
        	  info.addClass("chat-user");
        	  content.addClass("chat-message");

        	  if(resp[i].writer == "${sessionScope.id}") {
        	  	chat.addClass("my-chat");
        	  }
        	  let report = $("<button>");
        	  let teamLogo = $("<img>");

        	  teamLogo.attr("src", resp[i].teamLogo);
        	  teamLogo.css({
        	      "width": "15px",
        	      "height": "15px"
        	  });
        	  
        	  report.attr("title", "신고");
        	  report.addClass("report-btn");
        	  report.html('<i class="fa-solid fa-triangle-exclamation"></i>');
        	  
        	  info.append(resp[i].writer);
        	  info.append(teamLogo);
        	  info.append(" ");
        	  info.append(timeAgo(resp[i].regdate));
        	  info.append(report);

        	  content.append(resp[i].contents);

        	  chat.append(info);
        	  chat.append(content);

        	  chatList.append(chat);
        	  
        	  report.on("click", function() {
        		  	if("${id}"!="") {
        		    let params = $.param({
        		        target_contents: resp[i].contents,
        		        target_type: "라이브",
        		        target_seq: resp[i].liveChat_seq,
        		        parent_seq: resp[i].game_id,
        		        target_id: resp[i].writer,
        		        reporter: "${id}"
        		    });

        		    window.open("/board/report?" + params,
        		            "report", "width=500, height=500");
        		  	} else {
        		  		alert("로그인이 필요한 서비스입니다.");
        		  	}
        		});
          }
      });
  }

  loadChat();
  
  setInterval(loadChat, 60000);

  /* function sendChat(gameId){
    const input=document.getElementById("chatInput_"+gameId);
    const message=input.value.trim();

    if(message===""){
      return;
    }

    const chatList=document.getElementById("chatList_"+gameId);
    const chatItem=document.createElement("div");

    chatItem.className="chat-item my-chat";
    chatItem.innerHTML='<div class="chat-user">나</div><div class="chat-message">'+message+'</div>';

    chatList.appendChild(chatItem);

    input.value="";
    chatList.scrollTop=chatList.scrollHeight;
  } */

  /* document.querySelectorAll("[id^='chatInput_']").forEach(function(input){
    input.addEventListener("keydown",function(event){
      if(event.key==="Enter"){
        const gameId=this.id.replace("chatInput_","");
        sendChat(gameId);
      }
    });
  }); */
  function openBooking(event, url) {
    event.stopPropagation();

    const width = 1000;
    const height = 650;

    const left = (screen.width - width) / 2;
    const top = (screen.height - height) / 2;

    window.open(
        url,
        "_blank",
        "width=" + width +
        ",height=" + height +
        ",left=" + left +
        ",top=" + top +
        ",resizable=yes,scrollbars=yes"
    );
}
</script>

</body>
</html>