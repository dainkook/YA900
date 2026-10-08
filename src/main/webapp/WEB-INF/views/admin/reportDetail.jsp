<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>신고 상세정보</title>

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
   HEADER
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
	text-decoration: none;
	color: inherit;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* =========================
   BODY
========================= */
.body {
	width: 1200px;
	margin: 0 auto;
	padding: 40px 0 60px;
}

.page-title {
	margin-bottom: 8px;
	color: #111936;
	font-size: 28px;
	font-weight: bold;
}

.page-subtitle {
	margin-bottom: 30px;
	color: #68718a;
	font-size: 14px;
}

/* =========================
   DETAIL CARD
========================= */
.report-detail-card {
	width: 100%;
	background-color: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
	overflow: hidden;
}

/* =========================
   DETAIL HEADER
========================= */
.detail-header {
	height: 65px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 25px;
	border-bottom: 1px solid #d6dceb;
}

.detail-header-title {
	font-size: 17px;
	font-weight: bold;
	color: #111936;
}

.report-number {
	color: #68718a;
	font-size: 13px;
}

/* =========================
   REPORT INFO
========================= */
.report-info {
	padding: 30px 35px 0;
}

.info-row {
	display: flex;
	min-height: 58px;
	border-bottom: 1px solid #edf0f6;
}

.info-row:last-child {
	border-bottom: none;
}

.info-title {
	width: 180px;
	display: flex;
	align-items: center;
	padding-left: 15px;
	background-color: #f7f8fc;
	color: #68718a;
	font-size: 14px;
	font-weight: bold;
}

.info-value {
	flex: 1;
	display: flex;
	align-items: center;
	padding: 0 20px;
	color: #18213f;
	font-size: 14px;
}

/* =========================
   STATUS
========================= */
.status-wait {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 20px;
	background-color: #fff4df;
	color: #c27b16;
	font-size: 12px;
	font-weight: bold;
}

.status-progress {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 20px;
	background-color: #e8f1ff;
	color: #476aaa;
	font-size: 12px;
	font-weight: bold;
}

.status-complete {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 20px;
	background-color: #e8f5e9;
	color: #2e7d32;
	font-size: 12px;
	font-weight: bold;
}

/* =========================
   신고내용
========================= */
.contents-row {
	display: flex;
	min-height: 150px;
	border-bottom: 1px solid #edf0f6;
}

.contents-title {
	width: 180px;
	min-height: 150px;
	display: flex;
	align-items: flex-start;
	padding: 20px 0 20px 15px;
	background-color: #f7f8fc;
	color: #68718a;
	font-size: 14px;
	font-weight: bold;
}

.contents-value {
	flex: 1;
	min-height: 150px;
	padding: 20px;
	color: #18213f;
	font-size: 14px;
	line-height: 1.7;
	text-align: left;
	white-space: normal;
	word-break: break-word;
}

/*
 * Summernote에서 작성된
 * <p>, <span> 등의 정렬값을 무시하고
 * 신고내용을 왼쪽 정렬
 */
.contents-value * {
	text-align: left !important;
}

.contents-value p {
	margin: 0;
	text-align: left !important;
}

.empty-content {
	color: #9aa2b5;
}

/* =========================
   회원 정보
========================= */
.member-info-row {
	display: flex;
	min-height: 58px;
	border-bottom: none;
}

.member-info-title {
	width: 180px;
	display: flex;
	align-items: center;
	padding-left: 15px;
	background-color: #f7f8fc;
	color: #68718a;
	font-size: 14px;
	font-weight: bold;
}

.member-info-value {
	flex: 1;
	display: flex;
	align-items: center;
	padding: 0 20px;
	color: #18213f;
	font-size: 14px;
}

.member-info-value a {
	color: #476aaa;
	text-decoration: none;
}

.member-info-value a:hover {
	text-decoration: underline;
}

/* =========================
   BUTTON AREA
========================= */
.button-area {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 25px;
	border-top: 1px solid #d6dceb;
	background-color: #fafbfe;
}

.left-buttons {
	display: flex;
	align-items: center;
	gap: 10px;
}

.right-buttons {
	display: flex;
	align-items: center;
	gap: 10px;
}

.button-area form {
	margin: 0;
}

/* 목록으로 */
.list-btn {
	width: 100px;
	height: 40px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	background-color: white;
	color: #18213f;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s;
}

.list-btn:hover {
	background-color: #eef1f8;
}

/* 블랙리스트 등록 */
.blacklist-btn {
	width: 120px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color: #c62828;
	color: white;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s;
}

.blacklist-btn:hover {
	background-color: #a91f1f;
}

/* 블랙리스트 해제 */
.release-btn {
	width: 120px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color: #2e7d32;
	color: white;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s;
}

.release-btn:hover {
	background-color: #256628;
}

/* 상태 선택 */
.status-form {
	display: flex;
	align-items: center;
	gap: 10px;
	margin: 0;
}

.status-select {
	width: 120px;
	height: 40px;
	padding: 0 10px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	background-color: white;
	color: #18213f;
	font-size: 13px;
	cursor: pointer;
	outline: none;
}

.status-select:focus {
	border-color: #476aaa;
}

/* 상태 변경 */
.status-btn {
	width: 100px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color: #476aaa;
	color: white;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s;
}

