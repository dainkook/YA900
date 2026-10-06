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
	font-family: Arial, sans-serif;
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
	border-bottom: 1px solid #303b70;
	box-shadow: 0 3px 15px rgba(11, 16, 38, 0.18);
}

.logo {
	font-size: 30px;
	font-weight: bold;
	color: white;
	letter-spacing: 1px;
}

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

.find-result {
	margin-top: 25px;
	padding: 20px;
	text-align: center;
	border: 1px solid #d6dceb;
	border-radius: 8px;
	background: #f5f7fc;
	color: #36405d;
	font-size: 14px;
}

.find-result strong {
	font-size: 18px;
	color: #111936;
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


			<button class="sendEmail"
				type="button"
				id="sendEmail"
				style="display:none">

				인증번호 받기

			</button>


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


			<div class="button-group">

				<button type="submit"
					class="find-btn"
					id="find-btn">

					아이디 찾기

				</button>

				<button type="button"
					class="login-btn"
					onclick="location.href='${pageContext.request.contextPath}/login'">

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


let verified = false;


function checkInput() {

	if (nameRegex.test(name.value)
		&& emailRegex.test(email.value)) {

		$("#sendEmail").show();

	} else {

		$("#sendEmail").hide();

	}

}


name.addEventListener("input", function() {

	verified = false;

	if (nameRegex.test(name.value)) {

		namecheck_message.innerHTML = "";

	}

	checkInput();

});


email.addEventListener("input", function() {

	verified = false;

	if (emailRegex.test(email.value)) {

		emailcheck_message.innerHTML = "";

	}

	checkInput();

});


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