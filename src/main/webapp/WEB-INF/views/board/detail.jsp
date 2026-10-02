<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"></script>
<meta charset="UTF-8">
<title>게시글 상세 | YA900</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background-color: #f5f6f8;
	font-family: Arial, sans-serif;
	color: #222;
}

/* =========================
   상단 헤더
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

.menu-item > a {
	font-size: 18px;
	font-weight: bold;
	text-decoration: none;
	color: #f7f8ff;
	padding: 10px 5px;
	transition: color 0.2s ease;
}

.menu-item > a:hover {
	color: #aebee7;
}

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

/* 로그인 / 회원가입 */
.member-menu {
	font-size: 14px;
	margin-left: auto;
	display: flex;
	gap: 8px;
}

.login-btn, .sign-btn {
	padding: 10px 17px;
	border: 1px solid #7180b1;
	background: transparent;
	color: white;
	border-radius: 5px;
	cursor: pointer;
	transition: 0.2s ease;
}

.login-btn:hover, .sign-btn:hover {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

/* =========================
   게시글 상세
========================= */
.container {
	width: 1200px;
	margin: 45px auto 80px;
}

/* 페이지 제목 */
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

/* 게시글 카드 */
.container > .body {
	width: 100%;
	min-height: 600px;
	background-color: white;
	border: 1px solid #e2e5eb;
	border-radius: 10px;
	padding: 0 35px;
	box-shadow: 0 5px 20px rgba(20, 30, 60, 0.035);
}

/* 제목 */
.container > .body > .title {
	width: 100%;
	min-height: 95px;
	display: flex;
	align-items: center;
	border-bottom: 1px solid #e5e7ec;
}

.container > .body > .title div {
	width: 100%;
	font-size: 25px;
	font-weight: bold;
	line-height: 1.5;
	color: #222;
	outline: none;
	word-break: break-word;
}

/* 게시글 정보 */
.container > .body > .info {
	width: 100%;
	min-height: 65px;
	display: flex;
	align-items: center;
	gap: 25px;
	border-bottom: 1px solid #eee;
	font-size: 14px;
	color: #777;
}

.container > .body > .info > div {
	display: flex;
	align-items: center;
}

.container > .body > .info .writer {
	font-weight: bold;
	color: #333;
}

.container > .body > .info span {
	margin-right: 7px;
	font-weight: bold;
	color: #333;
}


/* 내용 */
.container > .body > .contents {
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

#files a { color: #293d78; text-decoration: none; }
#files a:hover { text-decoration: underline; }
#files:empty { display: none; }

#contents {
	width: 100%;
	min-height: 350px;
	outline: none;
}

#contents img { max-width: 100%; height: auto; }
.note-editor.note-frame { width: 100%; border-color: #dce3f3; box-shadow: none; }
.note-editable { font-family: Arial, sans-serif; font-size: 16px; line-height: 1.9; }

/* 수정 모드 */
#title[contenteditable="true"],
#contents[contenteditable="true"] {
	background-color: #fafbff;
	border: 1px solid #dce3f3;
	border-radius: 5px;
	padding: 10px;
}

#title[contenteditable="true"]:focus,
#contents[contenteditable="true"]:focus {
	border-color: #526ba8;
	box-shadow: 0 0 0 3px rgba(82, 107, 168, 0.08);
}

/* =========================
   하단 버튼
========================= */
.container > .body > .footer {
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

.container > .body > .footer > .list button,
.container > .body > .footer > .buttons button {
	height: 43px;
	padding: 0 20px;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s ease;
}

/* 목록 버튼 */
.container > .body > .footer > .list button {
	border: 1px solid #293d78;
	background: linear-gradient(135deg, #171f46, #293d78);
	color: white;
}

.container > .body > .footer > .list button:hover {
	background: #354d91;
}

/* 수정 / 삭제 */
.container > .body > .footer > .buttons {
	display: flex;
	gap: 9px;
}

.container > .body > .footer > .buttons button {
	min-width: 80px;
	border: 1px solid #d5d8df;
	background-color: white;
	color: #333;
}

.container > .body > .footer > .buttons button:hover {
	background-color: #f3f4f7;
	border-color: #aeb4c1;
}

/* 수정완료 */
#update {
	background-color: #293d78;
	border-color: #293d78;
	color: white;
}

#update:hover {
	background-color: #354d91;
}

/* 삭제 */
#delete {
	color: #b33b45;
	border-color: #e4bfc2;
}

#delete:hover {
	background-color: #fff4f4;
	border-color: #c86b73;
}

/* 반응형 */
@media (max-width: 1240px) {
	.container {
		width: calc(100% - 40px);
	}
}

