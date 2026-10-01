<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.container {
	width: 1200px;
	margin: 50px auto;
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
}

.login-btn, .sign-btn {
	border: 1px solid #7180b1;
	background: transparent;
	color: white;
	border-radius: 5px;
	transition: 0.2s ease;
}

.login-btn:hover, .sign-btn:hover {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

.container {
	width: 1200px;
	margin: 50px auto 80px;
}

.container>.body {
	width: 100%;
	min-height: 600px;
	margin-top: 20px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 0 30px;
}

.container>.body>.title {
	width: 100%;
	height: 80px;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #222;
}

.container>.body>.title div {
	font-size: 22px;
	font-weight: normal;
}

.container>.body>.info {
	width: 100%;
	height: 55px;
	display: flex;
	align-items: center;
	border-bottom: 1px solid #eee;
	font-size: 14px;
	color: #666;
}

.container>.body>.info>div {
	margin-right: 30px;
}

.container>.body>.info>.writer {
	margin-right: 1px;
}

.container>.body>.info span {
	margin-right: 7px;
	font-weight: bold;
	color: #333;
}

.container>.body>.contents {
	width: 100%;
	min-height: 430px;
	padding: 10px 10px;
	font-size: 16px;
	line-height: 1.8;
	white-space: pre-wrap;
	word-break: break-word;
}

.container>.footer {
	width: 100%;
	height: 80px;
	margin-top: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
}

.container>.footer>.list button {
	width: 90px;
	height: 40px;
	border: 1px solid #222;
	border-radius: 4px;
	background-color: #222;
	color: white;
	cursor: pointer;
}

.container>.footer>.list button:hover {
	background-color: #444;
}

.container>.footer>.buttons {
	display: flex;
	gap: 8px;
}

.container>.footer>.buttons button {
	width: 80px;
	height: 40px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: white;
	color: #222;
	cursor: pointer;
}

.container>.footer>.buttons button:hover {
	background-color: #f5f5f5;
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
					<a href="#">예매</a> <a href="#">경기일정</a> <a href="#">팀순위</a> <a
						href="#">선수순위</a> <a href="#">게시판</a>
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
					<a href="#">상식 퀴즈</a> <a href="#">OX 퀴즈</a> <a href="#">승부예측</a> <a
						href="#">게임 랭킹</a>
				</div>
			</div>
		</nav>

		<div class="member-menu">
			<button class="login-btn" onclick="location.href='login'">로그인</button>
			<button class="sign-btn" onclick="location.href='signup'">회원가입</button>
		</div>

	</div>
	<div class="container">
		<div class="body">
			<div class="title">
				<div id="title" contenteditable="false">${board.title}</div>
			</div>
			<div class="info">
				<div class="writer">
					<span>${board.writer}</span>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}${logo}">
				</div>
				<div>
					<span>조회</span>${board.view_count}</div>
				<div>
					<span>작성일</span>${board.write_date}</div>
			</div>
			<div class="contents">
				<div id="contents" contenteditable="false">${board.contents}</div>
			</div>
		</div>
		<div class="footer">
			<div class="list">
				<button id="list" type="button">목록</button>
			</div>
			<div class="buttons"></div>
		</div>
	</div>
	<script>
        $("#list").on("click", function() {
            location.href = "/board/board?cpage=1";
        });
        
        if("${loginId}"=="${board.writer}") {
            let update = $("<button>");
            let del = $("<button>");
            update.attr("id", "update");
            del.attr("id", "delete");
            $(".buttons").append(update, del);
            }

        $(".buttons").on("click", "#update", function() {

            if ($(this).text() == "수정") {

                $("#contents").attr("contenteditable", true);
                $("#title").attr("contenteditable", true);

                $(this).text("수정완료");
                $("#delete").text("취소");
            } else {
                location.href = "/board/updateDetail?seq=${board.board_seq}&title="
                        + $("#title").text()
                        + "&contents="
                        + $("#contents").text();
            }
        });
        
        $(".buttons").on("click", "#delete", function() {

            if ($(this).text() == "삭제") {

                location.href = "/board/delete?seq=${board.board_seq}";

            } else {

                $("#contents").attr("contenteditable", false);
                $("#title").attr("contenteditable", false);

                $("#update").text("수정");
                $(this).text("삭제");
            }
        });
    </script>
</body>
</html>