.status-btn:hover {
	background-color: #3b5b94;
}

/* =========================
   FOOTER
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

					<button type="button" class="logout-btn"
						onclick="location.href='/admin/logout'">로그아웃</button>

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

			<div class="page-title">신고 상세정보</div>

			<div class="page-subtitle">접수된 신고의 상세 정보를 확인하고 처리상태를 관리할 수
				있습니다.</div>


			<div class="report-detail-card">


				<div class="detail-header">

					<div class="detail-header-title">신고 정보</div>

					<div class="report-number">신고번호 : ${report.report_seq}</div>

				</div>


				<div class="report-info">


					<!-- 신고대상 -->

					<div class="info-row">

						<div class="info-title">신고대상</div>

						<div class="info-value">${report.target_type}</div>

					</div>


					<!-- 신고당한 회원 ID -->

					<div class="info-row">

						<div class="info-title">신고당한 ID</div>

						<div class="info-value">${report.target_id}</div>

					</div>


					<!-- 신고자 ID -->

					<div class="info-row">

						<div class="info-title">신고자 ID</div>

						<div class="info-value">${report.reporter}</div>

					</div>


					<!-- 신고사유 -->

					<div class="info-row">

						<div class="info-title">신고사유</div>

						<div class="info-value">${report.report_type}</div>

					</div>


					<!-- 신고날짜 -->

					<div class="info-row">

						<div class="info-title">신고날짜</div>

						<div class="info-value">

							<fmt:formatDate value="${report.regdate}"
								pattern="yyyy-MM-dd HH:mm" />

						</div>

					</div>


					<!-- 처리상태 -->

					<div class="info-row">

						<div class="info-title">처리상태</div>

						<div class="info-value">

							<c:choose>

								<%-- 미확인 --%>
								<c:when test="${report.status == '미확인'}">

									<span class="status-wait"> 미확인 </span>

								</c:when>


								<%-- 처리중 --%>
								<c:when test="${report.status == '처리중'}">

									<span class="status-progress"> 처리중 </span>

								</c:when>


								<%-- 처리완료 --%>
								<c:when test="${report.status == '처리완료'}">

									<span class="status-complete"> 처리완료 </span>

								</c:when>


								<%-- 그 외 상태 --%>
								<c:otherwise>

									${report.status}

								</c:otherwise>

							</c:choose>

						</div>

					</div>


					<!-- 신고내용 -->

					<div class="contents-row">

						<div class="contents-title">신고내용</div>

						<div class="contents-value">

							<c:choose>

								<%-- 신고내용이 있는 경우 --%>
								<c:when test="${not empty report.target_contents}">

									${report.target_contents}

								</c:when>


								<%-- 신고내용이 없는 경우 --%>
								<c:otherwise>

									<span class="empty-content"> 신고내용이 없습니다. </span>

								</c:otherwise>

							</c:choose>

						</div>

					</div>


					<!-- 신고당한 회원 정보 -->

					<div class="info-row">

						<div class="info-title">회원 정보</div>

						<div class="info-value">

							<c:choose>

								<%-- 회원 정보가 존재하는 경우 --%>
								<c:when test="${not empty member}">

									${member.id}

									&nbsp;&nbsp;|&nbsp;&nbsp;

									회원번호 ${member.member_seq}

								</c:when>


								<%-- 회원 정보가 없는 경우 --%>
								<c:otherwise>

									<span class="empty-content"> 회원 정보를 찾을 수 없습니다. </span>

								</c:otherwise>

							</c:choose>

						</div>

					</div>


				</div>


				<!-- 하단 버튼 영역 -->

				<div class="button-area">


					<!-- 왼쪽 버튼 영역 -->

					<div class="left-buttons">

						<button type="button" class="list-btn"
							onclick="location.href='/admin/report'">목록으로</button>


						<c:if test="${not empty member}">

							<c:choose>

								<%-- 정상 회원이면 블랙리스트 등록 --%>
								<c:when test="${member.blackList == 0}">

									<button type="button" class="blacklist-btn"
										onclick="location.href='/admin/member/blacklist?member_seq=${member.member_seq}'">
										블랙리스트 등록</button>

								</c:when>


								<%-- 블랙리스트 회원이면 해제 --%>
								<c:otherwise>

									<button type="button" class="release-btn"
										onclick="location.href='/admin/member/blacklist?member_seq=${member.member_seq}'">
										블랙리스트 해제</button>

								</c:otherwise>

							</c:choose>

						</c:if>

					</div>


					<!-- 오른쪽 상태 변경 영역 -->

					<form action="/admin/report/status" method="post"
						class="status-form">

						<select name="status" class="status-select">

							<option value="미확인" ${report.status == '미확인' ? 'selected' : ''}>
								미확인</option>

							<option value="처리중" ${report.status == '처리중' ? 'selected' : ''}>
								처리중</option>

							<option value="처리완료" ${report.status == '처리완료' ? 'selected' : ''}>
								처리완료</option>

						</select> <input type="hidden" name="report_seq"
							value="${report.report_seq}">


						<button type="submit" class="status-btn">상태 변경</button>

					</form>


				</div>


			</div>

		</div>


		<div class="footer">YA900 ADMIN</div>

	</div>

</body>

</html>