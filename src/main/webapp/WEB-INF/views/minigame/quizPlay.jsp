<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>YA900 야구 퀴즈</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, "Malgun Gothic", sans-serif;
    background: #eef1f8;
    color: #202945;
}

.container {
    width: 90%;
    max-width: 850px;
    margin: 50px auto;
}

.header {
    padding: 28px;
    text-align: center;
    color: white;
    background: linear-gradient(135deg, #0b1026, #171f46);
    border-radius: 16px 16px 0 0;
}

.header h1 {
    margin: 0 0 10px;
    font-size: 28px;
}

.header p {
    margin: 0;
    color: #cbd4f1;
    font-size: 14px;
}

.quiz-card {
    padding: 40px 35px;
    background: white;
    border-radius: 0 0 16px 16px;
    box-shadow: 0 8px 25px rgba(20, 35, 70, 0.08);
}

.progress-info {
    display: flex;
    justify-content: space-between;
    margin-bottom: 12px;
    color: #66718b;
    font-size: 14px;
}

.progress-bar {
    width: 100%;
    height: 8px;
    margin-bottom: 30px;
    overflow: hidden;
    background: #e6eaf3;
    border-radius: 10px;
}

.progress-fill {
    width: 0;
    height: 100%;
    background: #476aaa;
    border-radius: 10px;
    transition: width 0.3s;
}

.question-label {
    margin-bottom: 15px;
    color: #476aaa;
    font-size: 15px;
    font-weight: bold;
    text-align: center;
}

.question-category {
    display: table;
    margin: 0 auto 24px;
    padding: 8px 18px;
    color: #476aaa;
    background: #edf2ff;
    border: 1px solid #d8e3ff;
    border-radius: 20px;
    font-size: 13px;
    font-weight: bold;
}

.question-content {
    min-height: 120px;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
    font-size: 23px;
    font-weight: bold;
    line-height: 1.7;
    text-align: center;
    white-space: pre-wrap;
    word-break: keep-all;
}

.answer-buttons {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin: 25px 0;
}

.answer-btn {
    width: 130px;
    height: 65px;
    border: none;
    border-radius: 12px;
    color: white;
    font-size: 25px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.2s;
}

.answer-btn:hover:not(:disabled) {
    transform: translateY(-3px);
    opacity: 0.9;
}

.answer-btn:disabled {
    opacity: 0.55;
    cursor: not-allowed;
}

.btn-o {
    background: #258b62;
}

.btn-x {
    background: #d94a4a;
}

.result-box {
    display: none;
    padding: 22px;
    margin-top: 20px;
    border-radius: 12px;
    line-height: 1.7;
    white-space: pre-wrap;
    word-break: keep-all;
}

.result-correct {
    display: block;
    color: #176c48;
    background: #e9f8f0;
    border: 1px solid #b9e8cf;
}

.result-wrong {
    display: block;
    color: #a42f2f;
    background: #fff0f0;
    border: 1px solid #f1c6c6;
}

.result-title {
    margin-bottom: 8px;
    font-size: 20px;
    font-weight: bold;
}

.next-area {
    display: flex;
    justify-content: center;
    margin-top: 25px;
}

.next-btn {
    display: none;
    min-width: 180px;
    padding: 14px 25px;
    color: white;
    background: #476aaa;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

.next-btn:hover {
    background: #354f87;
}

.final-card {
    display: none;
}

.final-title {
    margin-bottom: 10px;
    font-size: 28px;
    font-weight: bold;
    text-align: center;
}

.final-score {
    margin: 25px 0;
    color: #476aaa;
    font-size: 36px;
    font-weight: bold;
    text-align: center;
}

.final-message {
    margin-bottom: 25px;
    color: #66718b;
    text-align: center;
}

.summary-item {
    padding: 20px;
    margin-bottom: 15px;
    border: 1px solid #e0e5ef;
    border-radius: 10px;
}

.summary-category {
    display: inline-block;
    padding: 5px 11px;
    margin-bottom: 10px;
    color: #476aaa;
    background: #edf2ff;
    border-radius: 15px;
    font-size: 12px;
    font-weight: bold;
}

.summary-question {
    margin-bottom: 12px;
    font-size: 16px;
    font-weight: bold;
    line-height: 1.6;
    white-space: pre-wrap;
    word-break: keep-all;
}

.summary-answer {
    margin: 6px 0;
    font-size: 14px;
    line-height: 1.6;
}

.summary-correct {
    color: #258b62;
    font-weight: bold;
}

.summary-wrong {
    color: #d94a4a;
    font-weight: bold;
}

.summary-explanation {
    padding: 12px;
    margin-top: 12px;
    color: #58637a;
    background: #f5f7fb;
    border-radius: 7px;
    font-size: 14px;
    line-height: 1.7;
    white-space: pre-wrap;
    word-break: keep-all;
}

.bottom-area {
    margin-top: 25px;
    text-align: center;
}

.back-btn {
    display: inline-block;
    padding: 12px 22px;
    color: #476aaa;
    background: white;
    border: 1px solid #476aaa;
    border-radius: 8px;
    text-decoration: none;
    font-size: 14px;
    font-weight: bold;
}

.back-btn:hover {
    color: white;
    background: #476aaa;
}

.quiz-source {
    display: none;
}

@media (max-width: 600px) {
    .container {
        width: 94%;
        margin: 20px auto;
    }

    .quiz-card {
        padding: 25px 18px;
    }

    .question-content {
        font-size: 19px;
    }

    .answer-btn {
        width: 110px;
    }
}
</style>
</head>

<body>

<div class="container">

    <div class="header">
        <h1>YA900 야구 퀴즈</h1>
        <p>야구 상식 OX 퀴즈에 도전하세요!</p>
    </div>

    <div class="quiz-card">

        <!-- 퀴즈 진행 화면 -->
        <div id="quizArea">

            <div class="progress-info">
                <span id="questionNumber">문제 1 / 10</span>
                <span id="progressPercent">0%</span>
            </div>

            <div class="progress-bar">
                <div class="progress-fill" id="progressFill"></div>
            </div>

            <div class="question-label" id="questionLabel">QUESTION 01</div>

            <div class="question-category" id="questionCategory">일반</div>

            <div class="question-content" id="questionContent"></div>

            <div class="answer-buttons">
                <button type="button" class="answer-btn btn-o"
                    id="answerO" onclick="selectAnswer('O')">O</button>

                <button type="button" class="answer-btn btn-x"
                    id="answerX" onclick="selectAnswer('X')">X</button>
            </div>

            <div class="result-box" id="resultBox"></div>

            <div class="next-area">
                <button type="button" class="next-btn" id="nextBtn"
                    onclick="nextQuestion()">다음 문제</button>
            </div>

        </div>

        <!-- 최종 결과 화면 -->
        <div class="final-card" id="finalCard">

            <div class="final-title">퀴즈 완료!</div>

            <div class="final-score" id="finalScore"></div>

            <div class="final-message" id="finalMessage"></div>

            <h3>전체 문제 및 정답 확인</h3>

            <div id="summaryList"></div>

            <div class="bottom-area">
                <a href="${pageContext.request.contextPath}/quiz"
                    class="back-btn">퀴즈 메인으로</a>
            </div>

        </div>

    </div>

</div>

<!-- 서버에서 전달받은 퀴즈 데이터 -->
<div class="quiz-source" id="quizSource">

    <c:forEach var="quiz" items="${list}">

        <div class="source-question" data-quiz-id="${quiz.quiz_id}">

            <div class="source-content">
                <c:out value="${quiz.quiz_contents}" />
            </div>

            <div class="source-answer">
                <c:out value="${quiz.answer}" />
            </div>

            <div class="source-explanation">
                <c:out value="${quiz.explanation}" />
            </div>

            <div class="source-category">
                <c:out value="${quiz.category}" />
            </div>

        </div>

    </c:forEach>

</div>

<script>
    /* 서버에서 받은 퀴즈 목록을 JavaScript 배열로 변환 */
    const sourceElements = document.querySelectorAll(".source-question");

    const questions = Array.from(sourceElements).map(function(item) {
        return {
            quiz_id: Number(item.dataset.quizId),
            contents: item.querySelector(".source-content").textContent.trim(),
            answer: item.querySelector(".source-answer").textContent.trim().toUpperCase(),
            explanation: item.querySelector(".source-explanation").textContent.trim(),
            category: item.querySelector(".source-category").textContent.trim()
        };
    });

    /* 사용자 답안 저장 */
    const userAnswers = new Array(questions.length).fill(null);

    let currentIndex = 0;

    /* 결과 저장 중복 호출 방지 */
    let isSavingResult = false;
    let isResultSaved = false;

    /* 화면 요소 */
    const questionNumber = document.getElementById("questionNumber");
    const progressPercent = document.getElementById("progressPercent");
    const progressFill = document.getElementById("progressFill");
    const questionLabel = document.getElementById("questionLabel");
    const questionCategory = document.getElementById("questionCategory");
    const questionContent = document.getElementById("questionContent");
    const answerO = document.getElementById("answerO");
    const answerX = document.getElementById("answerX");
    const resultBox = document.getElementById("resultBox");
    const nextBtn = document.getElementById("nextBtn");

    /* 첫 문제 표시 */
    function renderQuestion() {

        if (questions.length === 0) {
            document.getElementById("quizArea").innerHTML =
                "<p style='text-align:center;'>출제할 문제가 없습니다.</p>";
            return;
        }

        const question = questions[currentIndex];
        const questionCount = currentIndex + 1;
        const progress = Math.round(questionCount / questions.length * 100);

        questionNumber.textContent =
            "문제 " + questionCount + " / " + questions.length;

        progressPercent.textContent = progress + "%";
        progressFill.style.width = progress + "%";

        questionLabel.textContent =
            "QUESTION " + String(questionCount).padStart(2, "0");

        questionCategory.textContent = question.category || "일반";
        questionContent.textContent = question.contents;

        /* 다음 문제를 위해 버튼과 결과 영역 초기화 */
        answerO.disabled = false;
        answerX.disabled = false;

        resultBox.className = "result-box";
        resultBox.textContent = "";

        nextBtn.style.display = "none";

        if (questionCount === questions.length) {
            nextBtn.textContent = "최종 결과 확인";
        } else {
            nextBtn.textContent = "다음 문제";
        }
    }

    /* O/X 답안 선택 */
    function selectAnswer(selectedAnswer) {

        /* 중복 선택 방지 */
        if (userAnswers[currentIndex] !== null) {
            return;
        }

        const question = questions[currentIndex];

        userAnswers[currentIndex] = selectedAnswer;

        answerO.disabled = true;
        answerX.disabled = true;

        const isCorrect = selectedAnswer === question.answer;

        if (isCorrect) {
            resultBox.className = "result-box result-correct";
            resultBox.textContent =
                "정답입니다!\n\n내가 선택한 답: " + selectedAnswer;
        } else {
            resultBox.className = "result-box result-wrong";
            resultBox.textContent =
                "아쉽지만 오답입니다.\n\n" +
                "내가 선택한 답: " + selectedAnswer +
                "\n정답: " + question.answer +
                "\n\n해설: " +
                (question.explanation || "등록된 해설이 없습니다.");
        }

        nextBtn.style.display = "inline-block";
    }

    /* 다음 문제로 이동 */
    function nextQuestion() {

        if (userAnswers[currentIndex] === null) {
            return;
        }

        if (currentIndex < questions.length - 1) {
            currentIndex++;
            renderQuestion();
        } else {
            showFinalResult();
        }
    }

    /* 전체 결과 표시 */
    function showFinalResult() {

        /* 문제가 없거나 모든 답안을 입력하지 않았다면 종료 */
        if (questions.length === 0 ||
            userAnswers.some(function(answer) {
                return answer === null;
            })) {
            return;
        }

        /* 최종 결과 화면 표시 */
        document.getElementById("quizArea").style.display = "none";
        document.getElementById("finalCard").style.display = "block";

        let correctCount = 0;

        questions.forEach(function(question, index) {
            if (userAnswers[index] === question.answer) {
                correctCount++;
            }
        });

        document.getElementById("finalScore").textContent =
            correctCount + " / " + questions.length;

        const scorePercent = Math.round(
            correctCount / questions.length * 100
        );

        let message = "";

        if (scorePercent === 100) {
            message = "완벽합니다! 야구 상식왕이네요!";
        } else if (scorePercent >= 80) {
            message = "대단합니다! 야구 지식이 풍부하네요!";
        } else if (scorePercent >= 60) {
            message = "잘했습니다! 조금만 더 공부하면 되겠어요!";
        } else {
            message = "아쉽네요! 해설을 확인하고 다시 도전해 보세요!";
        }

        document.getElementById("finalMessage").textContent =
            message + " (정답률 " + scorePercent + "%)";

        const summaryList = document.getElementById("summaryList");

        summaryList.replaceChildren();

        /* 각 문제의 결과를 화면에 출력 */
        questions.forEach(function(question, index) {

            const isCorrect = userAnswers[index] === question.answer;

            const item = document.createElement("div");
            item.className = "summary-item";

            const category = document.createElement("div");
            category.className = "summary-category";
            category.textContent = question.category || "일반";
            item.appendChild(category);

            const title = document.createElement("div");
            title.className = "summary-question";
            title.textContent =
                "문제 " + (index + 1) + ". " + question.contents;
            item.appendChild(title);

            const userAnswer = document.createElement("div");
            userAnswer.className = "summary-answer";
            userAnswer.textContent =
                "내가 선택한 답: " + userAnswers[index];
            item.appendChild(userAnswer);

            const correctAnswer = document.createElement("div");
            correctAnswer.className = "summary-answer";
            correctAnswer.textContent = "정답: " + question.answer;
            item.appendChild(correctAnswer);

            const result = document.createElement("div");
            result.className = isCorrect
                ? "summary-answer summary-correct"
                : "summary-answer summary-wrong";
            result.textContent = isCorrect ? "정답" : "오답";
            item.appendChild(result);

            const explanation = document.createElement("div");
            explanation.className = "summary-explanation";
            explanation.textContent =
                "해설: " +
                (question.explanation || "등록된 해설이 없습니다.");
            item.appendChild(explanation);

            summaryList.appendChild(item);

            /*
             * 주의:
             * 이 반복문 안에서는 결과를 저장하지 않는다.
             * 이곳에서는 화면에 문제별 결과만 출력한다.
             */
        });

        /*
         * 중요!
         * 반복문이 모두 끝난 후 결과를 딱 한 번 저장한다.
         */
        saveQuizResult();
    }

    /* 퀴즈 결과를 서버로 전송 */
    function saveQuizResult() {

        /* 저장 중이거나 이미 저장했다면 재요청하지 않는다. */
        if (isSavingResult || isResultSaved) {
            return;
        }

        isSavingResult = true;

        const formData = new URLSearchParams();

        /* 문제 ID와 사용자 답안을 각각 전송 */
        questions.forEach(function(question, index) {
            formData.append("quizIds", question.quiz_id);
            formData.append("userAnswers", userAnswers[index]);
        });

        fetch("${pageContext.request.contextPath}/quiz/submit", {
            method: "POST",
            headers: {
                "Content-Type":
                    "application/x-www-form-urlencoded; charset=UTF-8"
            },
            body: formData.toString()
        })
        .then(function(response) {

            if (!response.ok) {
                throw new Error(
                    "결과 저장에 실패했습니다. 상태 코드: " +
                    response.status
                );
            }

            return response.text();
        })
        .then(function(message) {

            if (message.trim() !== "OK") {
                throw new Error(message);
            }

            isResultSaved = true;
            console.log("퀴즈 결과 저장 완료");
        })
        .catch(function(error) {

            console.error("퀴즈 결과 저장 오류:", error);
            alert("퀴즈 결과 저장에 실패했습니다. 다시 확인해 주세요.");
        })
        .finally(function() {
            isSavingResult = false;
        });
    }

    /* 페이지 로딩 시 첫 문제 출력 */
    renderQuestion();
</script>

</body>
</html>