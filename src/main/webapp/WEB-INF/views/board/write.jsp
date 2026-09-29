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

/* 게시글 작성 영역 */
.container > form > .body {
	width: 100%;
	min-height: 600px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 0 30px;
}

/* 제목 */
.container > form > .body > .title {
	width: 100%;
	height: 80px;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #222;
}

#title {
	width: 100%;
	font-size: 22px;
	font-weight: normal;
	outline: none;
}

/* 내용 */
.container > form > .body > .contents {
	width: 100%;
	min-height: 520px;
	padding: 30px 10px;
	font-size: 16px;
	line-height: 1.8;
}

#contents {
	width: 100%;
	min-height: 450px;
	outline: none;
	white-space: pre-wrap;
	word-break: break-word;
}

/* 하단 버튼 */
.container > form > .footer {
	width: 100%;
	height: 80px;
	margin-top: 15px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 0 20px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
}

.container > form > .footer > .buttons {
	display: flex;
	gap: 8px;
}

.container > form > .footer > .buttons button {
	width: 80px;
	height: 40px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: white;
	color: #222;
	cursor: pointer;
}

.container > form > .footer > .buttons button:hover {
	background-color: #f5f5f5;
}

/* 등록 버튼 */
#submit {
	background-color: #222 !important;
	border-color: #222 !important;
	color: white !important;
}

#submit:hover {
	background-color: #444 !important;
}

#title:empty:before {
	content: "제목을 입력하세요.";
	color: #aaa;
}

#contents:empty:before {
	content: "내용을 입력하세요.";
	color: #aaa;
}


</style>
</head>
<body>

	<div class="container">
		<form action="/board/writeComplete" method="post">
		<div class="body">
			<div class="title">
				<div id="title" contenteditable="true"></div>
				<input id="titleSubmit" type="hidden" name="title" value="">
			</div>
			<div class="contents">
				<div id="contents" contenteditable="true"></div>
				<input id="contentSubmit" type="hidden" name="contents" value="">
			</div>
			</div>
		<div class="footer">
			<div class="buttons">
				<button id="submit" type="submit">등록</button>
				<button id="cancel" type="button">취소</button>
			</div></div>
			</form>
		</div>
	<script>
		$("#cancel").on("click", function() {
			location.href = "/board/board?cpage=1";
		});
		
		$("#submit").on("click", function() {
			$("#titleSubmit").val($("#title").text());
			$("#contentSubmit").val($("#contents").text());
		})
    </script>
</body>
</html>