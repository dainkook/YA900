<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>회원관리</title>

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
	text-decoration: none;
	color: inherit;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.body {
	width: 1200px;
	margin: 0 auto;
	padding: 40px 0 60px;
}

.page-title {
	margin-bottom: 8px;
	color: #111936;
	font-size: 28px;
	font-weight: bold;
}

.page-subtitle {
	margin-bottom: 30px;
	color: #68718a;
	font-size: 14px;
}

.search-box {
	width: 100%;
	margin-bottom: 25px;
	padding: 20px 25px;
	background-color: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
}

.search-form {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.search-form select {
	width: 150px;
	height: 42px;
	padding: 0 10px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	background-color: white;
	color: #18213f;
	font-size: 14px;
}

.search-form input {
	width: 400px;
	height: 42px;
	padding: 0 12px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	font-size: 14px;
}

.search-form input:focus, .search-form select:focus {
	outline: none;
	border-color: #476aaa;
}

.search-btn {
	width: 90px;
	height: 42px;
	border: none;
	border-radius: 5px;
	background-color: #476aaa;
	color: white;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s;
}

.search-btn:hover {
	background-color: #354f86;
}

.member-card {
	width: 100%;
	background-color: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
	overflow: hidden;
}

.member-card-header {
	height: 65px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 25px;
	border-bottom: 1px solid #d6dceb;
}

.member-count {
	color: #68718a;
	font-size: 14px;
}

.member-count strong {
	color: #111936;
	font-size: 16px;
}

.member-table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

.member-table thead {
	background-color: #f7f8fc;
}

.member-table th {
	height: 55px;
	color: #68718a;
	font-size: 14px;
	font-weight: bold;
	border-bottom: 1px solid #d6dceb;
}

.member-table td {
	height: 60px;
	color: #18213f;
	font-size: 14px;
	text-align: center;
	border-bottom: 1px solid #edf0f6;
}

.member-table tbody tr:hover {
	background-color: #fafbfe;
}

.col-no {
	width: 10%;
}

.col-id {
	width: 19%;
}

.col-name {
	width: 13%;
}

.col-phone {
	width: 20%;
}

.col-regdate {
	width: 16%;
}

.col-status {
	width: 11%;
}

.col-manage {
	width: 11%;
}

.status-normal {
	display: inline-block;
	padding: 5px 10px;
	border-radius: 20px;
	background-color: #e8f5e9;
	color: #2e7d32;
	font-size: 12px;
	font-weight: bold;
}

.status-blacklist {
	display: inline-block;
	padding: 5px 10px;
	border-radius: 20px;
	background-color: #ffebee;
	color: #c62828;
	font-size: 12px;
	font-weight: bold;
}

.detail-btn {
	padding: 7px 15px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	background-color: white;
	color: #18213f;
	font-size: 12px;
	cursor: pointer;
	transition: 0.2s;
}

.detail-btn:hover {
	background-color: #476aaa;
	border-color: #476aaa;
	color: white;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 8px;
	margin-top: 25px;
}

.pagination a, .pagination span {
	min-width: 32px;
	height: 32px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
	color: #68718a;
	font-size: 13px;
	text-decoration: none;
	cursor: pointer;
}

.pagination a:hover {
	background-color: #e9edf7;
	color: #476aaa;
}

.pagination .active {
	background-color: #476aaa;
	color: white;
	font-weight: bold;
}

.pagination .arrow {
	color: #18213f;
	font-weight: bold;
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

					<span> ${admin_name} 관리자님 </span>

					<button type="button" class="logout-btn"
						onclick="location.href='/admin/logout'">로그아웃</button>

				</div>

			</div>

			<div class="menu">

				<div class="menu-item">
					<a href="/admin/main"> 대시보드 </a>
				</div>

				<div class="menu-item">
					<a href="/admin/notice"> 공지관리 </a>
				</div>

				<div class="menu-item active">
					<a href="/admin/member"> 회원관리 </a>
				</div>

				<div class="menu-item">
					<a href="/admin/reservation"> 예매관리 </a>
				</div>

				<div class="menu-item">
					<a href="/admin/schedule"> 경기관리 </a>
				</div>

				<div class="menu-item">
					<a href="/admin/report"> 신고관리 </a>
				</div>

			</div>

		</div>

		<div class="body">

			<div class="page-title">회원 관리</div>

			<div class="page-subtitle">YA900 서비스에 가입된 회원 정보를 관리할 수 있습니다.</div>

			<div class="search-box">

				<form action="/admin/member/search" method="get" class="search-form">

					<select name="searchType">

						<option value="all"
							<c:if test="${searchType == 'all'}">
							selected
						</c:if>>
							전체</option>

						<option value="id"
							<c:if test="${searchType == 'id'}">
							selected
						</c:if>>
							아이디</option>

						<option value="name"
							<c:if test="${searchType == 'name'}">
							selected
						</c:if>>
							이름</option>

						<option value="phone"
							<c:if test="${searchType == 'phone'}">
							selected
						</c:if>>
							전화번호</option>

					</select> <input type="text" name="keyword" value="${keyword}"
						placeholder="검색어를 입력하세요">

					<button type="submit" class="search-btn">검색</button>

				</form>

			</div>

			<div class="member-card">

				<div class="member-card-header">

					<div>회원 목록</div>

					<div class="member-count">
						총 <strong>${memberCount}</strong> 명
					</div>

				</div>

				<table class="member-table">

					<thead>

						<tr>

							<th class="col-no">회원번호</th>
							<th class="col-id">아이디</th>
							<th class="col-name">이름</th>
							<th class="col-phone">전화번호</th>
							<th class="col-regdate">가입일</th>
							<th class="col-status">상태</th>
							<th class="col-manage">관리</th>

						</tr>

					</thead>

					<tbody>

						<c:forEach var="member" items="${list}">

							<tr>

								<td>${member.member_seq}</td>

								<td>${member.id}</td>

								<td>${member.name}</td>

								<td>${member.phoneFormat}</td>

								<td><fmt:formatDate value="${member.regdate}"
										pattern="yyyy-MM-dd" /></td>

								<td><c:choose>

										<c:when test="${member.blackList == 1}">
											<span class="status-blacklist"> 정지 </span>
										</c:when>

										<c:otherwise>
											<span class="status-normal"> 정상 </span>
										</c:otherwise>

									</c:choose></td>

								<td>

									<button type="button" class="detail-btn"
										onclick="location.href='/admin/member/detail?member_seq=${member.member_seq}'">
										상세</button>

								</td>

							</tr>

						</c:forEach>

					</tbody>

				</table>

			</div>

			<div class="pagination">

				<%-- 이전 페이지 --%>
				<c:if test="${page.currentPage > 1}">

					<c:choose>

						<%-- 검색 중인 경우 --%>
						<c:when test="${not empty searchType}">

							<a
								href="/admin/member/search?searchType=${searchType}&keyword=${keyword}&cpage=${page.currentPage-1}"
								class="arrow"> ◀ </a>

						</c:when>

						<%-- 일반 회원 목록인 경우 --%>
						<c:otherwise>

							<a href="/admin/member?cpage=${page.currentPage-1}" class="arrow">
								◀ </a>

						</c:otherwise>

					</c:choose>

				</c:if>


				<%-- 페이지 번호 --%>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">

					<c:choose>

						<%-- 현재 페이지 --%>
						<c:when test="${i == page.currentPage}">

							<span class="active"> ${i} </span>

						</c:when>


						<%-- 다른 페이지 --%>
						<c:otherwise>

							<c:choose>

								<%-- 검색 중 --%>
								<c:when test="${not empty searchType}">

									<a
										href="/admin/member/search?searchType=${searchType}&keyword=${keyword}&cpage=${i}">
										${i} </a>

								</c:when>


								<%-- 일반 목록 --%>
								<c:otherwise>

									<a href="/admin/member?cpage=${i}"> ${i} </a>

								</c:otherwise>

							</c:choose>

						</c:otherwise>

					</c:choose>

				</c:forEach>


				<%-- 다음 페이지 --%>
				<c:if test="${page.currentPage < page.pageTotal}">

					<c:choose>

						<%-- 검색 중 --%>
						<c:when test="${not empty searchType}">

							<a
								href="/admin/member/search?searchType=${searchType}&keyword=${keyword}&cpage=${page.currentPage+1}"
								class="arrow"> ▶ </a>

						</c:when>

						<%-- 일반 목록 --%>
						<c:otherwise>

							<a href="/admin/member?cpage=${page.currentPage+1}" class="arrow">
								▶ </a>

						</c:otherwise>

					</c:choose>

				</c:if>

			</div>

		</div>

		<div class="footer">YA900 ADMIN</div>

	</div>

</body>

</html>