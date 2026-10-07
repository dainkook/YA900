<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YA900 - 마이페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>

/* =========================
   전체
========================= */
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background: linear-gradient(
        to bottom,
        #111936 0%,
        #111936 15%,
        #0b1026 25%,
        #171f46 35%,
        #252f67 48%,
        #71809f 65%,
        #aeb7ca 76%,
        #d5dae5 86%,
        #eef1f8 94%,
        #eef1f8 100%
    );
    color: #18213f;
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
    border-bottom: 1px solid #303b70;
    box-shadow: 0 3px 15px rgba(11, 16, 38, 0.18);
}

.logo {
    font-size: 30px;
    font-weight: bold;
    color: white;
    letter-spacing: 1px;
    cursor: pointer;
}

/* =========================
   메인 영역
========================= */
.mypage-container {
    width: 800px;
    margin: 60px auto;
}

/* =========================
   제목
========================= */
.mypage-title {
    color: white;
    text-align: center;
    margin-bottom: 30px;
}

.mypage-title h1 {
    margin: 0 0 10px 0;
    font-size: 30px;
}

.mypage-title p {
    margin: 0;
    color: #c7cee0;
    font-size: 14px;
}

/* =========================
   공통 카드
========================= */
.mypage-card {
    background: white;
    border: 1px solid #d6dceb;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(17, 25, 54, 0.08);
    margin-bottom: 25px;
}

/* =========================
   프로필
========================= */
.profile-card {
    padding: 30px;
    display: flex;
    align-items: center;
    gap: 35px;
}

.profile-image {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    background: #eef2f8;
    border: 1px solid #d6dceb;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    flex-shrink: 0;
}

.profile-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.profile-image span {
    color: #8b93a8;
    font-size: 13px;
}

.profile-info {
    flex: 1;
}

.profile-info h2 {
    margin: 0 0 20px 0;
    color: #111936;
}

.profile-row {
    display: flex;
    margin-bottom: 12px;
    font-size: 15px;
}

.profile-label {
    width: 100px;
    font-weight: bold;
    color: #68718a;
}

.profile-value {
    color: #18213f;
}

/* =========================
   정보 카드
========================= */
.info-card {
    padding: 30px;
}

.card-title {
    margin: 0 0 25px 0;
    color: #111936;
    font-size: 21px;
}

/* =========================
   정보 목록
========================= */
.info-list {
    border-top: 1px solid #d6dceb;
}

.info-row {
    height: 60px;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #d6dceb;
}

.info-label {
    width: 180px;
    padding-left: 15px;
    color: #68718a;
    font-weight: bold;
}

.info-value {
    color: #18213f;
}

/* =========================
   응원팀 / 포인트
========================= */
.user-setting {
    display: flex;
    gap: 25px;
}

.setting-card {
    flex: 1;
    padding: 30px;
    background: white;
    border: 1px solid #d6dceb;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(17, 25, 54, 0.08);
}

.setting-card h2 {
    margin: 0 0 20px 0;
    color: #111936;
    font-size: 20px;
}

.team-select {
    width: 100%;
    height: 42px;
    border: 1px solid #c7cee0;
    border-radius: 5px;
    padding: 0 10px;
    color: #18213f;
    background: white;
}

.point-box {
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #f5f7fc;
    border: 1px solid #d6dceb;
    border-radius: 8px;
}

.point {
    font-size: 28px;
    font-weight: bold;
    color: #476aaa;
}

.point-unit {
    margin-left: 5px;
    color: #68718a;
}

/* =========================
   버튼
========================= */
.button-area {
    display: flex;
    gap: 10px;
    margin-top: 30px;
}

.main-btn,
.update-btn {
    flex: 1;
    height: 45px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
    transition: 0.2s ease;
}

.main-btn {
    background: white;
    border: 1px solid #7180b1;
    color: #111936;
}

.main-btn:hover {
    background: #edf1fa;
}

.update-btn {
    background: #111936;
    border: 1px solid #111936;
    color: white;
}

.update-btn:hover {
    background: #476aaa;
    border-color: #476aaa;
}

/* =========================
   FOOTER
========================= */
.footer {
    width: 100%;
    height: 70px;
    background: #eef1f8;
    color: #838ec9;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 13px;
}

/* =========================
   예매 내역
========================= */

.reservation-item {
    border: 1px solid #d6dceb;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 30px;
    background: #f8f9fc;
}

.reservation-item:last-child {
    margin-bottom: 0;
}

.reservation-row {
    display: flex;
    align-items: center;
    min-height: 45px;
    border-bottom: 1px solid #e3e6ef;
}

.reservation-row:last-child {
    border-bottom: none;
}

.reservation-label {
    width: 120px;
    color: #68718a;
    font-weight: bold;
}

.reservation-value {
    color: #18213f;
}

.reservation-status {
    color: #476aaa;
    font-weight: bold;
}

.no-reservation {
    padding: 30px;
    text-align: center;
    color: #8b93a8;
}

.reservation-section {
    margin-top: 30px;
    margin-bottom: 30px;
}

.cancel-btn {
    margin-top: 15px;
    padding: 8px 16px;
    border: none;
    border-radius: 6px;
    background: #476aaa;
    color: white;
    font-weight: bold;
    cursor: pointer;
}

.cancel-btn:hover {
    opacity: 0.85;
}

</style>
</head>

<body>

<!-- =========================
     HEADER
========================= -->

<div class="header">

    <div class="logo"
         onclick="location.href='${pageContext.request.contextPath}/'">
        YA900
    </div>

</div>


<!-- =========================
     마이페이지
========================= -->

