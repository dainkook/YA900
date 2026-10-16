
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
    min-height: 100px;
    height: auto;
    background: linear-gradient(135deg, #0b1026, #171f46);
    color: white;

    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 15px;

    padding: 15px clamp(15px, 4vw, 50px);

    position: sticky;
    top: 0;
    z-index: 1000;

    border-bottom: 1px solid #303b70;
    box-shadow: 0 3px 15px rgba(11, 16, 38, 0.18);
}

.logo {
    font-size: clamp(22px, 2.2vw, 30px);
    font-weight: bold;
    margin-right: clamp(10px, 3vw, 60px);
    color: white;
    letter-spacing: 1px;
    cursor: pointer;
    flex-shrink: 0;
}

.main-menu {
    height: 100%;
    display: flex;
    align-items: center;
    gap: clamp(12px, 3vw, 40px);
    flex-shrink: 1;
}

.menu-item {
    position: relative;
    height: 100%;
    display: flex;
    align-items: center;
}

.menu-item > a {
    font-size: clamp(14px, 1.4vw, 18px);
    font-weight: bold;
    text-decoration: none;
    color: #f7f8ff;
    padding: 10px 5px;
    white-space: nowrap;
    transition: color 0.2s ease;
}

.menu-item > a:hover {
    color: #aebee7;
}

/* =========================
   SUB MENU
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
   LOGIN / SIGNUP
========================= */

