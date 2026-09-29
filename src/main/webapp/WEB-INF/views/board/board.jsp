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

.container>.header {
	width: 100%;
	height: 180px;
	background-color: white;
	border: 1px solid #ddd;
}

.container>.header>.title {
	width: 100%;
	height: 110px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-bottom: 1px solid #eee;
}

.container>.header>.title h1 {
	margin: 0;
	font-size: 30px;
	color: #222;
}

.container>.header>.search {
	width: 100%;
	height: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.container>.header>.search select {
	width: 110px;
	height: 40px;
	padding: 0 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: white;
	font-size: 14px;
}

.container>.header>.search input {
	width: 500px;
	height: 40px;
	padding: 0 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
}

.container>.header>.search input:focus {
	outline: none;
	border-color: #555;
}

.container>.header>.search button {
	width: 80px;
	height: 40px;
	border: 1px solid #222;
	border-radius: 4px;
	background-color: #222;
	color: white;
	cursor: pointer;
}

.container>.header>.search button:hover {
	background-color: #444;
}

.container>.body {
	width: 100%;
	min-height: 600px;
	margin-top: 20px;
	background-color: white;
	border: 1px solid #ddd;
}

.container>.body table {
	width: 100%;
	height: auto;
	border-collapse: collapse;
	table-layout: fixed;
}

a {
	color: inherit;
}

.container>.body table tr:first-child {
	height: 55px;
	background-color: #f7f7f7;
	border-bottom: 2px solid #222;
	font-weight: bold;
}

.container>.body table tr:not(:first-child) {
	height: 55px;
	border-bottom: 1px solid #eee;
}

.container>.body table tr:not(:first-child):hover {
	background-color: #fafafa;
}

.container>.body table td {
	padding: 0 15px;
	text-align: center;
	font-size: 14px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.container>.body table td:nth-child(1) {
	width: 10%;
}

.container>.body table td:nth-child(2) {
	width: 50%;
	text-align: left;
}

.container>.body table td:nth-child(3) {
	width: 15%;
}

.container>.body table td:nth-child(4) {
	width: 15%;
}

.container>.body table td:nth-child(5) {
	width: 10%;
}

.container>.footer {
	width: 100%;
	height: 80px;
	margin-top: 15px;
	display: flex;
	background-color: white;
	border: 1px solid #ddd;
}

.container>.footer>.navi {
	width: 90%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container>.footer>.navi a {
	margin: 0 8px;
	color: #555;
	text-decoration: none;
	font-size: 14px;
}

.container>.footer>.navi a:hover {
	color: #000;
	font-weight: bold;
}

.container>.footer>.write {
	width: 10%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container>.footer>.write button {
	width: 90px;
	height: 40px;
	border: 1px solid #222;
	border-radius: 4px;
	background-color: #222;
	color: white;
	cursor: pointer;
}

.container>.footer>.write button:hover {
	background-color: #444;
}

.container>.footer>.navi a{
	font-size:16pt;
	
}
</style>
</head>

<body>
	<div class="container">
		<div class="header">
			<div class="title">
				<h1>자유게시판</h1>
			</div>
			<div class="search">
				<form action="/board/search">
				<select id="select">
					<option>제목</option>
					<option>내용</option>
					<option>글쓴이</option>	
				</select> <input type="text" placeholder="검색할 게시글의 제목을 입력하세요">
				<input type="hidden" name="option">
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
					<c:when test="${list != null}">
						<c:forEach var="i" items="${list}">
							<tr>
								<td>${i.board_seq}</td>
								<td><a href="/board/detail?seq=${i.board_seq}">${i.title}</a></td>
								<td>${i.writer}</td>
								<td>${i.write_date}</td>
								<td>${i.view_count}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr colspan="5">
							<td>게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div class="footer">
			<div class="navi">
			</div>
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
		
		let pageTotalCount = Math.ceil(recordTotalCount / recordCountPerPage);
		
		let startNavi = Math.floor((currentPage -1) / naviCountPerPage) * naviCountPerPage + 1;
		let endNavi = startNavi + naviCountPerPage - 1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		let needPrev = startNavi > 1;
		let needNext = endNavi < pageTotalCount;
		
		let navi = document.querySelector(".navi");		
			let first = document.createElement("a");
			first.setAttribute("href", "/board/board?cpage=" + 1);
			first.innerHTML = " << ";
			navi.append(first);
		
		if(needPrev) {
			let prev = document.createElement("a");
			prev.setAttribute("href", "/board/board?cpage=" + (currentPage - naviCountPerPage));
			prev.innerHTML = "< ";
			navi.append(prev);
		}
		
		for(let i= startNavi; i<=endNavi; i++) {
			let num = document.createElement("a");
			num.setAttribute("href", "/board/board?cpage=" + i);
			num.innerHTML =" " + i + " ";
			navi.append(num);
		}
		
		if(needNext) {
			let next = document.createElement("a");
			next.setAttribute("href", "/board/board?cpage=" + (currentPage + naviCountPerPage));
			next.innerHTML = " >";
			navi.append(next);
			}
		
			let last = document.createElement("a");
			last.setAttribute("href", "/board/board?cpage=" + pageTotalCount);
			last.innerHTML = " >>";
			navi.append(last);
			
		$("#write").on("click", function() {
			if('${loginId}'=='') {
				alert("로그인이 필요한 서비스입니다.");
			} else {
				location.href = "/board/write";
			}
		});
    </script>
</body>
</html>