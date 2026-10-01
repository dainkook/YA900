<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>회원 상세정보</title>

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

.member-detail-card {
	width: 100%;
	background-color: white;
	border: 1px solid #d6dceb;
	border-radius: 12px;
	box-shadow: 0 5px 18px rgba(17, 25, 54, 0.06);
	overflow: hidden;
}

.detail-header {
	height: 65px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 25px;
	border-bottom: 1px solid #d6dceb;
}

.detail-header-title {
	font-size: 17px;
	font-weight: bold;
	color: #111936;
}

.member-number {
	color: #68718a;
	font-size: 13px;
}

.member-info {
	padding: 30px 35px;
}

.info-row {
	display: flex;
	min-height: 58px;
	border-bottom: 1px solid #edf0f6;
}

.info-row:last-child {
	border-bottom: none;
}

.info-title {
	width: 180px;
	display: flex;
	align-items: center;
	padding-left: 15px;
	background-color: #f7f8fc;
	color: #68718a;
	font-size: 14px;
	font-weight: bold;
}

.info-value {
	flex: 1;
	display: flex;
	align-items: center;
	padding: 0 20px;
	color: #18213f;
	font-size: 14px;
}

.status-normal {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 20px;
	background-color: #e8f5e9;
	color: #2e7d32;
	font-size: 12px;
	font-weight: bold;
}

.status-blacklist {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 20px;
	background-color: #ffebee;
	color: #c62828;
	font-size: 12px;
	font-weight: bold;
}

.button-area {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	padding: 25px;
	border-top: 1px solid #d6dceb;
	background-color: #fafbfe;
}

.list-btn {
	width: 100px;
	height: 40px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	background-color: white;
	color: #18213f;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s;
}

.list-btn:hover {
	background-color: #eef1f8;
}

.blacklist-btn {
	width: 120px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color: #c62828;
	color: white;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s;
}

.blacklist-btn:hover {
	background-color: #a91f1f;
}

.release-btn {
	width: 120px;
	height: 40px;
	border: none;
	border-radius: 5px;
	background-color: #2e7d32;
	color: white;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s;
}

.release-btn:hover {
	background-color: #256628;
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
					<a href="/admin/main">대시보드</a>
				</div>

				<div class="menu-item">
					<a href="/admin/notice">공지관리</a>
				</div>

				<div class="menu-item active">
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

			<div class="page-title">회원 상세정보</div>

			<div class="page-subtitle">선택한 회원의 상세 정보를 확인하고 관리할 수 있습니다.</div>

			<div class="member-detail-card">

				<div class="detail-header">

					<div class="detail-header-title">회원 정보</div>

					<div class="member-number">회원번호 : ${member.member_seq}</div>

				</div>

				<div class="member-info">

					<div class="info-row">

						<div class="info-title">아이디</div>

						<div class="info-value">${member.id}</div>

					</div>

					<div class="info-row">

						<div class="info-title">이름</div>

						<div class="info-value">${member.name}</div>

					</div>

					<div class="info-row">

						<div class="info-title">전화번호</div>

						<div class="info-value">${member.phoneFormat}</div>

					</div>

					<div class="info-row">

						<div class="info-title">이메일</div>

						<div class="info-value">${member.email}</div>

					</div>

					<div class="info-row">

						<div class="info-title">성별</div>

						<div class="info-value">${member.gender}</div>

					</div>

					<div class="info-row">

						<div class="info-title">나이</div>

						<div class="info-value">${member.age}세</div>

					</div>

					<div class="info-row">

						<div class="info-title">생년월일</div>

						<div class="info-value">
							<fmt:formatDate value="${member.birth}" pattern="yyyy년 MM월 dd일" />
						</div>

					</div>

					<div class="info-row">

						<div class="info-title">주소</div>

						<div class="info-value">

							${member.zipcode} &nbsp;&nbsp; ${member.address1}

							<c:if test="${not empty member.address2}">
						&nbsp;&nbsp;${member.address2}
					</c:if>

						</div>

					</div>

					<div class="info-row">

						<div class="info-title">응원팀</div>

						<div class="info-value">${member.team}</div>

					</div>

					<div class="info-row">

						<div class="info-title">포인트</div>

						<div class="info-value">${member.point} P</div>

					</div>

					<div class="info-row">

						<div class="info-title">가입일</div>

						<div class="info-value">

							<fmt:formatDate value="${member.regdate}"
								pattern="yyyy-MM-dd HH:mm" />

						</div>

					</div>

					<div class="info-row">

						<div class="info-title">회원 상태</div>

						<div class="info-value">

							<c:choose>

								<c:when test="${member.blackList == 1}">

									<span class="status-blacklist"> 정지 </span>

								</c:when>

								<c:otherwise>

									<span class="status-normal"> 정상 </span>

								</c:otherwise>

							</c:choose>

						</div>

					</div>

				</div>

				<div class="button-area">

					<button type="button" class="list-btn"
						onclick="location.href='/admin/member'">목록으로</button>

					<c:choose>

						<c:when test="${member.blackList == 0}">

							<button type="button" class="blacklist-btn"
								onclick="location.href='/admin/member/blacklist?member_seq=${member.member_seq}'">
								블랙리스트 등록</button>

						</c:when>

						<c:otherwise>

							<button type="button" class="release-btn"
								onclick="location.href='/admin/member/blacklist?member_seq=${member.member_seq}'">
								블랙리스트 해제</button>

						</c:otherwise>

					</c:choose>

				</div>

			</div>

		</div>

		<div class="footer">YA900 ADMIN</div>

	</div>

</body>

</html>
