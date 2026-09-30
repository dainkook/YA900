<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YA900</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
</head>
<style>
/* =========================
   전체
========================= */

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background: linear-gradient(
        to bottom,
        #111936 0%,
        #111936 15%,
        #0b1026 25%,
        #171f46 35%,
        #252f67 48%,
        #71809f 65%,
        #aeb7ca 76%,
        #d5dae5 86%,
        #eef1f8 94%,
        #eef1f8 100%
    );
    color: #18213f;
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

    transition:
        opacity 0.2s ease,
        transform 0.2s ease;

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

.login-btn,
.sign-btn {
    border: 1px solid #7180b1;
    background: transparent;
    color: white;

    border-radius: 5px;

    transition: 0.2s ease;
}

.login-btn:hover,
.sign-btn:hover {
    background: #476aaa;
    border-color: #476aaa;
    color: white;
}


/* =========================
   BANNER
========================= */

.banner {
    width: 100%;
    height: 550px;

    position: relative;
    overflow: hidden;

    background: #080d22;

    display: flex;
    justify-content: center;
    align-items: center;
}

.banner-slide {
    position: absolute;

    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    background-size: cover;
    background-position: center;

    opacity: 0;

    animation: bannerFade 20s infinite;

    filter: blur(5px);
    transform: scale(1.05);
}

.banner-slide::after {
    content: "";

    position: absolute;
    inset: 0;

    background: rgba(8, 13, 34, 0.6);
}

.banner-slide:nth-child(1) {
    background-image:
        url("${pageContext.request.contextPath}/resources/images/banner/banner1.jpg");
}

.banner-slide:nth-child(2) {
    background-image:
        url("${pageContext.request.contextPath}/resources/images/banner/banner2.jpg");
}

.banner-slide:nth-child(3) {
    background-image:
        url("${pageContext.request.contextPath}/resources/images/banner/banner3.jpg");
}

.banner-slide:nth-child(4) {
    background-image:
        url("${pageContext.request.contextPath}/resources/images/banner/banner4.jpg");
}

.banner-slide:nth-child(5) {
    background-image:
        url("${pageContext.request.contextPath}/resources/images/banner/banner5.jpg");
}


@keyframes bannerFade {

    0% {
        opacity: 0;
    }

    5% {
        opacity: 1;
    }

    20% {
        opacity: 1;
    }

    25% {
        opacity: 0;
    }

    100% {
        opacity: 0;
    }
}

.banner h1 {
    position: relative;
    z-index: 2;

    color: white;

    letter-spacing: 1px;

    text-shadow: 0 3px 15px rgba(0, 0, 0, 0.5);
}


/* =========================
   메인 영역
========================= */

.main-content {
    width: 1200px;

    margin: 50px auto;

    display: flex;
    flex-direction: column;

    gap: 30px;
}


/* =========================
   공통 카드
========================= */

.reservation,
.recent-board,
.ranking,
.schedule,
.bottom-menu1,
.bottom-menu2 {

    background: #ffffff;

    border: 1px solid #d6dceb;

    border-radius: 12px;

    box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
}


/* =========================
   예매 영역
========================= */

.reservation {
    width: 100%;

    min-height: 350px;
    height: auto;

    padding: 25px 30px;

    overflow: visible;
}

.reservation h2 {
    text-align: center;

    margin: 0 0 15px 0;

    color: #111936;
}


/* =========================
   경기 카드 영역
========================= */

.game-area {
    height: 250px;

    display: flex;

    align-items: center;

    gap: 15px;

    overflow: visible;
}

.game-list {
    width: 100%;
    height: 230px;

    display: flex;

    align-items: center;

    gap: 20px;

    padding: 20px 5px 10px;

    overflow-x: auto;
    overflow-y: hidden;
}


/* =========================
   경기 카드
========================= */

.game-card {

    width: 260px;
    height: 190px;

    flex-shrink: 0;

    padding: 20px;

    display: flex;
    flex-direction: column;

    justify-content: center;
    align-items: center;

    text-align: center;

    cursor: pointer;

    background: #fbfcff;

    border: 1px solid #d6dceb;

    border-radius: 10px;

    transition:
        transform 0.2s ease,
        border-color 0.2s ease,
        box-shadow 0.2s ease;
}

