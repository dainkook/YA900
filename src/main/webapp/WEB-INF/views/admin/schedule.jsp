<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>경기관리</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background-color: #eef1f8;
	color: #18213f;
	font-family: Arial, "Malgun Gothic", sans-serif;
}

.container {
	width: 100%;
	min-height: 100vh;
	background-color: #eef1f8;
}

/* =========================
   헤더
========================= */
.header {
	width: 100%;
	background: linear-gradient(135deg, #0b1026, #171f46);
	color: white;
	box-shadow: 0 3px 15px rgba(11, 16, 38, .18);
}

.top {
	width: 100%;
	height: 100px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 50px;
}

.logo {
	font-size: 30px;
	font-weight: bold;
	letter-spacing: 1px;
}

.login {
	display: flex;
	align-items: center;
	gap: 15px;
	font-size: 14px;
}

.logout-btn {
	padding: 8px 15px;
	border: 1px solid #7180b1;
	border-radius: 5px;
	background: transparent;
	color: white;
	cursor: pointer;
}

.logout-btn:hover {
	background-color: rgba(255, 255, 255, .1);
}

/* =========================
   메뉴
========================= */
.menu {
	height: 60px;
	display: flex;
	border-top: 1px solid #303b70;
}

.menu-item {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: .2s;
}

.menu-item:hover {
	background-color: rgba(255, 255, 255, .08);
}

.menu-item.active {
	background-color: #476aaa;
}

.menu-item a {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	color: inherit;
}

/* =========================
   본문
========================= */
.body {
	width: 1200px;
	margin: 0 auto;
	padding: 40px 0 60px;
	min-height: calc(100vh - 160px);
}

.page-title {
	margin-bottom: 30px;
	color: #111936;
	font-size: 28px;
	font-weight: bold;
}

.page-subtitle {
	margin-top: 8px;
	color: #68718a;
	font-size: 14px;
	font-weight: normal;
}

/* =========================
   검색
========================= */
.search-area {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	margin-bottom: 25px;
	padding: 20px;
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, .06);
}

.search-area form {
	display: flex;
	align-items: center;
	gap: 10px;
}

.search-area select {
	width: 150px;
	height: 42px;
	padding: 0 10px;
	border: 1px solid #cfd5e3;
	border-radius: 5px;
	background: white;
	font-size: 14px;
}

.search-area input {
	width: 400px;
	height: 42px;
	padding: 10px;
	border: 1px solid #cfd5e3;
	border-radius: 5px;
	font-size: 14px;
}

.search-area button {
	width: 90px;
	height: 42px;
	border: none;
	border-radius: 5px;
	background: #476aaa;
	color: white;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
}

.search-area button:hover {
	background: #395a96;
}

/* =========================
   경기 목록
========================= */
.schedule-list {
	width: 100%;
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 5px 18px rgba(17, 25, 54, .06);
}

/* 목록 상단 */
.schedule-list-header {
	width: 100%;
	height: 65px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 25px;
	background-color: white;
	border-bottom: 1px solid #d6dceb;
}

.schedule-count {
	color: #68718a;
	font-size: 14px;
}

.schedule-count strong {
	color: #111936;
	font-size: 16px;
}

/* 경기 등록 버튼 */
.write-btn {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	padding: 8px 15px;
	border: none;
	border-radius: 5px;
	background-color: #476aaa;
	color: white;
	font-size: 13px;
	font-weight: bold;
	text-decoration: none;
	margin-left: 15px;
}

.write-btn:hover {
	background-color: #395a96;
}

/* =========================
   경기 행
========================= */
.schedule-row {
	width: 100%;
	min-height: 80px;
	display: flex;
	border-bottom: 1px solid #e4e7ef;
}

.schedule-row:last-child {
	border-bottom: none;
}

.schedule-row.header-row {
	min-height: 58px;
	background-color: #f7f8fc;
}

.schedule-row.header-row>div {
	color: #68718a;
	font-size: 14px;
	font-weight: bold;
}

.schedule-row>div {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
	color: #30384f;
	font-size: 14px;
	text-align: center;
}

/* =========================
   컬럼
========================= */
.schedule-no {
	width: 8%;
}

.schedule-date {
	width: 17%;
}

.schedule-game {
	width: 32%;
}

.schedule-location {
	width: 15%;
}

.schedule-status {
	width: 13%;
}

.schedule-manage {
	width: 15%;
}

/* =========================
   경기 팀
========================= */
.match {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 20px;
}

.team {
	width: 120px;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 8px;
	font-weight: bold;
}

.team img {
	width: 38px;
	height: 38px;
	object-fit: contain;
}

.vs {
	color: #68718a;
	font-size: 12px;
	font-weight: bold;
}

/* =========================
   경기 날짜
========================= */
.game-date {
	line-height: 1.6;
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
   상세 버튼
========================= */
.detail-btn {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	padding: 7px 13px;
	border: 1px solid #cfd5e3;
	border-radius: 5px;
	background-color: white;
	color: #30384f;
	font-size: 12px;
	text-decoration: none;
}

.detail-btn:hover {
	background-color: #f1f4fa;
}

/* =========================
   데이터 없음
========================= */
.empty {
	width: 100%;
	height: 150px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #68718a;
	font-size: 14px;
}

/* =========================
   페이지네이션
========================= */
.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	margin-top: 30px;
}

.pagination a {
	min-width: 32px;
	height: 32px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #68718a;
	border-radius: 5px;
	text-decoration: none;
	font-size: 14px;
}

.pagination a:hover {
	background-color: #e8edf8;
	color: #18213f;
}

.pagination a.active {
	background-color: #476aaa;
	color: white;
	font-weight: bold;
}

