<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
	height: 420px;
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
	height: 290px;
	position: relative;
	border: 1px dashed #c7cee0;
	border-radius: 8px;
	background-color: #fafbfe;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #9aa2b5;
	font-size: 14px;
	padding: 15px;
}

.chart-content canvas {
	width: 100% !important;
	height: 100% !important;
	max-width: 270px;
	max-height: 270px;
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

					<div class="chart-content">

						<canvas id="reservationChart"></canvas>

					</div>

				</div>

				<div class="chart">

					<div class="chart-title">회원 성별 / 연령대</div>

					<div class="chart-content">

						<canvas id="genderChart"></canvas>

					</div>

				</div>

			</div>

		</div>

		<div class="footer">YA900 ADMIN</div>

	</div>

	<script>

	const reservationData = [
		<c:forEach var="item" items="${monthlyReservation}" varStatus="status">
			{
				month: "${item.MONTH}",
				count: ${item.CNT}
			}
			<c:if test="${!status.last}">
				,
			</c:if>
		</c:forEach>
		];

		const months = reservationData.map(function(item) {
			return item.month + "월";
		});

		const counts = reservationData.map(function(item) {
			return item.count;
		});

		const ctx = document.getElementById("reservationChart");

		new Chart(ctx, {
			type: "bar",
			data: {
				labels: months,
				datasets: [{
					label: "예매 건수",
					data: counts,
					borderWidth: 1
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				scales: {
					y: {
						beginAtZero: true,
						ticks: {
							precision: 0
						}
					}
				},
				plugins: {
					legend: {
						display: true
					}
				}
			}
		});


		const genderData = [
		<c:forEach var="item" items="${genderStats}" varStatus="status">
			{
				gender: "${item.GENDER}",
				count: ${item.CNT}
			}
			<c:if test="${!status.last}">
				,
			</c:if>
		</c:forEach>
		];


		const ageData = [
		<c:forEach var="item" items="${ageStats}" varStatus="status">
			{
				gender: "${item.GENDER}",
				ageGroup: ${item.AGE_GROUP},
				count: ${item.CNT}
			}
			<c:if test="${!status.last}">
				,
			</c:if>
		</c:forEach>
		];


		const male = genderData.find(function(item) {
			return item.gender === "남성";
		});

		const female = genderData.find(function(item) {
			return item.gender === "여성";
		});

		const maleCount = male ? male.count : 0;
		const femaleCount = female ? female.count : 0;

		const genderLabels = ["남성", "여성"];

		const genderCounts = [
			maleCount,
			femaleCount
		];

		const totalGenderCount = maleCount + femaleCount;

		const maleAngle = (maleCount / totalGenderCount) * 360;

		const genderRotation = 270 - (maleAngle / 2);

		const genderCtx = document.getElementById("genderChart");

		new Chart(genderCtx, {
			type: "doughnut",
			data: {
				labels: genderLabels,
				datasets: [{
					data: genderCounts,
					backgroundColor: [
						"#4A90E2",
						"#F48FB1"
					],
					borderWidth: 2,
					borderColor: "#ffffff"
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				rotation: genderRotation,
				plugins: {
					legend: {
						display: true,
						position: "bottom"
					},
					tooltip: {
						callbacks: {
							label: function(context) {
								const gender = context.label;
								const count = context.raw;

								return gender + " : " + count + "명";
							},
							afterLabel: function(context) {
								const gender = context.label;

								const result = ageData.filter(function(item) {
									return item.gender === gender;
								});

								return result.map(function(item) {
									return item.ageGroup + "대 : " + item.count + "명";
								});
							}
						}
					}
				}
			}
		});
</script>
</body>
</html>