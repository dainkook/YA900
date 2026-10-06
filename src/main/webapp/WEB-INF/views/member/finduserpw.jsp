<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: linear-gradient(135deg, #0f172a, #1e293b);
	min-height: 100vh;
}

/* header */
header {
	height: 70px;
	background: #111827;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 50px;
}

.logo {
	color: white;
	font-size: 28px;
	font-weight: bold;
}

.header-menu a {
	color: white;
	text-decoration: none;
	margin-left: 20px;
}

/* container */
.container {
	width: 500px;
	margin: 70px auto;
	background: white;
	border-radius: 15px;
	padding: 40px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

.container h1 {
	text-align: center;
	margin-bottom: 35px;
}

/* input */
.input-group {
	margin-bottom: 20px;
}

.input-group label {
	display: block;
	margin-bottom: 7px;
	font-weight: bold;
}

.input-group input {
	width: 100%;
	height: 45px;
	border: 1px solid #ccc;
	border-radius: 6px;
	padding: 0 12px;
	font-size: 15px;
}

.input-group input:focus {
	outline: none;
	border-color: #2563eb;
}

/* message */
.message {
	margin-top: 7px;
	font-size: 13px;
}

/* button */
button {
	width: 100%;
	height: 45px;
	border: none;
	border-radius: 6px;
	background: #2563eb;
	color: white;
	font-size: 15px;
	cursor: pointer;
}

button:hover {
	background: #1d4ed8;
}

/* email */
#email-area {
	display: none;
}

#password-area {
	display: none;
}

/* bottom */
.bottom-menu {
	text-align: center;
	margin-top: 25px;
}

.bottom-menu a {
	color: #555;
	text-decoration: none;
	margin: 0 8px;
	font-size: 14px;
}

.bottom-menu a:hover {
	text-decoration: underline;
}

/* footer */
footer {
	text-align: center;
	color: #aaa;
	font-size: 13px;
	padding-bottom: 30px;
}
</style>

</head>

<body>


	<header>

		<div class="logo">YA900</div>

		<div class="header-menu">

			<a href="${pageContext.request.contextPath}/login"> 로그인 </a> <a
				href="${pageContext.request.contextPath}/signup"> 회원가입 </a>

		</div>

	</header>



	<div class="container">

		<h1>비밀번호 찾기</h1>


		<!-- 이름 -->

		<div class="input-group">

			<label>이름</label> <input type="text" id="name"
				placeholder="이름을 입력하세요">

			<div id="namemessage" class="message"></div>

		</div>



		<!-- 아이디 -->

		<div class="input-group">

			<label>아이디</label> <input type="text" id="id"
				placeholder="아이디를 입력하세요">

			<div id="idmessage" class="message"></div>

		</div>



		<!-- 이메일 -->

		<div class="input-group">

			<label>이메일</label> <input type="text" id="email"
				placeholder="이메일을 입력하세요">

			<div id="emailmessage" class="message"></div>

			<button type="button" id="send-email">인증번호 받기</button>

		</div>



		<!-- 이메일 인증 -->

		<div id="email-area">

			<div class="input-group">

				<label>인증번호</label> <input type="text" id="email-code"
					placeholder="인증번호를 입력하세요">

				<div id="codemessage" class="message"></div>

				<button type="button" id="verify-email">인증번호 확인</button>

			</div>

		</div>



		<!-- 비밀번호 변경 -->

		<div id="password-area">

			<div class="input-group">

				<label>새 비밀번호</label> <input type="password" id="newPw"
					placeholder="새 비밀번호를 입력하세요">

				<div id="pwcheckmessage" class="message"></div>

			</div>



			<div class="input-group">

				<label>새 비밀번호 확인</label> <input type="password" id="newpwCheck"
					placeholder="새 비밀번호를 다시 입력하세요">

				<div id="pwcheck2-message" class="message"></div>

			</div>



			<button type="button" id="changePw">비밀번호 변경</button>

		</div>



		<!-- 하단 메뉴 -->

		<div class="bottom-menu">

			<a href="${pageContext.request.contextPath}/login"> 로그인 </a> | <a
				href="${pageContext.request.contextPath}/finduserid"> 아이디 찾기 </a> |

			<a href="${pageContext.request.contextPath}/signup"> 회원가입 </a>

		</div>

	</div>



	<footer> YA900 © 2026 </footer>



	<script>