<div class="mypage-container">

    <div class="mypage-title">
        <h1>마이페이지</h1>
        <p>회원님의 정보를 확인할 수 있습니다.</p>
    </div>


    <!-- =========================
         프로필
    ========================= -->

    <div class="mypage-card profile-card">

        <div class="profile-image">

            <!-- 나중에 DB에서 이미지 경로를 받아서 사용 -->
            <img src="" alt="프로필 이미지">

        </div>

        <div class="profile-info">

            <h2>회원 정보</h2>

            <div class="profile-row">
                <div class="profile-label">아이디</div>
                <div class="profile-value">아이디</div>
            </div>

            <div class="profile-row">
                <div class="profile-label">이름</div>
                <div class="profile-value">이름</div>
            </div>

        </div>

    </div>


    <!-- =========================
         개인정보
    ========================= -->

    <div class="mypage-card info-card">

        <h2 class="card-title">개인정보</h2>

        <div class="info-list">

            <div class="info-row">
                <div class="info-label">아이디</div>
                <div class="info-value">아이디</div>
            </div>

            <div class="info-row">
                <div class="info-label">이름</div>
                <div class="info-value">이름</div>
            </div>

            <div class="info-row">
                <div class="info-label">휴대폰 번호</div>
                <div class="info-value">휴대폰 번호</div>
            </div>

            <div class="info-row">
                <div class="info-label">이메일</div>
                <div class="info-value">이메일</div>
            </div>

        </div>

    </div>


    <!-- =========================
         응원팀 / 포인트
    ========================= -->

    <div class="user-setting">

        <!-- 응원팀 -->

        <div class="setting-card">

            <h2>응원 팀</h2>

            <select class="team-select">

                <option>응원 팀 선택</option>
                <option>팀 이름</option>
                <option>팀 이름</option>
                <option>팀 이름</option>

            </select>

        </div>


        <!-- 포인트 -->

        <div class="setting-card">

            <h2>적립 포인트</h2>

            <div class="point-box">

                <span class="point">포인트</span>
                <span class="point-unit">P</span>

            </div>

        </div>

    </div>
    
    <!-- =========================
     예매 내역
	========================= -->
	
	<div class="mypage-card info-card reservation-section">
	    <h2 class="card-title">예매 내역</h2>
	
	    <c:choose>
	
	        <c:when test="${empty reservationList}">
	            <div class="no-reservation">
	                예매한 내역이 없습니다.
	            </div>
	        </c:when>
	
	        <c:otherwise>
	
	            <c:forEach var="reservation" items="${reservationList}">
				    <div class="reservation-item">
				
				        <!-- 경기 정보 -->
				        <div class="reservation-row">
				            <div class="reservation-label">경기</div>
				            <div class="reservation-value">
				                ${reservation.away_team} vs ${reservation.home_team}
				            </div>
				        </div>
				
				        <!-- 경기 날짜 -->
				        <div class="reservation-row">
				            <div class="reservation-label">경기일</div>
				            <div class="reservation-value">
				                <fmt:formatDate
				                    value="${reservation.start_date}"
				                    pattern="yyyy-MM-dd"/>
				            </div>
				        </div>
				
				        <!-- 경기장 -->
				        <div class="reservation-row">
				            <div class="reservation-label">경기장</div>
				            <div class="reservation-value">
				                ${reservation.location}
				            </div>
				        </div>
				
				        <!-- 좌석 -->
				        <div class="reservation-row">
				            <div class="reservation-label">좌석</div>
				            <div class="reservation-value">
				                ${reservation.seat_ids}번
				            </div>
				        </div>
				
				        <!-- 가격 -->
				        <div class="reservation-row">
				            <div class="reservation-label">가격</div>
				            <div class="reservation-value">
				                <fmt:formatNumber
				                    value="${reservation.total_price}"
				                    pattern="#,###"/>원
				            </div>
				        </div>
				
				        <!-- 예매 상태 -->
				        <div class="reservation-row">
				            <div class="reservation-label">예매상태</div>
				            <div class="reservation-value reservation-status">
				                ${reservation.status}
				            </div>
				        </div>
				
				        <!-- 예매 취소 -->
				        <c:if test="${reservation.status eq '예매완료'}">
				            <button type="button"
				                    class="cancel-btn"
				                    onclick="cancelReservation(${reservation.reservation_id})">
				                예매 취소
				            </button>
				        </c:if>
				    </div>
				</c:forEach>
	        </c:otherwise>
	    </c:choose>
	</div>


    <!-- =========================
         하단 버튼
    ========================= -->

    <div class="button-area">

        <button type="button"
                class="main-btn"
                onclick="location.href='${pageContext.request.contextPath}/'">
            메인 페이지
        </button>

        <button type="button"
                class="update-btn"
                onclick="location.href='${pageContext.request.contextPath}/mypage/update'">
            개인정보 수정
        </button>

    </div>

</div>


<!-- =========================
     FOOTER
========================= -->

<div class="footer">

    <span>YA900</span>

</div>

<script>
function cancelReservation(reservationId) {

    if (!confirm("정말 예매를 취소하시겠습니까?")) {
        return;
    }

    $.ajax({
        url: "${pageContext.request.contextPath}/booking/cancel",
        type: "POST",
        data: {
            reservation_id: reservationId
        },

        success: function(result) {

            if (result === "SUCCESS") {

                alert("예매가 취소되었습니다.");

                location.reload();

            } else if (result === "PAYMENT_ID_NOT_FOUND") {

                alert("결제 정보를 찾을 수 없습니다.");

            } else {

                alert("환불 처리에 실패했습니다.");
            }
        },

        error: function(xhr) {

            alert("환불 처리 중 오류가 발생했습니다.");
        }
    });
}
</script>
</body>
</html>