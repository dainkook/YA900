<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">

<title>경기 상세정보</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #eef1f8;
	color: #333;
}

/* =========================
   관리자 헤더
========================= */
.header {
	background: linear-gradient(135deg, #0b1026, #171f46);
	color: white;
}

.header-top {
	height: 100px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 1200px;
	margin: 0 auto;
}

.logo {
	font-size: 30px;
	font-weight: bold;
}

.admin-info {
	display: flex;
	align-items: center;
	gap: 15px;
	font-size: 14px;
}

.logout-btn {
	padding: 8px 15px;
	border: 1px solid rgba(255, 255, 255, 0.4);
	border-radius: 5px;
	background: transparent;
	color: white;
	cursor: pointer;
}

.logout-btn:hover {
	background-color: rgba(255, 255, 255, 0.1);
}

.nav {
	height: 60px;
	border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.nav ul {
	width: 1200px;
	height: 100%;
	margin: 0 auto;
	padding: 0;
	list-style: none;
	display: flex;
}

.nav li {
	flex: 1;
	height: 100%;
}

.nav a {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #d7d9e2;
	text-decoration: none;
	font-size: 15px;
	font-weight: bold;
}

.nav a:hover {
	background-color: rgba(255, 255, 255, 0.05);
}

.nav a.active {
	background-color: #476aaa;
	color: white;
}

/* =========================
   본문
========================= */
.container {
	width: 1200px;
	margin: 40px auto 80px;
}

.page-title {
	margin-bottom: 25px;
}

.page-title h2 {
	margin: 0;
	font-size: 25px;
}

.page-title p {
	margin-top: 8px;
	color: #777;
	font-size: 14px;
}

/* =========================
   상세 카드
========================= */
.schedule-detail-card {
	background-color: white;
	border-radius: 12px;
	padding: 35px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

/* 경기 정보 */
.game-header {
	text-align: center;
	padding-bottom: 30px;
	border-bottom: 1px solid #eee;
}

.game-number {
	color: #888;
	font-size: 13px;
	margin-bottom: 10px;
}

.game-title {
	font-size: 21px;
	font-weight: bold;
	margin-bottom: 25px;
}

/* =========================
   팀 정보
========================= */
.team-area {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 70px;
	margin: 10px 0 30px;
}

.team {
	width: 180px;
	text-align: center;
}

.team-logo {
	width: 80px;
	height: 80px;
	object-fit: contain;
	margin-bottom: 12px;
}

.team-name {
	font-size: 20px;
	font-weight: bold;
}

.score {
	font-size: 32px;
	font-weight: bold;
	margin-top: 8px;
}

.vs {
	font-size: 20px;
	font-weight: bold;
	color: #999;
}

/* =========================
   상태
========================= */
.status {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	min-width: 75px;
	padding: 6px 10px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: bold;
}

.status.before {
	background-color: #e8f1ff;
	color: #476aaa;
}

.status.live {
	background-color: #e8f5e9;
	color: #2e7d32;
}

.status.complete {
	background-color: #fceaea;
	color: #c94a4a;
}

/* =========================
   상세 정보
========================= */
.info-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.info-table th {
	width: 180px;
	padding: 16px;
	background-color: #f7f8fb;
	border-bottom: 1px solid #eee;
	text-align: left;
	font-size: 14px;
	color: #555;
}

.info-table td {
	padding: 16px;
	border-bottom: 1px solid #eee;
	font-size: 14px;
}

/* =========================
   버튼
========================= */
.button-area {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 30px;
}

.btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	height: 42px;
	padding: 0 22px;
	border-radius: 6px;
	text-decoration: none;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	border: none;
}

.btn-list {
	background-color: #eef1f8;
	color: #555;
}

.btn-list:hover {
	background-color: #e1e5ef;
}

.btn-edit {
	background-color: #476aaa;
	color: white;
}

.btn-edit:hover {
	background-color: #3b5b92;
}

.btn-delete {
	background-color: #c94a4a;
	color: white;
}

.btn-delete:hover {
	background-color: #ad3d3d;
}
/* =========================
   푸터
========================= */
.footer {
	background-color: #171f46;
	color: #aaa;
	text-align: center;
	padding: 25px 0;
	font-size: 12px;
}
</style>

</head>

<body>

	<!-- 헤더 -->

	<div class="header">

		<div class="header-top">

			<div class="logo">YA900 ADMIN</div>

			<div class="admin-info">

				<span> ${admin_name} 관리자님 </span>

				<form action="${pageContext.request.contextPath}/admin/logout"
					method="post">

					<button type="submit" class="logout-btn">로그아웃</button>

				</form>

			</div>

		</div>


		<div class="nav">

			<ul>

				<li><a href="${pageContext.request.contextPath}/admin">
						대시보드 </a></li>

				<li><a href="${pageContext.request.contextPath}/admin/notice">
						공지관리 </a></li>

				<li><a href="${pageContext.request.contextPath}/admin/member">
						회원관리 </a></li>

				<li><a
					href="${pageContext.request.contextPath}/admin/reservation">
						예매관리 </a></li>

				<li><a href="${pageContext.request.contextPath}/admin/schedule"
					class="active"> 경기관리 </a></li>

				<li><a href="${pageContext.request.contextPath}/admin/report">
						신고관리 </a></li>

			</ul>

		</div>

	</div>


	<!-- 본문 -->

	<div class="container">

		<div class="page-title">

			<h2>경기 상세정보</h2>

			<p>등록된 경기의 상세 정보를 확인할 수 있습니다.</p>

		</div>


		<div class="schedule-detail-card">

			<div class="game-header">

				<div class="game-number">GAME ID ${schedule.game_id}</div>

				<div class="game-title">${schedule.title}</div>


				<div class="team-area">

					<div class="team">

						<img src="${pageContext.request.contextPath}${schedule.home_logo}"
							class="team-logo">

						<div class="team-name">${schedule.home_team}</div>

						<c:if test="${not empty schedule.home_score}">
							<div class="score">${schedule.home_score}</div>
						</c:if>

					</div>


					<div class="vs">VS</div>


					<div class="team">

						<img src="${pageContext.request.contextPath}${schedule.away_logo}"
							class="team-logo">

						<div class="team-name">${schedule.away_team}</div>

						<c:if test="${not empty schedule.away_score}">
							<div class="score">${schedule.away_score}</div>
						</c:if>

					</div>

				</div>


				<div>

					<c:choose>

						<c:when test="${schedule.game_status eq '진행중'}">
							<span class="status live"> 진행중 </span>
						</c:when>

						<c:when test="${schedule.game_status eq '종료'}">
							<span class="status complete"> 종료 </span>
						</c:when>

						<c:when test="${schedule.game_status eq '경기예정'}">
							<span class="status before"> 경기예정 </span>
						</c:when>

						<c:otherwise>
							<span class="status before"> ${schedule.game_status} </span>
						</c:otherwise>

					</c:choose>

				</div>

			</div>


			<!-- 상세 정보 -->

			<table class="info-table">

				<tr>

					<th>경기 제목</th>

					<td>${schedule.title}</td>

				</tr>


				<tr>

					<th>경기 일시</th>

					<td><fmt:formatDate value="${schedule.start_date}"
							pattern="yyyy-MM-dd HH:mm" /></td>

				</tr>


				<tr>

					<th>경기 종료 시간</th>

					<td><c:choose>

							<c:when test="${not empty schedule.end_date}">

								<fmt:formatDate value="${schedule.end_date}"
									pattern="yyyy-MM-dd HH:mm" />

							</c:when>

							<c:otherwise>
								-
							</c:otherwise>

						</c:choose></td>

				</tr>


				<tr>

					<th>경기장</th>

					<td>${schedule.location}</td>

				</tr>


				<tr>

					<th>홈팀</th>

					<td>${schedule.home_team}</td>

				</tr>


				<tr>

					<th>원정팀</th>

					<td>${schedule.away_team}</td>

				</tr>


				<tr>

					<th>스코어</th>

					<td><c:choose>

							<c:when
								test="${not empty schedule.home_score and not empty schedule.away_score}">
								${schedule.home_score} : ${schedule.away_score}
							</c:when>

							<c:otherwise>
								-
							</c:otherwise>

						</c:choose></td>

				</tr>


				<tr>

					<th>승리팀</th>

					<td><c:choose>

							<c:when test="${not empty schedule.winner_id}">

								<c:choose>

									<c:when test="${schedule.winner_id == schedule.home_id}">
										${schedule.home_team}
									</c:when>

									<c:when test="${schedule.winner_id == schedule.away_id}">
										${schedule.away_team}
									</c:when>

									<c:otherwise>
										-
									</c:otherwise>

								</c:choose>

							</c:when>

							<c:otherwise>
								-
							</c:otherwise>

						</c:choose></td>

				</tr>


				<tr>

					<th>네이버 경기 ID</th>

					<td><c:choose>

							<c:when test="${not empty schedule.naver_game_id}">
								${schedule.naver_game_id}
							</c:when>

							<c:otherwise>
								-
							</c:otherwise>

						</c:choose></td>

				</tr>

			</table>


			<!-- 버튼 -->

			<div class="button-area">

				<a href="${pageContext.request.contextPath}/admin/schedule"
					class="btn btn-list"> 목록으로 </a>

				<c:if test="${schedule.game_status eq '경기예정'}">

					<a
						href="${pageContext.request.contextPath}/admin/schedule/edit?game_id=${schedule.game_id}"
						class="btn btn-edit"> 경기 수정 </a>

					<a
						href="${pageContext.request.contextPath}/admin/schedule/delete?game_id=${schedule.game_id}"
						class="btn btn-delete"
						onclick="return confirm('정말 이 경기를 삭제하시겠습니까?');"> 경기 삭제 </a>

				</c:if>

			</div>

		</div>

	</div>


	<!-- 푸터 -->

	<div class="footer">YA900 ADMIN © 2026</div>

</body>

</html>