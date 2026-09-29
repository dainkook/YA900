<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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

.body {
	width: 1200px;
	margin: 0 auto;
	padding: 40px 0 60px;
}

.dashboard-title {
	margin-bottom: 30px;
	color: #111936;
	font-size: 28px;
	font-weight: bold;
}

.dashboard-subtitle {
	margin-top: 8px;
	color: #68718a;
	font-size: 14px;
	font-weight: normal;
}

.statistics {
	width: 100%;
	display: flex;
	gap: 25px;
	margin-bottom: 30px;
}

.stat-box {
	flex: 1;
	min-height: 180px;
	padding: 30px;
	background-color: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.stat-title {
	color: #68718a;
	font-size: 16px;
	font-weight: bold;
}

.stat-number {
	margin-top: 15px;
	color: #111936;
	font-size: 38px;
	font-weight: bold;
}

.stat-description {
	margin-top: 10px;
	color: #9aa2b5;
	font-size: 12px;
}

.charts {
	width: 100%;
	display: flex;
	gap: 25px;
}

.chart {
	width: 50%;
	height: 400px;
	padding: 25px;
	background-color: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
}

.chart-title {
	margin-bottom: 20px;
	color: #111936;
	font-size: 18px;
	font-weight: bold;
}

.chart-content {
	width: 100%;
	height: 320px;
	border: 1px dashed #c7cee0;
	border-radius: 8px;
	background-color: #fafbfe;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #9aa2b5;
	font-size: 14px;
}

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

					<button type="button" class="logout-btn"
						onclick="location.href='/admin/logout'">로그아웃</button>

				</div>

			</div>

			<div class="menu">

				<div class="menu-item active">대시보드</div>

				<div class="menu-item">공지관리</div>

				<div class="menu-item">회원관리</div>

				<div class="menu-item">예매관리</div>

				<div class="menu-item">경기관리</div>

				<div class="menu-item">신고관리</div>

			</div>


		</div>

		<div class="body">

			<div class="dashboard-title">
				관리자 대시보드

				<div class="dashboard-subtitle">YA900 서비스의 주요 현황을 확인할 수 있습니다.
				</div>

			</div>

			<div class="statistics">

				<div class="stat-box">

					<div class="stat-title">전체 회원</div>

					<div class="stat-number">${memberCount}</div>

					<div class="stat-description">현재 가입된 회원 수</div>

				</div>

				<div class="stat-box">

					<div class="stat-title">오늘 예매</div>

					<div class="stat-number">${todayReservationCount}</div>

					<div class="stat-description">오늘 발생한 예매 건수</div>

				</div>

				<div class="stat-box">

					<div class="stat-title">전체 예매</div>

					<div class="stat-number">${reservationCount}</div>

					<div class="stat-description">누적 예매 건수</div>

				</div>

			</div>

			<div class="charts">

				<div class="chart">

					<div class="chart-title">월별 예매 현황</div>

					<div class="chart-content">Chart.js 영역</div>

				</div>

				<div class="chart">

					<div class="chart-title">회원 성별 / 연령대</div>

					<div class="chart-content">Chart.js 영역</div>

				</div>

			</div>

		</div>

		<div class="footer">YA900 ADMIN</div>

	</div>

</body>
</html>