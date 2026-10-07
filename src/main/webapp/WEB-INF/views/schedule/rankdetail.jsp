<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>YA900 - 순위</title>
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
	gap: 8px;
}

.login-btn,
.sign-btn {
	border: 1px solid #7180b1;
	background: transparent;
	color: white;
	border-radius: 5px;
	padding: 8px 15px;
	cursor: pointer;
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

.content {
	padding: 35px 35px 60px;
}

.page-title {
	font-size: 25px;
	font-weight: bold;
	color: #111936;
	margin-bottom: 25px;
}

.record-tabs {
	display: flex;
	border-bottom: 1px solid #d6dceb;
	margin-bottom: 25px;
	background: white;
	border-radius: 8px 8px 0 0;
	padding: 0 10px;
}

.record-tabs button {
	height: 48px;
	padding: 0 28px;
	background: white;
	border: 0;
	border-bottom: 3px solid transparent;
	font-size: 15px;
	font-weight: 500;
	color: #8b93a8;
	cursor: pointer;
	transition: 0.2s ease;
}

.record-tabs button:hover {
	color: #476aaa;
}

.record-tabs button.active {
	color: #111936;
	font-weight: bold;
	border-bottom-color: #476aaa;
}

.season-area {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 20px;
}

.season-title {
	font-size: 18px;
	font-weight: bold;
	color: #111936;
}

.season-select {
	padding: 8px 30px 8px 12px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	background: white;
	color: #36405d;
	outline: none;
}

.season-select:focus {
	border-color: #476aaa;
}

.table-wrap {
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.05);
}

.rank-table {
	width: 100%;
	border-collapse: collapse;
}

.rank-table th {
	background: #f1f3f8;
	color: #36405d;
	padding: 14px 8px;
	border-bottom: 1px solid #d6dceb;
	font-size: 13px;
	font-weight: bold;
}

.rank-table td {
	padding: 15px 8px;
	border-bottom: 1px solid #e7eaf1;
	text-align: center;
	font-size: 14px;
	color: #4b556f;
}

.rank-table tbody tr {
	transition: 0.15s ease;
}

.rank-table tbody tr:hover {
	background: #f7f9fd;
}

.rank-table tbody tr:last-child td {
	border-bottom: none;
}

.rank-table .rank {
	font-weight: bold;
	color: #68718a;
	width: 55px;
}

.team-cell {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 12px;
	padding-left: 15px;
	font-weight: bold;
	color: #18213f;
}

.team-logo {
	width: 38px;
	height: 38px;
	object-fit: contain;
}

.player-cell {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 12px;
	padding-left: 15px;
	font-weight: bold;
	color: #18213f;
}

.player-img {
	width: 40px;
	height: 45px;
	object-fit: contain;
	border-radius: 6px;
	border: 1px solid #d6dceb;
	background: #f5f6f8;
}

.record-highlight {
	font-weight: bold;
	color: #476aaa !important;
}

.rank-table tbody tr:nth-child(1) .rank,
.rank-table tbody tr:nth-child(2) .rank,
.rank-table tbody tr:nth-child(3) .rank {
	font-size: 18px;
	color: #476aaa;
}

