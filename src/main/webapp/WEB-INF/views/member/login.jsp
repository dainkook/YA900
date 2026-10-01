<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    font-family: Arial, sans-serif;
    color: #222;
}


/* =========================
   HEADER
========================= */

.header {
    width: 100%;
    height: 100px;

    display: flex;
    align-items: center;

    padding: 0 50px;

    border-bottom: 1px solid #999;
    background: white;
}

.logo {
    font-size: 30px;
    font-weight: bold;
}


/* =========================
   LOGIN
========================= */

.login-container {
    width: 100%;
    min-height: 650px;

    display: flex;
    justify-content: center;
    align-items: center;
}

.login-box {
    width: 400px;

    border: 1px solid black;

    padding: 40px;
}

.login-title {
    text-align: center;

    margin: 0 0 30px;
}


/* 입력칸 */

.login-input {
    width: 100%;
    height: 45px;

    border: 1px solid #999;

    padding: 0 12px;

    margin-bottom: 10px;

    font-size: 14px;
}


/* 로그인 상태 유지 */

.login-option {
    margin: 10px 0 20px;

    font-size: 14px;
}

.login-option input {
    margin-right: 5px;
}


/* 로그인 버튼 */

.login-btn {
    width: 100%;
    height: 45px;

    background: black;
    color: white;

    border: none;
    border-radius: 5px;

    cursor: pointer;

    font-size: 15px;
}

.login-btn:hover {
    background: #666;
}


/* =========================
   링크
========================= */

.login-links {
    margin-top: 20px;

    text-align: center;

    font-size: 13px;
}

.login-links a {
    color: #555;

    text-decoration: none;

    margin: 0 8px;
}

.login-links a:hover {
    text-decoration: underline;
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
     LOGIN
========================= -->

<main class="login-container">

    <div class="login-box">

        <h2 class="login-title">
            로그인
        </h2>

        <form action="/login" method="post">
        <!-- 아이디 -->

        <input
            type="text"
            class="login-input"
            id="id"
            name="id"
            placeholder="아이디">


        <!-- 비밀번호 -->

        <input
            type="password"
            class="login-input"
            id="pw"
            name="pw"
            placeholder="비밀번호">


        <!-- 로그인 상태 유지 -->

        <div class="login-option">

            <label>
                <input type="checkbox">
                로그인 상태 유지
            </label>

        </div>


        <!-- 로그인 버튼 -->

        <button
            type="submit"
            class="login-btn">

            로그인

        </button>
        </form>

        <!-- 링크 -->

        <div class="login-links">

           <a href="${pageContext.request.contextPath}/finduserid">
    		아이디 찾기
			</a>

            |

            <a href="${pageContext.request.contextPath}/findPw.jsp">
                비밀번호 찾기
            </a>

            |

            <a href="${pageContext.request.contextPath}/signup">
            회원가입    
            </a>

        </div>

    </div>

</main>



<!-- =========================
     FOOTER
========================= -->

<footer class="footer">

    개인정보처리방침　|　전체 서비스　|　문제 신고　|　고객센터

</footer>


</body>
</html>