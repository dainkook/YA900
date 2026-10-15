
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

@media ( max-width : 600px) {
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

/* 기존 퀴즈 이어하기 안내창 */
.resume-overlay {
	position: fixed;
	inset: 0;
	z-index: 9999;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
	background: rgba(11, 16, 38, 0.7);
}

.resume-modal {
	width: 100%;
	max-width: 420px;
	padding: 32px 25px;
	background: white;
	border-radius: 16px;
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
	text-align: center;
}

.resume-modal h2 {
	margin: 0 0 15px;
	color: #202945;
	font-size: 23px;
}

.resume-modal p {
	margin: 0 0 25px;
	color: #66718b;
	line-height: 1.8;
}

.resume-buttons {
	display: flex;
	justify-content: center;
	gap: 12px;
}

.resume-btn {
	flex: 1;
	padding: 13px 10px;
	border: none;
	border-radius: 8px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}

.resume-continue {
	color: white;
	background: #476aaa;
}

.resume-continue:hover {
	background: #354f87;
}

.resume-exit {
	color: #476aaa;
	background: white;
	border: 1px solid #476aaa;
}

.resume-exit:hover {
	background: #edf2ff;
}
</style>
</head>

<body>

	<div class="container">

		<%-- 기존 퀴즈 이어하기 안내창 --%>
		<c:if test="${resumeAttempt}">
			<div class="resume-overlay" id="resumeOverlay">
				<div class="resume-modal">
					<h2>이어서 진행할까요?</h2>

					<p>
						이전에 진행하던 퀴즈가 있습니다. <br> 이어서
						진행하시겠습니까?
					</p>

					<div class="resume-buttons">
						<button type="button" class="resume-btn resume-continue"
							onclick="continueQuiz()">이어하기</button>

						<button type="button" class="resume-btn resume-exit"
							onclick="exitQuiz()">나가기</button>
					</div>
				</div>
			</div>
		</c:if>
		<div class="header">
			<h1>YA900 야구 퀴즈</h1>
			<p>야구 상식 OX 퀴즈에 도전하세요!</p>
		</div>

		<div class="quiz-card">

			<%-- 퀴즈 진행 화면 --%>
			<div id="quizArea">

				<div class="progress-info">
					<span id="questionNumber">문제 1 / 10</span> <span
						id="progressPercent">0%</span>
				</div>

				<div class="progress-bar">
					<div class="progress-fill" id="progressFill"></div>
				</div>

				<div class="question-label" id="questionLabel">QUESTION 01</div>
				<div class="question-category" id="questionCategory">일반</div>
				<div class="question-content" id="questionContent"></div>

				<div class="answer-buttons">
					<button type="button" class="answer-btn btn-o" id="answerO"
						onclick="selectAnswer('O')">O</button>

					<button type="button" class="answer-btn btn-x" id="answerX"
						onclick="selectAnswer('X')">X</button>
				</div>

				<div class="result-box" id="resultBox"></div>

				<div class="next-area">
					<button type="button" class="next-btn" id="nextBtn"
						onclick="nextQuestion()">다음 문제</button>
				</div>

			</div>

			<%-- 최종 결과 화면 --%>
			<div class="final-card" id="finalCard">

				<div class="final-title">퀴즈 완료!</div>
				<div class="final-score" id="finalScore"></div>
				<div class="final-message" id="finalMessage"></div>

				<h3>전체 문제 및 정답 확인</h3>
				<div id="summaryList"></div>

				<div class="bottom-area">
					<a href="${pageContext.request.contextPath}/quiz" class="back-btn">퀴즈
						메인으로</a>
				</div>

			</div>
		</div>
	</div>

	<%-- 서버에서 전달받은 퀴즈 데이터 --%>
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

	<%-- 서버에서 전달받은 진행 기록 및 답안 --%>
	<script id="savedAnswersData" type="application/json">
[
<c:forEach var="detail" items="${attemptDetails}" varStatus="status">
    {
        "quizId": ${detail.quiz_id},
        "questionOrder": ${detail.question_order},
        "selectedAnswer": <c:choose><c:when test="${detail.selected_answer eq 'O' or detail.selected_answer eq 'X'}">"${detail.selected_answer}"</c:when><c:otherwise>null</c:otherwise></c:choose>
    }<c:if test="${!status.last}">,</c:if>
</c:forEach>
]
</script>

	<script>
/* 서버에서 전달받은 퀴즈 목록을 JavaScript 배열로 변환 */
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

/* 서버에서 전달받은 진행 기록 정보 */
const contextPath = "${pageContext.request.contextPath}";
const attemptId = Number("${attemptId}");
const serverCurrentQuestion = Number("${currentQuestion}");
const savedAnswers = JSON.parse(
    document.getElementById("savedAnswersData").textContent
);

/* 사용자 답안 배열 초기화 */
const userAnswers = new Array(questions.length).fill(null);

/* DB에 저장된 답안을 문제 순서에 맞게 복원 */
savedAnswers.forEach(function(item) {
    const index = Number(item.questionOrder) - 1;

    if (
        index >= 0 &&
        index < questions.length &&
        questions[index].quiz_id === Number(item.quizId) &&
        (item.selectedAnswer === "O" || item.selectedAnswer === "X")
    ) {
        userAnswers[index] = item.selectedAnswer;
    }
});

/* 현재 문제 번호는 DB에서 1부터 시작하므로 배열 인덱스는 1을 뺀다 */
let currentIndex = Number.isInteger(serverCurrentQuestion)
    ? serverCurrentQuestion - 1
    : 0;

if (currentIndex < 0 || currentIndex >= questions.length) {
    currentIndex = 0;
}

/* 결과 저장 중복 호출 방지 */
let isSavingAnswer = false;
let isMovingQuestion = false;
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

/* 서버에 폼 데이터를 전송하는 공통 함수 */
async function postForm(url, values) {
    const formData = new URLSearchParams();

    Object.keys(values).forEach(function(key) {
        formData.append(key, values[key]);
    });

    const response = await fetch(contextPath + url, {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: formData.toString()
    });

    if (!response.ok) {
        throw new Error("서버 요청 실패: HTTP " + response.status);
    }

    const message = await response.text();

    if (message.trim() !== "OK") {
        throw new Error(message || "서버에서 요청을 처리하지 못했습니다.");
    }

    return message;
}

/* 정답 결과를 화면에 표시 */
function displayAnswerResult(index) {
    const selectedAnswer = userAnswers[index];

    if (selectedAnswer === null) {
        return;
    }

    const question = questions[index];
    const isCorrect = selectedAnswer === question.answer;

    answerO.disabled = true;
    answerX.disabled = true;

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
    nextBtn.textContent = index === questions.length - 1
        ? "최종 결과 확인"
        : "다음 문제";
}

/* 현재 문제 표시 및 저장된 답안 복원 */
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

    answerO.disabled = false;
    answerX.disabled = false;

    resultBox.className = "result-box";
    resultBox.textContent = "";
    nextBtn.style.display = "none";

    /* 이미 답한 문제라면 선택 결과를 다시 표시 */
    if (userAnswers[currentIndex] !== null) {
        displayAnswerResult(currentIndex);
    }
}

