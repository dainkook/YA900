<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>경기 상세</title>
<style>
* {
	box-sizing: border-box
}

body {
	margin: 0;
	background-color: #f5f6f8;
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
	background-color: white;
	border: 1px solid #aaa;
	padding: 8px 15px;
	cursor: pointer
}

.container {
	width: 1050px;
	margin: 0 auto;
	background-color: white;
	min-height: 100vh;
	padding-top: 80px
}

.game-info {
	padding: 35px 40px 25px;
	border-bottom: 1px solid #ddd
}

.game-date {
	text-align: center;
	font-size: 14px;
	color: #777;
	margin-bottom: 25px
}

.game-teams {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 70px
}

.team {
	width: 180px;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center
}

.team-logo {
	width: 70px;
	height: 70px;
	object-fit: contain;
	margin-bottom: 12px
}

.team-name {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px
}

.team-score {
	font-size: 32px;
	font-weight: bold
}

.vs {
	font-size: 20px;
	color: #aaa
}

.game-status {
	text-align: center;
	font-size: 13px;
	color: #777;
	margin-top: 15px
}

.main-layout {
	display: flex;
	align-items: flex-start;
	width: 1050px
}

.game-detail {
	width: 700px;
	border-right: 1px solid #ddd;
	flex-shrink: 0
}

.detail-navigation {
	display: flex;
	border-bottom: 1px solid #ddd;
	padding: 0 30px
}

.detail-navigation button {
	flex: 1;
	height: 55px;
	background-color: white;
	border: none;
	border-bottom: 2px solid transparent;
	font-size: 15px;
	cursor: pointer;
	color: #777
}

.detail-navigation button.active {
	color: #222;
	font-weight: bold;
	border-bottom: 2px solid #222
}

.content {
	padding: 30px 30px 60px
}

.tab-content {
	display: none
}

.tab-content.active {
	display: block
}

.section-title {
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 18px
}

.compare-box {
	display: flex;
	align-items: stretch;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	margin-bottom: 35px
}

.compare-team {
	width: calc(50% - 30px);
	padding: 20px;
	text-align: center;
	min-height: 200px
}

.compare-team h3 {
	margin: 0 0 15px;
	font-size: 17px
}

.compare-team-logo {
	width: 55px;
	height: 55px;
	object-fit: contain;
	margin-bottom: 10px
}

.compare-vs {
	width: 60px;
	flex-shrink: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	font-weight: bold;
	color: #999;
	border-left: 1px solid #eee;
	border-right: 1px solid #eee
}

.compare-row {
	display: flex;
	justify-content: space-between;
	padding: 10px 0;
	border-top: 1px solid #eee;
	font-size: 14px
}

.compare-row span:last-child {
	font-weight: bold
}

.player-section {
	margin-bottom: 35px
}

.player-compare {
	display: flex;
	align-items: stretch;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	width: 100%
}

.player-compare-team {
	width: calc(50% - 30px);
	padding: 20px;
	min-height: 260px
}

.player-compare-vs {
	width: 60px;
	flex-shrink: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	font-weight: bold;
	color: #999;
	border-left: 1px solid #eee;
	border-right: 1px solid #eee
}

.player-team-name {
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 20px
}

.player-info {
	display: flex;
	align-items: center;
	gap: 15px;
	margin-bottom: 20px
}

.player-image {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid #ddd
}

.player-name {
	font-size: 16px;
	font-weight: bold
}

.player-detail {
	font-size: 13px;
	color: #777;
	margin-top: 6px
}

.player-stat {
	margin-top: 15px
}

.player-stat-row {
	display: flex;
	justify-content: space-between;
	padding: 9px 0;
	border-top: 1px solid #eee;
	font-size: 14px
}

.player-stat-row span:last-child {
	font-weight: bold
}

.key-player {
	display: flex;
	align-items: center;
	gap: 15px;
	margin-bottom: 20px
}

.key-player-image {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid #ddd
}

.key-player-name {
	font-size: 16px;
	font-weight: bold
}

.key-player-detail {
	font-size: 13px;
	color: #777;
	margin-top: 6px
}

.key-player-stat {
	margin-top: 15px
}

.key-player-stat-row {
	display: flex;
	justify-content: space-between;
	padding: 9px 0;
	border-top: 1px solid #eee;
	font-size: 14px
}

