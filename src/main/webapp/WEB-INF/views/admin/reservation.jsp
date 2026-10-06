<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>예매관리</title>

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

.reservation-list {
	width: 100%;
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 5px 18px rgba(17, 25, 54, .06);
}

.reservation-row {
	width: 100%;
	min-height: 58px;
	display: flex;
	border-bottom: 1px solid #e4e7ef;
}

.reservation-row:last-child {
	border-bottom: none;
}

.reservation-row.header-row {
	background-color: #f7f8fc;
}

.reservation-row.header-row>div {
	color: #68718a;
	font-size: 14px;
	font-weight: bold;
}

.reservation-row>div {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
	color: #30384f;
	font-size: 14px;
}

.reservation-no {
	width: 13%;
}

.reservation-member {
	width: 15%;
}

.reservation-game {
	width: 15%;
}

.reservation-seat {
	width: 15%;
}

.reservation-date {
	width: 17%;
}

.reservation-status {
	width: 13%;
}

.reservation-manage {
	width: 12%;
}

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

.status.complete {
	background-color: #e8f1ff;
	color: #476aaa;
}

.status.cancel {
	background-color: #fceaea;
	color: #c94a4a;
}

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

.empty {
	width: 100%;
	height: 150px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #68718a;
	font-size: 14px;
}

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

.reservation-list-header {
	width: 100%;
	height: 65px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 25px;
	background-color: white;
	border-bottom: 1px solid #d6dceb;
}

.reservation-count {
	color: #68718a;
	font-size: 14px;
}

.reservation-count strong {
	color: #111936;
	font-size: 16px;
}
</style>

</head>

<body>

	<div class="container">

		<div class="header">

			<div class="top">

				<div class="logo">YA900 ADMIN</div>

				<div class="login">
					<span>${admin_name} 관리자님</span>
					<button class="logout-btn">로그아웃</button>
				</div>

			</div>

			<div class="menu">

				<div class="menu-item">
					<a href="/admin/main">대시보드</a>
				</div>

				<div class="menu-item">
					<a href="/admin/notice">공지관리</a>
				</div>

				<div class="menu-item">
					<a href="/admin/member">회원관리</a>
				</div>

				<div class="menu-item active">
					<a href="/admin/reservation">예매관리</a>
				</div>

				<div class="menu-item">
					<a href="/admin/schedule">경기관리</a>
				</div>

				<div class="menu-item">
					<a href="/admin/report">신고관리</a>
				</div>

			</div>

		</div>

		<div class="body">

			<div class="page-title">

				예매 관리

				<div class="page-subtitle">회원들의 예매 정보를 관리할 수 있습니다.</div>

			</div>

			<div class="search-area">

				<form action="/admin/reservation/search" method="get">

					<select name="searchType">

						<option value="all"
							${searchType == 'all' || empty searchType ? 'selected' : ''}>
							전체</option>

						<option value="reservation_id"
							${searchType == 'reservation_id' ? 'selected' : ''}>
							예매번호</option>

						<option value="member_id"
							${searchType == 'member_id' ? 'selected' : ''}>회원아이디</option>

						<option value="title" ${searchType == 'title' ? 'selected' : ''}>
							경기</option>

					</select> <input type="text" name="keyword" value="${keyword}"
						placeholder="검색어를 입력하세요.">

					<button type="submit">검색</button>

				</form>

			</div>

			<div class="reservation-list">

				<div class="reservation-list-header">

					<div>예매 목록</div>

					<div class="reservation-count">
						총 <strong>${reservationCount}</strong> 건
					</div>

				</div>

				<div class="reservation-row header-row">

					<div class="reservation-no">예매번호</div>

					<div class="reservation-member">회원아이디</div>

					<div class="reservation-game">경기</div>

					<div class="reservation-seat">좌석</div>

					<div class="reservation-date">예매일</div>

					<div class="reservation-status">상태</div>

					<div class="reservation-manage">관리</div>

				</div>

				<c:choose>

					<c:when test="${not empty list}">

						<c:forEach var="reservation" items="${list}">

							<div class="reservation-row">

								<div class="reservation-no">${reservation.reservation_id}
								</div>

								<div class="reservation-member">${reservation.member_id}</div>

								<div class="reservation-game">${reservation.title}</div>

								<div class="reservation-seat">${reservation.seat_id}</div>

								<div class="reservation-date">
									<fmt:formatDate value="${reservation.reservation_date}"
										pattern="yyyy-MM-dd HH:mm" />
								</div>

								<div class="reservation-status">

									<c:choose>

										<c:when test="${reservation.status == '예매완료'}">

											<span class="status complete"> ${reservation.status} </span>

										</c:when>

										<c:when test="${reservation.status == '취소'}">

											<span class="status cancel"> ${reservation.status} </span>

										</c:when>

										<c:otherwise>

											<span class="status"> ${reservation.status} </span>

										</c:otherwise>

									</c:choose>

								</div>

								<div class="reservation-manage">

									<a class="detail-btn"
										href="/admin/reservation/detail?reservation_id=${reservation.reservation_id}">
										상세 </a>

								</div>

							</div>

						</c:forEach>

					</c:when>

					<c:otherwise>

						<div class="empty">등록된 예매 정보가 없습니다.</div>

					</c:otherwise>

				</c:choose>

			</div>

			<div class="pagination">

				<c:if test="${page.startPage > 1}">

					<c:choose>

						<c:when test="${not empty searchType}">

							<a
								href="/admin/reservation/search?searchType=${searchType}&keyword=${keyword}&cpage=${page.startPage - 1}">
								◀ </a>

						</c:when>

						<c:otherwise>

							<a href="/admin/reservation?cpage=${page.startPage - 1}"> ◀ </a>

						</c:otherwise>

					</c:choose>

				</c:if>

				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">

					<c:choose>

						<c:when test="${not empty searchType}">

							<a
								href="/admin/reservation/search?searchType=${searchType}&keyword=${keyword}&cpage=${i}"
								class="${i == page.currentPage ? 'active' : ''}"> ${i} </a>

						</c:when>

						<c:otherwise>

							<a href="/admin/reservation?cpage=${i}"
								class="${i == page.currentPage ? 'active' : ''}"> ${i} </a>

						</c:otherwise>

					</c:choose>

				</c:forEach>

				<c:if test="${page.endPage < page.pageTotal}">

					<c:choose>

						<c:when test="${not empty searchType}">

							<a
								href="/admin/reservation/search?searchType=${searchType}&keyword=${keyword}&cpage=${page.endPage + 1}">
								▶ </a>

						</c:when>

						<c:otherwise>

							<a href="/admin/reservation?cpage=${page.endPage + 1}"> ▶ </a>

						</c:otherwise>

					</c:choose>

				</c:if>

			</div>

		</div>

		<div class="footer">YA900 ADMIN</div>

	</div>

</body>
</html>