/* O/X 답안 선택 및 즉시 DB 저장 */
async function selectAnswer(selectedAnswer) {
    if (
        isSavingAnswer ||
        userAnswers[currentIndex] !== null
    ) {
        return;
    }

    isSavingAnswer = true;
    answerO.disabled = true;
    answerX.disabled = true;

    const questionOrder = currentIndex + 1;

    try {
        /* 서버 저장이 성공한 후에 답안을 확정한다 */
        await postForm("/quiz/answer", {
            attemptId: attemptId,
            questionOrder: questionOrder,
            selectedAnswer: selectedAnswer
        });

        userAnswers[currentIndex] = selectedAnswer;
        displayAnswerResult(currentIndex);

    } catch (error) {
        console.error("답안 저장 오류:", error);
        alert("답안을 저장하지 못했습니다. 다시 선택해 주세요.");

        answerO.disabled = false;
        answerX.disabled = false;
    } finally {
        isSavingAnswer = false;
    }
}

/* 다음 문제로 이동하고 진행 위치 저장 */
async function nextQuestion() {
    if (
        isMovingQuestion ||
        userAnswers[currentIndex] === null
    ) {
        return;
    }

    isMovingQuestion = true;
    nextBtn.disabled = true;

    try {
        /* 마지막 문제가 아니라면 다음 문제 위치를 DB에 저장 */
        if (currentIndex < questions.length - 1) {
            const nextQuestionNumber = currentIndex + 2;

            await postForm("/quiz/progress", {
                attemptId: attemptId,
                currentQuestion: nextQuestionNumber
            });

            currentIndex++;
            renderQuestion();

        } else {
            await showFinalResult();
        }

    } catch (error) {
        console.error("진행 위치 저장 오류:", error);
        alert("진행 상황을 저장하지 못했습니다. 다시 시도해 주세요.");
    } finally {
        isMovingQuestion = false;
        nextBtn.disabled = false;
    }
}

/* 최종 결과 표시 및 제출 */
async function showFinalResult() {
    if (
        questions.length === 0 ||
        userAnswers.some(function(answer) {
            return answer === null;
        })
    ) {
        return;
    }

    /* 결과를 먼저 서버에 저장 */
    await saveQuizResult();

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

    /* 각 문제의 결과와 해설 출력 */
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
    });
}

/* 퀴즈 결과를 기존 서버 제출 경로로 전송 */
async function saveQuizResult() {
    if (isSavingResult || isResultSaved) {
        return;
    }

    isSavingResult = true;

    try {
        const formData = new URLSearchParams();

        formData.append("attemptId", attemptId);

        questions.forEach(function(question, index) {
            formData.append("quizIds", question.quiz_id);
            formData.append("userAnswers", userAnswers[index]);
        });

        const response = await fetch(contextPath + "/quiz/submit", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
            },
            body: formData.toString()
        });

        if (!response.ok) {
            throw new Error("결과 저장 실패: HTTP " + response.status);
        }

        const message = await response.text();

        if (message.trim() !== "OK") {
            throw new Error(message || "결과 저장에 실패했습니다.");
        }

        isResultSaved = true;
        console.log("퀴즈 결과 저장 완료");

    } finally {
        isSavingResult = false;
    }
}


/* 기존 퀴즈인지 확인 */
const isResumeAttempt = "${resumeAttempt}" === "true";

/* 이어하기 선택 */
function continueQuiz() {
    const overlay = document.getElementById("resumeOverlay");

    if (overlay) {
        overlay.style.display = "none";
    }

    renderQuestion();
}

/* 나가기 선택 */
function exitQuiz() {
    location.href = contextPath + "/quiz";
}

/* 페이지 로딩 시 실행 */
if (isResumeAttempt) {
    // 기존 기록이 있으면 안내창에서 선택할 때까지 대기
    // renderQuestion()은 이어하기를 눌렀을 때 실행
} else {
    // 새 퀴즈는 바로 시작
    renderQuestion();
}

</script>

</body>
</html>