<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YA900 예매</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<style>

/* =========================
   YA900 THEME
========================= */

:root {
    --navy-dark: #0b1026;
    --navy: #111936;
    --navy-main: #171f46;
    --navy-light: #252f67;

    --point: #476aaa;
    --point-light: #7189c2;

    --bg: #eef1f8;
    --card: #ffffff;

    --line: #d6dceb;
    --text: #18213f;
    --sub-text: #68718a;
}


/* =========================
   전체
========================= */

* {
    box-sizing: border-box;
}

html,
body {
    margin: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
}

body {
    font-family: Arial, sans-serif;
    color: var(--text);

    background:
        linear-gradient(
            135deg,
            #eef1f8 0%,
            #f8f9fc 50%,
            #eef1f8 100%
        );
}


/* =========================
   전체 스크롤바
========================= */

::-webkit-scrollbar {
    width: 8px;
    height: 8px;
}

::-webkit-scrollbar-track {
    background: #e6eaf3;
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: var(--point);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
    background: var(--point-light);
}


/* =========================
   예매 전체
========================= */

.booking-page {
    width: 100%;
    height: 100vh;

    padding: 15px;

    overflow: hidden;
}


/* =========================
   상단 제목
========================= */

.booking-header {
    height: 45px;

    display: flex;
    align-items: center;

    padding: 0 15px;

    background: linear-gradient(
        135deg,
        var(--navy-dark),
        var(--navy-main)
    );

    color: white;

    border-radius: 10px 10px 0 0;

    border-bottom: 1px solid #303b70;

    box-shadow: 0 3px 12px rgba(11,16,38,0.15);
}

.booking-title {
    font-size: 20px;
    font-weight: bold;

    letter-spacing: 0.5px;
}


/* =========================
   경기 정보
========================= */

.game-info {
    height: 85px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: white;

    border-bottom: 1px solid var(--line);

    box-shadow: 0 3px 12px rgba(17,25,54,0.05);
}

.game-date {
    width: 150px;

    text-align: center;

    font-size: 13px;

    color: var(--sub-text);
}

.game-teams {
    width: 350px;

    text-align: center;

    color: var(--navy);
}

.game-teams strong {
    font-size: 22px;
}

.game-stadium {
    width: 180px;

    text-align: center;

    font-size: 13px;

    color: var(--sub-text);
}


/* =========================
   예매 내용
========================= */

.booking-content {
    height: calc(100vh - 160px);

    display: grid;
    grid-template-columns: 1fr 220px;

    overflow: hidden;

    background: var(--bg);

    border-radius: 0 0 10px 10px;
}


/* =========================
   좌석 영역
========================= */

.seat-area {
    padding: 12px 15px;

    background: #f8f9fc;

    border-right: 1px solid var(--line);
}

.area-title {
    margin-bottom: 8px;

    font-size: 15px;
    font-weight: bold;

    color: var(--navy);
}


/* =========================
   경기장
========================= */

.field {
    width: 180px;
    height: 35px;

    margin: 0 auto 10px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: linear-gradient(
        135deg,
        var(--navy),
        var(--navy-light)
    );

    color: white;

    border: none;

    border-radius: 7px;

    font-size: 12px;

    box-shadow: 0 4px 10px rgba(17,25,54,0.15);
}


/* =========================
   좌석
========================= */

.seat-map {
    width: 430px;

    margin: 0 auto;
}

.seat-row {
    height: 30px;

    display: flex;
    align-items: center;
    justify-content: center;

    gap: 5px;
}

.seat {
    width: 24px;
    height: 24px;

    padding: 0;

    background: white;

    border: 1px solid #bcc6dc;

    border-radius: 4px;

    color: var(--text);

    font-size: 9px;

    cursor: pointer;

    transition:
        background 0.15s ease,
        border-color 0.15s ease,
        transform 0.15s ease;
}

.seat:hover {
    background: #edf1fa;

    border-color: var(--point);

    transform: translateY(-1px);
}

.seat.selected {
    background: var(--point);

    border-color: var(--point);

    color: white;

    box-shadow: 0 2px 7px rgba(71,106,170,0.3);
}

.seat.sold {
    background: #dfe3eb;

    border-color: #dfe3eb;

    color: #8b93a8;

    cursor: default;
}


/* 가운데 통로 */

.aisle {
    width: 22px;
}


/* =========================
   구역 표시
========================= */