@media (max-width: 768px) {
	.header {
		padding: 0 20px;
	}

	.logo {
		margin-right: 25px;
		font-size: 25px;
	}

	.main-menu {
		gap: 15px;
	}

	.menu-item > a {
		font-size: 14px;
	}

	.member-menu {
		display: none;
	}

	.container {
		width: calc(100% - 24px);
		margin-top: 25px;
	}

	.container > .body {
		padding: 0 18px;
	}

	.container > .body > .info {
		gap: 12px;
		flex-wrap: wrap;
		padding: 12px 0;
	}

	.page-heading h2 {
		font-size: 23px;
	}
}
</style>
</head>

<body>

	<div class="header">

		<div class="logo" onclick="location.href='/'">YA900</div>

		<nav class="main-menu">

			<div class="menu-item">
				<a href="#">야구</a>
				<div class="sub-menu">
					<a href="#">예매</a>
					<a href="#">경기일정</a>
					<a href="#">팀순위</a>
					<a href="#">선수순위</a>
					<a href="#">게시판</a>
				</div>
			</div>

			<div class="menu-item">
				<a href="#">축구</a>
				<div class="sub-menu">
					<a href="#">예매</a>
					<a href="#">경기일정</a>
					<a href="#">팀순위</a>
					<a href="#">선수순위</a>
					<a href="#">게시판</a>
				</div>
			</div>

			<div class="menu-item">
				<a href="#">미니게임</a>
				<div class="sub-menu">
					<a href="#">상식 퀴즈</a>
					<a href="#">OX 퀴즈</a>
					<a href="#">승부예측</a>
					<a href="#">게임 랭킹</a>
				</div>
			</div>

		</nav>

		<div class="member-menu">
			<button class="login-btn" onclick="location.href='login'">로그인</button>
			<button class="sign-btn" onclick="location.href='signup'">회원가입</button>
		</div>

	</div>

	<div class="container">

		<div class="page-heading">
			<div class="heading-text">
				<h2>자유게시판</h2>
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
					<img class="team-logo"
						src="${pageContext.request.contextPath}${logo}">
				</div>

				<div>
					<span>조회</span>${board.view_count}
				</div>

				<div>
					<span>작성일</span>${board.write_date}
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

			<div class="buttons"></div>
		</div>

	</div>

	</div>

	<form id="updateForm" action="/board/updateDetail" method="get"
		style="display: none;">
		<input type="hidden" name="seq" value="${board.board_seq}">
		<input type="hidden" id="updateTitle" name="title">
		<input type="hidden" id="updateContents" name="contents">
	</form>

	<script>
		// 원래 게시글 내용 저장
		let originalTitle = $("#title").html();
		let originalContents = $("#contents").html();

		// 목록 이동
		$("#list").on("click", function() {
			location.href = "/board/board?cpage=1";
		});

		// 작성자 본인에게만 수정 / 삭제 버튼 표시
		if ("${loginId}" == "${board.writer}") {
			let update = $("<button>");
			let del = $("<button>");

			update.attr("id", "update");
			del.attr("id", "delete");

			update.text("수정");
			del.text("삭제");

			$(".buttons").append(update, del);
		}

		// 수정 및 수정완료
		$(".buttons").on("click", "#update", function() {

			if ($(this).text() == "수정") {

				$("#title").attr("contenteditable", true);
				$("#contents").summernote({
					height: 400,
					lang: "ko-KR",
					toolbar: [
						["font", ["fontname", "fontsize"]],
						["style", ["bold", "italic", "underline", "strikethrough"]],
						["color", ["color"]],
						["para", ["ul", "ol", "paragraph"]],
						["insert", ["link", "picture"]],
						["view", ["fullscreen", "codeview"]]
					]
				});

				$(this).text("수정완료");
				$("#delete").text("취소");
				$("#title").focus();

			} else {

				if ($("#title").text().trim() == ""
					|| $("#contents").summernote("isEmpty")) {
					alert("제목과 내용을 입력해주세요.");
					return;
				}

				if (!confirm("수정한 내용을 저장하시겠습니까?")) {
					return;
				}

				$("#updateTitle").val($("#title").text());
				$("#updateContents").val($("#contents").summernote("code"));

				$("#updateForm").submit();
			}
		});

		// 삭제 및 수정 취소
		$(".buttons").on("click", "#delete", function() {

			if ($(this).text() == "삭제") {

				if (confirm("정말 삭제하시겠습니까?")) {
					location.href = "/board/delete?seq=${board.board_seq}";
				}

			} else {

				$("#contents").summernote("destroy");
				$("#contents").html(originalContents);
				$("#title").html(originalTitle);

				$("#contents").attr("contenteditable", false);
				$("#title").attr("contenteditable", false);

				$("#update").text("수정");
				$(this).text("삭제");
			}
		});
	</script>

</body>
</html>