$(function() {


    let name = document.getElementById("name");

    let id = document.getElementById("id");

    let email = document.getElementById("email");

    let emailCode = document.getElementById("email-code");

    let newPw = document.getElementById("newPw");

    let newpwCheck = document.getElementById("newpwCheck");


    let namemessage =
        document.getElementById("namemessage");

    let idmessage =
        document.getElementById("idmessage");

    let emailmessage =
        document.getElementById("emailmessage");

    let codemessage =
        document.getElementById("codemessage");

    let pwcheckmessage =
        document.getElementById("pwcheckmessage");

    let pwcheck2message =
        document.getElementById("pwcheck2-message");


    let sendEmail =
        document.getElementById("send-email");

    let verifyEmail =
        document.getElementById("verify-email");

    let changePw =
        document.getElementById("changePw");


    let nameRegex =
        /^[가-힣]{2,5}$/;


    let idRegex =
        /^[A-Za-z0-9]{6,12}$/;


    let emailRegex =
        /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;


    let pwRegex =
        /^(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]).{8,}$/;


    name.addEventListener("input", function() {

        if (name.value == "") {

            namemessage.textContent = "";

        } else if (nameRegex.test(name.value)) {

            namemessage.textContent =
                "사용 가능한 이름입니다.";

        } else {

            namemessage.textContent =
                "이름은 한글 2~5자리로 입력하세요.";

        }

    });

    id.addEventListener("input", function() {

        if (id.value == "") {

            idmessage.textContent = "";

        } else if (idRegex.test(id.value)) {

            idmessage.textContent =
                "아이디 형식이 올바릅니다.";

        } else {

            idmessage.textContent =
                "아이디는 영문과 숫자를 포함한 6~12자리로 입력하세요.";

        }

    });

    email.addEventListener("input", function() {

        if (email.value == "") {

            emailmessage.textContent = "";

        } else if (emailRegex.test(email.value)) {

            emailmessage.textContent =
                "이메일 형식이 올바릅니다.";

        } else {

            emailmessage.textContent =
                "올바른 이메일 형식으로 입력하세요.";

        }

    });

    sendEmail.addEventListener("click", function() {


        if (!nameRegex.test(name.value)) {

            alert("이름을 올바르게 입력하세요.");

            name.focus();

            return;

        }


        if (!idRegex.test(id.value)) {

            alert("아이디를 올바르게 입력하세요.");

            id.focus();

            return;

        }


        if (!emailRegex.test(email.value)) {

            alert("이메일을 올바르게 입력하세요.");

            email.focus();

            return;

        }


        $.ajax({

            url:
                "${pageContext.request.contextPath}/sendemail",

            type: "post",

            data: {

                email: email.value

            },

            success: function(result) {

                if (result == "success") {

                    alert("인증번호가 이메일로 전송되었습니다.");

                    $("#email-area").show();

                } else {

                    alert("인증번호 전송에 실패했습니다.");

                }

            },

            error: function() {

                alert("이메일 전송 중 오류가 발생했습니다.");

            }

        });

    });

    verifyEmail.addEventListener("click", function() {


        if (emailCode.value == "") {

            codemessage.textContent =
                "인증번호를 입력하세요.";

            emailCode.focus();

            return;

        }


        $.ajax({

            url:
                "${pageContext.request.contextPath}/verifyemail",

            type: "post",

            data: {

                code: emailCode.value

            },

            success: function(result) {


                if (result == "success") {

                    codemessage.textContent =
                        "이메일 인증이 완료되었습니다.";

                    $.ajax({

                        url:
                            "${pageContext.request.contextPath}/checkuser",

                        type: "post",

                        data: {

                            id: id.value,

                            name: name.value,

                            email: email.value

                        },

                        success: function(result) {


                            if (result == "success") {

                                alert("회원정보가 확인되었습니다.");

                                $("#password-area").show();

                            } else {

                                alert("입력하신 회원정보를 찾을 수 없습니다.");

                            }

                        },

                        error: function() {

                            alert("회원정보 확인 중 오류가 발생했습니다.");

                        }

                    });


                } else {

                    codemessage.textContent =
                        "인증번호가 일치하지 않습니다.";

                }

            },

            error: function() {

                alert("인증번호 확인 중 오류가 발생했습니다.");

            }

        });

    });

    newPw.addEventListener("input", function() {


        if (newPw.value == "") {

            pwcheckmessage.textContent = "";

        } else if (pwRegex.test(newPw.value)) {

            pwcheckmessage.textContent =
                "비밀번호 형식이 올바릅니다.";

        } else {

            pwcheckmessage.textContent =
                "특수문자를 포함한 8자리 이상으로 입력하세요.";

        }

    });

    newpwCheck.addEventListener("input", function() {


        if (newpwCheck.value == "") {

            pwcheck2message.textContent = "";

        } else if (newPw.value == newpwCheck.value) {

            pwcheck2message.textContent =
                "비밀번호가 일치합니다.";

        } else {

            pwcheck2message.textContent =
                "비밀번호가 일치하지 않습니다.";

        }

    });

    changePw.addEventListener("click", function() {

        if (newPw.value == "") {

            pwcheckmessage.textContent =
                "새 비밀번호를 입력하세요.";

            newPw.focus();

            return;

        }

        if (!pwRegex.test(newPw.value)) {

            pwcheckmessage.textContent =
                "특수문자를 포함한 8자리 이상으로 입력하세요.";

            newPw.focus();

            return;

        }

        if (newpwCheck.value == "") {

            pwcheck2message.textContent =
                "비밀번호 확인을 입력하세요.";

            newpwCheck.focus();

            return;

        }

        if (newPw.value != newpwCheck.value) {

            pwcheck2message.textContent =
                "비밀번호가 일치하지 않습니다.";

            newpwCheck.focus();

            return;

        }

        $.ajax({

            url:
                "${pageContext.request.contextPath}/updatepw",

            type: "post",

            data: {

                id: id.value,

                newPw: newPw.value

            },

            success: function(result) {

                if (result == "success") {

                    alert("비밀번호가 변경되었습니다.");

                    location.href =
                        "${pageContext.request.contextPath}/login";

                } else {

                    alert("비밀번호 변경에 실패했습니다.");

                }

            },

            error: function() {

                alert("비밀번호 변경 중 오류가 발생했습니다.");

            }

        });

    });

});

</script>

</body>
</html>