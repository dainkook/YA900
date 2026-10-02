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

.button-group {
    display: flex;
    gap: 10px;
    margin-top: 10px;
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

            <div class="input-group">

                <label>이름</label>

                <input type="text"
                       class="input"
                       name="name"
                       id="name"
                       placeholder="이름을 입력하세요"
                       required>

            </div>

            <div id="namecheck-message"></div>


            <div class="input-group">

                <label>이메일</label>

                <input type="email"
                       class="input"
                       name="email"
                       id="email"
                       placeholder="이메일을 입력하세요"
                       required>

            </div>
            <button class="sendEmail" type="button" id="sendEmail" style="display:none">인증번호 받기</button>

            <div id="emailcheck-message"></div>
			
			<div id="vertify" style="display:none;">
			<input type="text" class="input" id="email-code" placeholder="인증번호를 입력하세요">
			<button type="button" id="verifyemail">인증하기</button>


            <div class="button-group">

                <button type="submit"
                        class="find-btn">
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

                    location.href = "login";

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


let nameRegex = /^[가-힣]{2,5}$/;

let emailRegex =
    /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

function checkInput(){
	if(nameRegex.test(name.value)&& emailRegex.test(email.value)){
		$("#sendEmail").show();
	}else{
		$("#sendEmail").hide();
	}
}
    
    
findUserId.addEventListener("submit", function(event) {

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

});


name.addEventListener("input", function() {

    if (nameRegex.test(name.value)) {

        namecheck_message.innerHTML = "";

    }
    checkInput();
});


email.addEventListener("input", function() {

    if (emailRegex.test(email.value)) {

        emailcheck_message.innerHTML = "";

    }
    checkInput();
});

$("#sendEmail").click(function(){
	let emailvalue= $("#email").val();
	$.ajax({
	url:"${pageContext.request.contextPath}/sendemail",
	type:"post",
	data:{ email:emailvalue},
	success:function(result){
		if(result == "success"){
			alert("인증번호가 전송되었습니다.");
			$("#vertify").show();
		}
	}
	});
});

</script>


<footer class="footer">

    개인정보처리방침 | 전체 서비스 | 문제 신고 | 고객센터

</footer>


</body>
</html>