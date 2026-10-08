<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>신고관리</title>

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
   신고 목록
========================= */
.report-list {
	width: 100%;
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 5px 18px rgba(17, 25, 54, .06);
}

/* 목록 상단 */
.report-list-header {
	width: 100%;
	height: 65px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 25px;
	background-color: white;
	border-bottom: 1px solid #d6dceb;
}

.report-count {
	color: #68718a;
	font-size: 14px;
}

.report-count strong {
	color: #111936;
	font-size: 16px;
}

/* =========================
   신고 행
========================= */
.report-row {
	width: 100%;
	min-height: 65px;
	display: flex;
	border-bottom: 1px solid #e4e7ef;
}

.report-row:last-child {
	border-bottom: none;
}

.report-row.header-row {
	min-height: 58px;
	background-color: #f7f8fc;
}

.report-row.header-row>div {
	color: #68718a;
	font-size: 14px;
	font-weight: bold;
}

.report-row>div {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
	color: #30384f;
	font-size: 14px;
	text-align: center;
}

/* 신고관리 테이블 컬럼 */
.report-no {
	width: 7%;
}

.report-target {
	width: 13%;
}

.report-target-id {
	width: 14%;
}

.report-reporter {
	width: 14%;
}

.report-type {
	width: 16%;
}

.report-date {
	width: 15%;
}

.report-status {
	width: 13%;
}

.report-manage {
	width: 8%;
}

/* =========================
   처리상태
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

.status.wait {
	background-color: #fff4df;
	color: #c27b16;
}

.status.progress {
	background-color: #e8f1ff;
	color: #476aaa;
}

.status.complete {
	background-color: #e8f5e9;
	color: #2e7d32;
}

/* 상세 버튼 */
.detail-btn {
	display: inline-block;
	width: 50px;
	height: 30px;
	line-height: 30px;
	padding: 0;
	box-sizing: border-box;
	background: #fff;
	border: 1px solid #cfd5e3;
	border-radius: 5px;
	color: #18213f;
	font-size: 13px;
	text-align: center;
	text-decoration: none;
}

