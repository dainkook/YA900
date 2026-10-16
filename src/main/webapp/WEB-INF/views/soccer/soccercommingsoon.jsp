<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>YA900 | Coming Soon</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: "Arial Black", "Malgun Gothic", sans-serif;
        background: #111936;
        color: #fff;
        min-height: 100vh;
        overflow: hidden;
    }

    a {
        color: inherit;
        text-decoration: none;
    }

    /* HEADER */
    .header {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 90px;
        padding: 0 5%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        z-index: 5;
    }

    .logo {
        font-family: "Malgun Gothic", sans-serif;
        font-size: 27px;
        font-weight: 900;
        letter-spacing: -1.5px;
        cursor:pointer;
    }

    .logo span {
        color: #819de0;
    }

    .back-link {
        font-family: "Malgun Gothic", sans-serif;
        font-size: 12px;
        color: #aeb7ca;
        transition: color .2s;
    }

    .back-link:hover {
        color: #fff;
    }

    /* FULL SCREEN TYPOGRAPHY */
    .hero {
        min-height: 100svh;
        width: 100%;
        position: relative;
        display: flex;
        flex-direction: column;
        justify-content: center;
        overflow: hidden;
        background:
            radial-gradient(ellipse at 75% 45%, rgba(71,106,170,.19), transparent 45%),
            linear-gradient(135deg, #111936 0%, #171f46 60%, #202b58 100%);
    }

    .hero::before {
        content: "YA900";
        position: absolute;
        right: -2%;
        bottom: -12%;
        font-family: Arial, sans-serif;
        font-size: clamp(180px, 35vw, 500px);
        font-weight: 900;
        letter-spacing: -0.09em;
        line-height: 1;
        color: rgba(255,255,255,.025);
        pointer-events: none;
    }

    .top-label {
        position: absolute;
        top: 18%;
        left: 5.5%;
        font-family: "Malgun Gothic", sans-serif;
        color: #9cadd7;
        font-size: 11px;
        font-weight: 700;
        letter-spacing: 4px;
    }

    .top-label::before {
        content: "";
        display: inline-block;
        width: 24px;
        height: 2px;
        margin: 0 12px 3px 0;
        background: #819de0;
    }

    .headline {
        position: relative;
        z-index: 1;
        width: 100%;
        padding: 0 4.5%;
        font-family: Arial, Helvetica, sans-serif;
        font-size: clamp(65px, 14.2vw, 215px);
        font-weight: 900;
        line-height: .79;
        letter-spacing: -.085em;
        text-transform: uppercase;
    }

    .headline .coming {
        display: block;
        white-space: nowrap;
        color: #f5f6f8;
    }

    .headline .soon {
        display: block;
        white-space: nowrap;
        margin-top: .12em;
        text-align: right;
        padding-right: 1%;
        color: transparent;
        -webkit-text-stroke: 2px #819de0;
    }

    .headline .soon span {
        color: #819de0;
        -webkit-text-stroke: 0;
    }

    .bottom-info {
        position: absolute;
        left: 5.5%;
        right: 5.5%;
        bottom: 7%;
        display: flex;
        align-items: flex-end;
        justify-content: space-between;
        gap: 20px;
        font-family: "Malgun Gothic", sans-serif;
    }

    .bottom-info p {
        color: #aeb7ca;
        font-size: 12px;
        line-height: 1.9;
        letter-spacing: .2px;
    }

    .bottom-info strong {
        color: #fff;
        font-weight: 700;
    }

    .bottom-right {
        display: flex;
        align-items: center;
        gap: 12px;
        color: #9cadd7;
        font-size: 10px;
        font-weight: 700;
        letter-spacing: 2px;
        white-space: nowrap;
    }

    .status-dot {
        width: 7px;
        height: 7px;
        border-radius: 50%;
        background: #819de0;
        box-shadow: 0 0 12px rgba(129,157,224,.7);
    }

    /* SUBTLE ANIMATION */
    .coming {
        animation: reveal .8s ease-out both;
    }

    .soon {
        animation: reveal .8s .15s ease-out both;
    }

    @keyframes reveal {
        from {
            opacity: 0;
            transform: translateY(22px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @media (min-width: 1500px) {
        .headline {
            font-size: 215px;
        }
    }

    @media (max-width: 700px) {
        .header {
            height: 75px;
            padding: 0 6%;
        }

        .logo {
            font-size: 24px;
        }

        .top-label {
            top: 25%;
            left: 6%;
            font-size: 9px;
            letter-spacing: 2px;
        }

        .headline {
            padding: 0 5%;
            font-size: 14vw;
            letter-spacing: -.075em;
        }

        .headline .soon {
            -webkit-text-stroke-width: 1px;
        }

        .bottom-info {
            left: 6%;
            right: 6%;
            bottom: 6%;
            align-items: flex-start;
            flex-direction: column;
            gap: 18px;
        }

        .bottom-info p {
            font-size: 11px;
        }

        .bottom-right {
            font-size: 9px;
        }
    }

    @media (max-width: 380px) {
        .headline {
            font-size: 13.5vw;
        }
    }
</style>
</head>

<body>

<header class="header">
    <div class="logo" onclick="location.href='/'">YA900</div>

    <a href="${pageContext.request.contextPath}/" class="back-link">
        ← BACK TO HOME
    </a>
</header>

<main class="hero">

    <div class="top-label">A NEW GAME IS COMING</div>

    <h1 class="headline">
        <span class="coming">COMING</span>
        <span class="soon">S<span>O</span>ON.</span>
    </h1>

    <div class="bottom-info">
        <p>
            새로운 스포츠의 시작.<br>
            <strong>YA900 FOOTBALL</strong> — 준비 중입니다.
        </p>

        <div class="bottom-right">
            <span class="status-dot"></span>
            SOMETHING BIG IS COMING
        </div>
    </div>

</main>

</body>
</html>