.member-menu {
    font-size: 14px;
    margin-left: auto;
    display: flex;
    align-items: center;
    gap: 8px;
    white-space: nowrap;
    flex-shrink: 0;
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

.user-menu {
	margin-left: auto;
	display: flex;
	gap: 8px;
}

.user-menu button {
	background: transparent;
	border: 1px solid #7180b1;
	border-radius: 5px;
	padding: 8px 15px;
	color: white;
	cursor: pointer;
	transition: 0.2s ease;
}

.user-menu button:hover {
	background: #476aaa;
	border-color: #476aaa;
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
	color: white;
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

/* 게시판 선택 */
.board-select {
	padding: 20px 0;
	border-bottom: 1px solid #e5e7ec;
}

.board-select-title {
	display: block;
	margin-bottom: 15px;
	font-weight: bold;
	color: #171f46;
}

.board-dropdown-menu {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.board-option {
	min-height: 43px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
	padding: 8px 15px;
	border: 1px solid #d5dbea;
	border-radius: 6px;
	background-color: white;
	color: #3c4562;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s ease;
}

.board-option img {
	width: 25px;
	height: 25px;
	object-fit: contain;
}

.board-option:hover {
	border-color: #476aaa;
	background-color: #f0f3fb;
}

.board-option.selected {
	border: 2px solid #293d78;
	background-color: #293d78;
	color: white;
	box-shadow: 0 3px 8px rgba(23, 31, 70, 0.15);
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

/* 태블릿 및 작은 노트북 */
@media (max-width: 1100px) {
    .header {
        padding: 15px 25px;
        gap: 10px;
    }

    .logo {
        margin-right: 15px;
    }

    .main-menu {
        gap: 15px;
    }

    .member-menu {
        gap: 5px;
    }

    .login-btn,
    .sign-btn {
        padding: 6px 8px;
    }
}

/* 태블릿 및 작은 화면 */
@media (max-width: 850px) {
    .header {
        padding: 15px 20px;
    }

    .logo {
        margin-right: 5px;
    }

    .main-menu {
        gap: 10px;
    }

    .menu-item > a {
        font-size: 14px;
    }

    .member-menu {
        font-size: 12px;
    }

    .member-menu button {
        font-size: 12px;
        padding: 6px;
    }
}

/* 모바일 */
@media (max-width: 600px) {
    .header {
        justify-content: center;
        padding: 12px 10px;
        gap: 8px 15px;
    }

    .logo {
        font-size: 24px;
        margin-right: 5px;
    }

    .main-menu {
        gap: 12px;
        height: 40px;
    }

    .menu-item > a {
        font-size: 13px;
        padding: 8px 2px;
    }

    .member-menu {
        margin-left: 0;
        gap: 5px;
    }

    .member-menu span {
        font-size: 12px;
    }

    .member-menu button {
        font-size: 11px;
        padding: 5px 7px;
    }
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

		<form action="${pageContext.request.contextPath}/board/writeComplete"
			enctype="multipart/form-data" method="post">

			<div class="body">

				<!-- 게시판 선택 -->
				<div class="board-select">
					<span class="board-select-title">작성 게시판</span>

					<input type="hidden" id="teamSubmit" name="team" value="${selectedTeam}">
					<div id="boardDropdownMenu" class="board-dropdown-menu">
						<button type="button" class="board-option selected" data-team="">
    						<span style="font-size: 22px;">⚾</span>
    						<span>자유게시판</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == '두산' ? 'selected' : ''}"
							data-team="두산">
							<img src="${pageContext.request.contextPath}/resources/images/team/doosan.png"
								alt="두산 베어스">
							<span>두산 베어스</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == 'LG' ? 'selected' : ''}"
							data-team="LG">
							<img src="${pageContext.request.contextPath}/resources/images/team/lg.png"
								alt="LG 트윈스">
							<span>LG 트윈스</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == 'KIA' ? 'selected' : ''}"
							data-team="KIA">
							<img src="${pageContext.request.contextPath}/resources/images/team/kia.png"
								alt="KIA 타이거즈">
							<span>KIA 타이거즈</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == '삼성' ? 'selected' : ''}"
							data-team="삼성">
							<img src="${pageContext.request.contextPath}/resources/images/team/samsung.png"
								alt="삼성 라이온즈">
							<span>삼성 라이온즈</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == 'SSG' ? 'selected' : ''}"
							data-team="SSG">
							<img src="${pageContext.request.contextPath}/resources/images/team/ssg.png"
								alt="SSG 랜더스">
							<span>SSG 랜더스</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == 'KT' ? 'selected' : ''}"
							data-team="KT">
							<img src="${pageContext.request.contextPath}/resources/images/team/kt.png"
								alt="KT 위즈">
							<span>KT 위즈</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == '롯데' ? 'selected' : ''}"
							data-team="롯데">
							<img src="${pageContext.request.contextPath}/resources/images/team/lotte.png"
								alt="롯데 자이언츠">
							<span>롯데 자이언츠</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == '한화' ? 'selected' : ''}"
							data-team="한화">
							<img src="${pageContext.request.contextPath}/resources/images/team/hanhwa.png"
								alt="한화 이글스">
							<span>한화 이글스</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == 'NC' ? 'selected' : ''}"
							data-team="NC">
							<img src="${pageContext.request.contextPath}/resources/images/team/nc.png"
								alt="NC 다이노스">
							<span>NC 다이노스</span>
						</button>

						<button type="button"
							class="board-option ${selectedTeam == '키움' ? 'selected' : ''}"
							data-team="키움">
							<img src="${pageContext.request.contextPath}/resources/images/team/kiwoom.png"
								alt="키움 히어로즈">
							<span>키움 히어로즈</span>
						</button>
					</div>
				</div>

				<div class="title">
					<div id="title" contenteditable="true"></div>
					<input id="titleSubmit" type="hidden" name="title" value="">
				</div>

				<div class="attachments">
					<input type="file" name="files">
					<input type="file" name="files">
					<input type="file" name="files">
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
	let uploadedImages = [];
	let isSubmitting = false;

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
	        },
	        onMediaDelete: function(target) {
	            let imageUrl = target.attr("src");

	            if (uploadedImages.includes(imageUrl)) {
	                $.ajax({
	                    url: "${pageContext.request.contextPath}/board/deleteImage",
	                    type: "POST",
	                    data: {
	                        imageUrl: imageUrl
	                    },
	                    success: function(result) {
	                        if (result.success) {
	                            uploadedImages = uploadedImages.filter(function(url) {
	                                return url != imageUrl;
	                            });
	                        } else {
	                            alert("이미지 파일 삭제에 실패했습니다.");
	                        }
	                    },
	                    error: function() {
	                        alert("이미지 파일 삭제 요청에 실패했습니다.");
	                    }
	                });
	            }
	        }
	    }
	});

	function uploadImage(file) {
	    let formData = new FormData();
	    formData.append("file", file);

	    $.ajax({
	        url: "${pageContext.request.contextPath}/board/uploadImage",
	        type: "POST",
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(result) {
	            if (result.url) {
	                $("#contents").summernote("insertImage", result.url);
	                uploadedImages.push(result.url);
	            } else {
	                alert(result.error || "이미지 업로드에 실패했습니다.");
	            }
	        },
	        error: function() {
	            alert("이미지 업로드 요청에 실패했습니다.");
	        }
	    });
	}
	window.addEventListener("pagehide", function() {
	    if (isSubmitting) {
	        return;
	    }

	    uploadedImages.forEach(function(imageUrl) {
	        let formData = new URLSearchParams();
	        formData.append("imageUrl", imageUrl);

	        navigator.sendBeacon(
	            "${pageContext.request.contextPath}/board/deleteImage",
	            formData
	        );
	    });
	});

	$(".board-option").on("click", function() {
	    $(".board-option").removeClass("selected");
	    $(this).addClass("selected");

	    $("#teamSubmit").val($(this).data("team"));
	});

	$("#cancel").on("click", function() {
	    const base = "${pageContext.request.contextPath}/board/board";
	    const team = "${selectedTeam}";

	    if (team) {
	        location.href = base + "?team=" + encodeURIComponent(team) + "&cpage=1";
	    } else {
	        location.href = base + "?cpage=1";
	    }
	});

	$("#title").on("input", function() {
	    let title = $(this).text();

	    if (title.length > 100) {
	        $(this).text(title.substring(0, 100));

	        let range = document.createRange();
	        let selection = window.getSelection();

	        range.selectNodeContents(this);
	        range.collapse(false);

	        selection.removeAllRanges();
	        selection.addRange(range);
	    }
	});

	$(".container > form").on("submit", function(e) {
	    let title = $("#title").text().trim();
	    let contents = $("#contents").summernote("code");
	    let text = $("<div>").html(contents).text().trim();

	    if (title == "" || $("#contents").summernote("isEmpty")) {
	        e.preventDefault();
	        alert("제목과 내용을 입력해주세요.");
	        return;
	    }

	    if (title.length > 100) {
	        e.preventDefault();
	        alert("제목은 100자까지 작성할 수 있습니다.");
	        return;
	    }

	    if (text.length > 1000) {
	        e.preventDefault();
	        alert("게시글은 1000자까지 작성할 수 있습니다.");
	        return;
	    }
	    isSubmitting = true;
	    $("#titleSubmit").val(title);
	    $("#contentSubmit").val(contents);
	});
	</script>

</body>
</html>
