<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>공지사항 상세</title>

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

.notice-detail {
	width: 100%;
	background-color: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
	overflow: hidden;
}

.notice-header {
	width: 100%;
	padding: 30px;
	border-bottom: 1px solid #e4e7ef;
}

.notice-title {
	margin-bottom: 20px;
	color: #111936;
	font-size: 24px;
	font-weight: bold;
	line-height: 1.4;
}

.notice-info {
	display: flex;
	align-items: center;
	gap: 20px;
	color: #68718a;
	font-size: 13px;
}

.notice-info span {
	display: flex;
	align-items: center;
	gap: 5px;
}

.notice-content {
	width: 100%;
	min-height: 280px;
	padding: 25px 30px 30px;
	color: #30384f;
	font-size: 15px;
	line-height: 1.8;
	text-align: left;
	white-space: pre-wrap;
	word-break: break-word;
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

.btn-edit {
	border: none;
	background-color: #476aaa;
	color: white;
}

.btn-edit:hover {
	background-color: #354f88;
}

.btn-delete {
	border: none;
	background-color: #d9534f;
	color: white;
}

.btn-delete:hover {
	background-color: #c13f3b;
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

				공지사항

				<div class="page-subtitle">공지사항의 상세 내용을 확인할 수 있습니다.</div>

			</div>

			<div class="notice-detail">

				<div class="notice-header">

					<div class="notice-title">${notice.title}</div>

					<div class="notice-info">

						<span> 작성자 : <c:out value="${notice.writer}" />
						</span> <span> 작성일 : <fmt:formatDate value="${notice.write_date}"
								pattern="yyyy-MM-dd HH:mm" />
						</span> <span> 조회수 : ${notice.view_count} </span>

					</div>

				</div>

				<div class="notice-content">

					${notice.contents}

				</div>

			</div>

			<div class="button-area">

				<button type="button" class="btn btn-list"
					onclick="location.href='/admin/notice'">목록</button>

				<button type="button" class="btn btn-edit"
					onclick="location.href='/admin/notice/edit?notice_seq=${notice.notice_seq}'">
					수정</button>

				<button type="button" class="btn btn-delete"
					onclick="deleteNotice()">삭제</button>

			</div>

		</div>

		<div class="footer">YA900 ADMIN</div>

	</div>

	<script>
		function deleteNotice() {

			const result = confirm("이 공지사항을 삭제하시겠습니까?");

			if (result) {
				location.href = "/admin/notice/delete?notice_seq=${notice.notice_seq}";
			}

		}
	</script>

</body>
</html>