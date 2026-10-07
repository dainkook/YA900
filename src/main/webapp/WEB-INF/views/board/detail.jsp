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

body {
	margin: 0;
	background-color: #f5f6f8;
	font-family: Arial, sans-serif;
	color: #222;
}

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
}

.menu-item>a:hover {
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
	padding: 20px 25px;
	box-shadow: 0 5px 20px rgba(20, 30, 60, 0.035);
	margin-bottom: 15px;
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
	height: 38px;
	padding: 0 12px;
	border: 1px solid transparent;
	border-radius: 5px;
	background-color: transparent;
	font-size: 14px;
	color: #333;
	outline: none;
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

</style>
</head>
<body>
	<div class="header">
		<div class="logo" onclick="location.href='/'">YA900</div>
		<nav class="main-menu">
			<div class="menu-item">
				<a href="#">야구</a>
				<div class="sub-menu">
					<a href="#">예매</a> <a href="#">경기일정</a> <a href="#">팀순위</a> <a
						href="#">선수순위</a> <a href="#">게시판</a>
				</div>
			</div>
			<div class="menu-item">
				<a href="#">축구</a>
				<div class="sub-menu">
					<a href="#">예매</a> <a href="#">경기일정</a> <a href="#">팀순위</a> <a
						href="#">선수순위</a> <a href="#">게시판</a>
				</div>
			</div>
			<div class="menu-item">
				<a href="#">미니게임</a>
				<div class="sub-menu">
					<a href="#">상식 퀴즈</a> <a href="#">OX 퀴즈</a> <a href="#">승부예측</a> <a
						href="#">게임 랭킹</a>
				</div>
			</div>
		</nav>
		<div class="member-menu">
			<button class="login-btn" onclick="location.href='/login'">
				로그인</button>
			<button class="sign-btn" onclick="location.href='/signup'">
				회원가입</button>
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
						<a
							href="/board/download?oriName=${file.oriName}&sysName=${file.sysName}">${file.oriName}</a>
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
				<div class="buttons">
					<form action="/board/reportComplete" id="boardReport">
						<input type="hidden" name="target_contents" id="target_contents">
						<input type="hidden" name="target_type" value="게시판"> <input
							type="hidden" name="target_seq" value="${board.board_seq}">
						<input type="hidden" name="parent_seq" value="${board.board_seq}">
						<input type="hidden" name="target_id" value="${board.writer}">
						<input type="hidden" name="reporter" value="${id}"> <input
							type="hidden" id="report_type" name="report_type">
						<button type="button" class="boardReport">신고</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="replyContainer">
		<div class="replyWrite">
			<form id="replyForm" action="/board/replyWrite">
				<input type="text" name="contents" id="reply"
					placeholder="댓글을 입력해주세요..."> <input type="hidden"
					name="writer" value="${id}"> <input type="hidden"
					name="parent_seq" value="${board.board_seq}">
				<button id="replyWrite" type="submit">작성하기</button>
			</form>
		</div>
		<div class="reply">
			<table>
				<c:choose>
					<c:when test="${not empty replyList}">
						<c:forEach var="reply" items="${replyList}">
							<tr>
								<td colspan="5">
									<div class="replyLine">

										<form action="/board/replyUpdate" class="replyForm">
											<input type="text" name="contents" class="replyContents"
												readonly value="${reply.contents}"> <input
												type="hidden" name="parent_seq" value="${board.board_seq}">
											<input type="hidden" name="reply_seq"
												value="${reply.reply_seq}"> <span
												class="replyWriter">${reply.writer}</span> <span
												class="replyDate">${reply.write_date}</span>

											<c:if test="${id == reply.writer}">
												<button type="button" class="replyFix">수정</button>
												<button type="button" class="replyDel">삭제</button>
											</c:if>
										</form>

										<form action="/board/reportComplete" class="replyReportForm">
											<input type="hidden" name="target_contents"
												value="${reply.contents}"> <input type="hidden"
												name="target_type" value="댓글"> <input type="hidden"
												name="target_seq" value="${reply.reply_seq}"> <input
												type="hidden" name="target_id" value="${reply.writer}">
											<input type="hidden" name="parent_seq"
												value="${board.board_seq}"> <input type="hidden"
												name="reporter" value="${id}"> <input type="hidden"
												class="report_type" name="report_type">

											<button type="button" class="replyReport">신고</button>
										</form>

									</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">작성된 댓글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
	<form id="updateForm" action="/board/updateDetail" method="get"
		style="display: none;">
		<input type="hidden" name="seq" value="${board.board_seq}"> <input
			type="hidden" id="updateTitle" name="title"> <input
			type="hidden" id="updateContents" name="contents">
	</form>
	<script>
		let originalTitle = $("#title").html();
		let originalContents = $("#contents").html();
		$("#list").on("click", function() {

			location.href = "/board/board?cpage=1";

		});
		if ("${id}" == "${board.writer}") {
			let update = $("<button>");
			let del = $("<button>");
			update.attr("id", "update");
			del.attr("id", "delete");
			update.text("수정");
			del.text("삭제");
			$(".buttons").prepend(update, del);

		}
		$(".buttons")
				.on(
						"click",
						"#update",
						function() {
							if ($(this).text() == "수정") {
								$("#title").attr("contenteditable", true);
								$("#contents")
										.summernote(
												{
													height : 400,
													lang : "ko-KR",
													toolbar : [
															[
																	"font",
																	[
																			"fontname",
																			"fontsize" ] ],
															[
																	"style",
																	[
																			"bold",
																			"italic",
																			"underline",
																			"strikethrough" ] ],
															[ "color",
																	[ "color" ] ],
															[
																	"para",
																	[
																			"ul",
																			"ol",
																			"paragraph" ] ],
															[
																	"insert",
																	[ "link",
																			"picture" ] ],
															[
																	"view",
																	[
																			"fullscreen",
																			"codeview" ] ] ]

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
								$("#updateContents").val(
										$("#contents").summernote("code"));
								$("#updateForm").submit();
							}
						});
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

		$("#replyForm").on("submit", function(e) {
			if ($("#reply").val() == "") {
				e.preventDefault();
				alert("댓글의 내용을 입력해주세요");
				return;
			}

			if ("${id}" == "") {
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다.");
				return;
			}
		});

		$(".replyFix").on("click", function() {
			let reply = $(this).closest(".replyForm").find(".replyContents");
			if ($(this).text() != "완료") {
				reply.prop("readonly", false);
				$(this).text("완료");
			} else {
				if (!confirm("댓글을 수정하시겠습니까?")) {
					return;
				}
				$(this).closest(".replyForm").submit();
			}
		});
		$(".replyDel").on(
				"click",
				function() {
					if (!confirm("댓글을 삭제하시겠습니까?")) {
						return;
					}
					let replySeq = $(this).closest(".replyForm").find(
							"input[name='reply_seq']").val();
					location.href = "/board/replyDelete?reply_seq=" + replySeq
							+ "&parent_seq=${board.board_seq}";
				});

		var reportForm = null;

		$(".boardReport").on("click", function() {
			$("#target_contents").val($("#contents").text());
			reportForm = null;
			window.open("/board/report", "report", "width=500, height=500");
		});

		$(".replyReport").on("click", function() {
			reportForm = $(this).closest(".replyReportForm");
			window.open("/board/report", "report", "width=500, height=500");
		});
	</script>
</body>
</html>