.game-card:hover {

    transform: translateY(-4px);

    border-color: #476aaa;

    box-shadow:
        0 8px 20px rgba(71, 106, 170, 0.14);
}

.game-date {
    font-size: 14px;

    margin-bottom: 15px;

    color: #68718a;
}


/* =========================
   경기 팀
========================= */

.game-team {

    display: flex;

    align-items: center;
    justify-content: center;

    gap: 15px;

    margin: 10px 0;

    color: #111936;
}

.game-team img {

    width: 45px;
    height: 45px;

    object-fit: contain;
}

.game-team span {

    font-size: 16px;

    font-weight: bold;

    color: #476aaa;
}


/* 현재 JSP에서는 img 없이 span만 사용하므로
   팀 이름 간격 유지 */

.game-team span:nth-child(2) {

    color: #8b93a8;

    font-size: 13px;
}


/* =========================
   경기장
========================= */

.game-place {

    font-size: 13px;

    margin: 15px 0;

    color: #69738d;
}


/* =========================
   예매 버튼
========================= */

.reserve-btn {

    width: 100px;
    height: 35px;

    background: #111936;

    color: white;

    border: 1px solid #111936;

    border-radius: 5px;

    cursor: pointer;

    transition: 0.2s ease;
}

.reserve-btn:hover {

    background: #476aaa;

    border-color: #476aaa;
}


/* =========================
   아래 3개 영역
========================= */

.bottom-content {

    width: 100%;

    display: flex;

    gap: 30px;
}


/* =========================
   최근 게시글
========================= */

.recent-board {

    width: 33%;
    height: 450px;

    padding: 25px;
}

.recent-header {

    display: flex;

    justify-content: space-between;
    align-items: center;

    margin-bottom: 15px;
}

.recent-header h2 {

    margin: 0;

    font-size: 22px;
    font-weight: 700;

    color: #111936;
}

.recent-more {

    border: none;

    background: none;

    font-size: 13px;

    color: #476aaa;

    cursor: pointer;

    padding: 0;
}

.recent-more:hover {
    color: #252f67;
}

.board-item {

    height: 40px;

    border-bottom: 1px solid #d6dceb;

    display: flex;

    align-items: center;

    font-size: 14px;

    color: #36405d;
}


/* =========================
   랭킹
========================= */

.ranking {

    width: 33%;
    height: 450px;

    padding: 25px;
}

.ranking h2 {

    text-align: center;

    margin: 0 0 20px 0;

    color: #111936;
}


/* =========================
   랭킹 탭
========================= */

.record-tabs {

    display: flex;

    justify-content: center;

    gap: 30px;

    border-bottom: 1px solid #d6dceb;

    margin-bottom: 15px;

    position: relative;

    z-index: 2;
}

.record-tab {

    position: relative;

    border: none;

    background: white;

    padding: 10px 8px;

    font-size: 15px;

    font-weight: 600;

    color: #8b93a8;

    cursor: pointer;
}

.record-tab:hover {
    color: #476aaa;
}

.record-tab.active {
    color: #111936;
}

.record-tab.active::after {

    content: "";

    position: absolute;

    left: 0;
    right: 0;

    bottom: -1px;

    height: 3px;

    background: #476aaa;

    border-radius: 3px 3px 0 0;
}


/* =========================
   랭킹 리스트
========================= */

.ranking-list {

    height: 260px;

    overflow-y: auto;
}

#hitter-ranking,
#pitcher-ranking {
    display: none;
}

.ranking-list div {

    height: 40px;

    border-bottom: 1px solid #d6dceb;

    display: flex;

    align-items: center;

    padding: 0 10px;
}

.ranking-list div:hover {
    background: #f5f7fc;
}


/* =========================
   팀 순위
========================= */

.team-ranking-item {

    height: 40px;

    border-bottom: 1px solid #d6dceb;

    display: flex;

    align-items: center;

    padding: 0 10px;
}

.team-ranking-item img {

    width: 28px;
    height: 28px;

    object-fit: contain;

    margin-right: 10px;
}

