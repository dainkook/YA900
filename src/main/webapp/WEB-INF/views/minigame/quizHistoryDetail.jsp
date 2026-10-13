<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>YA900 퀴즈 상세 기록</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    min-height: 100vh;
    font-family: Arial, "Malgun Gothic", sans-serif;
    color: #202945;
    background: #eef1f8;
}

.header {
    height: 85px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 5%;
    color: white;
    background: linear-gradient(135deg, #0b1026, #171f46);
    border-bottom: 1px solid #303b70;
}

.logo {
    color: white;
    font-size: 28px;
    font-weight: bold;
    text-decoration: none;
}

.header-link {
    padding: 10px 16px;
    color: white;
    border: 1px solid #7180b1;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px;
}

.header-link:hover {
    background: #476aaa;
}

.container {
    width: 92%;
    max-width: 1000px;
    margin: 45px auto;
}

.page-title {
    margin-bottom: 25px;
}

.page-title h1 {
    margin: 0 0 10px;
    font-size: 27px;
}

.page-title p {
    margin: 0;
    color: #69748b;
    font-size: 14px;
}

.summary {
    margin-bottom: 22px;
    padding: 20px 25px;
    background: white;
    border: 1px solid #e1e5ef;
    border-radius: 10px;
}

.summary strong {
    color: #476aaa;
}

.question-card {
    margin-bottom: 18px;
    padding: 25px;
    background: white;
    border: 1px solid #e1e5ef;
    border-radius: 10px;
    box-shadow: 0 4px 14px rgba(20, 35, 70, 0.04);
}

.question-top {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    margin-bottom: 18px;
}

.question-number {
    color: #476aaa;
    font-weight: bold;
}

.category {
    padding: 5px 10px;
    color: #536078;
    background: #f0f3f9;
    border-radius: 15px;
    font-size: 12px;
}

.question-content {
    margin-bottom: 22px;
    font-size: 17px;
    font-weight: bold;
    line-height: 1.7;
    overflow-wrap: anywhere;
}

.answer-row {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-bottom: 15px;
}

.answer-box {
    flex: 1;
    min-width: 150px;
    padding: 14px;
    background: #f7f8fc;
    border-radius: 7px;
    line-height: 1.7;
}

.answer-label {
    display: block;
    margin-bottom: 5px;
    color: #69748b;
    font-size: 12px;
}

.answer-value {
    font-weight: bold;
}

.correct {
    color: #28784c;
}

.wrong {
    color: #c34747;
}

.result-badge {
    display: inline-block;
    padding: 6px 12px;
    border-radius: 5px;
    font-size: 13px;
    font-weight: bold;
}

.result-correct {
    color: #28784c;
    background: #e6f6ed;
}

.result-wrong {
    color: #c34747;
    background: #fff0f0;
}

.explanation {
    margin-top: 18px;
    padding: 16px;
    background: #f5f7fb;
    border-left: 4px solid #476aaa;
    border-radius: 4px;
    line-height: 1.8;
    overflow-wrap: anywhere;
}

.explanation-title {
    margin-bottom: 7px;
    color: #35405a;
    font-weight: bold;
}

.bottom-area {
    margin-top: 30px;
    text-align: center;
}

.back-btn {
    display: inline-block;
    padding: 12px 22px;
    color: white;
    background: #476aaa;
    border-radius: 7px;
    text-decoration: none;
    font-size: 14px;
    font-weight: bold;
}

.back-btn:hover {
    background: #354f87;
}

.site-footer {
    margin-top: 70px;
    padding: 25px;
    color: #778198;
    text-align: center;
    font-size: 12px;
    border-top: 1px solid #d8deea;
}

@media (max-width: 600px) {
    .header {
        height: 75px;
        padding: 0 18px;
    }

    .logo {
        font-size: 23px;
    }

    .container {
        width: 94%;
        margin: 30px auto;
    }

    .page-title h1 {
        font-size: 23px;
    }

    .question-card {
        padding: 18px;
    }

    .question-content {
        font-size: 15px;
    }
}
</style>
</head>

<body>

<header class="header">
    <a class="logo" href="${pageContext.request.contextPath}/">YA900</a>

    <a class="header-link"
       href="${pageContext.request.contextPath}/quiz/history">
        전체 기록
    </a>
</header>

<main class="container">

    <section class="page-title">
        <h1>퀴즈 상세 기록</h1>
        <p>이번 회차에서 풀었던 문제와 정답, 해설을 확인하세요.</p>
    </section>

    <section class="summary">
        <strong>기록 번호:</strong>
        <c:out value="${resultId}" />
        <span> · </span>
        <strong>총 문제 수:</strong>
        ${detailList.size()}문제
    </section>

    <c:forEach var="detail" items="${detailList}" varStatus="status">

        <section class="question-card">

            <div class="question-top">
                <span class="question-number">
                    문제 ${status.count}
                </span>

                <c:if test="${not empty detail.category}">
                    <span class="category">
                        <c:out value="${detail.category}" />
                    </span>
                </c:if>
            </div>

            <div class="question-content">
                <c:out value="${detail.quizContents}" />
            </div>

            <div class="answer-row">

                <div class="answer-box">
                    <span class="answer-label">내가 선택한 답</span>
                    <span class="answer-value">
                        <c:choose>
                            <c:when test="${not empty detail.userAnswer}">
                                <c:out value="${detail.userAnswer}" />
                            </c:when>
                            <c:otherwise>미응답</c:otherwise>
                        </c:choose>
                    </span>
                </div>

                <div class="answer-box">
                    <span class="answer-label">정답</span>
                    <span class="answer-value correct">
                        <c:out value="${detail.correctAnswer}" />
                    </span>
                </div>

            </div>

            <div>
                <c:choose>
                    <c:when test="${detail.isCorrect == 1}">
                        <span class="result-badge result-correct">
                            정답
                        </span>
                    </c:when>

                    <c:otherwise>
                        <span class="result-badge result-wrong">
                            오답
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="explanation">
                <div class="explanation-title">해설</div>

                <c:choose>
                    <c:when test="${not empty detail.explanation}">
                        <c:out value="${detail.explanation}" />
                    </c:when>

                    <c:otherwise>
                        등록된 해설이 없습니다.
                    </c:otherwise>
                </c:choose>
            </div>

        </section>

    </c:forEach>

    <div class="bottom-area">
        <a class="back-btn"
           href="${pageContext.request.contextPath}/quiz/history">
            전체 기록으로 돌아가기
        </a>
    </div>

</main>

<footer class="site-footer">
    YA900
</footer>

</body>
</html>