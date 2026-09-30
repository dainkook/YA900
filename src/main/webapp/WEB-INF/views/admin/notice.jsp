<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지관리</title>
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
   Header
========================= */

.header {
	width: 100%;
	background: linear-gradient(135deg, #0b1026, #171f46);
	color: white;
	box-shadow: 0 3px 15px rgba(11, 16, 38, 0.18);
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
	transition: 0.2s;
}

.logout-btn:hover {
	background-color: #476aaa;
	border-color: #476aaa;
}

/* =========================
   Navigation
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

	transition: 0.2s;
}

.menu-item:hover {
	background-color: #252f67;
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
   Body
========================= */

.body {
	width: 1200px;

	margin: 0 auto;

	padding: 40px 0 60px;

	min-height: calc(100vh - 160px);
}

/* =========================
   Page Title
========================= */

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
   Search
========================= */

.search-area {
	width: 100%;

	display: flex;
	justify-content: center;
	align-items: center;

	gap: 10px;

	margin-bottom: 25px;

	padding: 20px;

	background-color: white;

	border: 1px solid #d6dceb;
	border-radius: 12px;

	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
}

.search-area select {
	width: 150px;
	height: 42px;

	padding: 0 10px;

	border: 1px solid #cfd5e3;
	border-radius: 5px;

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

	background-color: #476aaa;
	color: white;

	font-size: 14px;
	font-weight: bold;

	cursor: pointer;
}

.search-area button:hover {
	background-color: #354f88;
}

/* =========================
   Notice List
========================= */

.notice-list {
	width: 100%;

	background-color: white;

	border: 1px solid #d6dceb;
	border-radius: 12px;

	overflow: hidden;

	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
}

.notice-row {
	width: 100%;
	min-height: 58px;

	display: flex;

	border-bottom: 1px solid #e4e7ef;
}

.notice-row:last-child {
	border-bottom: none;
}

.notice-row > div {
	display: flex;
	justify-content: center;
	align-items: center;

	padding: 10px;

	color: #30384f;

	font-size: 14px;
}

/* Header */

.notice-row.header-row {
	background-color: #f7f8fc;
}

.notice-row.header-row > div {
	color: #18213f;
	font-weight: bold;
}

/* Column */

.notice-no {
	width: 10%;
}

.notice-title {
	width: 50%;

	justify-content: flex-start !important;
}

.notice-writer {
	width: 12%;
}

.notice-date {
	width: 16%;
}

.notice-view {
	width: 12%;
}

/* Title link */

.notice-title a {
	width: 100%;

	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;

	color: #30384f;

	text-decoration: none;
}

.notice-title a:hover {
	color: #476aaa;
	text-decoration: underline;
}

/* =========================
   Write Button
========================= */

.notice-bottom {
	width: 100%;

	display: flex;
	justify-content: flex-end;

	margin-top: 15px;
}

.write-btn {
	padding: 10px 18px;

	border: none;
	border-radius: 5px;

	background-color: #476aaa;
	color: white;

	font-size: 14px;
	font-weight: bold;

	cursor: pointer;
}

.write-btn:hover {
	background-color: #354f88;
}

/* =========================
   Pagination
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

.pagination .arrow {
	font-size: 13px;
}

/* =========================
   Footer
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

	<!-- =========================
	     Header
	========================= -->

	<div class="header">

		<div class="top">

			<div class="logo">
				YA900 ADMIN
			</div>

			<div class="login">

				<span>
					${admin_name} 관리자님
				</span>

				<button
					type="button"
					class="logout-btn"
					onclick="location.href='/admin/logout'">
					로그아웃
				</button>

			</div>

		</div>


		<!-- Navigation -->

		<div class="menu">

			<div class="menu-item">
				<a href="/admin/main">
					대시보드
				</a>
			</div>

			<div class="menu-item active">
				<a href="/admin/notice">
					공지관리
				</a>
			</div>

			<div class="menu-item">
				<a href="/admin/member">
					회원관리
				</a>
			</div>

			<div class="menu-item">
				<a href="/admin/reservation">
					예매관리
				</a>
			</div>

			<div class="menu-item">
				<a href="/admin/schedule">
					경기관리
				</a>
			</div>

			<div class="menu-item">
				<a href="/admin/report">
					신고관리
				</a>
			</div>

		</div>

	</div>


	<!-- =========================
	     Body
	========================= -->

	<div class="body">

		<div class="page-title">

			공지 관리

			<div class="page-subtitle">
				서비스의 주요 공지사항을 관리할 수 있습니다.
			</div>

		</div>


		<!-- Search -->

		<div class="search-area">

			<select name="category">

				<option value="all">
					전체
				</option>

				<option value="title">
					제목
				</option>

				<option value="contents">
					내용
				</option>

			</select>


			<input
				type="text"
				name="search"
				placeholder="검색어를 입력하세요">


			<button type="button">
				검색
			</button>

		</div>


		<!-- Notice List -->

		<div class="notice-list">

			<!-- Header -->

			<div class="notice-row header-row">

				<div class="notice-no">
					번호
				</div>

				<div class="notice-title">
					제목
				</div>

				<div class="notice-writer">
					작성자
				</div>

				<div class="notice-date">
					작성일
				</div>

				<div class="notice-view">
					조회수
				</div>

			</div>


			<!-- Sample Data -->

			<div class="notice-row">

				<div class="notice-no">
					10
				</div>

				<div class="notice-title">

					<a href="/admin/notice/detail?seq=10">
						예매 시스템 점검 안내
					</a>

				</div>

				<div class="notice-writer">
					관리자
				</div>

				<div class="notice-date">
					2026-09-30
				</div>

				<div class="notice-view">
					125
				</div>

			</div>


			<div class="notice-row">

				<div class="notice-no">
					9
				</div>

				<div class="notice-title">

					<a href="/admin/notice/detail?seq=9">
						회원 이용 안내
					</a>

				</div>

				<div class="notice-writer">
					관리자
				</div>

				<div class="notice-date">
					2026-09-28
				</div>

				<div class="notice-view">
					82
				</div>

			</div>


			<div class="notice-row">

				<div class="notice-no">
					8
				</div>

				<div class="notice-title">

					<a href="/admin/notice/detail?seq=8">
						사이트 이용 안내
					</a>

				</div>

				<div class="notice-writer">
					관리자
				</div>

				<div class="notice-date">
					2026-09-25
				</div>

				<div class="notice-view">
					61
				</div>

			</div>


			<div class="notice-row">

				<div class="notice-no">
					7
				</div>

				<div class="notice-title">

					<a href="/admin/notice/detail?seq=7">
						티켓 예매 관련 안내
					</a>

				</div>

				<div class="notice-writer">
					관리자
				</div>

				<div class="notice-date">
					2026-09-22
				</div>

				<div class="notice-view">
					47
				</div>

			</div>


			<div class="notice-row">

				<div class="notice-no">
					6
				</div>

				<div class="notice-title">

					<a href="/admin/notice/detail?seq=6">
						서비스 이용약관 변경 안내
					</a>

				</div>

				<div class="notice-writer">
					관리자
				</div>

				<div class="notice-date">
					2026-09-20
				</div>

				<div class="notice-view">
					38
				</div>

			</div>

		</div>


		<!-- Write Button -->

		<div class="notice-bottom">

			<button
				type="button"
				class="write-btn"
				onclick="location.href='/admin/notice/write'">

				공지 작성

			</button>

		</div>
		
		<div class="pagination">

			<a href="#" class="arrow">
				◀
			</a>

			<a href="#" class="active">
				1
			</a>

			<a href="#">
				2
			</a>

			<a href="#">
				3
			</a>

			<a href="#">
				4
			</a>

			<a href="#">
				5
			</a>

			<a href="#">
				6
			</a>

			<a href="#">
				7
			</a>

			<a href="#">
				8
			</a>

			<a href="#">
				9
			</a>

			<a href="#">
				10
			</a>

			<a href="#" class="arrow">
				▶
			</a>

		</div>

	</div>

	<div class="footer">
		YA900 ADMIN
	</div>
</div>
</body>
</html>