/* =========================
   푸터
========================= */
.footer {
	width: 100%;
	height: 70px;
	background-color: #eef1f8;
	border-top: 1px solid #d6dceb;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #68718a;
	font-size: 13px;
}
</style>

</head>

<body>

	<div class="container">

		<div class="header">

			<div class="top">

				<div class="logo">YA900 ADMIN</div>

				<div class="login">

					<span> ${admin_name} 관리자님 </span>

					<button class="logout-btn">로그아웃</button>

				</div>

			</div>

			<div class="menu">

				<div class="menu-item">
					<a href="/admin/main"> 대시보드 </a>
				</div>

				<div class="menu-item">
					<a href="/admin/notice"> 공지관리 </a>
				</div>

				<div class="menu-item">
					<a href="/admin/member"> 회원관리 </a>
				</div>

				<div class="menu-item">
					<a href="/admin/reservation"> 예매관리 </a>
				</div>

				<div class="menu-item active">
					<a href="/admin/schedule"> 경기관리 </a>
				</div>

				<div class="menu-item">
					<a href="/admin/report"> 신고관리 </a>
				</div>

			</div>

		</div>

		<div class="body">

			<div class="page-title">

				경기 관리

				<div class="page-subtitle">등록된 경기 일정을 관리할 수 있습니다.</div>

			</div>

			<div class="search-area">

				<form action="/admin/schedule/search" method="get">

					<select name="searchType">

						<option value="all"
							${searchType == 'all' || empty searchType ? 'selected' : ''}>
							전체</option>

						<option value="team" ${searchType == 'team' ? 'selected' : ''}>
							팀</option>

						<option value="location"
							${searchType == 'location' ? 'selected' : ''}>구장</option>

					</select> <input type="text" name="keyword" value="${keyword}"
						placeholder="검색어를 입력하세요.">

					<button type="submit">검색</button>

				</form>

			</div>

			<div class="schedule-list">

				<div class="schedule-list-header">

					<div>경기 목록</div>

					<div>

						<span class="schedule-count"> 총 <strong>${page.recordCount}</strong>
							건
						</span> <a href="${pageContext.request.contextPath}/admin/schedule/write"
							class="write-btn"> 경기 등록 </a>

					</div>

				</div>

				<div class="schedule-row header-row">

					<div class="schedule-no">경기번호</div>

					<div class="schedule-date">경기일시</div>

					<div class="schedule-game">경기</div>

					<div class="schedule-location">구장</div>

					<div class="schedule-status">상태</div>

					<div class="schedule-manage">관리</div>

				</div>

				<c:choose>

					<c:when test="${not empty list}">

						<c:forEach var="schedule" items="${list}">

							<div class="schedule-row">

								<div class="schedule-no">${schedule.game_id}</div>

								<div class="schedule-date">

									<div class="game-date">

										<fmt:formatDate value="${schedule.start_date}"
											pattern="yyyy-MM-dd" />

										<br>

										<fmt:formatDate value="${schedule.start_date}" pattern="HH:mm" />

									</div>

								</div>

								<div class="schedule-game">

									<div class="match">

										<div class="team">

											<c:if test="${not empty schedule.home_logo}">

												<img
													src="${pageContext.request.contextPath}${schedule.home_logo}"
													alt="${schedule.home_team}">

											</c:if>

											<span> ${schedule.home_team} </span>

										</div>

										<div class="vs">VS</div>

										<div class="team">

											<c:if test="${not empty schedule.away_logo}">

												<img
													src="${pageContext.request.contextPath}${schedule.away_logo}"
													alt="${schedule.away_team}">

											</c:if>

											<span> ${schedule.away_team} </span>

										</div>

									</div>

								</div>

								<div class="schedule-location">${schedule.location}</div>

								<div class="schedule-status">

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

								<div class="schedule-manage">

									<a class="detail-btn"
										href="/admin/schedule/detail?game_id=${schedule.game_id}">
										상세 </a>

								</div>

							</div>

						</c:forEach>

					</c:when>

					<c:otherwise>

						<div class="empty">등록된 경기 정보가 없습니다.</div>

					</c:otherwise>

				</c:choose>

			</div>

			<%-- =========================
			     페이지네이션
			========================= --%>

			<div class="pagination">

				<c:if test="${page.startPage > 1}">

					<c:choose>

						<c:when test="${not empty searchType}">

							<a
								href="/admin/schedule/search?searchType=${searchType}&keyword=${keyword}&cpage=${page.startPage - 1}">
								◀ </a>

						</c:when>

						<c:otherwise>

							<a href="/admin/schedule?cpage=${page.startPage - 1}"> ◀ </a>

						</c:otherwise>

					</c:choose>

				</c:if>

				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">

					<c:choose>

						<c:when test="${not empty searchType}">

							<a
								href="/admin/schedule/search?searchType=${searchType}&keyword=${keyword}&cpage=${i}"
								class="${i == page.currentPage ? 'active' : ''}"> ${i} </a>

						</c:when>

						<c:otherwise>

							<a href="/admin/schedule?cpage=${i}"
								class="${i == page.currentPage ? 'active' : ''}"> ${i} </a>

						</c:otherwise>

					</c:choose>

				</c:forEach>

				<c:if test="${page.endPage < page.pageTotal}">

					<c:choose>

						<c:when test="${not empty searchType}">

							<a
								href="/admin/schedule/search?searchType=${searchType}&keyword=${keyword}&cpage=${page.endPage + 1}">
								▶ </a>

						</c:when>

						<c:otherwise>

							<a href="/admin/schedule?cpage=${page.endPage + 1}"> ▶ </a>

						</c:otherwise>

					</c:choose>

				</c:if>

			</div>

		</div>

		<div class="footer">YA900 ADMIN</div>

	</div>

</body>

</html>