.key-player-stat-row span:last-child {
	font-weight: bold
}

.lineup-table, .record-table {
	width: 100%;
	border-collapse: collapse
}

.lineup-table th, .lineup-table td, .record-table th, .record-table td {
	padding: 13px 10px;
	border-bottom: 1px solid #eee;
	text-align: center;
	font-size: 14px
}

.lineup-table th, .record-table th {
	background-color: #f7f7f7;
	font-weight: bold
}

.lineup-player {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px
}

.lineup-player-image {
	width: 35px;
	height: 35px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid #ddd
}

.lineup-player-name {
	font-size: 14px;
	font-weight: 500
}

.lineup-empty {
	color: #bbb
}

.open-talk {
	width: 350px;
	height: 620px;
	flex-shrink: 0;
	display: flex;
	flex-direction: column;
	background-color: white;
	position: sticky;
	top: 80px
}

.open-talk-header {
	height: 55px;
	padding: 0 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	border-bottom: 1px solid #ddd
}

.open-talk-title {
	font-size: 16px;
	font-weight: bold
}

.open-talk-count {
	font-size: 12px;
	color: #999
}

.chat-list {
	flex: 1;
	padding: 15px;
	overflow-y: auto;
	background-color: #fafafa
}

.chat-item {
	margin-bottom: 18px
}

.chat-user {
	font-size: 12px;
	font-weight: bold;
	margin-bottom: 5px
}

.chat-message {
	display: inline-block;
	background-color: white;
	border: 1px solid #e5e5e5;
	border-radius: 5px;
	padding: 9px 11px;
	font-size: 13px;
	line-height: 1.5;
	max-width: 90%
}

.chat-item.my-chat {
	text-align: right
}

.chat-item.my-chat .chat-message {
	background-color: #222;
	color: white;
	border-color: #222;
	text-align: left
}

.chat-input-area {
	border-top: 1px solid #ddd;
	padding: 12px;
	background-color: white
}

.chat-input {
	display: flex;
	gap: 7px
}

.chat-input input {
	flex: 1;
	height: 38px;
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 0 10px;
	outline: none
}

.chat-input input:focus {
	border-color: #999
}

.chat-input button {
	width: 55px;
	border: 1px solid #222;
	background-color: #222;
	color: white;
	border-radius: 4px;
	cursor: pointer
}

@media ( max-width :1100px) {
	.container {
		width: 100%
	}

	.main-layout {
		width: 100%
	}

	.game-detail {
		width: calc(100% - 320px)
	}

	.open-talk {
		width: 320px
	}
}

