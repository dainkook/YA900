<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>작성</title>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"></script>

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

.write-box {
	width: 100%;
	padding: 30px;
	background-color: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	color: #18213f;
	font-size: 14px;
	font-weight: bold;
}

.title-input {
	width: 100%;
	height: 45px;
	padding: 0 12px;
	border: 1px solid #cfd5e3;
	border-radius: 5px;
	outline: none;
	font-size: 14px;
}

.title-input:focus {
	border-color: #476aaa;
}

.button-area {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 25px;
}

.btn {
	min-width: 90px;
	height: 42px;
	padding: 0 18px;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
}

.btn-list {
	border: 1px solid #cfd5e3;
	background-color: white;
	color: #68718a;
}

.btn-list:hover {
	background-color: #f5f6fa;
}

.btn-write {
	border: none;
	background-color: #476aaa;
	color: white;
}

.btn-write:hover {
	background-color: #354f88;
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

					<span>${admin_name} 관리자님</span>

					<button type="button" class="logout-btn"
						onclick="location.href='/admin/logout'">로그아웃</button>

				</div>

			</div>

			<div class="menu">

				<div class="menu-item">
					<a href="/admin/main">대시보드</a>
				</div>

				<div class="menu-item active">
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

				<div class="menu-item">
					<a href="/admin/report">신고관리</a>
				</div>

			</div>

		</div>

		<div class="body">

			<div class="page-title">

				<c:choose>

					<c:when test="${not empty notice}">

						공지사항 수정

						<div class="page-subtitle">
							기존 공지사항의 내용을 수정할 수 있습니다.
						</div>

					</c:when>

					<c:otherwise>

						공지사항 작성

						<div class="page-subtitle">
							새로운 공지사항을 작성할 수 있습니다.
						</div>

					</c:otherwise>

				</c:choose>

			</div>

			<div class="write-box">

				<c:choose>

					<c:when test="${not empty notice}">

						<form action="/admin/notice/editProc" method="post">

							<input type="hidden"
								name="notice_seq"
								value="${notice.notice_seq}">

					</c:when>

					<c:otherwise>

						<form action="/admin/notice/writeProc" method="post">

					</c:otherwise>

				</c:choose>

				<div class="form-group">

					<label for="title">제목</label>

					<input type="text"
						id="title"
						name="title"
						class="title-input"
						value="${notice.title}"
						placeholder="공지사항 제목을 입력하세요."
						required>

				</div>

				<div class="form-group">

					<label for="contents">내용</label>

					<textarea id="contents"
						name="contents"
						required>${notice.contents}</textarea>

				</div>

				<div class="button-area">

					<button type="button"
						class="btn btn-list"
						onclick="location.href='/admin/notice'">
						취소
					</button>

					<button type="submit"
						class="btn btn-write">

						<c:choose>

							<c:when test="${not empty notice}">
								수정
							</c:when>

							<c:otherwise>
								등록
							</c:otherwise>

						</c:choose>

					</button>

				</div>

				</form>

			</div>

		</div>

		<div class="footer">YA900 ADMIN</div>

	</div>

	<script>

		$(document).ready(function() {

			$("#contents").summernote({

				lang: "ko-KR",

				height: 400,

				minHeight: 300,

				maxHeight: 600,

				placeholder: "공지사항 내용을 입력하세요.",

				toolbar: [
					["style", ["style"]],
					[
						"font",
						[
							"bold",
							"italic",
							"underline",
							"clear"
						]
					],
					["fontname", ["fontname"]],
					["color", ["color"]],
					[
						"para",
						[
							"ul",
							"ol",
							"paragraph"
						]
					],
					["table", ["table"]],
					[
						"insert",
						[
							"link",
							"picture",
							"video"
						]
					],
					[
						"view",
						[
							"fullscreen",
							"codeview",
							"help"
						]
					]
				]

			});

		});

	</script>

</body>

</html>