<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"></script>
<meta charset="UTF-8">
<title>게시글 상세 | YA900</title>
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

.login-btn,
.sign-btn {
    border: 1px solid #7180b1;
    background: transparent;
    color: white;
    border-radius: 5px;
    padding: 6px 10px;
    cursor: pointer;
    white-space: nowrap;
    transition: 0.2s ease;
}

.login-btn:hover,
.sign-btn:hover {
    background: #476aaa;
    border-color: #476aaa;
    color: white;
}

.container {
	width: 1200px;
	margin: 45px auto 80px;
}

.page-heading {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 22px;
	padding: 0 5px;
}

.heading-text {
	display: flex;
	flex-direction: column;
	gap: 9px;
}

.page-heading h2 {
	margin: 0;
	font-size: 27px;
	font-weight: bold;
	color: #171f46;
	letter-spacing: -0.5px;
}

.page-heading p {
	margin: 0;
	font-size: 14px;
	color: #888;
}

.page-heading .category {
	font-size: 13px;
	color: #777;
	padding-bottom: 3px;
}

.container>.body {
	width: 100%;
	min-height: 600px;
	background-color: white;
	border: 1px solid #e2e5eb;
	border-radius: 10px;
	padding: 0 35px;
	box-shadow: 0 5px 20px rgba(20, 30, 60, 0.035);
}

.container>.body>.title {
	width: 100%;
	min-height: 95px;
	display: flex;
	align-items: center;
	border-bottom: 1px solid #e5e7ec;
}

.container>.body>.title div {
	width: 100%;
	font-size: 25px;
	font-weight: bold;
	line-height: 1.5;
	color: #222;
	outline: none;
	word-break: break-word;
}

.container>.body>.info {
	width: 100%;
	min-height: 65px;
	display: flex;
	align-items: center;
	gap: 25px;
	border-bottom: 1px solid #eee;
	font-size: 14px;
	color: #777;
}

.container>.body>.info>div {
	display: flex;
	align-items: center;
}

.container>.body>.info .writer {
	font-weight: bold;
	color: #333;
}

.container>.body>.info span {
	margin-right: 7px;
	font-weight: bold;
	color: #333;
}

.container>.body>.contents {
	width: 100%;
	min-height: 430px;
	padding: 0 10px;
	font-size: 16px;
	line-height: 1.9;
	color: #333;
	white-space: pre-wrap;
	word-break: break-word;
}

#files {
	width: 100%;
	min-height: 65px;
	padding: 17px 10px;
	border-bottom: 1px solid #e5e7ec;
	font-size: 14px;
	color: #555;
}

#files a {
	color: #293d78;
	text-decoration: none;
}

#files a:hover {
	text-decoration: underline;
}

#files:empty {
	display: none;
}

#contents {
	width: 100%;
	min-height: 350px;
	outline: none;
}

#contents img {
	max-width: 100%;
	height: auto;
}

.note-editor.note-frame {
	width: 100%;
	border-color: #dce3f3;
	box-shadow: none;
}

.note-editable {
	font-family: Arial, sans-serif;
	font-size: 16px;
	line-height: 1.9;
}

#title[contenteditable="true"], #contents[contenteditable="true"] {
	background-color: #fafbff;
	border: 1px solid #dce3f3;
	border-radius: 5px;
	padding: 10px;
}

#title[contenteditable="true"]:focus, #contents[contenteditable="true"]:focus
	{
	border-color: #526ba8;
	box-shadow: 0 0 0 3px rgba(82, 107, 168, 0.08);
}

.container>.body>.footer {
	width: 100%;
	min-height: 85px;
	margin-top: 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 25px;
	background-color: white;
	border-top: 1px solid #e5e7ec;
	border-radius: 0 0 10px 10px;
	box-shadow: none;
}

.container>.body>.footer>.list button, .container>.body>.footer>.buttons button
	{
	height: 43px;
	padding: 0 20px;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s ease;
}

.container>.body>.footer>.list button {
	border: 1px solid #293d78;
	background: linear-gradient(135deg, #171f46, #293d78);
	color: white;
}

.container>.body>.footer>.list button:hover {
	background: #354d91;
}

.container>.body>.footer>.buttons {
	display: flex;
	gap: 9px;
}

.container>.body>.footer>.buttons button {
	min-width: 80px;
	border: 1px solid #d5d8df;
	background-color: white;
	color: #333;
}

.container>.body>.footer>.buttons button:hover {
	background-color: #f3f4f7;
	border-color: #aeb4c1;
}

#update {
	background-color: #293d78;
	border-color: #293d78;
	color: white;
}

#update:hover {
	background-color: #354d91;
}

#delete {
	color: #b33b45;
	border-color: #e4bfc2;
}

#delete:hover {
	background-color: #fff4f4;
	border-color: #c86b73;
}

.replyContainer {
	width: 1200px;
	margin: 25px auto 80px;
}

.replyWrite {
	width: 100%;
	background-color: white;
	border: 1px solid #e2e5eb;
	border-radius: 10px;
	padding: 20px 20px;
	box-shadow: 0 5px 20px rgba(20, 30, 60, 0.035);
	margin-bottom: 5px;
}