@media ( max-width :750px) {
	.main-layout {
		display: block;
		width: 100%
	}

	.game-detail {
		width: 100%;
		border-right: none
	}

	.open-talk {
		width: 100%;
		height: 500px;
		position: static;
		border-top: 1px solid #ddd
	}
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

	<section class="game-info">
		<div class="game-date">
			<fmt:formatDate value="${schedule.start_date}" pattern="yyyy년 MM월 dd일 HH:mm"/>
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

		<c:when test="${schedule.home_score >= 0 || schedule.away_score >= 0}">
			경기종료
		</c:when>

		<c:otherwise>
			경기예정
		</c:otherwise>

	</c:choose>
</div>
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

									<img src="${schedule.away_logo}"
										class="compare-team-logo"
										alt="${schedule.away_team} 로고">

									<h3>${team.team_name}</h3>

									<div class="compare-row">
										<span>승률</span>
										<span>
											<fmt:formatNumber value="${team.win_rate}" pattern="0.000"/>
										</span>
									</div>

									<div class="compare-row">
										<span>타율</span>
										<span>
											<fmt:formatNumber value="${team.batting_avg}" pattern="0.000"/>
										</span>
									</div>

									<div class="compare-row">
										<span>ERA</span>
										<span>
											<fmt:formatNumber value="${team.era}" pattern="0.00"/>
										</span>
									</div>

								</div>

							</c:if>
						</c:forEach>

						<div class="compare-vs">VS</div>

						<c:forEach var="team" items="${teamList}">
							<c:if test="${team.team_id == schedule.home_id}">

								<div class="compare-team">

									<img src="${schedule.home_logo}"
										class="compare-team-logo"
										alt="${schedule.home_team} 로고">

									<h3>${team.team_name}</h3>

									<div class="compare-row">
										<span>승률</span>
										<span>
											<fmt:formatNumber value="${team.win_rate}" pattern="0.000"/>
										</span>
									</div>

									<div class="compare-row">
										<span>타율</span>
										<span>
											<fmt:formatNumber value="${team.batting_avg}" pattern="0.000"/>
										</span>
									</div>

									<div class="compare-row">
										<span>ERA</span>
										<span>
											<fmt:formatNumber value="${team.era}" pattern="0.00"/>
										</span>
									</div>

								</div>

							</c:if>
						</c:forEach>

					</div>

					<div class="player-section">

						<div class="section-title">선발 투수</div>

						<div class="player-compare">

							<c:set var="awayPitcherFound" value="false"/>

							<c:forEach var="pitcher" items="${pitcherList}">
								<c:if test="${!awayPitcherFound && pitcher.player_team == schedule.away_team}">

									<c:set var="awayPitcherFound" value="true"/>

									<div class="player-compare-team">

										<div class="player-team-name">
											${schedule.away_team}
										</div>

										<div class="player-info">

											<img src="${pitcher.player_image}"
												class="player-image"
												alt="${pitcher.player_name}">

											<div>
												<div class="player-name">
													${pitcher.player_name}
												</div>

												<div class="player-detail">
													${pitcher.player_team}
												</div>
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
													<fmt:formatNumber value="${pitcher.era}" pattern="0.00"/>
												</span>
											</div>

										</div>

									</div>

								</c:if>
							</c:forEach>

							<div class="player-compare-vs">VS</div>

							<c:set var="homePitcherFound" value="false"/>

							<c:forEach var="pitcher" items="${pitcherList}">
								<c:if test="${!homePitcherFound && pitcher.player_team == schedule.home_team}">

									<c:set var="homePitcherFound" value="true"/>

									<div class="player-compare-team">

										<div class="player-team-name">
											${schedule.home_team}
										</div>

										<div class="player-info">

											<img src="${pitcher.player_image}"
												class="player-image"
												alt="${pitcher.player_name}">

											<div>
												<div class="player-name">
													${pitcher.player_name}
												</div>

												<div class="player-detail">
													${pitcher.player_team}
												</div>
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
													<fmt:formatNumber value="${pitcher.era}" pattern="0.00"/>
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

							<c:set var="awayHitterFound" value="false"/>

							<c:forEach var="hitter" items="${hitterList}">
								<c:if test="${!awayHitterFound && hitter.player_team == schedule.away_team}">

									<c:set var="awayHitterFound" value="true"/>

									<div class="player-compare-team">

										<div class="player-team-name">
											${schedule.away_team}
										</div>

										<div class="key-player">

											<img src="${hitter.player_image}"
												class="key-player-image"
												alt="${hitter.player_name}">

											<div>
												<div class="key-player-name">
													${hitter.player_name}
												</div>

												<div class="key-player-detail">
													${hitter.player_team}
												</div>
											</div>

										</div>

										<div class="key-player-stat">

											<div class="key-player-stat-row">
												<span>타율</span>
												<span>
													<fmt:formatNumber value="${hitter.batting_avg}" pattern="0.000"/>
												</span>
											</div>

											<div class="key-player-stat-row">
												<span>안타</span>
												<span>${hitter.hits}</span>
											</div>

											<div class="key-player-stat-row">
												<span>홈런</span>
												<span>${hitter.home_runs}</span>
											</div>

											<div class="key-player-stat-row">
												<span>타점</span>
												<span>${hitter.runs_batted_in}</span>
											</div>

										</div>

									</div>

								</c:if>
							</c:forEach>

							<div class="player-compare-vs">VS</div>

							<c:set var="homeHitterFound" value="false"/>

							<c:forEach var="hitter" items="${hitterList}">
								<c:if test="${!homeHitterFound && hitter.player_team == schedule.home_team}">

									<c:set var="homeHitterFound" value="true"/>

									<div class="player-compare-team">

										<div class="player-team-name">
											${schedule.home_team}
										</div>

										<div class="key-player">

											<img src="${hitter.player_image}"
												class="key-player-image"
												alt="${hitter.player_name}">

											<div>
												<div class="key-player-name">
													${hitter.player_name}
												</div>

												<div class="key-player-detail">
													${hitter.player_team}
												</div>
											</div>

										</div>

										<div class="key-player-stat">

											<div class="key-player-stat-row">
												<span>타율</span>
												<span>
													<fmt:formatNumber value="${hitter.batting_avg}" pattern="0.000"/>
												</span>
											</div>

											<div class="key-player-stat-row">
												<span>안타</span>
												<span>${hitter.hits}</span>
											</div>

											<div class="key-player-stat-row">
												<span>홈런</span>
												<span>${hitter.home_runs}</span>
											</div>

											<div class="key-player-stat-row">
												<span>타점</span>
												<span>${hitter.runs_batted_in}</span>
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

									<td>
										<c:set var="awayLineupFound" value="false"/>

										<c:forEach var="lineup" items="${lineupList}">

											<c:if test="${lineup.team == 'away' && lineup.batting_order == order}">

												<c:set var="awayLineupFound" value="true"/>

												<div class="lineup-player">

													<img src="${lineup.player_image}"
														class="lineup-player-image"
														alt="${lineup.player_name}">

													<span class="lineup-player-name">
														${lineup.player_name}
													</span>

												</div>

											</c:if>

										</c:forEach>

										<c:if test="${!awayLineupFound}">
											<span class="lineup-empty">-</span>
										</c:if>
									</td>

									<td>
										<c:set var="awayPositionFound" value="false"/>

										<c:forEach var="lineup" items="${lineupList}">

											<c:if test="${lineup.team == 'away' && lineup.batting_order == order}">

												<c:set var="awayPositionFound" value="true"/>
												${lineup.position}

											</c:if>

										</c:forEach>

										<c:if test="${!awayPositionFound}">
											<span class="lineup-empty">-</span>
										</c:if>
									</td>

									<td>
										<c:set var="homeLineupFound" value="false"/>

										<c:forEach var="lineup" items="${lineupList}">

											<c:if test="${lineup.team == 'home' && lineup.batting_order == order}">

												<c:set var="homeLineupFound" value="true"/>

												<div class="lineup-player">

													<img src="${lineup.player_image}"
														class="lineup-player-image"
														alt="${lineup.player_name}">

													<span class="lineup-player-name">
														${lineup.player_name}
													</span>

												</div>

											</c:if>

										</c:forEach>

										<c:if test="${!homeLineupFound}">
											<span class="lineup-empty">-</span>
										</c:if>
									</td>

									<td>
										<c:set var="homePositionFound" value="false"/>

										<c:forEach var="lineup" items="${lineupList}">

											<c:if test="${lineup.team == 'home' && lineup.batting_order == order}">

												<c:set var="homePositionFound" value="true"/>
												${lineup.position}

											</c:if>

										</c:forEach>

										<c:if test="${!homePositionFound}">
											<span class="lineup-empty">-</span>
										</c:if>
									</td>

								</tr>

							</c:forEach>

						</tbody>

					</table>

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
												<td>
													<fmt:formatNumber value="${awayTeam.batting_avg}" pattern="0.000"/>
												</td>
												<td>
													<fmt:formatNumber value="${homeTeam.batting_avg}" pattern="0.000"/>
												</td>
											</tr>

											<tr>
												<td>ERA</td>
												<td>
													<fmt:formatNumber value="${awayTeam.era}" pattern="0.00"/>
												</td>
												<td>
													<fmt:formatNumber value="${homeTeam.era}" pattern="0.00"/>
												</td>
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
				<div class="open-talk-count">
					${schedule.away_team} vs ${schedule.home_team}
				</div>
			</div>

			<div class="chat-list" id="chatList_${schedule.game_id}"></div>

			<div class="chat-input-area">

				<div class="chat-input">

					<input type="text"
						id="chatInput_${schedule.game_id}"
						placeholder="메시지를 입력하세요">

					<button type="button"
						onclick="sendChat(${schedule.game_id})">
						등록
					</button>

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

function sendChat(gameId){
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
}

document.querySelectorAll("[id^='chatInput_']").forEach(function(input){
	input.addEventListener("keydown",function(event){
		if(event.key==="Enter"){
			const gameId=this.id.replace("chatInput_","");
			sendChat(gameId);
		}
	});
});
</script>

</body>
</html>