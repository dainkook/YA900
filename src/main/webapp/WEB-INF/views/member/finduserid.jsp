<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 - YA900</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
* {
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    margin: 0;
    background: linear-gradient(to bottom, #111936 0%, #111936 15%,
        #0b1026 25%, #171f46 35%, #252f67 48%, #71809f 65%,
        #aeb7ca 76%, #d5dae5 86%, #eef1f8 94%, #eef1f8 100%);
    color: #18213f;
    font-family: Arial, sans-serif;
    min-height: 100vh;
}

/* HEADER */
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

/* SUB MENU */
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

/* FIND CONTAINER */
.find-container {
    width: 100%;
    min-height: calc(100vh - 170px);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 70px 20px;
}

.find-box {
    width: 420px;
    padding: 40px;
    background: #ffffff;
    border: 1px solid #d6dceb;
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(17, 25, 54, 0.12);
}

.find-title {
    margin: 0 0 30px;
    text-align: center;
    font-size: 26px;
    font-weight: bold;
    color: #111936;
}

.input-group {
    margin-bottom: 10px;
}

.input-group label {
    display: block;
    margin-bottom: 8px;
    font-size: 14px;
    font-weight: bold;
    color: #36405d;
}

.input {
    width: 100%;
    height: 45px;
    padding: 0 12px;
    border: 1px solid #c7cee0;
    border-radius: 6px;
    background: #ffffff;
    color: #18213f;
    font-size: 14px;
    outline: none;
    transition: 0.2s ease;
}

.input:focus {
    border-color: #476aaa;
    box-shadow: 0 0 0 2px rgba(71, 106, 170, 0.12);
}

.input::placeholder {
    color: #9aa3b7;
}

/* BUTTONS */
.sendEmail {
    width: 100%;
    height: 40px;
    margin-top: 10px;
    border: 1px solid #476aaa;
    border-radius: 6px;
    background: #476aaa;
    color: white;
    cursor: pointer;
    font-size: 14px;
    transition: 0.2s ease;
}

.sendEmail:hover {
    background: #3c5f9a;
    border-color: #3c5f9a;
}

.verify-area {
    margin-top: 15px;
    padding: 15px;
    background: #f5f7fc;
    border: 1px solid #d6dceb;
    border-radius: 8px;
}

.verify-area .input {
    margin-bottom: 10px;
}

.verify-btn {
    width: 100%;
    height: 40px;
    border: 1px solid #c7cee0;
    border-radius: 6px;
    background: #eef1f8;
    color: #111936;
    cursor: pointer;
    font-size: 14px;
    transition: 0.2s ease;
}

.verify-btn:hover {
    background: #dfe5f2;
}

.button-group {
    display: flex;
    gap: 10px;
    margin-top: 25px;
}

.find-btn,
.login-btn {
    flex: 1;
    height: 45px;
    border: 1px solid #111936;
    border-radius: 6px;
    background: #111936;
    color: white;
    cursor: pointer;
    font-size: 15px;
    transition: 0.2s ease;
}

.find-btn:hover,
.login-btn:hover {
    background: #476aaa;
    border-color: #476aaa;
}

.message {
    margin-top: 5px;
    font-size: 13px;
}

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
</style>
</head>

<body>

    <!-- HEADER -->
    <div class="header">

        <div class="logo" onclick="location.href='/'">YA900</div>

        <nav class="main-menu">

            <div class="menu-item">
                <a href="#">야구</a>
                <div class="sub-menu">
                    <a href="${pageContext.request.contextPath}/#reservation">예매</a>
                    <a href="${pageContext.request.contextPath}/schedule/schedule">경기일정</a>
                    <a href="${pageContext.request.contextPath}/schedule/rankdetail">팀순위</a>
                    <a href="${pageContext.request.contextPath}/schedule/rankdetail?tab=pitcher">선수순위</a>
                    <a href="${pageContext.request.contextPath}/board/board?cpage=1">게시판</a>
                </div>
            </div>

            <div class="menu-item">
                <a href="#">축구</a>
                <div class="sub-menu">
                    <a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">예매</a>
                    <a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">경기일정</a>
                    <a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">팀순위</a>
                    <a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">선수순위</a>
                    <a href="${pageContext.request.contextPath}/schedule/soccercommingsoon">게시판</a>
                </div>
            </div>

            <div class="menu-item">
                <a href="#">미니게임</a>
                <div class="sub-menu">
                    <a href="${pageContext.request.contextPath}/quiz">상식 퀴즈</a>
                    <a href="${pageContext.request.contextPath}/myteam">나만의 팀</a>
                    <a href="${pageContext.request.contextPath}/prediction">승부예측</a>
                </div>
            </div>

        </nav>
    </div>

    <!-- FIND USER ID -->
    <main class="find-container">

        <div class="find-box">

            <h2 class="find-title">아이디 찾기</h2>

            <div class="input-group">
                <label for="name">이름</label>
                <input type="text" class="input" id="name"
                    placeholder="이름을 입력하세요" required>
            </div>

            <div id="namecheck-message" class="message"></div>

            <div class="input-group">
                <label for="email">이메일</label>
                <input type="email" class="input" id="email"
                    placeholder="이메일을 입력하세요" required>
            </div>

            <div id="emailcheck-message" class="message"></div>

            <button class="sendEmail" type="button" id="sendEmail"
                style="display: none;">
                인증번호 받기
            </button>

            <div id="verify" class="verify-area" style="display: none;">

                <div class="input-group">
                    <label for="email-code">인증번호</label>
                    <input type="text" class="input" id="email-code"
                        placeholder="인증번호를 입력하세요">
                </div>

                <button type="button" class="verify-btn" id="verifyemail">
                    인증번호 확인
                </button>

                <div id="verify-message" class="message"></div>

            </div>

            <div class="button-group">

                <button type="button" class="find-btn"
                    onclick="location.href='${pageContext.request.contextPath}/'">
                    메인으로
                </button>

                <button type="button" class="login-btn"
                    onclick="location.href='${pageContext.request.contextPath}/login'">
                    로그인
                </button>

            </div>

        </div>

    </main>

    <footer class="footer">
        개인정보처리방침 | 전체 서비스 | 문제 신고 | 고객센터
    </footer>

<script>
$(function() {

    let name = document.getElementById("name");
    let email = document.getElementById("email");
    let emailCode = document.getElementById("email-code");

    let nameMessage = document.getElementById("namecheck-message");
    let emailMessage = document.getElementById("emailcheck-message");
    let verifyMessage = document.getElementById("verify-message");

    let nameRegex = /^[가-힣]{2,5}$/;
    let emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

    let verified = false;
    let sending = false;

    function checkInput() {
        if (nameRegex.test(name.value.trim())
                && emailRegex.test(email.value.trim())) {
            $("#sendEmail").show();
        } else {
            $("#sendEmail").hide();
            $("#verify").hide();
        }
    }

    // 이름 변경 시 기존 인증 무효화
    name.addEventListener("input", function() {
        verified = false;
        nameMessage.textContent = "";
        checkInput();
    });

    // 이메일 변경 시 기존 인증 무효화
    email.addEventListener("input", function() {
        verified = false;
        emailMessage.textContent = "";
        checkInput();
    });

    // 인증번호 전송
    $("#sendEmail").click(function() {

        if (!nameRegex.test(name.value.trim())) {
            alert("이름을 올바르게 입력하세요.");
            name.focus();
            return;
        }

        if (!emailRegex.test(email.value.trim())) {
            alert("이메일을 올바르게 입력하세요.");
            email.focus();
            return;
        }

        if (sending) {
            return;
        }

        sending = true;

        $.ajax({
            url: "${pageContext.request.contextPath}/sendemail",
            type: "post",
            data: {
                name: name.value.trim(),
                email: email.value.trim()
            },

            success: function(result) {

                if (result == "success") {
                    alert("인증번호가 이메일로 전송되었습니다.");

                    $("#verify").show();
                    emailCode.value = "";
                    verifyMessage.textContent = "";

                } else if (result == "notfound") {
                    alert("이름과 이메일이 일치하는 회원이 없습니다.");
                    $("#verify").hide();

                } else {
                    alert("인증번호 전송에 실패했습니다.");
                }
            },

            error: function() {
                alert("이메일 전송 중 오류가 발생했습니다.");
            },

            complete: function() {
                sending = false;
            }
        });
    });

    // 인증번호 확인 후 아이디 표시
    $("#verifyemail").click(function() {

        let code = emailCode.value.trim();

        if (code == "") {
            alert("인증번호를 입력해주세요.");
            emailCode.focus();
            return;
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/verifyuseridemail",
            type: "post",
            data: {
                code: code,
                name: name.value.trim(),
                email: email.value.trim()
            },

            success: function(result) {

                if (result.indexOf("success:") === 0) {

                    let foundId = result.substring("success:".length);

                    verified = true;

                    alert("올바른 인증번호입니다.");

                    alert("회원님의 아이디는 " + foundId + "입니다.");

                    location.href = "${pageContext.request.contextPath}/login";

                } else if (result == "notfound") {

                    verified = false;
                    alert("이름과 이메일이 일치하는 회원이 없습니다.");

                } else {

                    verified = false;
                    alert("인증번호가 일치하지 않거나 인증 정보가 올바르지 않습니다.");

                }
            },

            error: function() {
                alert("인증 확인 중 오류가 발생했습니다.");
            }
        });
    });

});
</script>

</body>
</html>
