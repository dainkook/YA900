<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YA900 나만의 팀</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	background: #f5f6f8;
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #222;
}

/* =========================
   HEADER
========================= */
.header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 80px;
	background: white;
	border-bottom: 1px solid #e2e5e9;
	display: flex;
	align-items: center;
	padding: 0 50px;
	z-index: 1000;
}

.logo {
	font-size: 30px;
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
	font-size: 17px;
}

.main-menu a:hover {
	color: #476aaa;
}

.user-menu {
	margin-left: auto;
	display: flex;
	gap: 10px;
}

.user-menu button {
	background: white;
	border: 1px solid #cfd3d8;
	border-radius: 5px;
	padding: 9px 18px;
	font-size: 14px;
	cursor: pointer;
}

.user-menu button:hover {
	border-color: #476aaa;
	color: #476aaa;
}

/* =========================
   CONTAINER
========================= */
.container {
	width: 1310px;
	max-width: calc(100% - 40px);
	margin: 110px auto 40px;
}

/* =========================
   PAGE TITLE
========================= */
.title {
	height: 70px;
	background: white;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	display: flex;
	align-items: center;
	padding: 0 25px;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 18px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

/* =========================
   MAIN AREA
========================= */
.main-area {
	display: flex;
	gap: 20px;
}

.team-area, .player-area {
	background: white;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	height: 710px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

.team-area {
	width: 625px;
	padding: 25px;
}

.player-area {
	width: 665px;
	padding: 25px;
	display: flex;
	flex-direction: column;
}

/* =========================
   AREA TITLE
========================= */
.area-title {
	text-align: center;
	font-size: 21px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #222;
}

/* =========================
   BASEBALL FIELD
========================= */
.field {
	position: relative;
	height: 440px;
	border: 1px solid #e0e3e7;
	border-radius: 8px;
	background: #fafbfc;
}

/* =========================
   POSITION BUTTON
========================= */
.position {
	position: absolute;
	width: 112px;
	height: 60px;
	border: 1px solid #d7dbe0;
	border-radius: 7px;
	background: white;
	color: #333;
	font-size: 15px;
	cursor: pointer;
	transition: all 0.15s ease;
}

.position:hover {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
	box-shadow: 0 3px 8px rgba(71, 106, 170, 0.2);
}

/* Position */
.p-left {
	left: 69px;
	top: 44px;
}

.p-center {
	left: 255px;
	top: 25px;
}

.p-right {
	right: 69px;
	top: 44px;
}

.p-second {
	left: 255px;
	top: 113px;
}

.p-short {
	left: 175px;
	top: 169px;
}

.p-pitcher {
	left: 255px;
	top: 181px;
}

.p-third {
	left: 69px;
	top: 244px;
}

.p-first {
	right: 69px;
	top: 244px;
}

.p-catcher {
	left: 255px;
	bottom: 31px;
}

/* =========================
   TEAM INFO
========================= */
.team-info {
	border-top: 1px solid #e4e6e9;
	margin-top: 22px;
	padding-top: 20px;
	display: flex;
	justify-content: space-around;
	text-align: center;
	font-size: 14px;
	color: #777;
}

.team-info strong {
	display: block;
	margin-top: 8px;
	font-size: 17px;
	color: #222;
	min-height: 25px;
}

/* =========================
   SEARCH
========================= */
.search {
	display: flex;
	height: 45px;
	margin-bottom: 12px;
}

.search input {
	flex: 1;
	border: 1px solid #d8dce1;
	border-right: none;
	border-radius: 6px 0 0 6px;
	padding: 0 14px;
	font-size: 14px;
	outline: none;
}

.search input:focus {
	border-color: #476aaa;
}

.search button {
	width: 75px;
	border: 1px solid #476aaa;
	border-radius: 0 6px 6px 0;
	background: #476aaa;
	color: white;
	font-size: 14px;
	cursor: pointer;
}

.search button:hover {
	background: #3d5e97;
}

/* =========================
   POSITION FILTER
========================= */
.position-filter {
	display: flex;
	gap: 5px;
	margin-bottom: 15px;
}

.position-filter button {
	flex: 1;
	height: 38px;
	padding: 0;
	border: 1px solid #d9dde3;
	border-radius: 5px;
	background: white;
	color: #555;
	font-size: 12px;
	white-space: nowrap;
	cursor: pointer;
}

.position-filter button:hover {
	border-color: #476aaa;
	color: #476aaa;
}

.position-filter button.active {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
	font-weight: bold;
}

/* =========================
   PLAYER LIST
========================= */
.player-list {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 10px;
	align-content: start;
	flex: 1;
	min-height: 0;
	overflow-y: auto;
	padding: 2px;
}

/* =========================
   PLAYER CARD
========================= */
.player-card {
	height: 185px;
	background: white;
	border: 1px solid #e0e3e7;
	border-radius: 8px;
	padding: 8px;
	text-align: center;
	cursor: pointer;
	transition: all 0.15s ease;
}

.player-card:hover {
	border-color: #476aaa;
	box-shadow: 0 3px 10px rgba(71, 106, 170, 0.12);
	transform: translateY(-2px);
}

/* =========================
   PLAYER IMAGE
========================= */
.player-image {
	height: 105px;
	background: #f7f8fa;
	border: none;
	border-radius: 6px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 7px;
	overflow: hidden;
}

.player-image img {
	width: 100%;
	height: 100%;
	object-fit: contain;
}

/* =========================
   PLAYER INFO
========================= */
.player-name {
	font-size: 14px;
	font-weight: bold;
	color: #222;
	margin-top: 2px;
}

.player-position {
	font-size: 12px;
	color: #777;
	margin-top: 4px;
}

.player-team {
	font-size: 11px;
	color: #476aaa;
	font-weight: bold;
	margin-top: 3px;
}

/* =========================
   SAVE
========================= */
.save-area {
	text-align: center;
	margin-top: 20px;
}

.save-btn {
	width: 150px;
	height: 48px;
	border: none;
	border-radius: 7px;
	background: #476aaa;
	color: white;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.15s ease;
}

.save-btn:hover {
	background: #3d5e97;
	box-shadow: 0 3px 8px rgba(71, 106, 170, 0.2);
}

/* =========================
   SCROLLBAR
========================= */
.player-list::-webkit-scrollbar {
	width: 6px;
}

.player-list::-webkit-scrollbar-track {
	background: #f1f2f4;
	border-radius: 5px;
}

.player-list::-webkit-scrollbar-thumb {
	background: #c5c9cf;
	border-radius: 5px;
}

.player-list::-webkit-scrollbar-thumb:hover {
	background: #aeb3ba;
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
			<button>로그인</button>
			<button>회원가입</button>
		</div>

	</header>


	<div class="container">

		<div class="title">나만의 팀</div>


		<div class="main-area">

			<!-- =========================
			     나의 팀
			========================= -->

			<section class="team-area">

				<div class="area-title">나의 팀</div>

				<div class="field">

					<button class="position p-left">좌익수</button>

					<button class="position p-center">중견수</button>

					<button class="position p-right">우익수</button>

					<button class="position p-second">2루수</button>

					<button class="position p-short">유격수</button>

					<button class="position p-pitcher">선발투수</button>

					<button class="position p-third">3루수</button>

					<button class="position p-first">1루수</button>

					<button class="position p-catcher">포수</button>

				</div>


				<div class="team-info">

					<div>
						선수 <strong></strong>
					</div>

					<div>
						포지션 <strong></strong>
					</div>

					<div>
						팀 이름 <strong></strong>
					</div>

				</div>

			</section>


			<!-- =========================
			     선수 선택
			========================= -->

			<section class="player-area">

				<div class="area-title">선수 선택</div>


				<div class="search">

					<input type="text" placeholder="선수 검색">

					<button>검색</button>

				</div>


				<div class="position-filter">

					<button class="active" data-position="전체">전체</button>
					<button data-position="1루수">1루수</button>
					<button data-position="2루수">2루수</button>
					<button data-position="3루수">3루수</button>
					<button data-position="선발투수">선발투수</button>
					<button data-position="유격수">유격수</button>
					<button data-position="좌익수">좌익수</button>
					<button data-position="중견수">중견수</button>
					<button data-position="우익수">우익수</button>

				</div>


				<div class="player-list">

					<c:forEach var="player" items="${playerList}">

						<div class="player-card">

							<div class="player-image">

								<img src="${player.player_image}" alt="${player.player_name}">

							</div>

							<div class="player-name">${player.player_name}</div>

							<div class="player-position">${player.player_position}</div>

							<div class="player-team">${player.player_team}</div>

						</div>

					</c:forEach>

				</div>

			</section>

		</div>


		<div class="save-area">

			<button class="save-btn">팀 저장</button>

		</div>

	</div>
	<script>
		$(document).ready(function() {

			$(".position-filter button").click(function() {

				// 선택된 버튼 활성화
				$(".position-filter button").removeClass("active");
				$(this).addClass("active");

				// 선택한 포지션
				let position = $(this).data("position");

				// 전체
				if (position === "전체") {
					$(".player-card").show();
					return;
				}

				// 포지션 필터링
				$(".player-card").each(function() {

					let playerPosition = $(this).data("position");

					if (playerPosition === position) {
						$(this).show();
					} else {
						$(this).hide();
					}

				});

			});

		});
	</script>
</body>
</html>