.team-ranking-item .rank {

    width: 25px;

    font-weight: bold;
}

.team-ranking-item .team {

    font-weight: 500;
}


/* =========================
   경기 일정
========================= */

.schedule {

    width: 33%;
    height: 450px;

    padding: 25px;

    display: flex;

    flex-direction: column;
}

.schedule h2 {

    text-align: center;

    margin: 0 0 20px 0;

    color: #111936;
}

.schedule-box {

    width: 100%;
    height: 55px;

    border-bottom: 1px solid #d6dceb;

    display: flex;

    align-items: center;

    padding: 0 10px;

    font-size: 13px;
}

.schedule-box:first-of-type {

    border-top: 1px solid #d6dceb;
}

.schedule-box:hover {
    background: #f3f6fc;
}

.schedule-date {

    width: 55px;

    font-weight: bold;
}

.schedule-team {

    flex: 1;

    display: flex;

    align-items: center;

    justify-content: center;

    gap: 5px;

    font-weight: 600;
}

.schedule-team img {

    width: 25px;
    height: 25px;

    object-fit: contain;
}

.schedule-team span {

    font-size: 13px;

    min-width: 28px;
}

.schedule-team b {

    font-size: 11px;

    color: #8b93a8;

    margin: 0 2px;
}

.schedule-time {

    width: 45px;

    text-align: right;

    font-size: 12px;

    color: #476aaa;
}


/* =========================
   더보기 버튼
========================= */

.more-btn {

    width: 100px;
    height: 35px;

    background: #111936;

    color: white;

    border: 1px solid #111936;

    border-radius: 5px;

    cursor: pointer;

    margin: auto auto 0 auto;

    transition: 0.2s ease;
}

.more-btn:hover {

    background: #476aaa;

    border-color: #476aaa;
}


/* =========================
   퀵 메뉴
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
   뉴스 / 아래 메뉴
========================= */

.bottom-menu {

    width: 1200px;

    margin: 30px auto 0;

    display: flex;

    flex-direction: row;

    align-items: stretch;

    gap: 30px;
}

.bottom-menu1,
.bottom-menu2 {

    width: calc(50% - 15px);

    height: 320px;

    flex-shrink: 0;

    border: 1px solid #d6dceb;

    border-radius: 12px;

    background: white;

    box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
}

.bottom-menu1 {
    padding: 25px 30px;
}

.bottom-menu2 {
    padding: 25px 30px;

    overflow: hidden;
}


/* =========================
   뉴스
========================= */

.news-box {
    box-sizing: border-box;

    overflow: hidden;
}

.news-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 15px;
}

.news-header h2 {

    margin: 0;

    font-size: 22px;

    font-weight: 700;

    color: #111936;
}

.news-more {

    border: none;

    background: none;

    font-size: 13px;

    color: #476aaa;

    cursor: pointer;

    padding: 0;
}

.news-more:hover {
    color: #252f67;
}

.news-list {

    display: flex;

    flex-direction: column;
}

.news-item {

    display: flex;

    align-items: center;

    gap: 10px;

    height: 43px;

    border-bottom: 1px solid #e4e7f0;

    font-size: 14px;
}

.news-item:last-child {
    border-bottom: none;
}

.news-category {

    flex-shrink: 0;

    width: 42px;

    padding: 4px 0;

    border-radius: 4px;

    border: 1px solid #b9c4de;

    background: #edf1fa;

    color: #111936;

    font-size: 11px;

    font-weight: 600;

    text-align: center;
}

.news-item p {

    flex: 1;

    margin: 0;

    color: #36405d;

    white-space: nowrap;

    overflow: hidden;

    text-overflow: ellipsis;

    cursor: pointer;
}

.news-item p:hover {
    color: #476aaa;
}

.news-date {

    flex-shrink: 0;

    color: #8c95a9;

    font-size: 11px;
}


/* =========================
   KBO 구단 볼거리
========================= */

.bottom-menu2 h5 {

    margin: 0 0 15px 0;

    color: #68718a;

    font-weight: normal;
}

.content-slider {

    position: relative;

    width: 100%;

    overflow: hidden;
}