.seat-label {
    display: flex;
    justify-content: space-between;

    width: 350px;

    margin: 6px auto 0;

    font-size: 11px;

    color: var(--sub-text);
}


/* =========================
   좌석 안내
========================= */

.seat-guide {
    margin-top: 10px;

    display: flex;
    justify-content: center;

    gap: 15px;

    font-size: 10px;

    color: var(--sub-text);
}

.guide-item {
    display: flex;
    align-items: center;

    gap: 4px;
}

.guide-box {
    width: 13px;
    height: 13px;

    background: white;

    border: 1px solid #bcc6dc;

    border-radius: 3px;
}

.guide-box.selected {
    background: var(--point);

    border-color: var(--point);
}

.guide-box.sold {
    background: #dfe3eb;

    border-color: #dfe3eb;
}


/* =========================
   오른쪽 예매 정보
========================= */

.booking-summary {
    padding: 15px;

    background: white;

    box-shadow: -4px 0 15px rgba(17,25,54,0.05);
}

.summary-title {
    margin: 0 0 15px;

    padding-bottom: 10px;

    font-size: 16px;
    font-weight: bold;

    color: var(--navy);

    border-bottom: 2px solid var(--point);
}

.summary-item {
    margin-bottom: 14px;
}

.summary-label {
    margin-bottom: 4px;

    font-size: 11px;

    color: var(--sub-text);
}

.summary-value {
    font-size: 13px;

    color: var(--text);
}


/* =========================
   가격
========================= */

