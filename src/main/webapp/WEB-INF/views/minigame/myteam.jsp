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
	background: linear-gradient(to bottom, #111936 0%, #111936 12%, #171f46 22%, #252f67
		32%, #71809f 43%, #aeb7ca 55%, #d5dae5 70%, #eef1f8 85%, #eef1f8 100%);
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #18213f;
	min-height: 100vh;
}
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

.container {
	width: 1310px;
	max-width: calc(100% - 40px);
	margin: 110px auto 40px;
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

.team-area,
.player-area {
	background: white;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

.team-area {
	width: 625px;
	padding: 25px;
	min-height: 710px;
}

.player-area {
	width: 665px;
	padding: 25px;
	display: flex;
	flex-direction: column;
	height: 710px;
	align-self: flex-start;
	position: sticky;
	top: 100px;
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
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	gap: 4px;
}

.position-name {
	font-size: 13px;
	color: #777;
}

.selected-player {
	font-size: 15px;
	font-weight: bold;
	color: #222;
}

.position.selected {
	background: #476aaa;
	border-color: #476aaa;
}

.position.selected .position-name,
.position.selected .selected-player {
	color: white;
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
}

.team-info-header,
.selected-player-row {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	align-items: center;
	text-align: center;
}

.team-info-header {
	padding: 10px 0;
	border-bottom: 1px solid #ddd;
	font-size: 13px;
	color: #888;
	font-weight: bold;
}

.selected-player-row {
	padding: 10px 0;
	border-bottom: 1px solid #eee;
	font-size: 14px;
}

.selected-player-row .player-name {
	font-weight: bold;
	color: #222;
}

.selected-player-row .player-position {
	color: #666;
}

.selected-player-row .player-team {
	color: #476aaa;
	font-weight: bold;
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
.reset-btn {
    width: 150px;
    height: 48px;
    margin-left: 8px;
    border: 1px solid #d1d5db;
    border-radius: 7px;
    background: white;
    color: #555;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.15s ease;
}

.reset-btn:hover {
    background: #f1f3f6;
    border-color: #aeb4bd;
}
.home-btn {
    width: 150px;
    height: 48px;
    margin-left: 8px;
    border: 1px solid #d1d5db;
    border-radius: 7px;
    background: white;
    color: #555;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.15s ease;
}

.home-btn:hover {
    background: #f1f3f6;
    border-color: #aeb4bd;
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
	<div class="container">

		<div class="title">나만의 팀</div>

		<form action="${pageContext.request.contextPath}/myteamresult" method="POST">

			<div class="main-area">

				<section class="team-area">

					<div class="area-title">나의 팀</div>

					<div class="field">

						<button type="button" class="position p-left"
							data-position="좌익수">
							<span class="position-name">좌익수</span>
							<span class="selected-player"></span>
						</button>

						<button type="button" class="position p-center"
							data-position="중견수">
							<span class="position-name">중견수</span>
							<span class="selected-player"></span>
						</button>

						<button type="button" class="position p-right"
							data-position="우익수">
							<span class="position-name">우익수</span>
							<span class="selected-player"></span>
						</button>

						<button type="button" class="position p-second"
							data-position="2루수">
							<span class="position-name">2루수</span>
							<span class="selected-player"></span>
						</button>

						<button type="button" class="position p-short"
							data-position="유격수">
							<span class="position-name">유격수</span>
							<span class="selected-player"></span>
						</button>

						<button type="button" class="position p-pitcher"
							data-position="선발투수">
							<span class="position-name">선발투수</span>
							<span class="selected-player"></span>
						</button>

						<button type="button" class="position p-third"
							data-position="3루수">
							<span class="position-name">3루수</span>
							<span class="selected-player"></span>
						</button>

						<button type="button" class="position p-first"
							data-position="1루수">
							<span class="position-name">1루수</span>
							<span class="selected-player"></span>
						</button>

						<button type="button" class="position p-catcher"
							data-position="포수">
							<span class="position-name">포수</span>
							<span class="selected-player"></span>
						</button>

						<input type="hidden" id="좌익수" name="player_LF" value="">
						<input type="hidden" id="우익수" name="player_RF" value="">
						<input type="hidden" id="중견수" name="player_CF" value="">
						<input type="hidden" id="1루수" name="player_1B" value="">
						<input type="hidden" id="2루수" name="player_2B" value="">
						<input type="hidden" id="3루수" name="player_3B" value="">
						<input type="hidden" id="유격수" name="player_SS" value="">
						<input type="hidden" id="포수" name="player_C" value="">
						<input type="hidden" id="선발투수" name="player_SP" value="">

					</div>

					<div class="team-info">

						<div class="team-info-header">
							<span>선수</span>
							<span>포지션</span>
							<span>팀</span>
						</div>

						<div class="selected-player-list"></div>

					</div>

				</section>

				<!-- =========================
				     선수 선택
				========================= -->

				<section class="player-area">

					<div class="area-title">선수 선택</div>

					<div class="search">
					    <input type="text" id="playerSearch" placeholder="선수 이름 검색">
					    <button type="button" id="searchBtn">검색</button>
					</div>

					<div class="position-filter">

						<button type="button" class="active" data-position="전체">전체</button>
						<button type="button" data-position="1루수">1루수</button>
						<button type="button" data-position="2루수">2루수</button>
						<button type="button" data-position="3루수">3루수</button>
						<button type="button" data-position="선발투수">선발투수</button>
						<button type="button" data-position="유격수">유격수</button>
						<button type="button" data-position="좌익수">좌익수</button>
						<button type="button" data-position="중견수">중견수</button>
						<button type="button" data-position="우익수">우익수</button>
						<button type="button" data-position="포수">포수</button>

					</div>

					<div class="player-list">

						<c:forEach var="player" items="${playerList}">

							<div class="player-card" data-player-id="${player.player_id}">

								<div class="player-image">
									<img src="${player.player_image}"
										alt="${player.player_name}">
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
			    <button type="submit" class="save-btn">팀 저장</button>
			    <button type="button" class="reset-btn" id="resetBtn">초기화</button>
			    <button type="button" class="home-btn" onclick="location.href='${pageContext.request.contextPath}/'">홈으로</button>
			</div>

		</form>

	</div>

	<script>
		let savedPlayers = [];

		<c:forEach var="player" items="${myPlayerList}">
		savedPlayers.push({
			name : "${player.player_name}",
			position : "${player.player_position}",
			team : "${player.player_team}"
		});
		</c:forEach>
	</script>

	<script>
		
		$(function() {

			savedPlayers.forEach(function(player) {

				let positionButton = $(".position[data-position='"
						+ player.position + "']");

				positionButton.find(".selected-player").text(player.name);

				$("#" + player.position).val(player.name);

				$(".selected-player-list").append(
						"<div class='selected-player-row' data-position='" + player.position + "'>"
								+ "<span class='player-name'>" + player.name
								+ "</span>" + "<span class='player-position'>"
								+ player.position + "</span>"
								+ "<span class='player-team'>" + player.team
								+ "</span>" + "</div>");
			});

			$(".position-filter button").click(
					function() {

						$(".position-filter button").removeClass("active");
						$(this).addClass("active");

						let position = $(this).text().trim();

						if (position === "전체") {
							$(".player-card").show();
							return;
						}

						$(".player-card").each(
								function() {

									let playerPosition = $(this).find(
											".player-position").text().trim();

									if (playerPosition === position) {
										$(this).show();
									} else {
										$(this).hide();
									}
								});
					});

			let selectedPosition = null;

			$(".position").click(
					function() {

						selectedPosition = $(this).data("position");

						$(".position").removeClass("selected");
						$(this).addClass("selected");

						$(".position-filter button").removeClass("active");
						$(
								".position-filter button[data-position='"
										+ selectedPosition + "']").addClass(
								"active");

						$(".player-card").each(
								function() {

									let playerPosition = $(this).find(
											".player-position").text().trim();

									if (playerPosition === selectedPosition) {
										$(this).show();
									} else {
										$(this).hide();
									}
								});
					});

			$(".player-card")
					.click(
							function() {

								if (selectedPosition === null) {
									alert("먼저 포지션을 선택해주세요.");
									return;
								}

								let playerName = $(this).find(".player-name")
										.text().trim();

								let playerPosition = $(this).find(
										".player-position").text().trim();

								let playerTeam = $(this).find(".player-team")
										.text().trim();

								let positionButton = $(".position[data-position='"
										+ selectedPosition + "']");

								positionButton.find(".selected-player").text(
										playerName);

								$("#" + selectedPosition).val(playerName);

								$(".position").removeClass("selected");
								positionButton.addClass("selected");

								let selectedRow = $(".selected-player-row[data-position='"
										+ selectedPosition + "']");

								if (selectedRow.length > 0) {

									selectedRow.find(".player-name").text(
											playerName);
									selectedRow.find(".player-position").text(
											playerPosition);
									selectedRow.find(".player-team").text(
											playerTeam);

								} else {

									$(".selected-player-list")
											.append(
													"<div class='selected-player-row' data-position='" + selectedPosition + "'>"
															+ "<span class='player-name'>"
															+ playerName
															+ "</span>"
															+ "<span class='player-position'>"
															+ playerPosition
															+ "</span>"
															+ "<span class='player-team'>"
															+ playerTeam
															+ "</span>"
															+ "</div>");
								}
							});

		});
		
		$("#resetBtn").click(function() {

		    if (!confirm("선택한 팀을 모두 초기화하시겠습니까?")) {
		        return;
		    }

		    $(".position .selected-player").text("");
		    $(".field input[type='hidden']").val("");
		    
		    $(".position").removeClass("selected");
		    
		    $(".selected-player-list").empty();
		    
		    selectedPosition = null;
		    
		    $(".position-filter button").removeClass("active");
		    $(".position-filter button[data-position='전체']").addClass("active");

		    $(".player-card").show();
		});
		
		$("form").submit(function(e) {

		    let incomplete = false;

		    $(".position").each(function() {

		        let player = $(this).find(".selected-player").text().trim();

		        if (player === "") {
		            incomplete = true;
		            return false;
		        }
		    });

		    if (incomplete) {
		        e.preventDefault();
		        alert("팀 선택이 완료되지 않았습니다.");
		        return false;
		    }
		});
		
		$("#playerSearch").on("input", function() {

		    let search = $(this).val();

		    $(".player-card").each(function() {

		        let name = $(this).find(".player-name").text();

		        if (name.includes(search)) {
		            $(this).show();
		        } else {
		            $(this).hide();
		        }

		    });

		});
	</script>

</body>
</html>
