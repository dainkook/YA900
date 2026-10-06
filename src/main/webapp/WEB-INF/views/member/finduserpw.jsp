<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>비밀번호 찾기 - YA900</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background-color: #f5f6f8;
    font-family: Arial, sans-serif;
}


/* =========================
   HEADER
========================= */

.header {
    width: 100%;
    height: 80px;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #ddd;
    background: white;
}

.logo {
    margin-left: 40px;
    font-size: 28px;
    font-weight: bold;
    letter-spacing: 2px;
}


/* =========================
   비밀번호 찾기
========================= */

.find-container {
    width: 100%;
    display: flex;
    justify-content: center;
    padding: 80px 0;
}

.find-box {
    width: 400px;
    padding: 40px;
    background: white;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.find-title {
    margin: 0 0 35px;
    text-align: center;
    font-size: 24px;
}


/* =========================
   입력창
========================= */

.input-group {
    margin-bottom: 10px;
}

.input-group label {
    display: block;
    margin-bottom: 8px;
    font-size: 14px;
    font-weight: bold;
}

.input {
    width: 100%;
    height: 45px;
    padding: 0 12px;
    border: 1px solid #aaa;
    border-radius: 5px;
    font-size: 14px;
    outline: none;
}

.input:focus {
    border-color: #000;
}


/* =========================
   검증 메시지
========================= */

.check-message {
    min-height: 20px;
    margin-top: 5px;
    font-size: 13px;
}


/* =========================
   버튼
========================= */

.find-btn {
    width: 100%;
    height: 45px;
    margin-top: 10px;
    border: none;
    border-radius: 5px;
    background: black;
    color: white;
    cursor: pointer;
    font-size: 15px;
}

.find-btn:hover {
    background: #666;
}


/* =========================
   새 비밀번호 영역
========================= */

.password-area {
    margin-top: 30px;
    padding-top: 25px;
    border-top: 1px solid #ddd;
}

.password-title {
    margin: 0 0 20px;
    text-align: center;
    font-size: 18px;
}


/* =========================
   FOOTER
========================= */

.footer {
    width: 100%;
    height: 150px;
    border-top: 1px solid #999;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #777;
    font-size: 13px;
}

</style>

</head>

<body>


<!-- =========================
     HEADER
========================= -->

<header class="header">

    <div class="logo">
        YA900
    </div>

</header>


<!-- =========================
     비밀번호 찾기
========================= -->

<main class="find-container">

    <div class="find-box">

        <h2 class="find-title">
            비밀번호 찾기
        </h2>


        <!-- =========================
             회원 정보 확인
        ========================= -->

        <form id="finduserpw">


            <!-- 이름 -->

            <div class="input-group">

                <label>
                    이름
                </label>

                <input type="text"
                       class="input"
                       name="name"
                       id="name"
                       placeholder="이름을 입력하세요"
                       required>

            </div>

            <div id="namecheck-message"
                 class="check-message">
            </div>


            <!-- 아이디 -->

            <div class="input-group">

                <label>
                    아이디
                </label>

                <input type="text"
                       class="input"
                       name="id"
                       id="id"
                       placeholder="아이디를 입력하세요"
                       required>

            </div>

            <div id="idcheck-message"
                 class="check-message">
            </div>


            <!-- 이메일 -->

            <div class="input-group">

                <label>
                    이메일
                </label>

                <input type="email"
                       class="input"
                       name="email"
                       id="email"
                       placeholder="이메일을 입력하세요"
                       required>

            </div>

            <div id="emailcheck-message"
                 class="check-message">
            </div>


            <!-- 인증번호 받기 -->

            <button type="button"
                    id="sendEmail"
                    class="find-btn"
                    style="display: none;">

                인증번호 받기

            </button>


            <!-- 이메일 인증 -->

            <div id="verify-area"
                 style="display: none;">

                <input type="text"
                       id="email-code"
                       class="input"
                       placeholder="인증번호를 입력하세요">

                <button type="button"
                        id="verifyemail"
                        class="find-btn">

                    인증확인

                </button>

            </div>


            <!-- 비밀번호 재발급 -->

            <button type="submit"
                    class="find-btn">

                비밀번호 재발급

            </button>


        </form>


        <!-- =========================
             새 비밀번호 입력
        ========================= -->

        <div id="password-area"
             class="password-area"
             style="display: none;">

            <h3 class="password-title">

                새로운 비밀번호를 입력하세요

            </h3>


            <!-- 새 비밀번호 -->

            <div class="input-group">

                <label>
                    새 비밀번호
                </label>

                <input type="password"
                       class="input"
                       name="newPw"
                       id="newPw"
                       placeholder="새 비밀번호를 입력하세요">

            </div>

            <div id="pwcheck-message"
                 class="check-message">
            </div>


            <!-- 비밀번호 확인 -->

            <div class="input-group">

                <label>
                    비밀번호 확인
                </label>

                <input type="password"
                       class="input"
                       name="newPwCheck"
                       id="newPwCheck"
                       placeholder="비밀번호를 다시 입력하세요">

            </div>

            <div id="pwcheck2-message"
                 class="check-message">
            </div>


            <!-- 비밀번호 변경 버튼 -->

            <button type="button"
                    class="find-btn"
                    id="changePw">

                비밀번호 변경

            </button>

        </div>

    </div>

</main>


<!-- =========================
     FOOTER
========================= -->

<footer class="footer">

    개인정보처리방침　|　전체 서비스　|　문제 신고　|　고객센터

</footer>

<script>
    let idRegex= /^[가-힣A-Za-z0-9]{6,12}$/;
    let emailRegex= /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    let nameRegex =/^[가-힣]{2,5}$/;

    let name= document.getElementById("name");
    let id=document.getElementById("id");
    let email= document.getElementById("email");
    let sendEmail= document.getElementById("sendEmail");

    function checkinput(){
        if (nameRegex.test(name.value)&&
        idRegex.test(id.value)&&
        emailRegex.test(email.value)
    ){
        sendEmail.style.display ="block";
    }else{
        sendEmail.style.display ="none";
    }
    }
    name.addEventListener("input", checkinput);
    id.addEventListener("input", checkinput);
    email.addEventListener("input", checkinput);


    sendEmail.addEventListener("click", function(){
        let emailvalue = email.value;

        $.ajax({
            url:"${pageContext.request.contextPath}/sendemail",
            type: "post",
            data:{
                email: emailvalue
            },
            success:function(result){

                if(result == "success"){
                alert("인증번호가 전송되었습니다.");
                document.getElementById("verify-area").style.display = "block";
            }
        }
        });
    });

    let verifyemail= document.getElementById("verifyemail");
    


    verifyemail.addEventListener("click", function(){
        let emailCode= document.getElementById("email-code");
         let code = emailCode.value;

         $.ajax({
            url: "${pageContext.request.contextPath}/verifyemail",
            type: "post",
            data:{
                code: code
            },
            success:function(result){
                if(result == "success"){
                    alert("이메일 인증이 완료되었습니다.");

                }else{
                    alert("인증번호가 일치하지 않습니다.");
                }
            }
         });
    });
</script>
</body>
</html>