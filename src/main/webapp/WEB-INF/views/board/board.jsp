<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="teamTheme" value="default" />

<c:choose>
	<c:when test="${param.team eq '두산'}">
		<c:set var="teamTheme" value="doosan" />
	</c:when>
	<c:when test="${param.team eq 'LG'}">
		<c:set var="teamTheme" value="lg" />
	</c:when>
	<c:when test="${param.team eq 'KIA'}">
		<c:set var="teamTheme" value="kia" />
	</c:when>
	<c:when test="${param.team eq '삼성'}">
		<c:set var="teamTheme" value="samsung" />
	</c:when>
	<c:when test="${param.team eq 'SSG'}">
		<c:set var="teamTheme" value="ssg" />
	</c:when>
	<c:when test="${param.team eq 'KT'}">
		<c:set var="teamTheme" value="kt" />
	</c:when>
	<c:when test="${param.team eq '롯데'}">
		<c:set var="teamTheme" value="lotte" />
	</c:when>
	<c:when test="${param.team eq '한화'}">
		<c:set var="teamTheme" value="hanwha" />
	</c:when>
	<c:when test="${param.team eq 'NC'}">
		<c:set var="teamTheme" value="nc" />
	</c:when>
	<c:when test="${param.team eq '키움'}">
		<c:set var="teamTheme" value="kiwoom" />
	</c:when>
</c:choose>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<title>자유게시판</title>

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

.login-btn, .sign-btn {
	border: 1px solid #7180b1;
	background: transparent;
	color: white;
	border-radius: 5px;
	padding: 6px 10px;
	cursor: pointer;
	white-space: nowrap;
	transition: 0.2s ease;
}

