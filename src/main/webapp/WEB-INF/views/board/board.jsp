<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<title>자유게시판</title>

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
.board-header {
	width: 100%;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 3px 12px rgba(0, 0, 0, 0.04);
	overflow: hidden;
}

/* 제목 */
.title {
	width: 100%;
	height: 120px;
	display: flex;
	align-items: center;
	padding: 0 35px;
	border-bottom: 1px solid #eee;
}

.title h1 {
	margin: 0;
	font-size: 30px;
	color: #222;
}

/* 검색 */
.search {
	width: 100%;
	height: 80px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 0 35px;
	background-color: #fafbfc;
}

.search form {
	display: flex;
	align-items: center;
	gap: 8px;
}

.search select {
	width: 110px;
	height: 40px;
	padding: 0 10px;
	border: 1px solid #d5d8df;
	border-radius: 5px;
	background-color: white;
	font-size: 14px;
	color: #444;
}

.search input[type="text"] {
	width: 420px;
	height: 40px;
	padding: 0 15px;
	border: 1px solid #d5d8df;
	border-radius: 5px;
	background-color: white;
	font-size: 14px;
}

.search input[type="text"]:focus {
	outline: none;
	border-color: #476aaa;
}

.search button {
	width: 75px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color: #171f46;
	color: white;
	font-size: 14px;
	cursor: pointer;
	transition: 0.2s ease;
}

.search button:hover {
	background-color: #252f67;
}

/* =========================
   BOARD
========================= */
.body {
	width: 100%;
	margin-top: 25px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 3px 12px rgba(0, 0, 0, 0.04);
	overflow: hidden;
}

.body table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

/* 테이블 제목 */
.body table tr:first-child {
	height: 58px;
	background-color: #171f46;
	color: white;
	font-weight: bold;
}

.body table tr:first-child td {
	font-size: 14px;
}

/* 게시글 */
.body table tr:not(:first-child) {
	height: 62px;
	border-bottom: 1px solid #eee;
	background-color: white;
	transition: background-color 0.15s ease;
}

.body table tr:not(:first-child):hover {
	background-color: #f8f9fc;
}