.detail-btn:hover {
	background: #f4f6fa;
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

				<div class="menu-item">
					<a href="/admin/reservation">예매관리</a>
				</div>

				<div class="menu-item">
					<a href="/admin/schedule">경기관리</a>
				</div>

				<div class="menu-item active">
					<a href="/admin/report">신고관리</a>
				</div>

			</div>

		</div>


		<div class="body">

			<div class="page-title">

				신고 관리

				<div class="page-subtitle">
					접수된 신고 내역을 확인하고 처리할 수 있습니다.
				</div>

			</div>


			<%-- =========================
			     검색
			========================= --%>

			<div class="search-area">

				<form action="/admin/report/search" method="get">

					<select name="searchType">

						<option value="all"
							${searchType == 'all' ? 'selected' : ''}>
							전체
						</option>

						<option value="target"
							${searchType == 'target' ? 'selected' : ''}>
							신고대상
						</option>

						<option value="targetId"
							${searchType == 'targetId' ? 'selected' : ''}>
							신고당한 ID
						</option>

						<option value="reporter"
							${searchType == 'reporter' ? 'selected' : ''}>
							신고자 ID
						</option>

						<option value="reportType"
							${searchType == 'reportType' ? 'selected' : ''}>
							신고사유
						</option>

					</select>

					<input type="text"
						name="keyword"
						value="${keyword}"
						placeholder="검색어를 입력하세요.">

					<button type="submit">검색</button>

				</form>

			</div>


			<%-- =========================
			     신고 목록
			========================= --%>

			<div class="report-list">

				<div class="report-list-header">

					<div>신고 목록</div>

					<div>

						<span class="report-count">
							총 <strong>${page.recordCount}</strong>건
						</span>

					</div>

				</div>


				<div class="report-row header-row">

					<div class="report-no">번호</div>

					<div class="report-target">신고대상</div>

					<div class="report-target-id">신고당한 ID</div>

					<div class="report-reporter">신고자 ID</div>

					<div class="report-type">신고사유</div>

					<div class="report-date">신고날짜</div>

					<div class="report-status">처리상태</div>

					<div class="report-manage">관리</div>

				</div>


				<c:choose>

					<c:when test="${not empty list}">

						<c:forEach var="report" items="${list}">

							<div class="report-row">

								<div class="report-no">
									${report.report_seq}
								</div>

								<div class="report-target">
									${report.target_type}
								</div>

								<div class="report-target-id">
									${report.target_id}
								</div>

								<div class="report-reporter">
									${report.reporter}
								</div>

								<div class="report-type">
									${report.report_type}
								</div>

								<div class="report-date">

									<fmt:formatDate
										value="${report.regdate}"
										pattern="yyyy-MM-dd HH:mm" />

								</div>


								<div class="report-status">

									<c:choose>

										<c:when test="${report.status eq '미확인'}">

											<span class="status wait">
												미확인
											</span>

										</c:when>

										<c:when test="${report.status eq '처리중'}">

											<span class="status progress">
												처리중
											</span>

										</c:when>

										<c:when test="${report.status eq '처리완료'}">

											<span class="status complete">
												처리완료
											</span>

										</c:when>

										<c:otherwise>

											<span class="status wait">
												${report.status}
											</span>

										</c:otherwise>

									</c:choose>

								</div>


								<div class="report-manage">

									<a class="detail-btn"
										href="/admin/report/detail?report_seq=${report.report_seq}">
										상세
									</a>

								</div>

							</div>

						</c:forEach>

					</c:when>


					<c:otherwise>

						<div class="empty">
							접수된 신고가 없습니다.
						</div>

					</c:otherwise>

				</c:choose>

			</div>


			<%-- =========================
			     페이지네이션
			========================= --%>

			<div class="pagination">

				<%-- 이전 페이지 블록 --%>
				<c:if test="${page.startPage > 1}">

					<c:choose>

						<%-- 검색 중인 경우 --%>
						<c:when test="${not empty keyword}">

							<a href="/admin/report/search?searchType=${searchType}&keyword=${keyword}&cpage=${page.startPage - 1}">
								◀
							</a>

						</c:when>

						<%-- 일반 목록인 경우 --%>
						<c:otherwise>

							<a href="/admin/report?cpage=${page.startPage - 1}">
								◀
							</a>

						</c:otherwise>

					</c:choose>

				</c:if>


				<%-- 페이지 번호 --%>
				<c:forEach var="i"
					begin="${page.startPage}"
					end="${page.endPage}">

					<c:choose>

						<%-- 검색 결과 페이지 --%>
						<c:when test="${not empty keyword}">

							<a
								href="/admin/report/search?searchType=${searchType}&keyword=${keyword}&cpage=${i}"
								class="${page.currentPage == i ? 'active' : ''}">
								${i}
							</a>

						</c:when>

						<%-- 일반 목록 페이지 --%>
						<c:otherwise>

							<a
								href="/admin/report?cpage=${i}"
								class="${page.currentPage == i ? 'active' : ''}">
								${i}
							</a>

						</c:otherwise>

					</c:choose>

				</c:forEach>


				<%-- 다음 페이지 블록 --%>
				<c:if test="${page.endPage < page.pageTotal}">

					<c:choose>

						<%-- 검색 중인 경우 --%>
						<c:when test="${not empty keyword}">

							<a href="/admin/report/search?searchType=${searchType}&keyword=${keyword}&cpage=${page.endPage + 1}">
								▶
							</a>

						</c:when>

						<%-- 일반 목록인 경우 --%>
						<c:otherwise>

							<a href="/admin/report?cpage=${page.endPage + 1}">
								▶
							</a>

						</c:otherwise>

					</c:choose>

				</c:if>

			</div>

		</div>


		<div class="footer">
			YA900 ADMIN
		</div>

	</div>

</body>

</html>