<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YA900 승부예측</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background: linear-gradient(
		to bottom,
		#111936 0%,
		#111936 12%,
		#171f46 22%,
		#252f67 32%,
		#71809f 43%,
		#aeb7ca 55%,
		#d5dae5 70%,
		#eef1f8 85%,
		#eef1f8 100%
	);
	font-family: Arial, "Malgun Gothic", sans-serif;
	color: #222;
	min-height: 100vh;
}

/* =========================
   HEADER
========================= */

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
	cursor: pointer;
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

.menu-item > a {
	font-size: 18px;
	font-weight: bold;
	text-decoration: none;
	color: #f7f8ff;
	padding: 10px 5px;
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
	gap: 10px;
	white-space: nowrap;
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

/* =========================
   본문
========================= */

.container {
	width: 100%;
	max-width: 1310px;
	margin: 40px auto 60px;
	padding: 0 20px;
}

/* =========================
   제목
========================= */

.title {
	height: 70px;
	background: #f5f6f8;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	display: flex;
	align-items: center;
	padding: 0 25px;
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 20px;
	box-shadow: 0 4px 12px rgba(20, 30, 60, 0.08);
}

/* =========================
   요약 카드
========================= */

.summary {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
	margin-bottom: 20px;
}

.summary-card {
	background: #fff;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	padding: 25px 20px;
	text-align: center;
	font-size: 14px;
	box-shadow: 0 4px 12px rgba(20, 30, 60, 0.07);
}

.summary-card strong {
	display: block;
	margin-top: 12px;
	min-height: 25px;
	font-size: 22px;
	color: #476aaa;
}

/* =========================
   공통 박스
========================= */

.box {
	background: #fff;
	border: 1px solid #e1e4e8;
	border-radius: 10px;
	padding: 25px;
	margin-bottom: 20px;
	min-width: 0;
	box-shadow: 0 4px 12px rgba(20, 30, 60, 0.07);
}

.area-title {
	text-align: left;
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #222;
}

/* =========================
   경기 카드
========================= */

.match-card {
    position: relative;
    overflow: hidden;
    border: 1px solid #e1e4e8;
    border-radius: 8px;
    padding: 18px;
    margin-bottom: 12px;
    background: #fafbfc;
    transition: 0.2s ease;
}


/* 예측 완료 카드 전체 도장 */
.match-card.completed::after {
    content: "예측 완료";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) rotate(-12deg);
    width: 85%;
    padding: 16px 0;
    border: 5px solid rgba(71, 106, 170, 0.65);
    border-radius: 8px;
    color: rgba(71, 106, 170, 0.78);
    background: rgba(238, 242, 250, 0.35);
    font-size: clamp(28px, 4vw, 48px);
    font-weight: 900;
    letter-spacing: 5px;
    text-align: center;
    text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.5);
    pointer-events: none;
    z-index: 5;
}


.match-card:last-child {
	margin-bottom: 0;
}

.match-card:hover {
	border-color: #b8c4dc;
	box-shadow: 0 3px 8px rgba(20, 30, 60, 0.06);
}

.match-info {
    width: 100%;
    padding: 20px 30px;
    box-sizing: border-box;
}

.match-time {
    margin-bottom: 28px;
    text-align: center;
    font-size: 15px;
    color: #555;
    line-height: 1.6;
}

.match-teams {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    gap: 20px;
}

.match-team {
    display: flex;
    flex: 1;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 12px;
    min-width: 0;
    font-weight: bold;
    font-size: 16px;
}

.match-pick button:disabled {
    background: #e5e8ef;
    border-color: #d3d8e2;
    color: #888;
    cursor: not-allowed;
}

.team-logo {
    width: 75px;
    height: 75px;
    object-fit: contain;
}

.match-vs {
    flex-shrink: 0;
    padding: 0 15px;
    font-size: 20px;
    font-weight: bold;
    color: #476aaa;
}

@media (max-width: 600px) {
    .match-info {
        padding: 16px 10px;
    }

    .match-teams {
        gap: 8px;
    }

    .match-team {
        font-size: 14px;
    }

    .team-logo {
        width: 55px;
        height: 55px;
    }

    .match-vs {
        padding: 0 5px;
        font-size: 16px;
    }
}
/* =========================
   승부 선택 버튼
========================= */

.match-pick {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 8px;
}

.match-pick button {
	height: 42px;
	border: 1px solid #d3d8e2;
	border-radius: 5px;
	background: white;
	color: #333;
	font-size: 13px;
	cursor: pointer;
	transition: 0.2s ease;
}

