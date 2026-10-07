<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>YA900 마이페이지</title>


<style>

/* =========================================================
   전체
========================================================= */

* {
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    margin: 0;

    font-family: Arial, sans-serif;

    color: #18213f;

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

    min-height: 100vh;
}


/* =========================================================
   HEADER
========================================================= */

.header {
    width: 100%;
    height: 100px;

    background: linear-gradient(
        135deg,
        #0b1026,
        #171f46
    );

    color: white;

    display: flex;
    align-items: center;

    padding: 0 50px;

    position: sticky;
    top: 0;

    z-index: 1000;

    border-bottom: 1px solid #303b70;

    box-shadow:
        0 3px 15px rgba(11, 16, 38, 0.18);
}


.logo {
    font-size: 30px;

    font-weight: bold;

    color: white;

    letter-spacing: 1px;

    cursor: pointer;
}


/* =========================================================
   MAIN
========================================================= */

.mypage-container {
    width: 100%;

    min-height: calc(100vh - 170px);

    display: flex;

    justify-content: center;

    align-items: flex-start;

    padding: 60px 20px;
}


/* =========================================================
   마이페이지 카드
========================================================= */

.mypage-box {
    width: 900px;

    background: #ffffff;

    border: 1px solid #d6dceb;

    border-radius: 12px;

    padding: 40px;

    box-shadow:
        0 5px 18px rgba(17, 25, 54, 0.08);
}


/* =========================================================
   제목
========================================================= */

.mypage-title {
    margin: 0 0 35px;

    text-align: center;

    color: #111936;

    font-size: 26px;

    font-weight: 700;
}


/* =========================================================
   PROFILE
========================================================= */

.profile-area {
    display: flex;

    align-items: flex-start;

    margin-bottom: 35px;

    padding-bottom: 30px;

    border-bottom: 1px solid #d6dceb;
}


/* =========================================================
   프로필 이미지 영역
========================================================= */

.profile-image-area {
    display: flex;

    flex-direction: column;

    align-items: center;

    width: 220px;

    flex-shrink: 0;

    margin-right: 30px;
}


/* =========================================================
   프로필 이미지
========================================================= */

.profile-image {
    width: 220px;

    height: 220px;

    margin-right: 0;

    object-fit: cover;

    border-radius: 10px;

    border: 1px solid #d6dceb;

    background: #eef2f8;

    display: block;
}


/* =========================================================
   프로필 정보
========================================================= */

.profile-info {
    display: flex;

    flex-direction: column;

    gap: 10px;

    padding-top: 10px;
}


.profile-id {
    font-size: 21px;

    font-weight: bold;

    color: #111936;
}


