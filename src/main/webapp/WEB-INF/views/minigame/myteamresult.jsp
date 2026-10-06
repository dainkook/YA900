<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background: linear-gradient(to bottom, #111936 0%, #111936 12%, #171f46 22%, #252f67
		32%, #71809f 43%, #aeb7ca 55%, #d5dae5 70%, #eef1f8 85%, #eef1f8 100%);
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #18213f;
	min-height: 100vh;
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
.header>.logo:hover {
	cursor:pointer;
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
   CONTAINER
========================= */
.container {
	width: 1310px;
	max-width: calc(100% - 40px);
	margin: 110px auto 40px;
}

/* =========================
   PAGE TITLE
========================= */
.title {
	height: 70px;
	background: white;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	display: flex;
	align-items: center;
	padding: 0 25px;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 18px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

/* =========================
   MAIN AREA
========================= */
.main-area {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.squad-area, .roster-area {
	background: white;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	padding: 25px;
	min-width: 0;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

.squad-area {
	flex: 1.15 1 560px;
}

.roster-area {
	flex: 1 1 420px;
}

.area-title {
	text-align: center;
	font-size: 21px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #222;
}

/* =========================
   SQUAD FIELD
========================= */
.field {
	position: relative;
	height: 640px;
	border: 1px solid #e0e3e7;
	border-radius: 8px;
	background: #fafbfc;
}

.squad-player {
	position: absolute;
	width: 124px;
	height: 128px;
	padding: 8px 6px;
	background: white;
	border: 1px solid #d7dbe0;
	border-radius: 8px;
	text-align: center;
	overflow: hidden;
}

.squad-position {
	font-size: 12px;
	color: #777;
	min-height: 16px;
}

.squad-image {
	width: 56px;
	height: 56px;
	margin: 4px auto 6px;
	border-radius: 50%;
	background: #f7f8fa;
	overflow: hidden;
}

.squad-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.squad-name {
	font-size: 14px;
	font-weight: bold;
	color: #222;
	min-height: 18px;
}

.squad-team {
	font-size: 11px;
	font-weight: bold;
	color: #476aaa;
	margin-top: 3px;
	min-height: 14px;
}

/* 포지션 배치 */
.s-left {
	left: 36px;
	top: 44px;
}

.s-center {
	left: calc(50% - 62px);
	top: 16px;
}

.s-right {
	right: 36px;
	top: 44px;
}

.s-short {
	left: calc(50% - 160px);
	top: 178px;
}

.s-second {
	left: calc(50% + 36px);
	top: 178px;
}

.s-third {
	left: 36px;
	top: 338px;
}

.s-pitcher {
	left: calc(50% - 62px);
	top: 338px;
}

.s-first {
	right: 36px;
	top: 338px;
}

.s-catcher {
	left: calc(50% - 62px);
	bottom: 16px;
}

/* =========================
   ROSTER TABLE
========================= */
.table-scroll {
	overflow-x: auto;
}

.roster-table {
	width: 100%;
	min-width: 360px;
	border-collapse: collapse;
	text-align: center;
	font-size: 14px;
}

.roster-table th {
	padding: 12px 8px;
	border-bottom: 1px solid #ddd;
	font-size: 13px;
	color: #888;
	font-weight: bold;
}

.roster-table td {
	height: 54px;
	border-bottom: 1px solid #eee;
}

.roster-table td.name {
	font-weight: bold;
	color: #222;
}

.roster-table td.position {
	color: #666;
}

.roster-table td.team {
	color: #476aaa;
	font-weight: bold;
}

/* =========================
   ACTIONS
========================= */
.action-area {
	display: flex;
	justify-content: center;
	gap: 12px;
	margin-top: 20px;
}

.btn {
	width: 150px;
	height: 48px;
	border-radius: 7px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.15s ease;
}

.btn-primary {
	border: none;
	background: #476aaa;
	color: white;
}

.btn-primary:hover {
	background: #3d5e97;
	box-shadow: 0 3px 8px rgba(71, 106, 170, 0.2);
}

.btn-line {
	border: 1px solid #cfd3d8;
	background: white;
	color: #555;
}

.btn-line:hover {
	border-color: #476aaa;
	color: #476aaa;
}
</style>
</head>

<body>

	<div class="header">

		<div class="logo" onclick="location.href='/'">YA900</div>


		<nav class="main-menu">


			<div class="menu-item">
				<a href="#">야구</a>

				<div class="sub-menu">
				    <a href="#">예매</a>
				    <a href="${pageContext.request.contextPath}/schedule/schedule">경기일정</a> 
				    <a href="${pageContext.request.contextPath}/schedule/rankdetail">팀순위</a> 
				    <a href="${pageContext.request.contextPath}/schedule/rankdetail?tab=pitcher">선수순위</a> 
				    <a href="${pageContext.request.contextPath}/board/board?cpage=1">게시판</a>
				</div>
			</div>


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
			<button class="login-btn" onclick="location.href='login'">로그인</button>
			<button class="sign-btn" onclick="location.href='signup'">회원가입</button>
		</div>

	</div>

	</header>

	<div class="container">

		<div class="title">나의 스쿼드</div>

		<div class="main-area">
			<section class="squad-area">

				<div class="area-title">스쿼드</div>

				<div class="field">

				    <c:forEach var="player" items="${myPlayerList}">
				    
				        <c:if test="${player.player_position == '좌익수'}">
				            <c:set var="LF" value="${player}" />
				        </c:if>
				        
				        <c:if test="${player.player_position == '중견수'}">
				            <c:set var="CF" value="${player}" />
				        </c:if>
				        
				        <c:if test="${player.player_position == '우익수'}">
				            <c:set var="RF" value="${player}" />
				        </c:if>
				        
				        <c:if test="${player.player_position == '유격수'}">
				            <c:set var="SS" value="${player}" />
				        </c:if>
				        
				        <c:if test="${player.player_position == '2루수'}">
				            <c:set var="B2" value="${player}" />
				        </c:if>
				        
				        <c:if test="${player.player_position == '3루수'}">
				            <c:set var="B3" value="${player}" />
				        </c:if>
				        
				        <c:if test="${player.player_position == '선발투수'}">
				            <c:set var="SP" value="${player}" />
				        </c:if>
				        
				        <c:if test="${player.player_position == '1루수'}">
				            <c:set var="B1" value="${player}" />
				        </c:if>
				        
				        <c:if test="${player.player_position == '포수'}">
				            <c:set var="C" value="${player}" />
				        </c:if>
				    
				    </c:forEach>
				
				
				    <!-- 좌익수 -->
				    <div class="squad-player s-left">
				        <div class="squad-position">좌익수</div>
				        <div class="squad-image">
				            <img src="${LF.player_image}" alt="${LF.player_name}">
				        </div>
				        <div class="squad-name">${LF.player_name}</div>
				        <div class="squad-team">${LF.player_team}</div>
				    </div>
				
				
				    <!-- 중견수 -->
				    <div class="squad-player s-center">
				        <div class="squad-position">중견수</div>
				        <div class="squad-image">
				            <img src="${CF.player_image}" alt="${CF.player_name}">
				        </div>
				        <div class="squad-name">${CF.player_name}</div>
				        <div class="squad-team">${CF.player_team}</div>
				    </div>
				
				
				    <!-- 우익수 -->
				    <div class="squad-player s-right">
				        <div class="squad-position">우익수</div>
				        <div class="squad-image">
				            <img src="${RF.player_image}" alt="${RF.player_name}">
				        </div>
				        <div class="squad-name">${RF.player_name}</div>
				        <div class="squad-team">${RF.player_team}</div>
				    </div>
				
				
				    <!-- 유격수 -->
				    <div class="squad-player s-short">
				        <div class="squad-position">유격수</div>
				        <div class="squad-image">
				            <img src="${SS.player_image}" alt="${SS.player_name}">
				        </div>
				        <div class="squad-name">${SS.player_name}</div>
				        <div class="squad-team">${SS.player_team}</div>
				    </div>
				
				
				    <!-- 2루수 -->
				    <div class="squad-player s-second">
				        <div class="squad-position">2루수</div>
				        <div class="squad-image">
				            <img src="${B2.player_image}" alt="${B2.player_name}">
				        </div>
				        <div class="squad-name">${B2.player_name}</div>
				        <div class="squad-team">${B2.player_team}</div>
				    </div>
				
				
				    <!-- 3루수 -->
				    <div class="squad-player s-third">
				        <div class="squad-position">3루수</div>
				        <div class="squad-image">
				            <img src="${B3.player_image}" alt="${B3.player_name}">
				        </div>
				        <div class="squad-name">${B3.player_name}</div>
				        <div class="squad-team">${B3.player_team}</div>
				    </div>
				
				
				    <!-- 선발투수 -->
				    <div class="squad-player s-pitcher">
				        <div class="squad-position">선발투수</div>
				        <div class="squad-image">
				            <img src="${SP.player_image}" alt="${SP.player_name}">
				        </div>
				        <div class="squad-name">${SP.player_name}</div>
				        <div class="squad-team">${SP.player_team}</div>
				    </div>
				
				
				    <!-- 1루수 -->
				    <div class="squad-player s-first">
				        <div class="squad-position">1루수</div>
				        <div class="squad-image">
				            <img src="${B1.player_image}" alt="${B1.player_name}">
				        </div>
				        <div class="squad-name">${B1.player_name}</div>
				        <div class="squad-team">${B1.player_team}</div>
				    </div>
				
				
				    <!-- 포수 -->
				    <div class="squad-player s-catcher">
				        <div class="squad-position">포수</div>
				        <div class="squad-image">
				            <img src="${C.player_image}" alt="${C.player_name}">
				        </div>
				        <div class="squad-name">${C.player_name}</div>
				        <div class="squad-team">${C.player_team}</div>
				    </div>
				
				</div>

			</section>


			<!-- =========================
			     선수 명단
			========================= -->
			<section class="roster-area">

				<div class="area-title">선수 명단</div>

				<div class="table-scroll">
					<table class="roster-table">
						<thead>
							<tr>
								<th style="width: 40%">선수</th>
								<th style="width: 30%">포지션</th>
								<th style="width: 30%">팀</th>
							</tr>
						</thead>
						<tbody>

						    <c:forEach var="player" items="${myPlayerList}">
						
						        <tr>
						            <td class="name">${player.player_name}</td>
						            <td class="position">${player.player_position}</td>
						            <td class="team">${player.player_team}</td>
						        </tr>
						
						    </c:forEach>
						
						</tbody>
					</table>
				</div>

			</section>

		</div>


		<div class="action-area">
			<button type="button" class="btn btn-line">목록으로</button>
			<button type="button" class="btn btn-primary">팀 수정</button>
		</div>

	</div>
</body>
</html>