.login-btn:hover, .sign-btn:hover {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

/* =========================
   게시판 전체
========================= */
.container {
	width: 1200px;
	margin: 50px auto 80px;
}

/*
 * 기존에는
 * board-header / body / footer
 * 각각 별도의 박스로 되어 있었음.
 *
 * 이제 container 안에서 하나의 카드처럼 보이게 함.
 */
.board-header, .body, .footer {
	width: 100%;
	background: #ffffff;
	border: none;
	border-radius: 0;
	box-shadow: none;
	margin: 0;
}

/* 게시판 전체의 첫 번째 영역 */
.board-header {
	border-radius: 12px 12px 0 0;
	overflow: visible;
	position: relative;
	z-index: 10;
}

.board-title-dropdown {
	position: relative;
	z-index: 20;
}

.board-dropdown-menu {
	position: absolute;
	top: 80px;
	left: 30px;
	width: 320px;
	max-height: 360px;
	overflow-y: auto;
	background: #fff;
	border: 1px solid #d6dceb;
	border-radius: 10px;
	box-shadow: 0 8px 24px rgba(11, 16, 38, 0.15);
	grid-template-columns: repeat(3, minmax(0, 1fr));
	gap: 6px;
	z-index: 1001;
}

/* =========================
   게시판 제목
========================= */
.title {
	width: 100%;
	height: 110px;
	display: flex;
	align-items: center;
	padding: 0 30px;
	background: #ffffff;
	border-bottom: 1px solid #d6dceb;
}

.title h1 {
	margin: 0;
	font-size: 26px;
	font-weight: 700;
	color: #111936;
}

/* =========================
   검색
========================= */
.search {
	width: 100%;
	height: 75px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 0 30px;
	background: #ffffff;
	border-bottom: 1px solid #d6dceb;
}

.search form {
	display: flex;
	align-items: center;
	gap: 8px;
}

.search select {
	width: 100px;
	height: 38px;
	padding: 0 10px;
	border: 1px solid #d6dceb;
	border-radius: 5px;
	background: #ffffff;
	font-size: 14px;
	color: #36405d;
}

.search input[type="text"] {
	width: 400px;
	height: 38px;
	padding: 0 14px;
	border: 1px solid #d6dceb;
	border-radius: 5px;
	background: #ffffff;
	font-size: 14px;
	color: #36405d;
}

.search input[type="text"]:focus {
	outline: none;
	border-color: #476aaa;
}

.search button {
	width: 75px;
	height: 38px;
	border: none;
	border-radius: 5px;
	background: #111936;
	color: white;
	font-size: 14px;
	cursor: pointer;
	transition: 0.2s ease;
}

.search button:hover {
	background: #476aaa;
}

/* =========================
   게시판
========================= */
.body {
	overflow: hidden;
}

.body table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

/* 테이블 헤더 */
.body table tr:first-child {
	height: 55px;
	background: #f5f7fc;
	color: #36405d;
	font-weight: bold;
	border-bottom: 1px solid #d6dceb;
}

.body table tr:first-child td {
	font-size: 14px;
}

/* 게시글 */
.body table tr:not(:first-child) {
	height: 62px;
	border-bottom: 1px solid #edf0f5;
	background: #ffffff;
	transition: background-color 0.15s ease;
}

.body table tr:not(:first-child):hover {
	background: #f8f9fc;
}

/* 테이블 */
.body table td {
	padding: 0 18px;
	text-align: center;
	font-size: 14px;
	color: #68718a;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

/* 컬럼 */
.body table td:nth-child(1) {
	width: 10%;
}

.body table td:nth-child(2) {
	width: 50%;
	text-align: left;
}

.body table td:nth-child(3) {
	width: 15%;
}

.body table td:nth-child(4) {
	width: 15%;
}

.body table td:nth-child(5) {
	width: 10%;
}

/* 제목 링크 */
.body table a {
	color: #36405d;
	text-decoration: none;
	font-weight: 500;
}

.body table a:hover {
	color: #476aaa;
	text-decoration: none;
}

/* 게시글 없음 */
.body table tr:last-child td[colspan] {
	height: 250px;
	color: #8b93a8;
	text-align: center;
}

/* =========================
   하단
========================= */
.footer {
	height: 80px;
	display: flex;
	align-items: center;
	background: #ffffff;
	border-radius: 0 0 12px 12px;
	border-top: 1px solid #d6dceb;
}

/* 페이지 */
.navi {
	width: 90%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.navi a {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	min-width: 30px;
	height: 30px;
	margin: 0 2px;
	color: #68718a;
	text-decoration: none;
	font-size: 14px;
	border-radius: 5px;
	transition: 0.15s ease;
}

.navi a:hover {
	background: #111936;
	color: white;
}

/* 글쓰기 */
.write {
	width: 10%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.write button {
	width: 90px;
	height: 38px;
	border: none;
	border-radius: 5px;
	background: #111936;
	color: white;
	font-size: 14px;
	cursor: pointer;
	transition: 0.2s ease;
}

.write button:hover {
	background: #476aaa;
}

/* =========================
   기타
========================= */
.logo:hover {
	cursor: pointer;
}

.header>.logo:hover {
	cursor: pointer;
}

.container>.footer>.navi a {
	font-size: 14pt;
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

.quick-menu .menu, .quick-menu .menu:hover {
	background: #476aaa;
	color: white;
}

.header>.logo:hover {
	cursor: pointer;
}

/* 게시판 제목과 드롭다운 */
.board-title-dropdown {
	position: relative;
	gap: 10px;
}

.board-dropdown-btn {
	border: none;
	background: transparent;
	color: #c5cbd2;
	font-size: 15px;
	cursor: pointer;
	padding: 8px;
	transition: transform 0.2s ease;
}

.board-dropdown-btn:hover {
	color: #476aaa;
}

.board-dropdown-menu {
	display: none;
	position: absolute;
	top: 80px;
	left: 30px;
	width: 320px;
	padding: 12px;
	background: #fff;
	border: 1px solid #d6dceb;
	border-radius: 10px;
	box-shadow: 0 8px 24px rgba(11, 16, 38, 0.15);
	grid-template-columns: repeat(3, minmax(0, 1fr));
	gap: 6px;
	z-index: 1001;
}

.board-dropdown-menu.show {
	display: grid;
}

.team-item {
	min-width: 0;
	min-height: 90px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	gap: 6px;
	padding: 8px 2px;
	border-radius: 8px;
	color: #18213f;
	text-decoration: none;
	font-size: 12px;
	cursor: default;
}

a.team-item {
	cursor: pointer;
}

.team-item:hover {
	background: #f2f5fb;
}

.team-item img {
	width: 46px;
	height: 46px;
	object-fit: contain;
}

.team-item span {
	white-space: nowrap;
}

/* ===== 팀별 바깥 배경 그라데이션 ===== */

/* 전체 게시판: 기존 네이비 그라데이션 유지 */
body.theme-default {
	background: linear-gradient(to bottom, #111936 0%, #111936 15%, #0b1026 25%, #171f46
		35%, #252f67 48%, #71809f 65%, #aeb7ca 76%, #d5dae5 86%, #eef1f8 100%);
}

/* 두산 베어스: 네이비 → 블루 그레이 */
body.theme-doosan {
	background: linear-gradient(to bottom, #07152e 0%, #10264b 25%, #234574 45%, #8298b8
		68%, #dce5f2 88%, #f4f7fc 100%);
}

/* LG 트윈스: 딥 레드 → 핑크 */
body.theme-lg {
	background: linear-gradient(to bottom, #350813 0%, #8b1029 25%, #c8102e 43%, #e68a9a
		65%, #f8dce2 85%, #fff5f6 100%);
}

/* KIA 타이거즈: 다크 레드 → 크림 */
body.theme-kia {
	background: linear-gradient(to bottom, #30050b 0%, #7c0c19 25%, #c8102e 43%, #df8790
		65%, #f5dfe0 85%, #fff7f5 100%);
}

/* 삼성 라이온즈: 딥 블루 → 스카이 블루 */
body.theme-samsung {
	background: linear-gradient(to bottom, #061a3b 0%, #074ca1 28%, #247bd0 45%, #8bbce9
		68%, #dcecff 87%, #f5f9ff 100%);
}

/* SSG 랜더스: 블랙 → 실버 */
body.theme-ssg {
	background: linear-gradient(to bottom, #101010 0%, #292929 25%, #555b65 45%, #a8afb9
		68%, #e1e4e9 87%, #f8f9fb 100%);
}

/* KT 위즈: 블랙 → 그레이 */
body.theme-kt {
	background: linear-gradient(to bottom, #090909 0%, #202020 28%, #454545 48%, #999999
		70%, #dedede 88%, #f7f7f7 100%);
}

/* 롯데 자이언츠: 딥 네이비 → 레드 */
body.theme-lotte {
	background: linear-gradient(to bottom, #08162c 0%, #172e50 25%, #9e1830 45%, #df7b88
		67%, #f3dce0 87%, #fff7f7 100%);
}

/* 한화 이글스: 다크 오렌지 → 크림 */
body.theme-hanwha {
	background: linear-gradient(to bottom, #35170c 0%, #9d3c15 25%, #f15a24 43%, #f3a477
		66%, #fbe6d5 86%, #fff9f3 100%);
}

/* NC 다이노스: 딥 청록 → 민트 → 밝은 청록 */
body.theme-nc {
	background: linear-gradient(to bottom, #092b30 0%, #07545b 25%, #008c95 43%, #65bfc1
		65%, #c5e7e5 85%, #f2fbfa 100%);
}

/* 키움 히어로즈: 버건디 → 라이트 핑크 */
body.theme-kiwoom {
	background: linear-gradient(to bottom, #24000c 0%, #57001c 25%, #820024 43%, #bd718b
		66%, #ead4dd 87%, #fcf5f8 100%);
}

.team-logo {
	display: inline-flex;
	algin-itmes: center;
	justify-content: center;
	width: 40px;
	height: 40px;
	font-size: 28px;
}
</style>
</head>
<body class="theme-${teamTheme}">
	<!-- HEADER -->
	<div class="header">

		<div class="logo" onclick="location.href='/'">YA900</div>

		<!-- 메인 메뉴 -->
		<nav class="main-menu">

			<!-- 야구 -->
			<div class="menu-item">
				<a href="#">야구</a>

				<div class="sub-menu">
					<a href="#">예매</a> <a
						href="${pageContext.request.contextPath}/schedule/schedule">경기일정</a>
					<a href="${pageContext.request.contextPath}/schedule/rankdetail">팀순위</a>
					<a href="#">선수순위</a> <a
						href="${pageContext.request.contextPath}/board/board?cpage=1">게시판</a>
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

			<c:choose>

				<c:when test="${not empty sessionScope.id}">
					<span>${sessionScope.id}님</span>

					<button class="login-btn"
						onclick="location.href='${pageContext.request.contextPath}/mypage'">
						마이페이지</button>

					<form action="${pageContext.request.contextPath}/logout"
						method="post">
						<button type="submit" class="sign-btn">로그아웃</button>
					</form>
				</c:when>

				<c:otherwise>
					<button class="login-btn"
						onclick="location.href='${pageContext.request.contextPath}/login'">
						로그인</button>

					<button class="sign-btn"
						onclick="location.href='${pageContext.request.contextPath}/signup'">
						회원가입</button>
				</c:otherwise>

			</c:choose>


		</div>

	</div>
	<!-- 오른쪽 퀵메뉴 -->
	<div class="quick-menu">
		<div class="menu">QUICK MENU</div>
		<div onclick="location.href='${pageContext.request.contextPath}/'">홈</div>
		<div
			onclick="location.href='${pageContext.request.contextPath}/#reservation'">예매</div>
		<div
			onclick="location.href='${pageContext.request.contextPath}/board/board?cpage=1'">게시판</div>
		<div>마이페이지</div>
	</div>
	<div class="container">
		<div class="board-header">
			<div class="title board-title-dropdown">
				<h1>
					<c:choose>
						<c:when test="${empty param.team}">
			            전체 게시판
			        </c:when>
						<c:otherwise>
			            ${param.team} 게시판
			        </c:otherwise>
					</c:choose>
				</h1>

				<button type="button" id="boardDropdownBtn"
					class="board-dropdown-btn" aria-label="팀 게시판 선택"
					aria-expanded="false">▼</button>

				<div id="boardDropdownMenu" class="board-dropdown-menu">

					<a class="team-item"
						href="${pageContext.request.contextPath}/board/board?cpage=1">
						<span style="font-size: 32px;">⚾</span> <span>전체 게시판</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=두산&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/doosan.png"
						alt="두산 베어스"> <span>두산 베어스</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=LG&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/lg.png"
						alt="LG 트윈스"> <span>LG 트윈스</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=KIA&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/kia.png"
						alt="KIA 타이거즈"> <span>KIA 타이거즈</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=삼성&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/samsung.png"
						alt="삼성 라이온즈"> <span>삼성 라이온즈</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=SSG&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/ssg.png"
						alt="SSG 랜더스"> <span>SSG 랜더스</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=KT&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/kt.png"
						alt="KT 위즈"> <span>KT 위즈</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=롯데&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/lotte.png"
						alt="롯데 자이언츠"> <span>롯데 자이언츠</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=한화&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/hanhwa.png"
						alt="한화 이글스"> <span>한화 이글스</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=NC&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/nc.png"
						alt="NC 다이노스"> <span>NC 다이노스</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board?team=키움&cpage=1">
						<img
						src="${pageContext.request.contextPath}/resources/images/team/kiwoom.png"
						alt="키움 히어로즈"> <span>키움 히어로즈</span>
					</a> <a class="team-item"
						href="${pageContext.request.contextPath}/board/board/"> <span
						class="team-logo">🗨️</span> <span>문의 게시판</span>
					</a>
				</div>
			</div>

			<div class="search">
				<form action="/board/search" method="post">
					<select id="select">
						<option>제목</option>
						<option>내용</option>
						<option>글쓴이</option>
					</select> <input type="text" name="search" placeholder="검색할 게시글의 제목을 입력하세요">
					<input id="option" type="hidden" name="option"> <input
						type="hidden" name="cpage" value="1">
					<button type="submit">검색</button>
				</form>
			</div>
		</div>
		<div class="body">
			<table>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회</td>
				</tr>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="i" items="${list}">
							<tr>
								<td>${i.board_seq}</td>
								<td><a href="/board/detail?seq=${i.board_seq}">
										${i.title} </a></td>
								<td>${i.writer}</td>
								<td>${i.write_date}</td>
								<td>${i.view_count}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div class="footer">
			<div class="navi"></div>
			<div class="write">
				<button id="write">글쓰기</button>
			</div>
		</div>
	</div>
	<script>
let recordTotalCount = ${recordTotalCount};
let recordCountPerPage = ${recordCountPerPage};
let naviCountPerPage = ${naviCountPerPage};
let currentPage = ${cpage};
let isSearch = ${isSearch};
let option = "${option}";
let search = "${search}";
let pageTotalCount =
	Math.ceil(recordTotalCount / recordCountPerPage);

let startNavi =
	Math.floor((currentPage - 1) / naviCountPerPage)
	* naviCountPerPage + 1;

let endNavi =
	startNavi + naviCountPerPage - 1;

if (endNavi > pageTotalCount) {
	endNavi = pageTotalCount;
}

if (currentPage > pageTotalCount) {
	currentPage = pageTotalCount;
}

let needPrev = startNavi > 1;
let needNext = endNavi < pageTotalCount;

let navi =
	document.querySelector(".navi");

let first = document.createElement("a");
if(isSearch==false) {
	first.setAttribute("href", "/board/board?cpage=1");
		} else {first.setAttribute("href", "/board/search?option=" + option + "&search=" + search + "&cpage=1");
				}

first.innerHTML = "<<";
navi.append(first);

if (needPrev) { 
	let prev = document.createElement("a"); 
	
	if (isSearch == false) { 
		prev.setAttribute( 
			"href", 
			"/board/board?cpage=" 
			+ (currentPage - naviCountPerPage)
		); 
	} else { 
		prev.setAttribute( 
			"href", 
			"/board/search?option=" + option 
			+ "&search=" + search 
			+ "&cpage=" 
			+ (currentPage - naviCountPerPage)
		); 
	} 
	
	prev.innerHTML = "<"; 
	navi.append(prev); 
}

for (let i = startNavi; i <= endNavi; i++) {
	let num = document.createElement("a");
	if(isSearch==false) {
	num.setAttribute("href", "/board/board?cpage=" + i);
	num.innerHTML = i;
	navi.append(num);
	} else {
		num.setAttribute("href", "/board/search?option=" + option + "&search=" + search + "&cpage=" + i);
		num.innerHTML = i;
		navi.append(num);
	}
}

if (needNext) {
	let next = document.createElement("a");
	if(isSearch==false) {
	next.setAttribute("href", "/board/board?cpage=" + (currentPage + naviCountPerPage));
	} else {
		next.setAttribute("href", "/board/search?option=" + option + "&search=" + search + "&cpage=" + (currentPage + naviCountPerPage));
	}
	next.innerHTML = ">";
	navi.append(next);
}

let last = document.createElement("a");
if(isSearch==false) {
last.setAttribute("href", "/board/board?cpage=" + pageTotalCount);
} else {
	last.setAttribute("href", "/board/search?option=" + option + "&search=" + search + "&cpage=" + pageTotalCount);
}
last.innerHTML = ">>";
navi.append(last);

$("#write").on("click", function() {
	if ('${id}' == '') {
		alert("로그인이 필요한 서비스입니다.");
	} else {
		location.href = "/board/write";
	}
});

$("#option").val($("#select").val());

$("#select").on("change", function() {
	$("#option").val($("#select").val());
});
$("#boardDropdownBtn").on("click", function (e) {
 e.stopPropagation();

 const menu = $("#boardDropdownMenu");
 menu.toggleClass("show");

 $(this).attr("aria-expanded", menu.hasClass("show"));
});
$(document).on("click", function () {
 $("#boardDropdownMenu").removeClass("show");
 $("#boardDropdownBtn").attr("aria-expanded", "false");
});
$("#boardDropdownMenu").on("click", function (e) {
 e.stopPropagation();
});
</script>
</body>
</html>