.rank-table tbody tr:nth-child(1) .team-cell,
.rank-table tbody tr:nth-child(2) .team-cell,
.rank-table tbody tr:nth-child(3) .team-cell {
	color: #111936;
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

	.content {
		padding: 25px 15px 50px;
	}

	.rank-table {
		min-width: 850px;
	}

	.table-wrap {
		overflow-x: auto;
	}

	.kbo-navigation {
		gap: 30px;
	}

	.record-tabs {
		overflow-x: auto;
	}

	.record-tabs button {
		white-space: nowrap;
		padding: 0 20px;
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



	<main class="container">
		<section class="title-area">
			<nav class="kbo-navigation">
			    <a href="${pageContext.request.contextPath}/schedule/schedule">
			        일정
			    </a>
			    <a href="${pageContext.request.contextPath}/schedule/rankdetail" class="active">
			        랭킹 및 기록
			    </a>
			</nav>
		</section>
		<section class="content">
			<div class="page-title">KBO 순위</div>
			<nav class="record-tabs">
				<button type="button" class="active"
					onclick="showTab('teamRank',this)">팀 순위</button>
				<button type="button" onclick="showTab('teamRecord',this)">팀
					기록</button>
				<button type="button" onclick="showTab('pitcher',this)">투수</button>
				<button type="button" onclick="showTab('hitter',this)">타자</button>
			</nav>
			<div id="teamRank" class="tab-content">
				<div class="season-area">
					<div class="season-title">2026 KBO 리그</div>
					<select class="season-select">
						<option>2026</option>
					</select>
				</div>
				<div class="table-wrap">
					<table class="rank-table">
						<thead>
							<tr>
								<th>순위</th>
								<th>팀</th>
								<th>경기</th>
								<th>승</th>
								<th>패</th>
								<th>무</th>
								<th>승률</th>
								<th>게임차</th>
								<th>연속</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="team" items="${teamrankList}" varStatus="status">
								<tr>
									<td class="rank">${status.count}</td>

									<td>
										<div class="team-cell">
											<img src="${team.team_logo}" class="team-logo"> <span>${team.team_name}</span>
										</div>
									</td>

									<td>${team.games}</td>
									<td>${team.wins}</td>
									<td>${team.losses}</td>
									<td>${team.draws}</td>

									<td class="record-highlight">${team.win_rate}</td>

									<td>${team.games_behind}</td>
									<td>${team.winning_streak}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="teamRecord" class="tab-content" style="display: none">

				<div class="season-area">
					<div class="season-title">팀 공격 기록</div>
				</div>

				<div class="table-wrap">
					<table class="rank-table">
						<thead>
							<tr>
								<th>순위</th>
								<th>팀</th>
								<th>타율</th>
								<th>타수</th>
								<th>안타</th>
								<th>홈런</th>
								<th>득점</th>
								<th>타점</th>
								<th>도루</th>
								<th>OPS</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="team" items="${offenlist}" varStatus="status">
								<tr>

									<td class="rank">${status.count}</td>

									<td>
										<div class="team-cell">
											<img src="${team.team_logo}" class="team-logo"> <span>${team.team_name}</span>
										</div>
									</td>

									<td>${team.batting_average}</td>
									<td>${team.at_bats}</td>
									<td>${team.hits}</td>
									<td>${team.home_runs}</td>
									<td>${team.runs}</td>
									<td>${team.rbi}</td>
									<td>${team.stolen_bases}</td>
									<td>${team.ops}</td>

								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>



				<!-- 수비 기록 -->
				<div class="season-area" style="margin-top: 40px;">
					<div class="season-title">팀 수비 기록</div>
				</div>


				<div class="table-wrap">
					<table class="rank-table">

						<thead>
							<tr>
								<th>순위</th>
								<th>팀</th>
								<th>ERA</th>
								<th>이닝</th>
								<th>피안타</th>
								<th>피홈런</th>
								<th>탈삼진</th>
								<th>볼넷</th>
								<th>WHIP</th>
								<th>세이브</th>
							</tr>
						</thead>


						<tbody>

							<c:forEach var="team" items="${dffenlist}" varStatus="status">

								<tr>

									<td class="rank">${status.count}</td>

									<td>
										<div class="team-cell">
											<img src="${team.team_logo}" class="team-logo"> <span>${team.team_name}</span>
										</div>
									</td>

									<td>${team.era}</td>
									<td>${team.innings_pitched}</td>
									<td>${team.hits_allowed}</td>
									<td>${team.home_runs_allowed}</td>
									<td>${team.strikeouts}</td>
									<td>${team.walks_hbp}</td>
									<td>${team.whip}</td>
									<td>${team.saves}</td>

								</tr>

							</c:forEach>

						</tbody>

					</table>
				</div>

			</div>
			<div id="pitcher" class="tab-content" style="display: none">
				<div class="season-area">
					<div class="season-title">투수 기록</div>
				</div>
				<div class="table-wrap">
					<table class="rank-table">
						<thead>
							<tr>
								<th>순위</th>
								<th>선수</th>
								<th>팀</th>
								<th>ERA</th>
								<th>경기</th>
								<th>승</th>
								<th>패</th>
								<th>이닝</th>
								<th>탈삼진</th>
								<th>WAR</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="player" items="${pitcherList}" varStatus="status">
								<tr>
									<td class="rank">${status.count}</td>
									<td>
										<div class="player-cell">
											<img src="${player.player_image}" class="player-img"> <span>${player.player_name}</span>
										</div>
									</td>

									<td>
										<div class="team-cell">

											<c:if test="${not empty player.team_logo}">
												<img src="${player.team_logo}" class="team-logo">
											</c:if>

											<span>${player.team_name}</span>

										</div>
									</td>
									<td>${player.era}</td>
									<td>${player.games}</td>
									<td>${player.wins}</td>
									<td>${player.losses}</td>
									<td>${player.innings}</td>
									<td>${player.strikeouts}</td>
									<td>${player.war}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="hitter" class="tab-content" style="display: none">
				<div class="season-area">
					<div class="season-title">타자 기록</div>
				</div>
				<div class="table-wrap">
					<table class="rank-table">
						<thead>
							<tr>
								<th>순위</th>
								<th>선수</th>
								<th>팀</th>
								<th>타율</th>
								<th>경기</th>
								<th>타수</th>
								<th>안타</th>
								<th>홈런</th>
								<th>OPS</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="player" items="${hitterList}" varStatus="status">
								<tr>
									<td class="rank">${status.count}</td>
									<td>
										<div class="player-cell">

											<c:choose>
												<c:when test="${not empty player.player_image}">
													<img src="${player.player_image}" class="player-img">
												</c:when>

												<c:otherwise>
													<img
														src="${pageContext.request.contextPath}/resources/images/default_player.png"
														class="player-img">
												</c:otherwise>
											</c:choose>

											<span>${player.player_name}</span>

										</div>
									</td>

									<td>
										<div class="team-cell">

											<c:if test="${not empty player.team_logo}">
												<img src="${player.team_logo}" class="team-logo">
											</c:if>

											<span>${player.team_name}</span>

										</div>
									</td>
									<td>${player.batting_avg}</td>
									<td>${player.games}</td>
									<td>${player.at_bats}</td>
									<td>${player.hits}</td>
									<td>${player.home_runs}</td>
									<td>${player.ops}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</main>
	<script>
		function showTab(tabId, button) {
			document.querySelectorAll(".tab-content").forEach(function(tab) {
				tab.style.display = "none";
			});
			document.querySelectorAll(".record-tabs button").forEach(
					function(btn) {
						btn.classList.remove("active");
					});
			document.getElementById(tabId).style.display = "block";
			button.classList.add("active");
		}
		window.onload = function() {
	        const tab = "${tab}";

	        if (tab === "pitcher") {
	            showTab("pitcher", document.querySelector(".record-tabs button:nth-child(3)"));
	        } else if (tab === "hitter") {
	            showTab("hitter", document.querySelector(".record-tabs button:nth-child(4)"));
	        } else if (tab === "teamRecord") {
	            showTab("teamRecord", document.querySelector(".record-tabs button:nth-child(2)"));
	        }
	    };
	</script>
</body>
</html>
