<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background: #fff;
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #222;
}

/* ===== 공통 헤더 ===== */
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

.user-menu {
	margin-left: auto;
	display: flex;
	gap: 10px;
}

.user-menu button {
	background-color: white;
	border: 1px solid #aaa;
	padding: 9px 18px;
	font-size: 14px;
	cursor: pointer;
}

/* ===== 본문 ===== */
.container {
	width: 100%;
	max-width: 1082px;
	margin: 110px auto 40px;
	padding: 0 16px;
}

.title {
	height: 60px;
	border: 1px solid #ccc;
	display: flex;
	align-items: center;
	padding: 0 20px;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 15px;
}

.box {
	border: 1px solid #ccc;
	padding: 20px;
	margin-bottom: 15px;
	min-width: 0;
}

.area-title {
	text-align: center;
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 18px;
}

/* 요약 카드 */
.summary {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 15px;
	margin-bottom: 15px;
}

.summary-card {
	border: 1px solid #ccc;
	padding: 20px;
	text-align: center;
	font-size: 13px;
}

.summary-card strong {
	display: block;
	margin-top: 10px;
	min-height: 22px;
	font-size: 17px;
}

/* 오늘의 경기 */
.match-card {
	border: 1px solid #ccc;
	padding: 14px 16px 16px;
	margin-bottom: 12px;
}

.match-card:last-child {
	margin-bottom: 0;
}

.match-info {
	display: grid;
	grid-template-columns: 1.1fr 1fr 0.5fr 1fr;
	align-items: center;
	text-align: center;
	min-height: 28px;
	margin-bottom: 12px;
	font-size: 13px;
}

.match-team {
	font-weight: bold;
	min-height: 18px;
}

.match-vs {
	font-size: 12px;
}

.match-pick {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 8px;
}

.match-pick button {
	height: 38px;
	border: 1px solid #ccc;
	background: white;
	font-size: 12px;
	cursor: pointer;
}

.match-pick button:hover {
	background: #f5f5f5;
}

/* 표 */
.table-scroll {
	overflow-x: auto;
}

table {
	width: 100%;
	min-width: 520px;
	border-collapse: collapse;
	font-size: 13px;
	text-align: center;
}

th {
	padding: 11px 8px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #888;
	font-weight: bold;
}

td {
	height: 44px;
	border-bottom: 1px solid #e5e5e5;
}

.my-table tbody tr:first-child td {
	border-top: 1px solid #ccc;
}

.my-table td {
	height: 52px;
	border-bottom: 1px solid #ccc;
}

.save-area {
	text-align: center;
	margin-top: 16px;
}

.save-btn {
	width: 110px;
	height: 40px;
	border: 1px solid #aaa;
	background: white;
	font-size: 13px;
	cursor: pointer;
}

.save-btn:hover {
	background: #f5f5f5;
}

/* ===== 공통 푸터 ===== */
.footer {
	border-top: 1px solid #ddd;
	margin-top: 60px;
	padding: 30px 16px;
	text-align: center;
	font-size: 10px;
	color: #777;
}
</style>
</head>

<body>
	<header class="header">

		<div class="logo">YA900</div>

		<nav class="main-menu">

			<a href="#"> 야구 </a> <a href="#"> 축구 </a> <a href="#"> 미니게임 </a>

		</nav>

		<div class="user-menu">

			<button>로그인</button>

			<button>회원가입</button>

		</div>

	</header>

	<div class="container">

		<div class="title">승부예측</div>

		<div class="summary">
			<div class="summary-card">
				보유 포인트 <strong></strong>
			</div>
			<div class="summary-card">
				예측 참여 <strong></strong>
			</div>
			<div class="summary-card">
				적중률 <strong></strong>
			</div>
		</div>

		<section class="box">
			<div class="area-title">오늘의 경기</div>

			<div class="match-card">
				<div class="match-info">
					<div class="match-time"></div>
					<div class="match-team"></div>
					<div class="match-vs">VS</div>
					<div class="match-team"></div>
				</div>
				<div class="match-pick">
					<button type="button">승</button>
					<button type="button">무승부</button>
					<button type="button">승</button>
				</div>
			</div>

			<div class="match-card">
				<div class="match-info">
					<div class="match-time"></div>
					<div class="match-team"></div>
					<div class="match-vs">VS</div>
					<div class="match-team"></div>
				</div>
				<div class="match-pick">
					<button type="button">승</button>
					<button type="button">무승부</button>
					<button type="button">승</button>
				</div>
			</div>

			<div class="match-card">
				<div class="match-info">
					<div class="match-time"></div>
					<div class="match-team"></div>
					<div class="match-vs">VS</div>
					<div class="match-team"></div>
				</div>
				<div class="match-pick">
					<button type="button">승</button>
					<button type="button">무승부</button>
					<button type="button">승</button>
				</div>
			</div>
		</section>

		<section class="box">
			<div class="area-title">내 예측</div>

			<div class="table-scroll">
				<table class="my-table">
					<colgroup>
						<col style="width: 16%">
						<col style="width: 40%">
						<col style="width: 24%">
						<col style="width: 20%">
					</colgroup>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="save-area">
				<button type="button" class="save-btn">예측 제출</button>
			</div>
		</section>

		<section class="box">
			<div class="area-title">예측 내역</div>

			<div class="table-scroll">
				<table>
					<thead>
						<tr>
							<th style="width: 16%">날짜</th>
							<th style="width: 34%">경기</th>
							<th style="width: 20%">예측</th>
							<th style="width: 15%">결과</th>
							<th style="width: 15%">포인트</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

	</div>

	<footer class="footer"> YA900 </footer>
</body>
</html>