.content-track {

    display: flex;

    gap: 12px;

    transition: transform 0.3s ease;
}

.content-card {

    flex: 0 0 calc((100% - 24px) / 3);

    min-width: 0;

    border: 1px solid #d6dceb;

    border-radius: 10px;

    overflow: hidden;

    background: white;

    box-shadow: 0 3px 10px rgba(17, 25, 54, 0.05);
}


/* =========================
   구단 공식 채널
========================= */

.team-channel {

    height: 130px;

    display: flex;

    flex-direction: column;

    align-items: center;

    justify-content: center;

    background: linear-gradient(
        135deg,
        #202b5c,
        #4b629b
    );

    color: white;
}

.team-channel img {

    width: 55px;
    height: 55px;

    object-fit: contain;

    margin-bottom: 8px;
}

.channel-team {

    font-size: 11px;

    margin-bottom: 3px;

    opacity: 0.85;
}

.team-channel strong {
    font-size: 15px;
}


/* =========================
   구단 카드 내용
========================= */

.content-info {

    height: 60px;

    padding: 9px 10px 10px;

    display: flex;

    align-items: center;

    justify-content: space-between;

    gap: 5px;
}

.content-info span {

    flex: 1;

    min-width: 0;

    font-size: 10px;

    color: #8a93a8;

    white-space: nowrap;

    overflow: hidden;

    text-overflow: ellipsis;
}

.content-info button {

    flex-shrink: 0;

    width: 58px;
    height: 24px;

    padding: 0;

    border: 1px solid #c7cee0;

    border-radius: 5px;

    background: white;

    color: #111936;

    font-size: 8px;

    cursor: pointer;

    white-space: nowrap;
}

.content-info button:hover {
    background: #edf1fa;
}


/* =========================
   슬라이더 버튼
========================= */

.slide-btn {

    position: absolute;

    top: 45%;

    transform: translateY(-50%);

    width: 30px;
    height: 30px;

    border: 1px solid #c7cee0;

    border-radius: 50%;

    background: white;

    color: #111936;

    font-size: 20px;

    display: flex;

    align-items: center;
    justify-content: center;

    cursor: pointer;

    z-index: 5;

    box-shadow: 0 3px 10px rgba(17, 25, 54, 0.08);
}

.prev-btn {
    left: 5px;
}

.next-btn {
    right: 5px;
}

.slide-btn:hover {
    background: #edf1fa;
}


/* =========================
   팀 이름
========================= */

.team-name {

    position: absolute;

    top: 7px;
    left: 7px;

    padding: 4px 6px;

    background: rgba(8, 12, 30, 0.55);

    color: white;

    font-size: 10px;

    font-weight: bold;

    border-radius: 4px;
}


/* =========================
   경기 팝업
========================= */

.game-popup {

    display: none;

    position: fixed;

    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    background: rgba(7, 11, 28, 0.72);

    justify-content: center;
    align-items: center;

    z-index: 2000;
}

.popup-content {

    width: 400px;

    padding: 30px;

    background: white;

    border: 1px solid #aeb8d2;

    border-radius: 12px;

    box-shadow: 0 15px 45px rgba(0, 0, 0, 0.25);

    position: relative;

    text-align: center;
}

.popup-content h2 {

    margin-top: 0;

    margin-bottom: 25px;

    color: #111936;
}

.popup-content div {
    margin: 15px 0;
}

#popup-team {

    font-size: 22px;

    font-weight: bold;

    color: #476aaa;
}

.popup-close {

    position: absolute;

    top: 10px;
    right: 15px;

    border: none;

    background: none;

    font-size: 25px;

    cursor: pointer;

    color: #111936;
}


/* =========================
   경기 상세 정보
========================= */

.game-info {

    display: none;

    width: 100%;

    margin-top: 15px;

    padding: 20px 25px;

    background: #f5f7fc;

    border: 1px solid #d6dceb;

    border-radius: 10px;

    color: #18213f;
}

.game-info.show {
    display: block;
}

#info-team {

    font-size: 20px;

    font-weight: bold;

    color: #476aaa;

    margin-bottom: 10px;
}

#info-date,
#info-time,
#info-place {

    font-size: 14px;

    margin: 5px 0;
}


