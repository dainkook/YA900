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
<title>게시글 작성 | YA900</title>

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

/* 서브 메뉴 */
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
   글쓰기 페이지
========================= */
.container {
	width: 1200px;
	margin: 45px auto 80px;
}

/* 페이지 상단 안내 */
.page-heading {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 22px;
	padding: 0 5px;
}

.page-heading .heading-text {
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

/* 작성 카드 */
.container>form>.body {
	width: 100%;
	min-height: 610px;
	background-color: white;
	border: 1px solid #e2e5eb;
	border-radius: 10px;
	padding: 0 35px;
	box-shadow: 0 5px 20px rgba(20, 30, 60, 0.035);
}

/* 제목 영역 */
.container>form>.body>.title {
	width: 100%;
	min-height: 95px;
	display: flex;
	align-items: center;
	border-bottom: 1px solid #e5e7ec;
	position: relative;
}

.container>form>.body>.title:focus-within {
	border-bottom: 2px solid #263b76;
}

#title {
	width: 100%;
	min-height: 40px;
	font-size: 24px;
	font-weight: bold;
	outline: none;
	border: none;
	color: #222;
	line-height: 1.5;
}

#title:empty:before {
	content: "제목을 입력하세요.";
	color: #b7bbc5;
	font-weight: normal;
}

/* 첨부파일 영역 */
.attachments {
	min-height: 65px;
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	gap: 10px;
	padding: 14px 5px;
	border-bottom: 1px solid #e5e7ec;
	font-size: 14px;
	color: #555;
}

.attachments input[type="file"] {
	max-width: 100%;
	font-size: 13px;
}

/* 본문 영역 */
.container>form>.body>.contents {
	width: 100%;
	min-height: 515px;
	padding: 0 5px;
	font-size: 16px;
	line-height: 1.9;
}

#contents {
	width: 100%;
	min-height: 350px;
	padding: 25px 5px;
	outline: none;
	border: none;
	font-size: 16px;
	font-family: Arial, sans-serif;
	color: #333;
	line-height: 1.9;
	white-space: pre-wrap;
	word-break: break-word;
}

#contents:empty:before {
	content: "게시글 내용을 입력하세요.";
	color: #b7bbc5;
}

.note-editor.note-frame {
	width: 100%;
	border-color: #e2e5eb;
	border-radius: 5px;
	box-shadow: none;
}

.note-editable {
	font-family: Arial, sans-serif;
	font-size: 16px;
	line-height: 1.9;
}

/* 편집 영역 포커스 */
#title:focus, #contents:focus {
	outline: none;
}

/* =========================
   하단 버튼
========================= */
.container>form>.body>.footer {
	width: 100%;
	min-height: 85px;
	margin-top: 0;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 0 25px;
	background-color: white;
	border-top: 1px solid #e5e7ec;
	border-radius: 0 0 10px 10px;
	box-shadow: none;
}

.container>form>.body>.footer>.buttons {
	display: flex;
	gap: 10px;
}

.container>form>.body>.footer>.buttons button {
	width: 95px;
	height: 43px;
	border: 1px solid #d5d8df;
	border-radius: 5px;
	background-color: white;
	color: #444;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s ease;
}

.container>form>.body>.footer>.buttons button:hover {
	background-color: #f3f4f7;
	border-color: #aeb4c1;
}

/* 등록 버튼 */
#submit {
	background: linear-gradient(135deg, #171f46, #293d78) !important;
	border: 1px solid #293d78 !important;
	color: white !important;
}

#submit:hover {
	background: #354d91 !important;
	border-color: #354d91 !important;
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
</style>
</head>
<body>
	<!-- HEADER -->
	<div class="header">

		<div class="logo" onclick="location.href='/'">YA900</div>

		<!-- 메인 메뉴 -->
		<nav class="main-menu">

			<!-- 야구 -->
			<div class="menu-item">
				<a href="#">야구</a>

				<div class="sub-menu">
					<a href="#">예매</a> 
					<a href="${pageContext.request.contextPath}/schedule/schedule">경기일정</a> 
					<a href="${pageContext.request.contextPath}/schedule/rankdetail">팀순위</a> 
					<a href="#">선수순위</a> 
					<a href="${pageContext.request.contextPath}/board/board?cpage=1">게시판</a>
				</div>
			</div>

			<!-- 축구 -->
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

			<!-- 미니게임 -->
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
	<!-- 오른쪽 퀵메뉴 -->
	<div class="quick-menu">
		   <div class="menu">QUICK MENU</div>
		   <div onclick="location.href='${pageContext.request.contextPath}/'">홈</div>
		   <div onclick="location.href='${pageContext.request.contextPath}/#reservation'">예매</div>
		   <div onclick="location.href='${pageContext.request.contextPath}/board/board?cpage=1'">게시판</div>
		   <div>마이페이지</div>
	</div>
	<div class="container">

		<div class="page-heading">
			<div class="heading-text">
				<h2>게시글 작성</h2>
				<p>YA900 커뮤니티에 새로운 이야기를 남겨보세요.</p>
			</div>
			<div class="category">COMMUNITY / WRITE</div>
		</div>

		<form action="/board/writeComplete" enctype="multipart/form-data"
			method="post">

			<div class="body">

				<div class="title">
					<div id="title" contenteditable="true"></div>
					<input id="titleSubmit" type="hidden" name="title" value="">
				</div>

				<div class="attachments">
					<input type="file" name="files"> <input type="file"
						name="files"> <input type="file" name="files">
				</div>

				<div class="contents">
					<div id="contents" contenteditable="true"></div>
					<input id="contentSubmit" type="hidden" name="contents" value="">
				</div>

				<div class="footer">
					<div class="buttons">
						<button id="submit" type="submit">등록</button>
						<button id="cancel" type="button">취소</button>
					</div>
				</div>
			</div>

		</form>

	</div>

	<script>
	$("#contents").summernote({
	    height: 400,
	    lang: "ko-KR",
	    placeholder: "게시글 내용을 입력하세요.",
	    toolbar: [
	        ["font", ["fontname", "fontsize"]],
	        ["style", ["bold", "italic", "underline", "strikethrough"]],
	        ["color", ["color"]],
	        ["para", ["ul", "ol", "paragraph"]],
	        ["insert", ["link", "picture"]],
	        ["view", ["fullscreen", "codeview"]]
	    ],
	    callbacks: {
	        onImageUpload: function(files) {
	            uploadImage(files[0]);
	        }
	    }
	});
	
	function uploadImage(file) {

	    let formData = new FormData();
	    formData.append("file", file);

	    $.ajax({
	        url: "/board/uploadImage",
	        type: "POST",
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(result) {

	            if(result.url) {
	                $("#contents").summernote("insertImage", result.url);
	            } else {
	                alert(result.error);
	            }
	        }
	    });
	}

		$("#cancel").on("click", function() {
			location.href = "/board/board?cpage=1";
		});

		$("form").on("submit", function(e) {
			let title = $("#title").text().trim();
			let contents = $("#contents").summernote("code");
			if (title == "" || $("#contents").summernote("isEmpty")) {
				e.preventDefault();
				alert("제목과 내용을 입력해주세요.");
				return;
			}
			$("#titleSubmit").val($("#title").html());
			$("#contentSubmit").val(contents);
		});
	</script>

</body>
</html>
