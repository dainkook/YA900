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
	box-sizing: border-box
}

body {
	margin: 0;
	background: #f5f6f8;
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #222
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
	z-index: 1000
}

.logo {
	font-size: 28px;
	font-weight: bold;
	margin-right: 70px
}

.main-menu {
	display: flex;
	gap: 45px
}

.main-menu a {
	text-decoration: none;
	color: #222;
	font-size: 16px
}

.user-menu {
	margin-left: auto;
	display: flex;
	gap: 10px
}

.user-menu button {
	background: #fff;
	border: 1px solid #aaa;
	padding: 8px 15px;
	cursor: pointer
}

.container {
	width: 1050px;
	margin: 0 auto;
	background: #fff;
	min-height: 100vh;
	padding-top: 80px
}

.kbo-navigation {
	height: 55px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 45px;
	border-bottom: 1px solid #ddd;
	background: #fff
}

.kbo-navigation a {
	text-decoration: none;
	color: #777;
	font-size: 15px
}

.kbo-navigation a.active {
	color: #222;
	font-weight: bold
}

.content {
	padding: 30px 35px 60px
}

.page-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 25px
}

.record-tabs {
	display: flex;
	border-bottom: 1px solid #ddd;
	margin-bottom: 25px
}

.record-tabs button {
	height: 48px;
	padding: 0 28px;
	background: #fff;
	border: 0;
	border-bottom: 2px solid transparent;
	font-size: 15px;
	color: #777;
	cursor: pointer
}

.record-tabs button.active {
	color: #222;
	font-weight: bold;
	border-bottom: 2px solid #222
}

.season-area {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 20px
}

.season-title {
	font-size: 18px;
	font-weight: bold
}

.season-select {
	padding: 8px 30px 8px 12px;
	border: 1px solid #ccc;
	background: #fff
}

.table-wrap {
	border-top: 2px solid #222
}

.rank-table {
	width: 100%;
	border-collapse: collapse
}

.rank-table th {
	background: #f7f7f7;
	padding: 14px 8px;
	border-bottom: 1px solid #ddd;
	font-size: 13px
}

.rank-table td {
	padding: 16px 8px;
	border-bottom: 1px solid #eee;
	text-align: center;
	font-size: 14px
}

.rank-table .rank {
	font-weight: bold;
	width: 55px
}

.team-cell {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 12px;
	padding-left: 15px;
	font-weight: bold
}

.team-logo {
	width: 38px;
	height: 38px;
	object-fit: contain
}

.player-cell {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 12px;
	padding-left: 15px;
	font-weight: bold;
}

.player-img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid #eee;
}

.record-highlight {
	font-weight: bold
}

.rank-table tbody tr:hover {
	background: #fafafa
}

.rank-table tbody tr:nth-child(1) .rank {
	font-size: 18px
}

.rank-table tbody tr:nth-child(2) .rank {
	font-size: 18px
}

.rank-table tbody tr:nth-child(3) .rank {
	font-size: 18px
}

@media ( max-width :1100px) {
	.container {
		width: 100%
	}
}

@media ( max-width :750px) {
	.header {
		padding: 0 20px
	}
	.logo {
		margin-right: 30px
	}
	.main-menu {
		gap: 20px
	}
	.container {
		width: 100%
	}
	.content {
		padding: 25px 15px 50px
	}
	.rank-table {
		min-width: 850px
	}
	.table-wrap {
		overflow-x: auto
	}
	.kbo-navigation {
		gap: 30px
	}
	.record-tabs {
		overflow-x: auto
	}
	.record-tabs button {
		white-space: nowrap;
		padding: 0 20px
	}
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
	<main class="container">
		<nav class="kbo-navigation">
			<a href="${pageContext.request.contextPath}/schedule/schedule">일정</a>
			<a href="${pageContext.request.contextPath}/rankdetail"
				class="active">순위</a>
		</nav>
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
											<span>${team.team_name}</span>
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
	</script>
</body>
</html>
