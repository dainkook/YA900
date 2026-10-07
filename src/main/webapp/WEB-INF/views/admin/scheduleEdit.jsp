<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">

<title>경기 수정</title>

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
   수정 카드
========================= */
.schedule-edit-card {
	background-color: white;
	border-radius: 12px;
	padding: 35px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.form-table {
	width: 100%;
	border-collapse: collapse;
}

.form-table th {
	width: 180px;
	padding: 16px;
	background-color: #f7f8fb;
	border-bottom: 1px solid #eee;
	text-align: left;
	font-size: 14px;
	color: #555;
}

.form-table td {
	padding: 12px 16px;
	border-bottom: 1px solid #eee;
}

.form-control {
	width: 100%;
	height: 42px;
	padding: 0 12px;
	border: 1px solid #ddd;
	border-radius: 6px;
	font-size: 14px;
	outline: none;
}

.form-control:focus {
	border-color: #476aaa;
}

select.form-control {
	background-color: white;
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

.btn-save {
	background-color: #476aaa;
	color: white;
}

.btn-save:hover {
	background-color: #3b5b92;
}

/* =========================
   안내문
========================= */
.notice {
	margin-top: 20px;
	padding: 15px;
	border-radius: 6px;
	background-color: #f7f8fb;
	color: #777;
	font-size: 13px;
}

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


	<div class="container">

		<div class="page-title">

			<h2>경기 수정</h2>

			<p>경기예정 상태의 경기 정보만 수정할 수 있습니다.</p>

		</div>


		<div class="schedule-edit-card">

			<form
				action="${pageContext.request.contextPath}/admin/schedule/editProc"
				method="post">

				<input type="hidden" name="game_id" value="${schedule.game_id}">


				<table class="form-table">

					<tr>

						<th>경기 제목</th>

						<td><input type="text" name="title" class="form-control"
							value="${schedule.title}" required></td>

					</tr>


					<tr>

						<th>경기장</th>

						<td><input type="text" name="location" class="form-control"
							value="${schedule.location}" required></td>

					</tr>


					<tr>

						<th>경기 일시</th>

						<td><input type="datetime-local" name="start_date"
							class="form-control"
							value="<fmt:formatDate value='${schedule.start_date}' pattern="yyyy-MM-dd'T'HH:mm"/>"
							required></td>

					</tr>


					<tr>

						<th>홈팀</th>

						<td><select name="home_id" id="home_id" class="form-control"
							required>

								<option value="">홈팀 선택</option>

								<option value="1" ${schedule.home_id == 1 ? 'selected' : ''}>LG</option>

								<option value="2" ${schedule.home_id == 2 ? 'selected' : ''}>KT</option>

								<option value="3" ${schedule.home_id == 3 ? 'selected' : ''}>삼성</option>

								<option value="4" ${schedule.home_id == 4 ? 'selected' : ''}>한화</option>

								<option value="5" ${schedule.home_id == 5 ? 'selected' : ''}>NC</option>

								<option value="6" ${schedule.home_id == 6 ? 'selected' : ''}>두산</option>

								<option value="7" ${schedule.home_id == 7 ? 'selected' : ''}>SSG</option>

								<option value="8" ${schedule.home_id == 8 ? 'selected' : ''}>키움</option>

								<option value="9" ${schedule.home_id == 9 ? 'selected' : ''}>롯데</option>

								<option value="10" ${schedule.home_id == 10 ? 'selected' : ''}>KIA</option>

						</select></td>

					</tr>


					<tr>

						<th>원정팀</th>

						<td><select name="away_id" id="away_id" class="form-control"
							required>

								<option value="">원정팀 선택</option>

								<option value="1" ${schedule.away_id == 1 ? 'selected' : ''}>LG</option>

								<option value="2" ${schedule.away_id == 2 ? 'selected' : ''}>KT</option>

								<option value="3" ${schedule.away_id == 3 ? 'selected' : ''}>삼성</option>

								<option value="4" ${schedule.away_id == 4 ? 'selected' : ''}>한화</option>

								<option value="5" ${schedule.away_id == 5 ? 'selected' : ''}>NC</option>

								<option value="6" ${schedule.away_id == 6 ? 'selected' : ''}>두산</option>

								<option value="7" ${schedule.away_id == 7 ? 'selected' : ''}>SSG</option>

								<option value="8" ${schedule.away_id == 8 ? 'selected' : ''}>키움</option>

								<option value="9" ${schedule.away_id == 9 ? 'selected' : ''}>롯데</option>

								<option value="10" ${schedule.away_id == 10 ? 'selected' : ''}>KIA</option>

						</select></td>

					</tr>


					<tr>

						<th>네이버 경기 ID</th>

						<td><input type="text" name="naver_game_id"
							class="form-control" value="${schedule.naver_game_id}"></td>

					</tr>

				</table>


				<div class="notice">경기가 진행중이거나 종료된 경우에는 경기 정보를 수정할 수 없습니다.</div>


				<div class="button-area">

					<a
						href="${pageContext.request.contextPath}/admin/schedule/detail?game_id=${schedule.game_id}"
						class="btn btn-list"> 취소 </a>

					<button type="submit" class="btn btn-save">수정하기</button>

				</div>

			</form>

		</div>

	</div>


	<div class="footer">YA900 ADMIN © 2026</div>


	<script>

		const homeSelect = document.getElementById("home_id");
		const awaySelect = document.getElementById("away_id");

		function checkTeam() {

			if (homeSelect.value !== ""
					&& awaySelect.value !== ""
					&& homeSelect.value === awaySelect.value) {

				alert("홈팀과 원정팀은 같은 팀을 선택할 수 없습니다.");

				awaySelect.value = "";
			}
		}

		homeSelect.addEventListener("change", checkTeam);
		awaySelect.addEventListener("change", checkTeam);

	</script>

</body>

</html>