/* 테이블 */
.body table td {
	padding: 0 18px;
	text-align: center;
	font-size: 14px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

/* 컬럼 */
.body table td:nth-child(1) {
	width: 10%;
}

.body table td:nth-child(2) {
	width: 50%;
	text-align: left;
}

.body table td:nth-child(3) {
	width: 15%;
}

.body table td:nth-child(4) {
	width: 15%;
}

.body table td:nth-child(5) {
	width: 10%;
}

/* 제목 링크 */
.body table a {
	color: #222;
	text-decoration: none;
	font-weight: 500;
}

.body table a:hover {
	color: #476aaa;
	text-decoration: underline;
}

/* 게시글 없음 */
.body table tr:last-child td[colspan] {
	height: 250px;
	color: #888;
	text-align: center;
}

/* =========================
   FOOTER
========================= */
.footer {
	width: 100%;
	height: 80px;
	margin-top: 15px;
	display: flex;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 3px 12px rgba(0, 0, 0, 0.04);
}

/* 페이지 */
.navi {
	width: 90%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.navi a {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	min-width: 30px;
	height: 30px;
	margin: 0 2px;
	color: #666;
	text-decoration: none;
	font-size: 14px;
	border-radius: 4px;
	transition: 0.15s ease;
}

.navi a:hover {
	background-color: #171f46;
	color: white;
}

/* 글쓰기 */
.write {
	width: 10%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.write button {
	width: 90px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color: #171f46;
	color: white;
	font-size: 14px;
	cursor: pointer;
	transition: 0.2s ease;
}

.write button:hover {
	background-color: #252f67;
}

.logo:hover {
	cursor:pointer;
}
.container>.footer>.navi a {
	font-size:14pt;
}
</style>
</head>
<body>
	<div class="header">

		<div class="logo">YA900</div>

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
		<div class="board-header">
			<div class="title">
				<h1>자유게시판</h1>
			</div>
			<div class="search">
				<form action="/board/search" method="post">
					<select id="select">
						<option>제목</option>
						<option>내용</option>
						<option>글쓴이</option>
					</select> 
					<input type="text" name="search" placeholder="검색할 게시글의 제목을 입력하세요"> 
					<input id="option" type="hidden" name="option">
					<input type="hidden" name="cpage" value="1">
					<button type="submit">검색</button>
				</form>
			</div>
		</div>
		<div class="body">
			<table>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회</td>
				</tr>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="i" items="${list}">
							<tr>
								<td>${i.board_seq}</td>
								<td><a href="/board/detail?seq=${i.board_seq}">
										${i.title} </a></td>
								<td>${i.writer}</td>
								<td>${i.write_date}</td>
								<td>${i.view_count}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div class="footer">
			<div class="navi"></div>
			<div class="write">
				<button id="write">글쓰기</button>
			</div>
		</div>
	</div>
	<script>
let recordTotalCount = ${recordTotalCount};
let recordCountPerPage = ${recordCountPerPage};
let naviCountPerPage = ${naviCountPerPage};
let currentPage = ${cpage};
let isSearch = ${isSearch};
let option = "${option}";
let search = "${search}";
let pageTotalCount =
	Math.ceil(recordTotalCount / recordCountPerPage);

let startNavi =
	Math.floor((currentPage - 1) / naviCountPerPage)
	* naviCountPerPage + 1;

let endNavi =
	startNavi + naviCountPerPage - 1;

if (endNavi > pageTotalCount) {
	endNavi = pageTotalCount;
}

if (currentPage > pageTotalCount) {
	currentPage = pageTotalCount;
}

let needPrev = startNavi > 1;
let needNext = endNavi < pageTotalCount;

let navi =
	document.querySelector(".navi");

let first = document.createElement("a");
if(isSearch==false) {
	first.setAttribute("href", "/board/board?cpage=1");
		} else {first.setAttribute("href", "/board/search?option=" + option + "&search=" + search + "&cpage=1");
				}

first.innerHTML = "<<";
navi.append(first);

if (needPrev) { 
	let prev = document.createElement("a"); 
	
	if (isSearch == false) { 
		prev.setAttribute( 
			"href", 
			"/board/board?cpage=" 
			+ (currentPage - naviCountPerPage)
		); 
	} else { 
		prev.setAttribute( 
			"href", 
			"/board/search?option=" + option 
			+ "&search=" + search 
			+ "&cpage=" 
			+ (currentPage - naviCountPerPage)
		); 
	} 
	
	prev.innerHTML = "<"; 
	navi.append(prev); 
}

for (let i = startNavi; i <= endNavi; i++) {
	let num = document.createElement("a");
	if(isSearch==false) {
	num.setAttribute("href", "/board/board?cpage=" + i);
	num.innerHTML = i;
	navi.append(num);
	} else {
		num.setAttribute("href", "/board/search?option=" + option + "&search=" + search + "&cpage=" + i);
		num.innerHTML = i;
		navi.append(num);
	}
}

if (needNext) {
	let next = document.createElement("a");
	if(isSearch==false) {
	next.setAttribute("href", "/board/board?cpage=" + (currentPage + naviCountPerPage));
	} else {
		next.setAttribute("href", "/board/search?option=" + option + "&search=" + search + "&cpage=" + (currentPage + naviCountPerPage));
	}
	next.innerHTML = ">";
	navi.append(next);
}

let last = document.createElement("a");
if(isSearch==false) {
last.setAttribute("href", "/board/board?cpage=" + pageTotalCount);
} else {
	last.setAttribute("href", "/board/search?option=" + option + "&search=" + search + "&cpage=" + pageTotalCount);
}
last.innerHTML = ">>";
navi.append(last);

$("#write").on("click", function() {
	if ('${loginId}' == '') {
		alert("로그인이 필요한 서비스입니다.");
	} else {
		location.href = "/board/write";
	}
});

$("#option").val($("#select").val());

$("#select").on("change", function() {
	$("#option").val($("#select").val());
});
</script>
</body>
</html>