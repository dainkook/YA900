
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>YA900 퀴즈 기록</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	min-height: 100vh;
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #202945;
	background: #eef1f8;
}

.header {
	height: 85px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 5%;
	color: white;
	background: linear-gradient(135deg, #0b1026, #171f46);
	border-bottom: 1px solid #303b70;
}

.logo {
	color: white;
	font-size: 28px;
	font-weight: bold;
	letter-spacing: 1px;
	text-decoration: none;
}

.header-link {
	padding: 10px 16px;
	color: white;
	border: 1px solid #7180b1;
	border-radius: 6px;
	text-decoration: none;
	font-size: 14px;
}

.header-link:hover {
	background: #476aaa;
}

.container {
	width: 92%;
	max-width: 1100px;
	margin: 45px auto;
}

.page-title {
	margin-bottom: 25px;
}

.page-title h1 {
	margin: 0 0 10px;
	font-size: 27px;
}

.page-title p {
	margin: 0;
	color: #69748b;
	font-size: 14px;
}

.history-card {
	padding: 30px;
	background: white;
	border: 1px solid #e1e5ef;
	border-radius: 12px;
	box-shadow: 0 4px 16px rgba(20, 35, 70, 0.05);
}

.card-title {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 15px;
	margin-bottom: 22px;
}

.card-title h2 {
	margin: 0;
	font-size: 20px;
}

.record-count {
	color: #476aaa;
	font-size: 14px;
	font-weight: bold;
}

.table-scroll {
	overflow-x: auto;
}

table {
	width: 100%;
	min-width: 600px;
	border-collapse: collapse;
	text-align: center;
	font-size: 14px;
}

thead th {
	height: 48px;
	color: #536078;
	background: #f5f7fb;
	border-top: 1px solid #e1e5ef;
	border-bottom: 1px solid #dce2ed;
}

tbody td {
	height: 58px;
	padding: 10px;
	border-bottom: 1px solid #edf0f5;
}

tbody tr:hover {
	background: #f8faff;
}

.score {
	color: #476aaa;
	font-weight: bold;
}

.rate {
	display: inline-block;
	min-width: 65px;
	padding: 6px 10px;
	color: #355a9a;
	background: #edf2ff;
	border-radius: 15px;
	font-weight: bold;
}

.empty {
	padding: 65px 15px;
	color: #778198;
	text-align: center;
	line-height: 1.8;
}

.empty-title {
	margin-bottom: 10px;
	color: #35405a;
	font-size: 18px;
	font-weight: bold;
}

.bottom-area {
	margin-top: 25px;
	text-align: center;
}

.back-btn {
	display: inline-block;
	padding: 12px 22px;
	color: white;
	background: #476aaa;
	border-radius: 7px;
	text-decoration: none;
	font-size: 14px;
	font-weight: bold;
}

.back-btn:hover {
	background: #354f87;
}

.site-footer {
	margin-top: 70px;
	padding: 25px;
	color: #778198;
	text-align: center;
	font-size: 12px;
	border-top: 1px solid #d8deea;
}
.quick-menu {
	width: 280px;
	position: fixed;
	left: -250px;
	top: 50%;
	transform: translateY(-50%);
	border: 1px solid #3b4778;
	transition: left 0.5s ease;
	z-index: 1000;
	background: #111936;
	color: white;
	box-shadow: 5px 8px 25px rgba(10, 15, 35, 0.18);
}

.quick-menu:hover {
	left: 0;
}

.quick-menu div {
	width: 100%;
	height: 55px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	border-bottom: 1px solid #303b68;
}

.quick-menu div:last-child {
	border-bottom: none;
}

.quick-menu div:hover {
	background: #252f67;
}

.quick-menu .menu, .quick-menu .menu:hover {
	background: #476aaa;
	color: white;
}

@media ( max-width : 600px) {
	.header {
		height: 75px;
		padding: 0 18px;
	}
	.logo {
		font-size: 23px;
	}
	.container {
		width: 94%;
		margin: 30px auto;
	}
	.history-card {
		padding: 20px 15px;
	}
	.page-title h1 {
		font-size: 23px;
	}
	.card-title h2 {
		font-size: 17px;
	}
}

.detail-btn {
	display: inline-block;
	padding: 8px 12px;
	color: #476aaa;
	background: white;
	border: 1px solid #476aaa;
	border-radius: 6px;
	text-decoration: none;
	font-size: 12px;
	font-weight: bold;
	white-space: nowrap;
	transition: all 0.2s ease;
}

.detail-btn:hover {
	color: white;
	background: #476aaa;
}
/* =========================
   FOOTER
========================= */
.footer {
	width: 100%;
	height: 70px;
	margin-top: 0;
	background: #eef1f8;
	color: #838ec9;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 13px;
	border: none;
}

.footer a {
    margin: 0 4px;
    text-decoration: none;
	color: #838ec9;
}

</style>
</head>

<body>

	<header class="header">
		<a class="logo" href="${pageContext.request.contextPath}/">YA900</a> <a
			class="header-link" href="${pageContext.request.contextPath}/quiz">
			퀴즈 메인 </a>
	</header>
	<div class="quick-menu">
		    <div class="menu">QUICK MENU</div>
		    <div onclick="location.href='${pageContext.request.contextPath}/'">홈</div>
		    <div onclick="location.href='${pageContext.request.contextPath}/#reservation'">예매</div>
		    <div onclick="location.href='${pageContext.request.contextPath}/board/board?cpage=1'">게시판</div>
		    <div onclick="location.href='${pageContext.request.contextPath}/mypage'">마이페이지</div>
		</div>
	<main class="container">

		<section class="page-title">
			<h1>나의 퀴즈 기록</h1>
			<p>지금까지 도전한 야구 상식 퀴즈 기록을 확인하세요.</p>
		</section>
		
		<section class="history-card">
			
			<div class="card-title">
				<h2>전체 기록</h2>

				<span class="record-count"> 총 ${historyList.size()}회 참여 </span>
			</div>

			<c:choose>

				<%-- 퀴즈 기록이 없는 경우 --%>
				<c:when test="${empty historyList}">

					<div class="empty">
						<div class="empty-title">아직 퀴즈 기록이 없습니다.</div>

						퀴즈에 도전하고 나만의 기록을 만들어 보세요! <br> <br> <a class="back-btn"
							href="${pageContext.request.contextPath}/quiz/start"> 퀴즈 시작하기
						</a>
					</div>

				</c:when>

				<%-- 퀴즈 기록이 있는 경우 --%>
				<c:otherwise>

					<div class="table-scroll">
						<table>

							<thead>
								<tr>
									<th style="width: 7%;">번호</th>
									<th style="width: 28%;">플레이 날짜</th>
									<th style="width: 17%;">총 문제 수</th>
									<th style="width: 17%;">정답 수</th>
									<th style="width: 17%;">정답률</th>
									<th style="width: 14%;">상세</th>
								</tr>
							</thead>


							<tbody>

								<c:forEach var="history" items="${historyList}"
									varStatus="status">

									<tr>
									    <td>${status.count}</td>
									
									    <td>
									        <c:out value="${history.playDate}" />
									    </td>
									
									    <td>
									        <c:out value="${history.totalCount}" />문제
									    </td>
									
									    <td class="score">
									        <c:out value="${history.correctCount}" />
									        /
									        <c:out value="${history.totalCount}" />
									    </td>
									
									    <td>
									        <c:choose>
									            <c:when test="${history.totalCount > 0}">
									                <span class="rate">
									                    <fmt:formatNumber
									                        value="${history.correctCount * 100 / history.totalCount}"
									                        maxFractionDigits="0" />%
									                </span>
									            </c:when>
									            <c:otherwise>
									                -
									            </c:otherwise>
									        </c:choose>
									    </td>
									
									    <%-- 해당 퀴즈 기록의 상세 페이지로 이동 --%>
									    <td>
									        <a class="detail-btn"
									           href="${pageContext.request.contextPath}/quiz/history/detail?resultId=${history.resultId}">
									            상세 보기
									        </a>
									    </td>
									</tr>

								</c:forEach>

							</tbody>
						</table>
					</div>

				</c:otherwise>

			</c:choose>

			<div class="bottom-area">
				<a class="back-btn" href="${pageContext.request.contextPath}/quiz">
					퀴즈 메인으로 돌아가기 </a>
			</div>

		</section>

	</main>

	<div class="footer">

			<a href="#">개인정보처리방침</a> | <a href="#">전체 서비스</a> | <a href="#">문제
				신고</a> | <a href="#">고객센터</a> | <a
				href="${pageContext.request.contextPath}/admin">관리자</a>

		</div>

</body>
</html>