.profile-name {
    font-size: 15px;

    color: #68718a;
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

.reservation-section {
    margin-top: 40px;
    padding-top: 30px;
    border-top: 1px solid #d6dceb;
}

.reservation-section .section-title {
    margin-bottom: 20px;
}

/* =========================================================
   프로필 사진 변경 영역
========================================================= */


.profile-change-area {
    width: 220px;

    margin-top: 12px;

    text-align: center;
}


/* =========================================================
   프로필 사진 변경 버튼
========================================================= */

.profile-change-btn {
    width: 220px;

    height: 42px;

    border: 1px solid #c7cee0;

    border-radius: 5px;

    background: #edf1fa;

    color: #111936;

    font-size: 13px;

    cursor: pointer;

    transition: 0.2s ease;
}


.profile-change-btn:hover {
    background: #dce4f5;

    border-color: #476aaa;
}


/* =========================================================
   개인정보 영역
========================================================= */

.info-section {
    margin-bottom: 30px;
}


.section-title {
    margin-bottom: 18px;

    color: #111936;

    font-size: 20px;

    font-weight: 700;
}


/* =========================================================
   개인정보 한 줄
========================================================= */

.info-row {
    display: flex;

    min-height: 55px;

    border-bottom: 1px solid #d6dceb;
}


.info-row:first-of-type {
    border-top: 1px solid #d6dceb;
}


.info-title {
    width: 150px;

    display: flex;

    align-items: center;

    padding-left: 15px;

    background: #f5f7fc;

    color: #36405d;

    font-size: 14px;

    font-weight: 600;

    flex-shrink: 0;
}


.info-content {
    flex: 1;

    display: flex;

    align-items: center;

    padding: 8px 15px;

    min-width: 0;
}


/* =========================================================
   읽기 모드
========================================================= */
  
  .view-mode {
    display: block;
    width: 100%;
    line-height: 1.8;
    color: #36405d;
    font-size: 14px;
}


/* =========================================================
   수정 모드
========================================================= */

.edit-mode {
    display: none;
}


/* =========================================================
   INPUT
========================================================= */

.edit-input {
    width: 100%;

    height: 42px;

    padding: 0 10px;

    border: 1px solid #c7cee0;

    border-radius: 5px;

    background: white;

    color: #18213f;

    font-size: 14px;

    transition:
        border-color 0.2s ease,
        box-shadow 0.2s ease;
}


.edit-input:focus {
    outline: none;

    border-color: #476aaa;

    box-shadow:
        0 0 0 2px rgba(71, 106, 170, 0.12);
}


/* =========================================================
   응원팀 select
========================================================= */

.team-select {
    width: 100%;

    height: 42px;

    padding: 0 10px;

    border: 1px solid #c7cee0;

    border-radius: 5px;

    background: white;

    color: #18213f;

    font-size: 14px;

    cursor: pointer;
}


.team-select:focus {
    outline: none;

    border-color: #476aaa;

    box-shadow:
        0 0 0 2px rgba(71, 106, 170, 0.12);
}


/* =========================================================
   주소
========================================================= */

.address-edit {
    width: 100%;
}


.address-box {
    display: flex;

    width: 100%;

    gap: 8px;

    margin-bottom: 8px;
}


.address-box .edit-input {
    flex: 1;
}


.zipcode-btn {
    width: 110px;

    height: 42px;

    flex-shrink: 0;

    border: 1px solid #c7cee0;

    border-radius: 5px;

    background: #edf1fa;

    color: #111936;

    cursor: pointer;

    font-size: 13px;

    transition: 0.2s ease;
}


.zipcode-btn:hover {
    background: #dce4f5;

    border-color: #476aaa;
}


.address-input {
    width: 100%;

    height: 42px;

    padding: 0 10px;

    margin-bottom: 8px;

    border: 1px solid #c7cee0;

    border-radius: 5px;

    background: white;

    color: #18213f;

    font-size: 14px;

    transition:
        border-color 0.2s ease,
        box-shadow 0.2s ease;
}


.address-input:focus {
    outline: none;

    border-color: #476aaa;

    box-shadow:
        0 0 0 2px rgba(71, 106, 170, 0.12);
}


/* =========================================================
   팀 / 포인트
========================================================= */

.team-point-area {
    margin-top: 30px;
}


.simple-row {
    display: flex;

    min-height: 55px;

    border-bottom: 1px solid #d6dceb;
}


.simple-row:first-child {
    border-top: 1px solid #d6dceb;
}


.simple-title {
    width: 150px;

    display: flex;

    align-items: center;

    padding-left: 15px;

    background: #f5f7fc;

    color: #36405d;

    font-size: 14px;

    font-weight: 600;

    flex-shrink: 0;
}


.simple-content {
    flex: 1;

    display: flex;

    align-items: center;

    padding-left: 15px;

    color: #36405d;

    font-size: 14px;
}


/* =========================================================
   버튼 영역
========================================================= */

.button-area {
    display: flex;

    justify-content: center;

    gap: 10px;

    margin-top: 35px;
}


.main-btn,
.update-btn {
    width: 150px;

    height: 45px;

    border-radius: 5px;

    cursor: pointer;

    font-size: 14px;

    transition: 0.2s ease;
}


.main-btn {
    background: white;

    color: #111936;

    border: 1px solid #c7cee0;
}


.main-btn:hover {
    background: #edf1fa;

    border-color: #aeb8d2;
}


.update-btn {
    background: #111936;

    color: white;

    border: 1px solid #111936;
}


.update-btn:hover {
    background: #476aaa;

    border-color: #476aaa;
}


/* =========================================================
   FOOTER
========================================================= */

.footer {
    width: 100%;

    height: 70px;

    background: #eef1f8;

    color: #838ec9;

    display: flex;

    justify-content: center;

    align-items: center;

    font-size: 13px;

    border: none;
}


.footer a {
    margin: 0 4px;

    text-decoration: none;

    color: #838ec9;
}


.footer a:hover {
    color: #a9b1db;
}


/* =========================================================
   스크롤바
========================================================= */

::-webkit-scrollbar {
    width: 8px;
}


::-webkit-scrollbar-track {
    background: #e6eaf3;
}


::-webkit-scrollbar-thumb {
    background: #476aaa;

    border-radius: 10px;
}


::-webkit-scrollbar-thumb:hover {
    background: #7189c2;
}


/* =========================================================
   반응형
========================================================= */

@media (max-width: 768px) {

    .header {
        height: 80px;

        padding: 0 20px;
    }


    .logo {
        font-size: 25px;
    }


    .mypage-container {
        padding: 30px 15px;
    }


    .mypage-box {
        width: 100%;

        padding: 25px 20px;
    }


    /* 프로필 영역 */

    .profile-area {
        flex-direction: column;

        align-items: center;
    }


    .profile-image-area {
        width: 180px;

        margin-right: 0;

        margin-bottom: 20px;
    }


    .profile-image {
        width: 180px;

        height: 180px;

        margin-right: 0;
    }


    .profile-change-area {
        width: 180px;
    }


    .profile-change-btn {
        width: 180px;
    }


    .profile-info {
        align-items: center;

        text-align: center;
    }


    .info-title,
    .simple-title {
        width: 110px;
    }


    .button-area {
        flex-wrap: wrap;
    }


    .main-btn,
    .update-btn {
        width: 130px;
    }

}

</style>
</head>


<body>


<!-- =========================================================
     HEADER
========================================================= -->

<header class="header">

    <div
        class="logo"
        onclick="location.href='${pageContext.request.contextPath}/'">

        YA900

    </div>

</header>



<!-- =========================================================
     MAIN
========================================================= -->

<main class="mypage-container">


    <div class="mypage-box">


        <!-- 제목 -->

        <h2 class="mypage-title">

            마이페이지

        </h2>



        <!-- =================================================
             프로필
        ================================================== -->

        <div class="profile-area">

            <div class="profile-image-area">

                <img
                    class="profile-image"
                    src="${pageContext.request.contextPath}/upload/${user.profile_img}"
                    alt="프로필 이미지">


                <div class="edit-mode profile-change-area">

                    <input
                        type="file"
                        id="profileFile"
                        accept="image/*"
                        style="display: none;">


                    <button
                        type="button"
                        class="profile-change-btn"
                        onclick="document.getElementById('profileFile').click();">

                        프로필 사진 변경

                    </button>

                </div>

            </div>

        </div>



        <!-- =================================================
             개인정보
        ================================================== -->

        <div class="info-section">


            <div class="section-title">

                개인정보

            </div>



            <!-- 아이디 -->

            <div class="info-row">


                <div class="info-title">

                    아이디

                </div>


                <div class="info-content">

                    <div class="view-mode fixed-view">

                        ${user.id}

                    </div>

                </div>


            </div>



            <!-- 이름 -->

            <div class="info-row">


                <div class="info-title">

                    이름

                </div>


                <div class="info-content">

                    <div class="view-mode fixed-view">

                        ${user.name}

                    </div>

                </div>


            </div>



            <!-- 전화번호 -->

            <div class="info-row">


                <div class="info-title">

                    휴대전화번호

                </div>


                <div class="info-content">


                    <!-- 읽기 -->

                    <div class="view-mode">

                        ${user.phone}

                    </div>


                    <!-- 수정 -->

                    <input
                        type="text"
                        class="edit-input edit-mode"
                        id="phone"
                        value="${user.phone}"
                        placeholder="휴대전화번호 입력">


                </div>



            </div>



            <!-- 이메일 -->

            <div class="info-row">


                <div class="info-title">

                    이메일

                </div>


                <div class="info-content">


                    <!-- 읽기 -->

                    <div class="view-mode">

                        ${user.email}

                    </div>


                    <!-- 수정 -->

                    <input
                        type="text"
                        class="edit-input edit-mode"
                        id="email"
                        value="${user.email}"
                        placeholder="이메일 입력">


                </div>



            </div>



            <!-- 주소 -->

            <div class="info-row">


                <div class="info-title">

                    주소

                </div>


                <div class="info-content">


                    <!-- 읽기 모드 -->

                    <div class="view-mode">

                        ${user.zipcode}

                        <br>

                        ${user.address1}

                        <br>

                        ${user.address2}

                    </div>



                    <!-- 수정 모드 -->

                    <div
                        class="edit-mode address-edit">


                        <!-- 우편번호 -->

                        <div class="address-box">


                            <input
                                type="text"
                                class="edit-input"
                                id="zipcode"
                                value="${user.zipcode}"
                                placeholder="우편번호"
                                readonly>


                            <button
                                type="button"
                                class="zipcode-btn"
                                id="zipcodeBtn">

                                우편번호 찾기

                            </button>

                        </div>



                        <!-- 기본주소 -->

                        <input
                            type="text"
                            class="address-input"
                            id="address1"
                            value="${user.address1}"
                            placeholder="주소"
                            readonly>



                        <!-- 상세주소 -->

                        <input
                            type="text"
                            class="address-input"
                            id="address2"
                            value="${user.address2}"
                            placeholder="상세주소">


                    </div>


                </div>


            </div>



            <!-- =================================================
                 응원 팀
            ================================================== -->

            <div class="info-row">


                <div class="info-title">

                    응원 팀

                </div>


                <div class="info-content">


                    <!-- 읽기 모드 -->

                    <div class="view-mode">

                        ${user.team}

                    </div>



                    <!-- 수정 모드 -->

                    <select
                        class="team-select edit-mode"
                        name="team"
                        id="team"
                        required>

                        <option value="">응원 팀을 선택하세요</option>

                        <option value="KT">KT</option>
                        <option value="삼성">삼성</option>
                        <option value="한화">한화</option>
                        <option value="KIA">KIA</option>
                        <option value="롯데">롯데</option>
                        <option value="NC">NC</option>
                        <option value="LG">LG</option>
                        <option value="두산">두산</option>
                        <option value="SSG">SSG</option>
                        <option value="키움">키움</option>

                    </select>


                </div>


            </div>


        </div>



        <!-- =================================================
             포인트
        ================================================== -->

        <div class="team-point-area">


            <div class="simple-row">


                <div class="simple-title">

                    포인트

                </div>


                <div class="simple-content">

                    ${user.point}

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


        <!-- =================================================
             버튼
        ================================================== -->

        <div class="button-area">


            <button
                type="button"
                class="main-btn"
                id="mainBtn">

                메인 페이지

            </button>



            <button
                type="button"
                class="update-btn"
                id="editBtn"
                onclick="startEdit()">

                개인정보 수정

            </button>



            <button
                type="button"
                class="update-btn edit-mode"
                id="saveBtn"
                onclick="updateUser()">

                저장

            </button>



            <button
                type="button"
                class="main-btn edit-mode"
                id="cancelBtn"
                onclick="cancelEdit()">

                취소

            </button>


        </div>


    </div>


</main>



<!-- =========================================================
     FOOTER
========================================================= -->

<footer class="footer">

    <a href="#">개인정보처리방침</a>

    |

    <a href="#">전체 서비스</a>

    |

    <a href="#">문제 신고</a>

    |

    <a href="#">고객센터</a>

    |

    <a href="${pageContext.request.contextPath}/admin">

        관리자

    </a>

</footer>



<script>


/* =========================================================
   메인 페이지
========================================================= */

$("#mainBtn").on("click", function() {

    location.href =
        "${pageContext.request.contextPath}/";

});



/* =========================================================
   수정 모드
========================================================= */

function startEdit() {


    /*
     * 읽기 모드 숨김
     */

    $(".view-mode:not(.fixed-view)").hide();



    /*
     * 수정 모드 표시
     */

    $(".edit-mode").show();



    /*
     * 수정 버튼 숨김
     */

    $("#editBtn").hide();

}



/* =========================================================
   수정 취소
========================================================= */

function cancelEdit() {


    /*
     * 수정 모드 숨김
     */

    $(".edit-mode").hide();



    /*
     * 읽기 모드 표시
     */

    $(".view-mode").show();



    /*
     * 수정 버튼 다시 표시
     */

    $("#editBtn").show();



    /*
     * 기존 DB 값으로 복구
     */

    $("#phone").val("${user.phone}");

    $("#email").val("${user.email}");

    $("#zipcode").val("${user.zipcode}");

    $("#address1").val("${user.address1}");

    $("#address2").val("${user.address2}");

    $("#team").val("${user.team}");

}



/* =========================================================
   다음 주소 API
========================================================= */

$("#zipcodeBtn").on("click", function() {


    new daum.Postcode({

        oncomplete: function(data) {


            /*
             * 우편번호
             */

            $("#zipcode").val(data.zonecode);



            /*
             * 도로명 주소
             */

            $("#address1").val(data.roadAddress);



            /*
             * 상세주소
             */

            $("#address2").focus();

        }

    }).open();

});



/* =========================================================
   개인정보 수정
========================================================= */

function updateUser() {


    /* =====================================================
       입력값
    ===================================================== */

    let phone =
        $("#phone").val().trim();


    let email =
        $("#email").val().trim();


    let zipcode =
        $("#zipcode").val().trim();


    let address1 =
        $("#address1").val().trim();


    let address2 =
        $("#address2").val().trim();


    let team =
        $("#team").val();



    /* =====================================================
       정규식
    ===================================================== */

    let phoneRegex =
        /^01[016789]-?\d{3,4}-?\d{4}$/;


    let emailRegex =
        /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;



    /* =====================================================
       전화번호 검사
    ===================================================== */

    if (phone === "") {

        alert(
            "휴대전화번호를 입력해주세요."
        );

        $("#phone").focus();

        return;

    }


    if (!phoneRegex.test(콜)) {

        alert(
            "전화번호를 올바르게 입력해주세요."
        );

        $("#phone").focus();

        return;

    }



    /* =====================================================
       이메일 검사
    ===================================================== */

    if (email === "") {

        alert(
            "이메일을 입력해주세요."
        );

        $("#email").focus();

        return;

    }


    if (!emailRegex.test(email)) {

        alert(
            "이메일 형식이 올바르지 않습니다."
        );

        $("#email").focus();

        return;

    }



    /* =====================================================
       우편번호
    ===================================================== */

    if (zipcode === "") {

        alert(
            "우편번호를 입력해주세요."
        );

        return;

    }



    /* =====================================================
       기본주소
    ===================================================== */

    if (address1 === "") {

        alert(
            "주소를 입력해주세요."
        );

        return;

    }



    /* =====================================================
       상세주소
    ===================================================== */

    if (address2 === "") {

        alert(
            "상세주소를 입력해주세요."
        );

        $("#address2").focus();

        return;

    }



    /* =====================================================
       응원 팀
    ===================================================== */

    if (team === null || team === "") {

        alert(
            "응원 팀을 선택해주세요."
        );

        $("#team").focus();

        return;

    }



    /* =====================================================
       AJAX
    ===================================================== */

    $.ajax({

        url:
            "${pageContext.request.contextPath}/mypage/update",

        type:
            "POST",

        data: {

            phone:
                phone,

            email:
                email,

            zipcode:
                zipcode,

            address1:
                address1,

            address2:
                address2,

            team:
                team

        },


        /* =================================================
           성공
        ================================================= */

        success: function(response) {


            if (response === "success") {


                alert(
                    "개인정보가 수정되었습니다."
                );


                /*
                 * DB에서 최신 데이터를 다시 가져옴
                 */

                location.reload();


            } else {


                alert(
                    "개인정보 수정에 실패했습니다."
                );


            }

        },


        /* =================================================
           서버 오류
        ================================================= */

        error: function() {

            alert(
                "서버 오류가 발생했습니다."
            );

        }

    });

}

</script>


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