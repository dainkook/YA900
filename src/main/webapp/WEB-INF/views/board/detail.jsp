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

	<div class="container">
		<div class="body">
			<div class="title">
				<div id="title" contenteditable="false">${board.title}</div>
			</div>
			<div class="info">
				<div>
					<span>${board.writer} ${board.teamLogo}</span>
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