/* =========================
   FOOTER
========================= */

.footer {

    width: 100%;

    height: 70px;

    margin-top: 0;

    background: #eef1f8;

    color: #252f67;

    display: flex;

    justify-content: center;
    align-items: center;

    font-size: 13px;

    border: none;
}

.footer a {

    text-decoration: none;

    color: #3b4778;
}

.footer a:hover {
    color: #6079b4;
}


/* =========================
   스크롤바
========================= */

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
</style>
<body>

	<!-- HEADER -->
	<div class="header">

		<div class="logo">YA900</div>

		<!-- 메인 메뉴 -->
		<nav class="main-menu">

			<!-- 야구 -->
			<div class="menu-item">
				<a href="#">야구</a>

				<div class="sub-menu">
					<a href="#">예매</a> <a href="#">경기일정</a> <a href="#">팀순위</a> <a
						href="#">선수순위</a> <a href="#">게시판</a>
				</div>
			</div>

			<!-- 축구 -->
			<div class="menu-item">
				<a href="#">축구</a>

				<div class="sub-menu">
					<a href="#">예매</a> <a href="#">경기일정</a> <a href="#">팀순위</a> <a
						href="#">선수순위</a> <a href="#">게시판</a>
				</div>
			</div>

			<!-- 미니게임 -->
			<div class="menu-item">
				<a href="#">미니게임</a>

				<div class="sub-menu">
					<a href="#">상식 퀴즈</a> <a href="#">OX 퀴즈</a> <a href="#">승부예측</a> <a
						href="#">게임 랭킹</a>
				</div>
			</div>
		</nav>

		<div class="member-menu">
			<button class="login-btn" onclick="location.href='login'">로그인</button>
			<button class="sign-btn" onclick="location.href='signup'">회원가입</button>
		</div>

	</div>


	<!-- BANNER -->
	<div class="banner">

		<div class="banner-slide"></div>
		<div class="banner-slide"></div>
		<div class="banner-slide"></div>
		<div class="banner-slide"></div>
		<div class="banner-slide"></div>

		<h1>대충 간지나는 말 어쩌구 저쩌구</h1>

	</div>


	<!-- 예매 + 팀 순위 -->
	<div class="main-content">

		<!-- 예매하기 -->
		<div class="reservation">

			<h2>예매</h2>

			<div class="game-area">

				<div class="game-list">

					<c:forEach var="game" items="${scheduleList}">

						<div class="game-card"
							onclick="showGame(
                 '<fmt:formatDate value="${game.start_date}" pattern="MM.dd (E)"/>',
                 '${game.away_team} VS ${game.home_team}',
                 '<fmt:formatDate value="${game.start_date}" pattern="HH:mm"/>',
                 '${game.location}'
             )">

							<div class="game-date">
								<fmt:formatDate value="${game.start_date}"
									pattern="MM.dd (E) HH:mm" />
							</div>

							<div class="game-team">
								<span>${game.away_team}</span> <span>VS</span> <span>${game.home_team}</span>
							</div>

							<div class="game-place">${game.location}</div>

							<button type="button" class="reserve-btn"
								onclick="openBooking(event, '${pageContext.request.contextPath}/booking/${game.game_id}')">
								예매하기</button>

						</div>

					</c:forEach>

				</div>

			</div>

			<div id="game-info" class="game-info">
				<div id="info-date"></div>
				<div id="info-team"></div>
				<div id="info-time"></div>
				<div id="info-place"></div>
			</div>

		</div>

		<div class="bottom-content">
			<!-- 최근 게시글 -->
			<div class="recent-board">
				<div class="recent-header">
					<h2>최근 게시글</h2>
					<button class="recent-more"
						onclick="location.href='${pageContext.request.contextPath}/board/detail?cpage=1">더보기
						→</button>
				</div>


				<div class="board-item">야구장 처음 가는데 좌석 추천해주세요</div>

				<div class="board-item">이번 주 경기 보러 가시는 분?</div>

				<div class="board-item">응원가 추천해주세요!</div>

				<div class="board-item">티켓 양도합니다</div>

				<div class="board-item">이번 경기 라인업 어떻게 생각하세요?</div>

				<div class="board-item">저희 팀 가을야구 갈 수 있을까요...ㅠ</div>

				<div class="board-item">오늘 감독의 촉이 좀 안좋았던것 같아요.</div>

				<div class="board-item">해체 기원 좀</div>
			</div>

			<!-- 팀 순위 -->
			<div class="ranking">

				<h2>랭킹</h2>

				<div class="record-tabs">
					<button class="record-tab active"
						onclick="showRanking('team', this)">팀</button>
					<button class="record-tab" onclick="showRanking('hitter', this)">타자</button>
					<button class="record-tab" onclick="showRanking('pitcher', this)">투수</button>
				</div>

				<div id="team-ranking" class="ranking-list">

					<div class="team-ranking-item">
						<span class="rank">1</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/kt.png"
							alt="KT"> <span class="team">KT 위즈</span>
					</div>

					<div class="team-ranking-item">
						<span class="rank">2</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/samsung.png"
							alt="삼성"> <span class="team">삼성 라이온즈</span>
					</div>

					<div class="team-ranking-item">
						<span class="rank">3</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/lg.png"
							alt="LG"> <span class="team">LG 트윈스</span>
					</div>

					<div class="team-ranking-item">
						<span class="rank">4</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/kia.png"
							alt="KIA"> <span class="team">KIA 타이거즈</span>
					</div>

					<div class="team-ranking-item">
						<span class="rank">5</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/doosan.png"
							alt="두산"> <span class="team">두산 베어스</span>
					</div>

					<div class="team-ranking-item">
						<span class="rank">6</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/nc.png"
							alt="NC"> <span class="team">NC 다이노스</span>
					</div>

					<div class="team-ranking-item">
						<span class="rank">9</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/lotte.png"
							alt="롯데"> <span class="team">롯데 자이언츠</span>
					</div>

					<div class="team-ranking-item">
						<span class="rank">7</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/ssg.png"
							alt="SSG"> <span class="team">SSG 랜더스</span>
					</div>

					<div class="team-ranking-item">
						<span class="rank">8</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/hanhwa.png"
							alt="한화"> <span class="team">한화 이글스</span>
					</div>

					<div class="team-ranking-item">
						<span class="rank">10</span> <img
							src="${pageContext.request.contextPath}/resources/images/team/kiwoom.png"
							alt="키움"> <span class="team">키움 히어로즈</span>
					</div>

				</div>

				<div id="hitter-ranking" class="ranking-list">

					<c:forEach var="player" items="${hitterRanking}" varStatus="status">

						<div>${status.count} ${player.player_name}
							(${player.player_team})</div>

					</c:forEach>

				</div>

				<div id="pitcher-ranking" class="ranking-list">

				    <c:forEach var="player" items="${pitcherRanking}" varStatus="status">
				
				        <div>
				            ${status.index + 1}
				            ${player.player_name}
				            (${player.player_team})
				        </div>
				
				    </c:forEach>
				
				</div>

			</div>

			<div class="schedule">

				<h2>경기 일정</h2>

				<c:forEach var="game" items="${scheduleList}" begin="0" end="4">

					<div class="schedule-box">

						<div class="schedule-date">
							<fmt:formatDate value="${game.start_date}" pattern="MM.dd(E)" />
						</div>

						<div class="schedule-team">

							<span>${game.away_team}</span> <b>VS</b> <span>${game.home_team}</span>

						</div>

						<div class="schedule-time">
							<fmt:formatDate value="${game.start_date}" pattern="HH:mm" />
						</div>

					</div>

				</c:forEach>

				<button type="button" class="more-btn">더보기</button>

			</div>
		</div>

		<!-- 오른쪽 퀵메뉴 -->
		<div class="quick-menu">
			<div class="menu">QUICK MENU</div>
			<div>홈</div>
			<div>예매</div>
			<div>승부예측</div>
			<div>야구 상식퀴즈</div>
			<div>마이페이지</div>

		</div>

		<div class="bottom-menu">

			<div class="bottom-menu1 news-box">

				<div class="news-header">
					<h2>오늘의 야구 뉴스</h2>
					<button class="news-more">더보기 →</button>
				</div>

				<div class="news-list">

					<div class="news-item">
						<span class="news-category">경기</span>
						<p>오늘 경기 주요 이슈를 한눈에 확인하세요.</p>
						<span class="news-date">09.18</span>
					</div>

					<div class="news-item">
						<span class="news-category">구단</span>
						<p>구단별 최신 소식과 경기 정보를 확인하세요.</p>
						<span class="news-date">09.18</span>
					</div>

					<div class="news-item">
						<span class="news-category">선수</span>
						<p>오늘 경기에서 주목할 선수는 누구일까요?</p>
						<span class="news-date">09.18</span>
					</div>

					<div class="news-item">
						<span class="news-category">야구</span>
						<p>오늘의 야구 관련 주요 소식을 만나보세요.</p>
						<span class="news-date">09.17</span>
					</div>

					<div class="news-item">
						<span class="news-category">이슈</span>
						<p>이번 주 야구계에서 화제가 된 소식을 확인하세요.</p>
						<span class="news-date">09.17</span>
					</div>

				</div>

			</div>


			<div class="bottom-menu2">

				<div class="news-header">
					<h2>KBO 구단 공식 채널</h2>
				</div>

				<h5>각 구단의 공식 채널에서 다양한 콘텐츠를 만나보세요</h5>

				<div class="content-slider">

					<button type="button" class="slide-btn prev-btn">‹</button>

					<div class="content-track">

						<!-- KT -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/kt.png"
									alt="KT"> <span class="channel-team">KT 위즈</span> <strong>WIZ
									TV</strong>
							</div>
							<div class="content-info">
								<span>KT 위즈 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@ktwiztv', '_blank')">
									YouTube →</button>
							</div>
						</div>

						<!-- 삼성 -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/samsung.png"
									alt="삼성"> <span class="channel-team">삼성 라이온즈</span> <strong>LIONS
									TV</strong>
							</div>
							<div class="content-info">
								<span>삼성 라이온즈 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@lionstv1982', '_blank')">
									YouTube →</button>
							</div>
						</div>

						<!-- LG -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/lg.png"
									alt="LG"> <span class="channel-team">LG 트윈스</span> <strong>TWINS
									TV</strong>
							</div>
							<div class="content-info">
								<span>LG 트윈스 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@LGTwinsTV', '_blank')">
									YouTube →</button>
							</div>
						</div>

						<!-- KIA -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/kia.png"
									alt="KIA"> <span class="channel-team">KIA 타이거즈</span> <strong>KIA
									TV</strong>
							</div>
							<div class="content-info">
								<span>KIA 타이거즈 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@kiatigerstv', '_blank')">
									YouTube →</button>
							</div>
						</div>

						<!-- 두산 -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/doosan.png"
									alt="두산"> <span class="channel-team">두산 베어스</span> <strong>BEARS
									TV</strong>
							</div>
							<div class="content-info">
								<span>두산 베어스 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@bearstv1982', '_blank')">
									YouTube →</button>
							</div>
						</div>

						<!-- NC -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/nc.png"
									alt="NC"> <span class="channel-team">NC 다이노스</span> <strong>다이노스
									TV</strong>
							</div>
							<div class="content-info">
								<span>NC 다이노스 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@ncdinos', '_blank')">
									YouTube →</button>
							</div>
						</div>

						<!-- 롯데 -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/lotte.png"
									alt="롯데"> <span class="channel-team">롯데 자이언츠</span> <strong>자이언츠
									TV</strong>
							</div>
							<div class="content-info">
								<span>롯데 자이언츠 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@giantstv', '_blank')">
									YouTube →</button>
							</div>
						</div>

						<!-- SSG -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/ssg.png"
									alt="SSG"> <span class="channel-team">SSG 랜더스</span> <strong>LANDERS
									TV</strong>
							</div>
							<div class="content-info">
								<span>SSG 랜더스 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@SSGlanders', '_blank')">
									YouTube →</button>
							</div>
						</div>

						<!-- 한화 -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/hanhwa.png"
									alt="한화"> <span class="channel-team">한화 이글스</span> <strong>EAGLES
									TV</strong>
							</div>
							<div class="content-info">
								<span>한화 이글스 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@HanwhaEagles_official', '_blank')">
									YouTube →</button>
							</div>
						</div>

						<!-- 키움 -->
						<div class="content-card">
							<div class="team-channel">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/kiwoom.png"
									alt="키움"> <span class="channel-team">키움 히어로즈</span> <strong>히어로즈
									TV</strong>
							</div>
							<div class="content-info">
								<span>키움 히어로즈 공식 채널</span>
								<button type="button"
									onclick="window.open('https://www.youtube.com/@heroesbaseballclub', '_blank')">
									YouTube →</button>
							</div>
						</div>
					</div>

					<button type="button" class="slide-btn next-btn">›</button>

				</div>
			</div>

		</div>

		<!-- FOOTER -->
		<div class="footer">

			<a href="${pageContext.request.contextPath}/admin">개인정보처리방침 </a>|<a
				href="${pageContext.request.contextPath}/admin"> 전체 서비스 </a>|<a
				href="${pageContext.request.contextPath}/admin"> 문제 신고 </a>|<a
				href="${pageContext.request.contextPath}/admin"> 고객센터</a>

		</div>
