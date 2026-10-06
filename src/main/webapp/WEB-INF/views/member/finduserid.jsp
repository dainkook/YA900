
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

body {
    margin: 0;
    background-color: #f5f6f8;
    font-family: Arial, sans-serif;
}

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

.sendEmail {
    width: 100%;
    height: 40px;
    margin-top: 10px;
    border: none;
    border-radius: 5px;
    background: #555;
    color: white;
    cursor: pointer;
}

.verify-area {
    margin-top: 15px;
}

.verify-area .input {
    margin-bottom: 10px;
}

.verify-btn {
    width: 100%;
    height: 40px;
    border: none;
    border-radius: 5px;
    background: #555;
    color: white;
    cursor: pointer;
}

.button-group {
    display: flex;
    gap: 10px;
    margin-top: 20px;
}

.find-btn,
.login-btn {
    flex: 1;
    height: 45px;
    border: none;
    border-radius: 5px;
    background: black;
    color: white;
    cursor: pointer;
    font-size: 15px;
}

.find-btn:hover,
.login-btn:hover {
    background: #666;
}

.find-result {
    margin-top: 25px;
    padding: 20px;
    text-align: center;
    border: 1px solid #ddd;
    background: #fafafa;
    font-size: 14px;
}

.find-result strong {
    font-size: 18px;
}

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

.message {
    margin-top: 5px;
    font-size: 13px;
}

</style>

</head>

<body>

<header class="header">
    <div class="logo">YA900</div>
</header>


<main class="find-container">

    <div class="find-box">

        <h2 class="find-title">아이디 찾기</h2>

        <form action="${pageContext.request.contextPath}/finduserid"
              method="post"
              id="findUserId">

            <!-- 이름 -->
            <div class="input-group">

                <label>이름</label>

                <input type="text"
                       class="input"
                       name="name"
                       id="name"
                       placeholder="이름을 입력하세요"
                       required>

            </div>

            <div id="namecheck-message"
                 class="message"></div>


            <!-- 이메일 -->
            <div class="input-group">

                <label>이메일</label>

                <input type="email"
                       class="input"
                       name="email"
                       id="email"
                       placeholder="이메일을 입력하세요"
                       required>

            </div>

            <div id="emailcheck-message"
                 class="message"></div>


            <!-- 인증번호 받기 -->
            <button class="sendEmail"
                    type="button"
                    id="sendEmail"
                    style="display:none">

                인증번호 받기

            </button>


            <!-- 인증번호 입력 영역 -->
            <div id="vertify"
                 class="verify-area"
                 style="display:none;">

                <input type="text"
                       class="input"
                       id="email-code"
                       placeholder="인증번호를 입력하세요">

                <button type="button"
                        class="verify-btn"
                        id="verifyemail">

                    인증하기

                </button>

                <div id="verify-message"
                     class="message"></div>

            </div>


            <!-- 아이디 찾기 / 로그인 -->
            <div class="button-group">

                <button type="submit"
                        class="find-btn"
                        id="find-btn">

                    아이디 찾기

                </button>

                <button type="button"
                        class="login-btn"
                        onclick="location.href='login'">

                    로그인

                </button>

            </div>


            <c:if test="${not empty id}">

                <script>

                    alert("회원님의 아이디는 ${id}입니다.");
                  

                </script>

            </c:if>

        </form>

    </div>

</main>


<script>

let findUserId = document.getElementById("findUserId");

let name = document.getElementById("name");

let email = document.getElementById("email");

let emailcheck_message =
    document.getElementById("emailcheck-message");

let namecheck_message =
    document.getElementById("namecheck-message");

let verifyMessage =
    document.getElementById("verify-message");

let nameRegex = /^[가-힣]{2,5}$/;

let emailRegex =
    /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;


// 인증 완료 여부
let verified = false;


// 이름 + 이메일 형식 검사
function checkInput() {

    if (nameRegex.test(name.value)
        && emailRegex.test(email.value)) {

        $("#sendEmail").show();

    } else {

        $("#sendEmail").hide();

    }

}


// 이름 입력
name.addEventListener("input", function() {

    verified = false;

    if (nameRegex.test(name.value)) {

        namecheck_message.innerHTML = "";

    }

    checkInput();

});


// 이메일 입력
email.addEventListener("input", function() {

    verified = false;

    if (emailRegex.test(email.value)) {

        emailcheck_message.innerHTML = "";

    }

    checkInput();

});


// 인증번호 받기
$("#sendEmail").click(function() {

    let emailvalue = $("#email").val();

    $.ajax({

        url: "${pageContext.request.contextPath}/sendemail",

        type: "post",

        data: {
            email: emailvalue
        },

        success: function(result) {

            if (result == "success") {

                alert("인증번호가 전송되었습니다.");

                $("#vertify").show();

            }

        }

    });

});


// 인증하기
$("#verifyemail").click(function() {

    let code = $("#email-code").val();

    if (code == "") {

        alert("인증번호를 입력해주세요.");
        return;

    }


    $.ajax({

        url: "${pageContext.request.contextPath}/verifyemail",

        type: "post",

        data: {
            code: code
        },

        success: function(result) {

            if (result == "success") {

                alert("인증번호가 확인되었습니다.");

                verified = true;

                verifyMessage.innerHTML = "";

            } else {

                alert("인증번호가 일치하지 않습니다.");

                verified = false;

            }

        }

    });

});


// 아이디 찾기
findUserId.addEventListener("submit", function(event) {
	
	console.log("submit 실행");
	console.log("veriffied: " + verified);

    if (!nameRegex.test(name.value)) {

        namecheck_message.innerHTML =
            "이름 형식이 올바르지 않습니다.";

        name.focus();

        event.preventDefault();

        return;

    }


    if (!emailRegex.test(email.value)) {

        emailcheck_message.innerHTML =
            "이메일 형식이 올바르지 않습니다.";

        email.focus();

        event.preventDefault();

        return;

    }


    // 인증번호 확인 여부 검사
    if (!verified) {

        alert("이메일 인증을 완료해주세요.");

        event.preventDefault();

        return;

    }
	
    
});

	

</script>


<footer class="footer">

    개인정보처리방침 | 전체 서비스 | 문제 신고 | 고객센터

</footer>


</body>
</html>