.replyWrite form {
	display: flex;
	gap: 10px;
}

.replyWrite input[type="text"] {
	flex: 1;
	height: 43px;
	padding: 0 15px;
	border: 1px solid #dce1ea;
	border-radius: 5px;
	outline: none;
	font-size: 14px;
}

.replyWrite input[type="text"]:focus {
	border-color: #526ba8;
	box-shadow: 0 0 0 3px rgba(82, 107, 168, 0.08);
}

.replyWrite button {
	height: 43px;
	padding: 0 20px;
	border: 1px solid #293d78;
	border-radius: 5px;
	background: linear-gradient(135deg, #171f46, #293d78);
	color: white;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
}

.replyWrite button:hover {
	background: #354d91;
}

.reply {
	width: 100%;
	background-color: white;
	border: 1px solid #e2e5eb;
	border-radius: 10px;
	padding: 0 25px;
	box-shadow: 0 5px 20px rgba(20, 30, 60, 0.035);
	overflow: hidden;
}

.reply table {
	width: 100%;
	border-collapse: collapse;
}

.reply tr {
	border-bottom: 1px solid #eee;
}

.reply tr:last-child {
	border-bottom: none;
}

.reply td {
	padding: 18px 10px;
	font-size: 14px;
	color: #555;
	vertical-align: middle;
}

.replyLine {
	width: 100%;
	display: flex;
	align-items: center;
	gap: 10px;
}

.replyForm {
	flex: 1;
	min-width: 0;
	display: flex;
	align-items: center;
	gap: 10px;
}

.replyReportForm {
	flex-shrink: 0;
	margin: 0;
}

.replyReport {
	height: 35px;
	width: 50px;
	padding: 0;
	border-radius: 5px;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	border: 1px solid #b33b45 !important;
	background-color: #b33b45 !important;
	color: white !important;
}

.replyReport:hover {
	background-color: #8f2d36 !important;
	border-color: #8f2d36 !important;
}

.replyContents {
	flex: 1;
	min-width: 0;
	min-height: 38px;
	padding: 8px 12px;
	border: 1px solid transparent;
	border-radius: 5px;
	background-color: transparent;
	font-size: 15px;
	color: #333;
	font-family: Arial, sans-serif;
	outline: none;
	resize: none;
	overflow: hidden;
	line-height: 1.5;
	box-sizing: border-box;
}

.replyContents:not([readonly]) {
	background-color: #fafbff;
	border-color: #dce3f3;
}

.replyContents:not([readonly]):focus {
	border-color: #526ba8;
	box-shadow: 0 0 0 3px rgba(82, 107, 168, 0.08);
}

.replyWriter {
	width: 100px;
	flex-shrink: 0;
	font-weight: bold;
	color: #333 !important;
	white-space: nowrap;
}

.replyDate {
	width: 145px;
	flex-shrink: 0;
	text-align: center;
	color: #888;
	white-space: nowrap;
}

.replyFix, .replyDel {
	height: 35px;
	width: 50px;
	flex-shrink: 0;
	padding: 0;
	border-radius: 5px;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
}

.replyFix {
	border: 1px solid #293d78;
	background-color: white;
	color: #293d78;
}

.replyFix:hover {
	background-color: #f2f4fa;
}

.replyDel {
	border: 1px solid #e4bfc2;
	background-color: white;
	color: #b33b45;
}

.replyDel:hover {
	background-color: #fff4f4;
}

.reply table td[colspan="5"] {
	height: 100px;
	text-align: center;
	color: #999;
}

.boardReport, .replyReport {
	border: 1px solid #b33b45 !important;
	background-color: #b33b45 !important;
	color: white !important;
}

.boardReport:hover, .replyReport:hover {
	background-color: #8f2d36 !important;
	border-color: #8f2d36 !important;
}

/* =========================
   퀵 메뉴
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

.header>.logo:hover {
	cursor: pointer;
}

/* 댓글 한 개의 영역 */
.replyItem {
	padding: 8px 10px;
	border-bottom: 1px solid #eee;
	transition: background-color 0.2s ease;
}

/* 댓글에 마우스를 올리면 배경색 변경 */
.replyItem:hover {
	background-color: #f8f9fc;
}

/* 댓글 본문 한 줄 */
.replyLine {
	width: 100%;
	display: flex;
	align-items: center;
	gap: 10px;
}

/* 답글 버튼 영역 */
.replyActions {
	margin: 3px 0 0 12px;
}

.reReplyOpen {
	padding: 5px 8px;
	border: none;
	border-radius: 4px;
	background: transparent;
	color: #64739b;
	font-size: 13px;
	cursor: pointer;
}

.reReplyOpen:hover {
	background-color: #e9edf7;
	color: #293d78;
}

/* 대댓글 전체 영역 */
.reReplyArea {
	margin: 10px 0 5px 25px;
	padding-left: 18px;
	border-left: 2px solid #dce3f3;
}

/* 대댓글 입력창 */
.reReplyWrite {
	display: flex;
	gap: 8px;
	margin-bottom: 12px;
}

.reReplyWrite textarea {
	flex: 1;
	min-width: 0;
	min-height: 65px;
	padding: 10px 12px;
	border: 1px solid #dce1ea;
	border-radius: 6px;
	background-color: #fff;
	font-family: Arial, sans-serif;
	font-size: 14px;
	resize: vertical;
	outline: none;
}

.reReplyWrite textarea:focus {
	border-color: #526ba8;
	box-shadow: 0 0 0 3px rgba(82, 107, 168, 0.08);
}

.reReplyWrite button {
	align-self: flex-end;
	height: 35px;
	padding: 0 13px;
	border: 1px solid #293d78;
	border-radius: 5px;
	background-color: #293d78;
	color: white;
	font-size: 13px;
	cursor: pointer;
}

.reReplyWrite button:hover {
	background-color: #354d91;
}

/* 기존 대댓글 한 개 */
.reReplyItem {
	padding: 10px 12px;
	margin-bottom: 5px;
	border-radius: 5px;
	transition: background-color 0.2s ease;
}

.reReplyItem:hover {
	background-color: #f0f2f8;
}

/* 대댓글 본문 */
.reReplyForm {
	display: flex;
	align-items: center;
	gap: 10px;
}

.reReplyForm textarea {
	flex: 1;
	min-width: 0;
	min-height: 35px;
	padding: 8px 10px;
	border: 1px solid transparent;
	border-radius: 5px;
	background-color: transparent;
	font-family: Arial, sans-serif;
	font-size: 14px;
	color: #444;
	resize: none;
	outline: none;
}

.reReplyForm textarea:not([readonly]) {
	background-color: white;
	border-color: #dce3f3;
}

.reReplyForm textarea:not([readonly]):focus {
	border-color: #526ba8;
}

.reReplyForm .replyWriter {
	width: 90px;
}

.reReplyForm .replyDate {
	width: 130px;
	font-size: 12px;
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
					<a href="${pageContext.request.contextPath}/#reservation">예매</a> 
					<a href="${pageContext.request.contextPath}/schedule/schedule">경기일정</a> 
					<a href="${pageContext.request.contextPath}/schedule/rankdetail">팀순위</a> 
					<a href="${pageContext.request.contextPath}/schedule/rankdetail?tab=pitcher">선수순위</a> 
					<a href="${pageContext.request.contextPath}/board/board?cpage=1">게시판</a>
				</div>
			</div>

			<!-- 축구 -->
			<div class="menu-item">
				<a href="#">축구</a>

				<div class="sub-menu">
					<a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">예매</a> 
					<a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">경기일정</a> 
					<a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">팀순위</a> 
					<a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">선수순위</a> 
					<a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">게시판</a>
				</div>
			</div>

			<!-- 미니게임 -->
			<div class="menu-item">
				<a href="#">미니게임</a>

				<div class="sub-menu">
					<a href="${pageContext.request.contextPath}/quiz">상식 퀴즈</a> 
					<a href="${pageContext.request.contextPath}/myteam">나만의 팀</a> 
					<a href="${pageContext.request.contextPath}/prediction">승부예측</a> 
				</div>
			</div>
		</nav>

		<div class="member-menu">

    <c:choose>

        <c:when test="${not empty sessionScope.id}">
            <span>${sessionScope.id}님</span>

            <button class="login-btn"
                    onclick="location.href='${pageContext.request.contextPath}/mypage'">
                마이페이지
            </button>

            <form action="${pageContext.request.contextPath}/logout"
                  method="post">
                <button type="submit" class="sign-btn">
                    로그아웃
                </button>
            </form>
        </c:when>

        <c:otherwise>
            <button class="login-btn"
                    onclick="location.href='${pageContext.request.contextPath}/login'">
                로그인
            </button>

            <button class="sign-btn"
                    onclick="location.href='${pageContext.request.contextPath}/signup'">
                회원가입
            </button>
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
		<div>마이페이지</div>
	</div>
	<div class="container">
		<div class="page-heading">
			<div class="heading-text">
				<h2>공지사항</h2>
			</div>
			<div class="category">COMMUNITY / DETAIL</div>
		</div>
		<div class="body">
			<div class="title">
				<div id="title" contenteditable="false">${board.title}</div>
			</div>
			<div class="info">
				<div class="writer">
					<span>${board.writer}</span>
				</div>
				<div>
					<span>조회</span>${board.view_count}
				</div>

				<div>
					<span>작성일</span><fmt:formatDate value="${board.write_date}" pattern="yyyy-MM-dd HH:mm"/>
				</div>

			</div>
			<div id="files">
				<c:forEach var="file" items="${files}">
					<div>
						<a href="/board/download?oriName=${file.oriName}&sysName=${file.sysName}">${file.oriName}</a>
					</div>
				</c:forEach>
			</div>
			<div class="contents">
				<div id="contents" contenteditable="false">${board.contents}</div>
			</div>
			<div class="footer">
				<div class="list">
					<button id="list" type="button">목록</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		let originalTitle = $("#title").html();
		let originalContents = $("#contents").html();
		$("#list").on("click", function() {
			location.href = "/board/board?team=notice&cpage=1";
		});
	</script>
</body>
</html>