.total-price {
    margin-top: 15px;

    padding-top: 12px;

    border-top: 1px solid var(--line);

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.total-price span {
    font-size: 12px;

    color: var(--sub-text);
}

.total-price strong {
    font-size: 17px;

    color: var(--point);
}


/* =========================
   다음 버튼
========================= */

.next-btn {
    width: 100%;
    height: 38px;

    margin-top: 15px;

    border: none;

    border-radius: 6px;

    background: var(--navy);

    color: white;

    font-size: 13px;

    cursor: pointer;

    transition: 0.2s ease;
}

.next-btn:hover {
    background: var(--point);

    transform: translateY(-1px);
}


/* =========================
   결제 화면
========================= */

.payment-page {
    display: none;

    width: 100%;
    height: 100vh;

    overflow: hidden;

    background: var(--bg);
}

.payment-title {
    height: 45px;

    padding: 0 15px;

    display: flex;
    align-items: center;

    background: linear-gradient(
        135deg,
        var(--navy-dark),
        var(--navy-main)
    );

    color: white;

    font-size: 18px;
    font-weight: bold;

    border-bottom: 1px solid #303b70;
}


/* =========================
   결제 내용
========================= */

.payment-content {
    width: 650px;

    margin: 18px auto;
}


/* =========================
   결제 박스
========================= */

.payment-box {
    background: white;

    border: 1px solid var(--line);

    border-radius: 10px;

    padding: 15px;

    margin-bottom: 10px;

    box-shadow: 0 4px 15px rgba(17,25,54,0.06);
}

.payment-box h3 {
    margin: 0 0 12px;

    padding-bottom: 9px;

    font-size: 15px;

    color: var(--navy);

    border-bottom: 2px solid var(--point);
}

.payment-info {
    display: flex;
    justify-content: space-between;

    padding: 7px 0;

    font-size: 13px;

    border-bottom: 1px solid #edf0f6;
}

.payment-info:last-child {
    border-bottom: none;
}

.payment-info span:last-child {
    color: var(--text);

    font-weight: 500;
}


/* =========================
   결제 수단
========================= */

.payment-method {
    display: flex;

    gap: 10px;
}

.payment-method button {
    flex: 1;

    height: 40px;

    background: white;

    border: 1px solid #c5cde0;

    border-radius: 6px;

    color: var(--text);

    cursor: pointer;

    transition: 0.2s ease;
}

.payment-method button:hover {
    background: #edf1fa;

    border-color: var(--point);
}

.payment-method button.active {
    background: var(--point);

    border-color: var(--point);

    color: white;

    box-shadow: 0 3px 8px rgba(71,106,170,0.2);
}


/* =========================
   결제 금액
========================= */

.payment-total {
    display: flex;
    justify-content: space-between;
    align-items: center;

    padding: 10px 0;

    margin-bottom: 10px;

    border-top: 1px solid var(--line);
}

.payment-total span {
    color: var(--sub-text);
}

.payment-total strong {
    font-size: 20px;

    color: var(--point);
}


/* =========================
   이전 / 결제 버튼
========================= */

.payment-back-btn,
.payment-btn {
    width: 100%;
    height: 40px;

    border-radius: 6px;

    cursor: pointer;

    transition: 0.2s ease;
}

.payment-back-btn {
    margin-bottom: 8px;

    background: white;

    color: var(--navy);

    border: 1px solid #bcc6dc;
}

.payment-back-btn:hover {
    background: #edf1fa;

    border-color: var(--point);
}

.payment-btn {
    background: var(--navy);

    color: white;

    border: 1px solid var(--navy);
}

.payment-btn:hover {
    background: var(--point);

    border-color: var(--point);
}


/* =========================
   작은 화면 대응
========================= */

@media (max-width: 700px) {

    .game-teams {
        width: 280px;
    }

    .game-teams strong {
        font-size: 18px;
    }

    .payment-content {
        width: calc(100% - 30px);
    }

}

</style>

<body>

<div class="booking-page">


    <!-- =========================
         예매 화면
    ========================== -->

    <div class="booking-header">
        <div class="booking-title">
            YA900 예매
        </div>
    </div>


    <div class="game-info">

        <div class="game-date">
		    <fmt:formatDate value="${game.start_date}" pattern="MM.dd (E)" /><br>
		    <fmt:formatDate value="${game.start_date}" pattern="HH:mm" />
		</div>
		
		<div class="game-teams">
		    <strong>${game.away_team}</strong>
		    &nbsp; VS &nbsp;
		    <strong>${game.home_team}</strong>
		</div>
		
		<div class="game-stadium">
		    ${game.location}
		</div>
    </div>


    <div class="booking-content">


        <!-- 좌석 -->

        <div class="seat-area">

            <div class="area-title">
                좌석 선택
            </div>

            <div class="field">
                그라운드
            </div>


            <div class="seat-map">


                <!-- 1열 -->

                <div class="seat-row">
                    <button class="seat">01</button>
                    <button class="seat">02</button>
                    <button class="seat">03</button>
                    <button class="seat">04</button>
                    <button class="seat">05</button>

                    <div class="aisle"></div>

                    <button class="seat">06</button>
                    <button class="seat">07</button>
                    <button class="seat">08</button>
                    <button class="seat">09</button>
                    <button class="seat">10</button>
                </div>


                <!-- 2열 -->

                <div class="seat-row">
                    <button class="seat">11</button>
                    <button class="seat">12</button>
                    <button class="seat">13</button>
                    <button class="seat">14</button>
                    <button class="seat">15</button>

                    <div class="aisle"></div>

                    <button class="seat">16</button>
                    <button class="seat">17</button>
                    <button class="seat">18</button>
                    <button class="seat">19</button>
                    <button class="seat">20</button>
                </div>


                <!-- 3열 -->

                <div class="seat-row">
                    <button class="seat">21</button>
                    <button class="seat">22</button>
                    <button class="seat">23</button>
                    <button class="seat">24</button>
                    <button class="seat">25</button>

                    <div class="aisle"></div>

                    <button class="seat">26</button>
                    <button class="seat">27</button>
                    <button class="seat">28</button>
                    <button class="seat">29</button>
                    <button class="seat">30</button>
                </div>


                <!-- 4열 -->

                <div class="seat-row">
                    <button class="seat">31</button>
                    <button class="seat">32</button>
                    <button class="seat">33</button>
                    <button class="seat sold">34</button>
                    <button class="seat">35</button>

                    <div class="aisle"></div>

                    <button class="seat">36</button>
                    <button class="seat">37</button>
                    <button class="seat">38</button>
                    <button class="seat">39</button>
                    <button class="seat">40</button>
                </div>


                <!-- 5열 -->

                <div class="seat-row">
                    <button class="seat">41</button>
                    <button class="seat">42</button>
                    <button class="seat">43</button>
                    <button class="seat">44</button>
                    <button class="seat">45</button>

                    <div class="aisle"></div>

                    <button class="seat">46</button>
                    <button class="seat">47</button>
                    <button class="seat">48</button>
                    <button class="seat">49</button>
                    <button class="seat">50</button>
                </div>


                <!-- 6열 -->

                <div class="seat-row">
                    <button class="seat">51</button>
                    <button class="seat">52</button>
                    <button class="seat">53</button>
                    <button class="seat">54</button>
                    <button class="seat">55</button>

                    <div class="aisle"></div>

                    <button class="seat">56</button>
                    <button class="seat">57</button>
                    <button class="seat">58</button>
                    <button class="seat">59</button>
                    <button class="seat">60</button>
                </div>


                <!-- 7열 -->

                <div class="seat-row">
                    <button class="seat">61</button>
                    <button class="seat">62</button>
                    <button class="seat">63</button>
                    <button class="seat">64</button>
                    <button class="seat">65</button>

                    <div class="aisle"></div>

                    <button class="seat">66</button>
                    <button class="seat">67</button>
                    <button class="seat">68</button>
                    <button class="seat">69</button>
                    <button class="seat">70</button>
                </div>


                <!-- 8열 -->

                <div class="seat-row">
                    <button class="seat">71</button>
                    <button class="seat">72</button>
                    <button class="seat">73</button>
                    <button class="seat">74</button>
                    <button class="seat">75</button>

                    <div class="aisle"></div>

                    <button class="seat">76</button>
                    <button class="seat">77</button>
                    <button class="seat">78</button>
                    <button class="seat">79</button>
                    <button class="seat">80</button>
                </div>


                <!-- 9열 -->

                <div class="seat-row">
                    <button class="seat">81</button>
                    <button class="seat">82</button>
                    <button class="seat">83</button>
                    <button class="seat">84</button>
                    <button class="seat">85</button>

                    <div class="aisle"></div>

                    <button class="seat">86</button>
                    <button class="seat">87</button>
                    <button class="seat">88</button>
                    <button class="seat">89</button>
                    <button class="seat">90</button>
                </div>


                <!-- 10열 -->

                <div class="seat-row">
                    <button class="seat">91</button>
                    <button class="seat">92</button>
                    <button class="seat">93</button>
                    <button class="seat">94</button>
                    <button class="seat">95</button>

                    <div class="aisle"></div>

                    <button class="seat">96</button>
                    <button class="seat">97</button>
                    <button class="seat">98</button>
                    <button class="seat">99</button>
                    <button class="seat">100</button>
                </div>

            </div>


            <div class="seat-label">
                <span>3루</span>
                <span>1루</span>
            </div>


            <div class="seat-guide">

                <div class="guide-item">
                    <div class="guide-box"></div>
                    선택 가능
                </div>

                <div class="guide-item">
                    <div class="guide-box selected"></div>
                    선택
                </div>

                <div class="guide-item">
                    <div class="guide-box sold"></div>
                    매진
                </div>

            </div>

        </div>


        <!-- 예매 정보 -->

        <div class="booking-summary">

            <h3 class="summary-title">
                예매 정보
            </h3>

            <div class="summary-item">
                <div class="summary-label">경기</div>
                <div class="summary-value">
				    ${game.away_team} VS ${game.home_team}
				</div>
            </div>

            <div class="summary-item">
                <div class="summary-label">날짜</div>
                <div class="summary-value">
				    <fmt:formatDate value="${game.start_date}" pattern="MM.dd (E) HH:mm" />
				</div>
            </div>

            <div class="summary-item">
                <div class="summary-label">구장</div>
                <div class="summary-value">
				    ${game.location}
				</div>
            </div>

            <div class="summary-item">
                <div class="summary-label">선택 좌석</div>
                <div class="summary-value" id="selectedSeats">-</div>
            </div>

            <div class="summary-item">
                <div class="summary-label">인원</div>
                <div class="summary-value" id="selectedCount">0명</div>
            </div>

            <div class="total-price">
                <span>총 금액</span>
                <strong id="totalPrice">0원</strong>
            </div>

            <button class="next-btn" onclick="goPayment()">
                다음 단계
            </button>

        </div>

    </div>


    <!-- =========================
         결제 화면
    ========================== -->

    <div class="payment-page" id="paymentPage">

        <div class="payment-title">
            결제
        </div>


        <div class="payment-content">


            <!-- 예매 정보 -->

            <div class="payment-box">

                <h3>예매 정보</h3>

                <div class="payment-info">
                    <span>경기</span>
                    <span>
					    ${game.away_team} VS ${game.home_team}
					</span>
                </div>

                <div class="payment-info">
                    <span>경기일</span>
                    <span>
					    <fmt:formatDate value="${game.start_date}" pattern="MM.dd (E) HH:mm" />
					</span>
                </div>

                <div class="payment-info">
                    <span>구장</span>
                    <span>${game.location}</span>
                </div>

                <div class="payment-info">
                    <span>좌석</span>
                    <span id="paymentSeats">-</span>
                </div>

            </div>


            <!-- 결제 수단 -->

            <div class="payment-box">

                <h3>결제 수단</h3>

                <div class="payment-method">

                    <button onclick="selectPayment(this)">
                        신용카드
                    </button>

                    <button onclick="selectPayment(this)">
                        카카오페이
                    </button>

                    <button onclick="selectPayment(this)">
                        네이버페이
                    </button>

                </div>

            </div>


            <!-- 결제 금액 -->

            <div class="payment-box">

                <div class="payment-total">
                    <span>총 결제 금액</span>
                    <strong id="paymentTotal">0원</strong>
                </div>

                <button class="payment-back-btn" onclick="goBackBooking()">
                    이전 단계
                </button>

                <button class="payment-btn" onclick="completePayment()">
                    결제하기
                </button>

            </div>

        </div>

    </div>

</div>


<script>

/* =========================
   기본 설정
========================= */

let seatPrice = 16000;
let totalPrice = 0;
let selectedCount = 0;


/* =========================
   좌석 선택
========================= */

const seats = document.querySelectorAll(".seat");

seats.forEach(function(seat) {

    seat.addEventListener("click", function() {

        // 매진 좌석
        if (seat.classList.contains("sold")) {
            return;
        }


        // 선택 해제
        if (seat.classList.contains("selected")) {

            seat.classList.remove("selected");

            selectedCount--;
            totalPrice -= seatPrice;

        }


        // 좌석 선택
        else {

            seat.classList.add("selected");

            selectedCount++;
            totalPrice += seatPrice;

        }


        updateBookingInfo();

    });

});


/* =========================
   예매 정보 업데이트
========================= */

function updateBookingInfo() {

    document.getElementById("selectedCount").innerText =
        selectedCount + "명";

    document.getElementById("totalPrice").innerText =
        totalPrice.toLocaleString() + "원";


    let selectedSeatNames = [];

    document.querySelectorAll(".seat.selected").forEach(function(seat) {

        selectedSeatNames.push(seat.innerText);

    });


    document.getElementById("selectedSeats").innerText =
        selectedSeatNames.length > 0
        ? selectedSeatNames.join(", ")
        : "-";

}


/* =========================
   결제 화면으로 이동
========================= */

function goPayment() {

    const selectedSeats =
        document.querySelectorAll(".seat.selected");


    // 좌석을 선택하지 않았으면 이동하지 않음
    if (selectedSeats.length === 0) {

        alert("좌석을 선택해주세요.");

        return;
    }


    // 선택한 좌석 이름 가져오기

    let seatNames = [];

    selectedSeats.forEach(function(seat) {

        seatNames.push(seat.innerText);

    });


    // 결제 화면에 좌석 표시

    document.getElementById("paymentSeats").innerText =
        seatNames.join(", ");


    // 결제 금액 표시

    document.getElementById("paymentTotal").innerText =
        (selectedSeats.length * seatPrice).toLocaleString() + "원";


    // 예매 화면 숨기기

    document.querySelector(".booking-header").style.display = "none";
    document.querySelector(".game-info").style.display = "none";
    document.querySelector(".booking-content").style.display = "none";


    // 결제 화면 표시

    document.getElementById("paymentPage").style.display = "block";

}


/* =========================
   예매 화면으로 돌아가기
========================= */

function goBackBooking() {

    // 결제 화면 숨기기

    document.getElementById("paymentPage").style.display = "none";


    // 예매 화면 다시 표시

    document.querySelector(".booking-header").style.display = "flex";
    document.querySelector(".game-info").style.display = "flex";
    document.querySelector(".booking-content").style.display = "grid";

}


/* =========================
   결제수단 선택
========================= */

function selectPayment(button) {

    document
        .querySelectorAll(".payment-method button")
        .forEach(function(btn) {

            btn.classList.remove("active");

        });


    button.classList.add("active");

}


/* =========================
   결제 완료
========================= */

function completePayment() {

    const selectedPayment =
        document.querySelector(".payment-method button.active");


    if (!selectedPayment) {

        alert("결제 수단을 선택해주세요.");

        return;

    }


    alert("결제가 완료되었습니다!");

}

</script>

</body>
</html>