.match-pick button:hover {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

.match-pick button.active {
	background: #476aaa;
	border-color: #476aaa;
	color: white;
}

/* =========================
   테이블
========================= */

.table-scroll {
	overflow-x: auto;
}

table {
	width: 100%;
	min-width: 520px;
	border-collapse: collapse;
	font-size: 13px;
	text-align: center;
}

th {
	padding: 13px 8px;
	background: #f5f6f8;
	border-top: 1px solid #dfe2e7;
	border-bottom: 1px solid #c8cdd5;
	font-weight: bold;
	color: #333;
}

td {
	height: 48px;
	border-bottom: 1px solid #e5e7eb;
	color: #444;
}

tbody tr:hover {
	background: #f8f9fb;
}

/* =========================
   내 예측 테이블
========================= */

.my-table tbody tr:first-child td {
	border-top: 1px solid #e1e4e8;
}

.my-table td {
	height: 52px;
	border-bottom: 1px solid #e1e4e8;
}

/* =========================
   제출 버튼
========================= */

.save-area {
	text-align: center;
	margin-top: 20px;
}

.save-btn {
	width: 130px;
	height: 42px;
	border: 1px solid #476aaa;
	border-radius: 5px;
	background: #476aaa;
	color: white;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.2s ease;
}

.save-btn:hover {
	background: #3d5e97;
	border-color: #3d5e97;
}

/* 예측 내역 스크롤 */
.prediction-history-scroll {
    height: 305px;
    overflow-y: auto;
    overflow-x: auto;
}

/* 테이블 제목 고정 */
.prediction-history-scroll thead th {
    position: sticky;
    top: 0;
    z-index: 2;
    background: #f5f6f8;
}

/* 스크롤바 디자인 */
.prediction-history-scroll::-webkit-scrollbar {
    width: 7px;
    height: 7px;
}

.prediction-history-scroll::-webkit-scrollbar-thumb {
    background: #b8c4dc;
    border-radius: 10px;
}

.prediction-history-scroll::-webkit-scrollbar-track {
    background: #f5f6f8;
}
/* =========================
   푸터
========================= */

.footer {
	border-top: 1px solid rgba(255, 255, 255, 0.4);
	margin-top: 70px;
	padding: 30px 16px;
	text-align: center;
	font-size: 10px;
	color: #555;
}



/* =========================
   반응형
========================= */

@media (max-width: 900px) {

	.header {
		padding: 0 25px;
	}

	.logo {
		margin-right: 30px;
	}

	.main-menu {
		gap: 20px;
	}

	.menu-item > a {
		font-size: 16px;
	}

	.container {
		max-width: 100%;
		margin-top: 30px;
	}

	.summary {
		grid-template-columns: 1fr;
	}

	.match-info {
		grid-template-columns: 1fr 1fr 50px 1fr;
	}

}

@media (max-width: 600px) {

	.header {
		height: auto;
		min-height: 100px;
		padding: 20px;
		flex-wrap: wrap;
	}

	.logo {
		margin-right: 20px;
	}

	.main-menu {
		order: 3;
		width: 100%;
		justify-content: center;
		gap: 15px;
		margin-top: 15px;
	}

	.menu-item > a {
		font-size: 14px;
	}

	.member-menu {
		margin-left: auto;
	}

	.container {
		padding: 0 12px;
		margin-top: 20px;
	}

	.title {
		height: 60px;
		font-size: 19px;
	}

	.box {
		padding: 18px;
	}

	.match-info {
		grid-template-columns: 1fr;
		gap: 8px;
	}

	.match-vs {
		display: none;
	}

	.match-pick {
		grid-template-columns: 1fr 1fr 1fr;
	}

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
					<a href="#">예매</a> 
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
					<a href="#">예매</a> 
					<a href="#">경기일정</a> 
					<a href="#">팀순위</a> 
					<a href="#">선수순위</a> 
					<a href="#">게시판</a>
				</div>
			</div>

			<!-- 미니게임 -->
			<div class="menu-item">
				<a href="#">미니게임</a>

				<div class="sub-menu">
					<a href="${pageContext.request.contextPath}/quiz">상식 퀴즈</a> 
					<a href="${pageContext.request.contextPath}/myteam">나만의 팀</a> 
					<a href="${pageContext.request.contextPath}/prediction">승부예측</a> 
					<a href="#">게임 랭킹</a>
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
	<div class="container">

		<div class="title">승부예측</div>

		<div class="summary">
			<div class="summary-card">
				보유 포인트 <strong></strong>
			</div>
			<div class="summary-card">
				예측 참여 <strong></strong>
			</div>
			<div class="summary-card">
				적중률 <strong></strong>
			</div>
		</div>

		
			<section class="box">
			    <div class="area-title">오늘의 경기</div>
			
			    <c:choose>
			        <c:when test="${not empty predictionList}">
			            <c:forEach var="game" items="${predictionList}">
			                <div class="match-card" 
					                data-home-team="${game.home_team}"
		     						data-away-team="${game.away_team}"
		     						data-game-date="<fmt:formatDate value='${game.gameStartDate}' pattern='MM월 dd일 HH:mm'/>">
			
			                    <div class="match-info">
			                        <div class="match-time">
			                            <fmt:formatDate value="${game.gameStartDate}" pattern="MM월 dd일 HH:mm" />
			                        </div>
			
			                        <div class="match-teams">
									       
									        <div class="match-team">
									            <img src="${game.home_logo}" alt="${game.home_team} 로고" class="team-logo" onerror="this.style.display='none'">
									            <span>${game.home_team}</span>
									        </div>
									
									        <div class="match-vs">VS</div>
									 
									        <div class="match-team">
									            <img src="${game.away_logo}" alt="${game.away_team} 로고" class="team-logo"  onerror="this.style.display='none'">
									            <span>${game.away_team}</span>
									        </div>
									    </div>
									</div>
			
			                    <div class="match-pick">
			                        <button type="button"
			                                data-prediction-id="${game.prediction_seq}"
			                                data-choice="1">
			                            홈팀 승
			                        </button>
			
			                        <button type="button"
			                                data-prediction-id="${game.prediction_seq}"
			                                data-choice="0">
			                            무승부
			                        </button>
			
			                        <button type="button"
			                                data-prediction-id="${game.prediction_seq}"
			                                data-choice="2">
			                            원정팀 승
			                        </button>
			                    </div>
			
			                </div>
			            </c:forEach>
			        </c:when>
			
			        <c:otherwise>
			            <p>예측 가능한 경기가 없습니다.</p>
			        </c:otherwise>
			    </c:choose>
			</section>


		<section class="box" id="my-prediction=box">
			<div class="area-title">내 예측</div>

			<div class="table-scroll">
				<table class="my-table">
				    <thead>
				        <tr>
				            <th style="width: 20%">날짜</th>
				            <th style="width: 35%">경기</th>
				            <th style="width: 25%">예측</th>
				            <th style="width: 20%">취소</th>
				        </tr>
				    </thead>
				    <tbody id="my-prediction-list">
				        <tr class="empty-row">
				            <td colspan="4">선택한 예측이 없습니다.</td>
				        </tr>
				    </tbody>
				</table>
			</div>

			<div class="save-area">
				<button type="button" class="save-btn">예측 제출</button>
			</div>
		</section>

		
			<section class="box">
			    <div class="area-title">예측 내역</div>
			
			    <div class="table-scroll prediction-history-scroll">
    				<table class="my-table">
			            <thead>
			                <tr>
			                    <th>날짜</th>
			                    <th>경기</th>
			                    <th>예측</th>
			                    <th>결과</th>
			                    <th>포인트</th>
			                </tr>
			            </thead>
			
			            <tbody>
			                <c:choose>
			                    <c:when test="${not empty myPredictionList}">
			                        <c:forEach var="item" items="${myPredictionList}">
			                            <tr>
			                                <td>
			                                    <fmt:formatDate
			                                        value="${item.START_DATE}"
			                                        pattern="MM월 dd일 HH:mm" />
			                                </td>
			
			                                <td>${item.HOME_TEAM} vs ${item.AWAY_TEAM}</td>
			
			                                <td>
			                                    <c:choose>
			                                        <c:when test="${item.PREDICTED_RESULT == 1}">홈팀 승</c:when>
			                                        <c:when test="${item.PREDICTED_RESULT == 0}">무승부</c:when>
			                                        <c:when test="${item.PREDICTED_RESULT == 2}">원정팀 승</c:when>
			                                        <c:otherwise>-</c:otherwise>
			                                    </c:choose>
			                                </td>
			
			                                <td>
			                                    <c:choose>
			                                        <c:when test="${item.IS_CORRECT == 1}">적중</c:when>
			                                        <c:when test="${item.IS_CORRECT == 0}">미확정</c:when>
			                                        <c:otherwise>-</c:otherwise>
			                                    </c:choose>
			                                </td>
			
			                                <td>
			                                    <c:choose>
			                                        <c:when test="${item.IS_CORRECT == 1}">적중 포인트</c:when>
			                                        <c:otherwise>0</c:otherwise>
			                                    </c:choose>
			                                </td>
			                            </tr>
			                        </c:forEach>
			                    </c:when>
			
			                    <c:otherwise>
			                        <tr>
			                            <td colspan="5">아직 제출한 예측이 없습니다.</td>
			                        </tr>
			                    </c:otherwise>
			                </c:choose>
			            </tbody>
			        </table>
			    </div>
			</section>

	</div>

	<footer class="footer"> YA900 </footer>

	<script>
	$(function() {
		const myPredictions = {};

		const submittedPredictionIds = [
		    <c:forEach var="item" items="${myPredictionList}">
		        ${item.PREDICTION_ID},
		    </c:forEach>
		];

		const choiceNames = {
		    "1": "홈팀 승",
		    "0": "무승부",
		    "2": "원정팀 승"
		};

		// 이미 예측을 제출한 경기 처리
		$(".match-card").each(function() {
		    const card = $(this);

		    const predictionId = Number(
		        card.find(".match-pick button").first().attr("data-prediction-id")
		    );

		    if (submittedPredictionIds.includes(predictionId)) {
		        card.addClass("completed");
		        card.find(".match-pick button").prop("disabled", true);
		    }
		});

		// 경기별 예측 선택
		$(document).on("click", ".match-pick button", function() {
		    const button = $(this);
		    const card = button.closest(".match-card");

		    const id = String(button.attr("data-prediction-id"));
		    const choice = String(button.attr("data-choice"));

		    if (submittedPredictionIds.includes(Number(id))) {
		        return;
		    }

		    myPredictions[id] = {
		        date: card.attr("data-game-date"),
		        home: card.attr("data-home-team"),
		        away: card.attr("data-away-team"),
		        choice: choice
		    };

		    card.find(".match-pick button").removeClass("active");
		    button.addClass("active");

		    renderMyPredictions();
		});

		// 내 예측 테이블 출력
		function renderMyPredictions() {
		    const tbody = $("#my-prediction-list");
		    tbody.empty();

		    const ids = Object.keys(myPredictions);

		    if (ids.length === 0) {
		        tbody.append(
		            '<tr class="empty-row">' +
		            '<td colspan="4">선택한 예측이 없습니다.</td></tr>'
		        );
		        return;
		    }

		    ids.forEach(function(id) {
		        const item = myPredictions[id];
		        const row = $("<tr>");

		        $("<td>").text(item.date).appendTo(row);
		        $("<td>").text(item.home + " vs " + item.away).appendTo(row);
		        $("<td>").text(choiceNames[item.choice]).appendTo(row);

		        const cancelButton = $("<button>", {
		            type: "button",
		            text: "취소"
		        }).css({
		            padding: "5px 10px",
		            border: "1px solid #d3d8e2",
		            borderRadius: "5px",
		            background: "#fff",
		            cursor: "pointer"
		        });

		        cancelButton.on("click", function() {
		            delete myPredictions[id];
		            cardButtons(id).removeClass("active");
		            renderMyPredictions();
		        });

		        $("<td>").append(cancelButton).appendTo(row);
		        tbody.append(row);
		    });
		}

		// 해당 경기의 선택 버튼 가져오기
		function cardButtons(id) {
		    return $('.match-pick button[data-prediction-id="' + id + '"]');
		}

		// 예측 저장
		$(".save-btn").on("click", function() {
		    const ids = Object.keys(myPredictions);

		    if (ids.length === 0) {
		        alert("예측할 경기를 선택해 주세요.");
		        return;
		    }

		    const form = $("<form>", {
		        method: "post",
		        action: "${pageContext.request.contextPath}/prediction/submit"
		    });

		    ids.forEach(function(id) {
		        $("<input>", {
		            type: "hidden",
		            name: "predictionIds",
		            value: id
		        }).appendTo(form);

		        $("<input>", {
		            type: "hidden",
		            name: "choices",
		            value: myPredictions[id].choice
		        }).appendTo(form);
		    });

		    $("body").append(form);
		    form.submit();
		});

		});
	</script>

</body>
</html>