</body>

<script>

function showRanking(type, button) {

    document.getElementById("team-ranking").style.display = "none";
    document.getElementById("hitter-ranking").style.display = "none";
    document.getElementById("pitcher-ranking").style.display = "none";


    if(type == "team") {
        document.getElementById("team-ranking").style.display = "block";
    }

    else if(type == "hitter") {
        document.getElementById("hitter-ranking").style.display = "block";
    }

    else if(type == "pitcher") {
        document.getElementById("pitcher-ranking").style.display = "block";
    }


    // 기존 active 제거
    document.querySelectorAll(".record-tab").forEach(function(tab) {
        tab.classList.remove("active");
    });

    // 클릭한 버튼에 active 추가
    button.classList.add("active");
}

const gameList = document.querySelector(".game-list");

gameList.addEventListener("wheel", function(e) {
    e.preventDefault();
    gameList.scrollLeft += e.deltaY;
});

let selectedGame = null;

function showGame(date, team, time, place) {

    const gameInfo = document.getElementById("game-info");

    // 같은 카드를 다시 클릭한 경우 → 닫기
    if (selectedGame === team) {
        gameInfo.classList.remove("show");
        selectedGame = null;
        return;
    }

    // 다른 카드를 클릭한 경우 → 내용 변경 후 표시
    document.getElementById("info-date").innerText = date;
    document.getElementById("info-team").innerText = team;
    document.getElementById("info-time").innerText = time;
    document.getElementById("info-place").innerText = place;

    gameInfo.classList.add("show");

    selectedGame = team;
}

