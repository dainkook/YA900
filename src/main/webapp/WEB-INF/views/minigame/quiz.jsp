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

html, body {
	height: 100%;
}

body {
	margin: 0;
	display: flex;
	flex-direction: column;
	background: #fff;
	color: #222;
	font-family: 'Noto Sans KR', system-ui, sans-serif;
	font-size: 13px;
}

/* 공통 */
.box {
	border: 1px solid #cfcfcf;
	padding: 24px 28px;
	min-width: 0;
}

.row {
	display: flex;
	flex-wrap: wrap;
	gap: 16px;
}

h1 {
	margin: 0;
	font-size: 18px;
}

h2 {
	margin: 0 0 20px;
	font-size: 16px;
	text-align: center;
}

.btn {
	min-height: 44px;
	padding: 0 40px;
	border: 1px solid #777;
	background: #fff;
	color: #222;
	font: inherit;
	cursor: pointer;
}

/* 사이트 헤더 */
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

/* 본문 */
.wrap {
	flex: 1 0 auto;
	width: 100%;
	max-width: 992px;
	margin: 0 auto;
	padding: 108px 16px 40px;
	display: flex;
	flex-direction: column;
	gap: 16px;
}

.quiz-start {
	flex: 7 1 480px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	gap: 12px;
	text-align: center;
	padding: 32px 24px;
}

.quiz-start h2 {
	margin-bottom: 8px;
}

.quiz-start p {
	margin: 0;
	color: #555;
}

.quiz-start .btn {
	margin-top: 12px;
}

.my-point {
	flex: 3 1 240px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	padding: 24px;
}

.my-point h2 {
	margin: 0;
}

.point-value {
	height: 64px;
	border: 1px solid #cfcfcf;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 16px;
	font-weight: 700;
}

.my-point .btn {
	width: 100%;
	padding: 0;
	font-size: 12px;
}

.info {
	flex: 1 1 380px;
}

.info ul {
	margin: 0;
	padding: 0 0 0 18px;
	list-style: disc;
	display: flex;
	flex-direction: column;
	gap: 12px;
	color: #333;
}

.table-scroll {
	overflow-x: auto;
}

table {
	width: 100%;
	min-width: 480px;
	border-collapse: collapse;
	font-size: 12px;
	text-align: center;
}

th {
	padding: 10px 8px;
	border-top: 1px solid #cfcfcf;
	border-bottom: 1px solid #777;
	font-weight: 700;
}

td {
	height: 44px;
	border-bottom: 1px solid #e3e3e3;
}

/* 사이트 푸터 */
.site-footer {
	border-top: 1px solid #cfcfcf;
	padding: 28px 16px;
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

	<main class="wrap">

		<div class="box">
			<h1>야구 상식퀴즈</h1>
		</div>

		<div class="row">
			<section class="box quiz-start">
				<h2>오늘의 야구 상식퀴즈</h2>
				<p>문제 수</p>
				<p>획득 가능 포인트</p>
				<button type="button" class="btn">퀴즈 시작</button>
			</section>

			<section class="box my-point">
				<h2>내 포인트</h2>
				<div class="point-value"></div>
				<button type="button" class="btn">포인트 내역</button>
			</section>
		</div>

		<div class="row">
			<section class="box info">
				<h2>퀴즈 안내</h2>
				<ul>
					<li>문제 수</li>
					<li>문제당 포인트</li>
					<li>정답 확인</li>
					<li>랭킹 반영</li>
				</ul>
			</section>

			<section class="box info">
				<h2>최근 기록</h2>
				<ul>
					<li>최근 점수</li>
					<li>최고 점수</li>
					<li>참여 횟수</li>
					<li>정답률</li>
				</ul>
			</section>
		</div>

		<section class="box">
			<h2>퀴즈 랭킹</h2>
			<div class="table-scroll">
				<table>
					<thead>
						<tr>
							<th style="width: 20%">순위</th>
							<th style="width: 45%">사용자</th>
							<th style="width: 35%">점수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

		<section class="box">
			<h2>포인트 내역</h2>
			<div class="table-scroll">
				<table>
					<thead>
						<tr>
							<th style="width: 30%">날짜</th>
							<th style="width: 40%">내용</th>
							<th style="width: 30%">포인트</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

	</main>

	<footer class="site-footer">YA900</footer>
</body>
</html>