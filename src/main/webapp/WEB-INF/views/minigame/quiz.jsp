<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YA900 야구 상식 퀴즈</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body {
	margin: 0;
	background: linear-gradient(to bottom, #111936 0%, #111936 15%, #0b1026 25%, #171f46
		35%, #252f67 48%, #71809f 65%, #aeb7ca 76%, #d5dae5 86%, #eef1f8 94%,
		#eef1f8 100%);
	color: #18213f;
}

h1 {
	margin: 0;
	font-size: 25px;
	font-weight: 800;
	letter-spacing: -0.7px;
	color: #202945;
}

h2 {
	margin: 0 0 22px;
	font-size: 20px;
	font-weight: 800;
	letter-spacing: -0.5px;
	text-align: center;
	color: #202945;
}

/* =========================
   HEADER
========================= */
.header {
	width: 100%;
	height: 100px;
	background: linear-gradient(135deg, #0b1026, #171f46);
	color: white;
	display: flex;
	align-items: center;
	padding: 0 50px;
	position: sticky;
	top: 0;
	z-index: 1000;
	border-bottom: 1px solid #303b70;
	box-shadow: 0 3px 15px rgba(11, 16, 38, 0.18);
}

.logo {
	font-size: 30px;
	font-weight: bold;
	margin-right: 60px;
	color: white;
	letter-spacing: 1px;
	cursor: pointer;
}

.main-menu {
	height: 100%;
	display: flex;
	align-items: center;
	gap: 40px;
}

.menu-item {
	position: relative;
	height: 100%;
	display: flex;
	align-items: center;
}

.menu-item>a {
	font-size: 18px;
	font-weight: bold;
	text-decoration: none;
	color: #f7f8ff;
	padding: 10px 5px;
	transition: color 0.2s ease;
	letter-spacing: -0.3px;
}

.menu-item>a:hover {
	color: #aebee7;
}

/* =========================
   서브 메뉴
========================= */
.sub-menu {
	position: absolute;
	top: 100%;
	left: 50%;
	transform: translateX(-50%) translateY(-10px);
	width: 130px;
	background: #171f46;
	border: 1px solid #394575;
	display: flex;
	flex-direction: column;
	opacity: 0;
	visibility: hidden;
	transition: opacity 0.2s ease, transform 0.2s ease;
	box-shadow: 0 10px 25px rgba(8, 12, 30, 0.25);
}

.menu-item:hover .sub-menu {
	opacity: 1;
	visibility: visible;
	transform: translateX(-50%) translateY(0);
}

.sub-menu a {
	padding: 13px 15px;
	text-decoration: none;
	color: #f5f7ff;
	font-size: 13px;
	font-weight: 500;
	letter-spacing: -0.2px;
	font-size: 14px;
	border-bottom: 1px solid #35406b;
}

.sub-menu a:last-child {
	border-bottom: none;
}

.sub-menu a:hover {
	background: #252f67;
}

/* =========================
   로그인 / 회원가입
========================= */
.member-menu {
	font-size: 14px;
	margin-left: auto;
	display: flex;
	align-items: center;
	gap: 10px;
	white-space: nowrap;
}

.member-menu form {
	display: flex;
	margin: 0;
}

.member-menu span {
	color: white;
	font-weight: bold;
	white-space: nowrap;
}

.login-btn, .sign-btn {
	border: 1px solid #7180b1;
	background: transparent;
	color: white;
	border-radius: 5px;
	padding: 6px 10px;
	cursor: pointer;
	white-space: nowrap;
	transition: 0.2s ease;
}

.login-btn:hover, .sign-btn:hover {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

/* =========================
   CONTAINER
========================= */
.wrap {
	width: 1310px;
	max-width: calc(100% - 40px);
	margin: 110px auto 40px;
}

/* =========================
   COMMON BOX
========================= */
.box {
	background: #ffffff;
	border: 1px solid #e1e7f2;
	border-radius: 14px;
	box-shadow: 0 5px 18px rgba(20, 35, 70, 0.06);
	padding: 28px;
	transition: box-shadow 0.2s ease, transform 0.2s ease;
}

.box h2 {
	position: relative;
	padding-bottom: 13px;
	border-bottom: 1px solid #edf0f7;
}

/* 퀴즈 시작 카드 설명 */

/* =========================
   QUIZ START
========================= */
.quiz-start {
    flex: 2;
    min-height: 300px;

    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;

    padding: 24px 28px;
}

/* 퀴즈 제목 */
.quiz-start h2 {
    margin: 0 0 14px;
    padding-bottom: 8px;
    line-height: 1.4;
}

/* 퀴즈 안내 문구 */
.quiz-start p {
    margin: 5px 0;
    line-height: 1.5;
    font-size: 14px;
    font-weight: 500;
    color: #666;
    letter-spacing: -0.2px;
}

/* 전체 등록 문제 */
.quiz-start p:first-of-type {
    margin-top: 0;
    color: #344b78;
    font-size: 16px;
    font-weight: 700;
}

/* 퀴즈 시작 버튼 */
.quiz-start .btn {
    margin-top: 10px;
    min-width: 150px;
    height: 45px;
    padding: 0 25px;
}


/* 내 포인트 */
.point-value {
	width: 80%;
	min-height: 75px;
	border: 1px solid #dfe7f5;
	border-radius: 10px;
	background: linear-gradient(135deg, #f7f9ff, #edf2ff);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 26px;
	font-weight: 800;
	color: #476aaa;
	margin-bottom: 20px;
	letter-spacing: -0.5px;
}

/* 안내 및 최근 기록 */
.info ul {
	margin: 0;
	padding-left: 20px;
	display: flex;
	flex-direction: column;
	gap: 13px;
	color: #58647b;
	font-size: 14px;
	line-height: 1.7;
}

.info li {
	padding-left: 4px;
}

.info li::marker {
	color: #476aaa;
}

/* 공통 버튼 */
.btn, .history-btn {
	font-family: inherit;
	font-size: 14px;
	font-weight: 700;
	letter-spacing: -0.2px;
}

.btn {
	border-radius: 8px;
	box-shadow: 0 3px 7px rgba(71, 106, 170, 0.13);
}

.history-btn {
	border-radius: 8px;
	box-shadow: 0 3px 7px rgba(71, 106, 170, 0.12);
}

/* 표 제목과 데이터 */
table {
	width: 100%;
	border-collapse: collapse;
	font-family: inherit;
	font-size: 14px;
	text-align: center;
}

th {
	height: 48px;
	background: #f4f6fb;
	border-top: 1px solid #e1e7f2;
	border-bottom: 1px solid #dce3ef;
	font-size: 13px;
	font-weight: 800;
	letter-spacing: -0.2px;
	color: #596780;
}

td {
	height: 52px;
	padding: 10px 8px;
	border-bottom: 1px solid #edf0f6;
	font-size: 14px;
	font-weight: 500;
	color: #36425b;
}

tbody tr:hover {
	background: #f5f8ff;
}

/* 카드 제목과 표 사이의 간격 */
.table-scroll {
	border-radius: 8px;
	overflow-x: auto;
}

/* 푸터 */
.site-footer {
	font-family: inherit;
	font-size: 12px;
	letter-spacing: 0.5px;
	color: #7b8498;
}

/* =========================
   TITLE
========================= */
.wrap>.box:first-child {
	height: 70px;
	display: flex;
	align-items: center;
	margin-bottom: 18px;
}

h1 {
	margin: 0;
	font-size: 24px;
	font-weight: bold;
}

h2 {
	margin: 0 0 20px;
	font-size: 21px;
	font-weight: bold;
	text-align: center;
	color: #222;
}

/* =========================
   ROW
========================= */
.row {
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
}

/* =========================
   QUIZ START
========================= */
.quiz-start {
	flex: 2;
	min-height: 300px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.quiz-start p {
	margin: 6px 0;
	font-size: 14px;
	color: #666;
}

/* =========================
   MY POINT
========================= */
.my-point {
	flex: 1;
	min-height: 300px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.my-point h2 {
	margin-bottom: 25px;
}

.point-value {
	width: 80%;
	height: 70px;
	border: 1px solid #e0e3e7;
	border-radius: 7px;
	background: #f7f8fa;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	font-weight: bold;
	color: #476aaa;
	margin-bottom: 20px;
}

/* =========================
   BUTTON
========================= */
.btn {
	height: 45px;
	min-width: 150px;
	padding: 0 25px;
	border: none;
	border-radius: 7px;
	background: #476aaa;
	color: white;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.15s ease;
}

.btn:hover {
	background: #3d5e97;
	box-shadow: 0 3px 8px rgba(71, 106, 170, 0.2);
}

/* =========================
   INFO
========================= */
.info {
	flex: 1;
	min-height: 230px;
}

.info ul {
	margin: 0;
	padding-left: 20px;
	display: flex;
	flex-direction: column;
	gap: 14px;
	color: #555;
	font-size: 14px;
}

.info li {
	padding-left: 4px;
}

/* =========================
   TABLE
========================= */
.table-scroll {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
	text-align: center;
}

th {
	height: 45px;
	background: #f7f8fa;
	border-top: 1px solid #e1e4e8;
	border-bottom: 1px solid #d5d9df;
	font-weight: bold;
	color: #555;
}

td {
	height: 48px;
	border-bottom: 1px solid #eee;
	color: #444;
}

tbody tr:hover {
	background: #f7f9fc;
}

/* =========================
   BOTTOM BOX
========================= */
.wrap>section.box {
	margin-bottom: 20px;
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

.footer a:hover {
	color: #a9b1db;
}

/* =========================
   QUICK MENU
========================= */
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

/* =========================
   RESPONSIVE
========================= */
@media ( max-width : 900px) {
	.header {
		padding: 0 25px;
	}
	.logo {
		margin-right: 30px;
	}
	.main-menu {
		gap: 20px;
	}
	.wrap {
		width: 100%;
		max-width: calc(100% - 30px);
	}
	.row {
		flex-direction: column;
	}
	.quiz-start, .my-point, .info {
		width: 100%;
	}
}

@media ( max-width : 600px) {
	.header {
		height: 80px;
		padding: 0 15px;
	}
	.logo {
		font-size: 24px;
		margin-right: 20px;
	}
	.main-menu {
		gap: 10px;
	}
	.menu-item>a {
		font-size: 14px;
	}
	.member-menu {
		display: none;
	}
	.wrap {
		margin-top: 40px;
		max-width: calc(100% - 20px);
	}
	.box {
		padding: 20px;
	}
	h1 {
		font-size: 20px;
	}
	h2 {
		font-size: 18px;
	}
	.quick-menu {
		display: none;
	}
}

.history-btn-wrap {
	margin-top: 22px;
	text-align: center;
}

.history-btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	min-width: 150px;
	height: 42px;
	padding: 0 20px;
	background: #476aaa;
	color: white;
	border-radius: 7px;
	font-size: 14px;
	font-weight: bold;
	text-decoration: none;
	transition: all 0.2s ease;
}

.history-btn:hover {
	background: #3d5e97;
	box-shadow: 0 3px 8px rgba(71, 106, 170, 0.2);
}

.point-history-scroll {
	max-height: 300px;
	overflow-y: auto;
	overflow-x: hidden;
}

.point-history-scroll table {
	width: 100%;
	border-collapse: collapse;
}

.point-history-scroll thead {
	position: sticky;
	top: 0;
	z-index: 1;
	background-color: #fff;
}
</style>
</head>

<body>

	<div class="header">

		<div class="logo" onclick="location.href='/'">YA900</div>

		<!-- 메인 메뉴 -->
		<nav class="main-menu">

			<!-- 야구 -->
			<div class="menu-item">
				<a href="#">야구</a>

				<div class="sub-menu">
					<a href="${pageContext.request.contextPath}/#reservation">예매</a> <a
						href="${pageContext.request.contextPath}/schedule/schedule">경기일정</a>
					<a href="${pageContext.request.contextPath}/schedule/rankdetail">팀순위</a>
					<a
						href="${pageContext.request.contextPath}/schedule/rankdetail?tab=pitcher">선수순위</a>
					<a href="${pageContext.request.contextPath}/board/board?cpage=1">게시판</a>
				</div>
			</div>

			<!-- 축구 -->
			<div class="menu-item">
				<a href="#">축구</a>

				<div class="sub-menu">
					<a href="#">예매</a> <a href="#">경기일정</a> <a href="#">팀순위</a> <a
						href="#">선수순위</a> <a href="#">게시판</a>
				</div>
			</div>

			<!-- 미니게임 -->
			<div class="menu-item">
				<a href="#">미니게임</a>

				<div class="sub-menu">
					<a href="${pageContext.request.contextPath}/quiz">상식 퀴즈</a> <a
						href="${pageContext.request.contextPath}/myteam">나만의 팀</a> <a
						href="${pageContext.request.contextPath}/prediction">승부예측</a>
				</div>
			</div>
		</nav>

		<div class="member-menu">
			<c:choose>

				<c:when test="${not empty sessionScope.id}">
					<span>${sessionScope.id}님</span>

					<button class="login-btn"
						onclick="location.href='${pageContext.request.contextPath}/mypage'">
						마이페이지</button>

					<form action="${pageContext.request.contextPath}/logout"
						method="post">
						<button type="submit" class="sign-btn">로그아웃</button>
					</form>
				</c:when>

				<c:otherwise>
					<button class="login-btn"
						onclick="location.href='${pageContext.request.contextPath}/login'">
						로그인</button>

					<button class="sign-btn"
						onclick="location.href='${pageContext.request.contextPath}/signup'">
						회원가입</button>
				</c:otherwise>

			</c:choose>


		</div>

	</div>
	<div class="quick-menu">
		<div class="menu">QUICK MENU</div>
		<div onclick="location.href='${pageContext.request.contextPath}/'">홈</div>
		<div
			onclick="location.href='${pageContext.request.contextPath}/#reservation'">예매</div>
		<div
			onclick="location.href='${pageContext.request.contextPath}/board/board?cpage=1'">게시판</div>
		<div
			onclick="location.href='${pageContext.request.contextPath}/mypage'">마이페이지</div>
	</div>
	<main class="wrap">

		<div class="box">
			<h1>야구 상식퀴즈</h1>
		</div>

		<div class="row">

			<%-- 퀴즈 시작 영역 --%>
			<section class="box quiz-start">
				<h2>오늘의 야구 상식퀴즈</h2>

				<p>전체 등록 문제: ${quizCount}문제</p>
				<p>이번 도전: ${playCount}문제 출제</p>
				<p>정답 1문제당 ${pointPerCorrect}포인트 / 최대 ${maxPoint}포인트</p>
				<p>오늘 참여 횟수: ${todayCount} / 2회</p>

				<button type="button" class="btn"
					onclick="location.href='${pageContext.request.contextPath}/quiz/start'">
					퀴즈 시작</button>
			</section>

			<%-- 내 포인트 영역 --%>
			<section class="box my-point">
				<h2>내 포인트</h2>

				<div class="point-value">
					<c:choose>
						<c:when test="${not empty point}">
							<fmt:formatNumber value="${point}" pattern="#,##0" /> P
                </c:when>
						<c:otherwise>
                    0 P
                </c:otherwise>
					</c:choose>
				</div>

				<button type="button" class="btn"
					onclick="location.href='${pageContext.request.contextPath}/quiz/pointHistory'">
					포인트 내역</button>
			</section>

		</div>

		<div class="row">
			<section class="box info">
				<h2>퀴즈 안내</h2>

				<ul>
					<li>전체 등록 문제: ${quizCount}문제</li>
					<li>한 회차 출제: 10문제</li>
					<li>정답 확인: 제출 후 결과 확인</li>
					<li>랭킹 반영: 회원별 최고 정답 수 기준</li>
				</ul>
			</section>

			<section class="box info">
				<h2>최근 기록</h2>

				<c:choose>
					<%-- 로그인한 회원의 기록이 있는 경우 --%>
					<c:when test="${not empty summary and summary.playCount > 0}">

						<ul>
							<li>최근 점수: <c:choose>
									<c:when test="${not empty latest}">
										<c:out value="${latest.correctCount}" />
                            /
                            <c:out value="${latest.totalCount}" />점
                        </c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</li>

							<li>최고 점수: <c:out value="${summary.bestScore}" />점
							</li>

							<li>참여 횟수: <c:out value="${summary.playCount}" />회
							</li>

							<li>정답률: <c:choose>
									<c:when test="${summary.sumTotal > 0}">
										<fmt:formatNumber
											value="${summary.sumCorrect * 100 / summary.sumTotal}"
											maxFractionDigits="1" />%
                        </c:when>

									<c:otherwise>0%</c:otherwise>
								</c:choose>
							</li>
						</ul>

					</c:when>
					<c:when test="${not empty sessionScope.id}">
						<ul>
							<li>최근 점수: -</li>
							<li>최고 점수: 0점</li>
							<li>참여 횟수: 0회</li>
							<li>정답률: 0%</li>
						</ul>
					</c:when>

					<c:otherwise>
						<p style="text-align: center; color: #666;">로그인하면 나의 퀴즈 기록을
							확인할 수 있습니다.</p>
					</c:otherwise>
				</c:choose>

				<div class="history-btn-wrap">
					<a href="${pageContext.request.contextPath}/quiz/history"
						class="history-btn">전체 기록 보기</a>
				</div>
			</section>
		</div>

		<%-- 포인트 랭킹 --%>
		<section class="box">
			<h2>포인트 랭킹</h2>

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
						<c:choose>
							<c:when test="${not empty rankingList}">
								<c:forEach var="rank" items="${rankingList}">
									<tr>

										<td><c:out value="${rank.rankno}" />위</td>
										<td><c:out value="${rank.memberid}" /></td>
										<td><c:out value="${rank.score}" />점</td>

									</tr>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<tr>
									<td colspan="3">아직 랭킹 데이터가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</section>


		<%-- 포인트 내역 --%>
		<section class="box">
			<h2>포인트 내역</h2>

			<div class="point-history-scroll">
				<table>
					<thead>
						<tr>
							<th style="width: 30%">날짜</th>
							<th style="width: 40%">내용</th>
							<th style="width: 30%">포인트</th>
						</tr>
					</thead>


					<tbody>
						<c:choose>
							<c:when test="${not empty pointHistoryList}">
								<c:forEach var="history" items="${pointHistoryList}">
									<tr>
										<td><fmt:formatDate value="${history.PLAY_DATE}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td>정답 ${history.CORRECT_COUNT} /
											${history.TOTAL_COUNT}문제</td>
										<td>+<fmt:formatNumber value="${history.EARNED_POINT}"
												pattern="#,##0" /> P
										</td>
									</tr>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<tr>
									<td colspan="3">아직 포인트 내역이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>
			</div>
		</section>

	</main>
	<div class="footer">

		<a href="#">개인정보처리방침</a> | <a href="#">전체 서비스</a> | <a href="#">문제
			신고</a> | <a href="#">고객센터</a> | <a
			href="${pageContext.request.contextPath}/admin">관리자</a>

	</div>

	<%-- 오늘 퀴즈 참여 횟수 제한 알림 --%>
	<c:if test="${param.limit eq '1'}">
		<script>
			alert("오늘의 퀴즈 참여 횟수를 모두 사용했습니다.");
		</script>
	</c:if>

</body>
</html>