function openBooking(event, page) {
    event.stopPropagation();

    const width = 1000;
    const height = 600;

    const left = (screen.width - width) / 2;
    const top = (screen.height - height) / 2;

    window.open(
        page,
        '_blank',
        `width=${width},height=${height},left=${left},top=${top},scrollbars=no,resizable=yes`
    );
}

/* KBO 구단 볼거리 슬라이더 */

const contentTrack = document.querySelector(".content-track");
const contentCards = document.querySelectorAll(".content-card");

const contentPrev = document.querySelector(".prev-btn");
const contentNext = document.querySelector(".next-btn");

let contentIndex = 0;

function moveContentSlider() {

    const cardWidth = contentCards[0].offsetWidth + 12;

    const maxIndex = contentCards.length - 3;

    if (contentIndex < 0) {
        contentIndex = 0;
    }

    if (contentIndex > maxIndex) {
        contentIndex = maxIndex;
    }

    contentTrack.style.transform =
        "translateX(-" + (contentIndex * cardWidth) + "px)";
}


contentNext.addEventListener("click", function() {

    contentIndex++;

    moveContentSlider();

});


contentPrev.addEventListener("click", function() {

    contentIndex--;

    moveContentSlider();

});
document.querySelector(".more-btn").onclick = function () {
    location.href = "${pageContext.request.contextPath}/schedule/schedule";
}

</script>
</html>