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
	padding: 30px;
	background: #fff;
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #222;
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

.container {
	width: 1050px;
	margin: 110px auto 40px;
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

.main-area {
	display: flex;
	gap: 15px;
}

.team-area, .player-area {
	border: 1px solid #ccc;
	height: 570px;
}

.team-area {
	width: 500px;
	padding: 20px;
}

.player-area {
	width: 535px;
	padding: 20px;
	display: flex;
	flex-direction: column;
}

.player-area .area-title, .player-area .search, .player-area .position-filter
	{
	flex-shrink: 0;
}

.area-title {
	text-align: center;
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 18px;
}

.field {
	position: relative;
	height: 350px;
	border: 1px solid #ccc;
	background: #fff;
}

.position {
	position: absolute;
	width: 90px;
	height: 48px;
	border: 1px solid #ccc;
	background: white;
	font-size: 13px;
	cursor: pointer;
}

.position:hover {
	background: #f5f5f5;
}

.p-left {
	left: 55px;
	top: 35px;
}

.p-center {
	left: 204px;
	top: 20px;
}

.p-right {
	right: 55px;
	top: 35px;
}

.p-second {
	left: 204px;
	top: 90px;
}

.p-short {
	left: 140px;
	top: 135px;
}

.p-pitcher {
	left: 204px;
	top: 145px;
}

.p-third {
	left: 55px;
	top: 195px;
}

.p-first {
	right: 55px;
	top: 195px;
}

.p-catcher {
	left: 204px;
	bottom: 25px;
}

.team-info {
	border-top: 1px solid #ccc;
	margin-top: 18px;
	padding-top: 16px;
	display: flex;
	justify-content: space-around;
	text-align: center;
	font-size: 13px;
}

.team-info strong {
	display: block;
	margin-top: 7px;
	font-size: 15px;
	min-height: 20px;
}

.search {
	display: flex;
	height: 40px;
	margin-bottom: 12px;
}

.search input {
	flex: 1;
	border: 1px solid #ccc;
	padding: 0 12px;
	font-size: 13px;
}

.search button {
	width: 75px;
	border: 1px solid #ccc;
	background: white;
	font-size: 12px;
	cursor: pointer;
}

.position-filter {
	display: flex;
	gap: 5px;
	margin-bottom: 12px;
}

.position-filter button {
	flex: 1;
	height: 34px;
	border: 1px solid #ccc;
	background: white;
	font-size: 12px;
	cursor: pointer;
}

.position-filter button.active {
	background: #eee;
	font-weight: bold;
}

.player-list {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 9px;
	align-content: start;
	flex: 1;
	min-height: 0;
	overflow-y: auto;
}

.player-card {
	height: 135px;
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
	cursor: pointer;
}

.player-card:hover {
	background: #f7f7f7;
}

.player-image {
	height: 82px;
	border: 1px solid #ddd;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 11px;
	margin-bottom: 7px;
}

.player-name {
	font-size: 12px;
	font-weight: bold;
}

.player-position {
	font-size: 10px;
	color: #777;
	margin-top: 4px;
}

.selected-area {
	border: 1px solid #ccc;
	margin-top: 15px;
	padding: 20px;
}

.selected-title {
	text-align: center;
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 15px;
}

.selected-list {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	gap: 8px;
}

.selected-player {
	height: 48px;
	border: 1px solid #ccc;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 12px;
	cursor: pointer;
}

.selected-player:hover {
	background: #f5f5f5;
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

		<div class="title">나만의 팀</div>

		<div class="main-area">

			<section class="team-area">
				<div class="area-title">나의 팀</div>

				<div class="field">

					<button class="position p-left">좌익수</button>
					<button class="position p-center">중견수</button>
					<button class="position p-right">우익수</button>

					<button class="position p-second">2루수</button>
					<button class="position p-short">유격수</button>

					<button class="position p-pitcher">투수</button>

					<button class="position p-third">3루수</button>
					<button class="position p-first">1루수</button>

					<button class="position p-catcher">포수</button>

				</div>

				<div class="team-info">
					<div>
						선수 <strong></strong>
					</div>
					<div>
						팀 점수 <strong></strong>
					</div>
					<div>
						팀 이름 <strong></strong>
					</div>
				</div>
			</section>

			<section class="player-area">

				<div class="area-title">선수 선택</div>

				<div class="search">
					<input type="text" placeholder="선수 검색">
					<button>검색</button>
				</div>

				<div class="position-filter">
					<button class="active">전체</button>
					<button>투수</button>
					<button>포수</button>
					<button>내야</button>
					<button>외야</button>
				</div>

				<div class="player-list">

					<div class="player-card">
						<div class="player-image"></div>
						<div class="player-name"></div>
						<div class="player-position"></div>
					</div>

					<div class="player-card">
						<div class="player-image"></div>
						<div class="player-name"></div>
						<div class="player-position"></div>
					</div>

					<div class="player-card">
						<div class="player-image"></div>
						<div class="player-name"></div>
						<div class="player-position"></div>
					</div>

					<div class="player-card">
						<div class="player-image"></div>
						<div class="player-name"></div>
						<div class="player-position"></div>
					</div>

					<div class="player-card">
						<div class="player-image"></div>
						<div class="player-name"></div>
						<div class="player-position"></div>
					</div>

					<div class="player-card">
						<div class="player-image"></div>
						<div class="player-name"></div>
						<div class="player-position"></div>
					</div>

					<div class="player-card">
						<div class="player-image"></div>
						<div class="player-name"></div>
						<div class="player-position"></div>
					</div>

					<div class="player-card">
						<div class="player-image"></div>
						<div class="player-name"></div>
						<div class="player-position"></div>
					</div>

					<div class="player-card">
						<div class="player-image"></div>
						<div class="player-name"></div>
						<div class="player-position"></div>
					</div>

				</div>
			</section>

		</div>

		<section class="selected-area">

			<div class="selected-title">선택 선수</div>

			<div class="selected-list">

				<div class="selected-player">투수</div>
				<div class="selected-player">포수</div>
				<div class="selected-player">1루수</div>
				<div class="selected-player">2루수</div>
				<div class="selected-player">3루수</div>

				<div class="selected-player">유격수</div>
				<div class="selected-player">좌익수</div>
				<div class="selected-player">중견수</div>
				<div class="selected-player">우익수</div>

			</div>

			<div class="save-area">
				<button class="save-btn">팀 저장</button>
			</div>

		</section>

	</div>
</body>
</html>