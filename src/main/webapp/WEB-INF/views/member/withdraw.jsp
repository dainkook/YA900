<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        font-family: Arial, sans-serif;
        background: #f2f3f5;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .withdraw-container {
        width: 50%;
        min-width: 320px;
        padding: 40px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.12);
        text-align: center;
    }

    .withdraw-container h2 {
        margin-bottom: 20px;
    }

    .warning {
        color: #dc3545;
        line-height: 1.7;
        margin-bottom: 30px;
    }

    button, .cancel-btn {
        padding: 11px 22px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 15px;
        text-decoration: none;
    }

    .withdraw-btn {
        background: #dc3545;
        color: white;
    }

    .cancel-btn {
        background: #6c757d;
        color: white;
        display: inline-block;
    }

    /* 탈퇴 확인 모달 배경 */
    .modal-bg {
        display: none;
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
    }

    /* 확인창 */
    .modal {
        width: 50%;
        min-width: 300px;
        max-width: 500px;
        padding: 30px;
        background: white;
        border-radius: 12px;
        text-align: center;
    }

    .yes-btn {
        background: #dc3545;
        color: white;
    }

    .no-btn {
        background: #6c757d;
        color: white;
    }

    @media (max-width: 600px) {
        .withdraw-container {
            width: 90%;
            padding: 25px;
        }

        .modal {
            width: 90%;
        }
    }
    .password-input {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 15px;
}

.password-input:focus {
    outline: none;
    border-color: #dc3545;
}
</style>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>


<div class="withdraw-container">
    <h2>회원 탈퇴</h2>

    <p class="warning">
        회원 탈퇴를 진행하려면 비밀번호를 입력해 주세요.<br>
        탈퇴 후에는 계정을 이용할 수 없습니다.
    </p>

    <form id="withdrawForm" method="post"
          action="${pageContext.request.contextPath}/withdraw/execute">

        <input type="password"
               id="password"
               name="password"
               class="password-input"
               placeholder="비밀번호를 입력하세요"
               required>

        <button type="button" class="withdraw-btn"
                onclick="openModal()">
            회원 탈퇴
        </button>

        <a href="${pageContext.request.contextPath}/mypage"
           class="cancel-btn">
            취소
        </a>
    </form>
</div>


<!-- Yes / No 확인창 -->

<div id="confirmModal" class="modal-bg">
    <div class="modal">
        <h3>정말 회원 탈퇴하시겠습니까?</h3>
        <p>탈퇴를 진행하면 계정 이용이 제한됩니다.</p>

        <button type="button" class="yes-btn"
                onclick="submitWithdraw()">
            Yes
        </button>

        <button type="button" class="no-btn"
                onclick="goMypage()">
            No
        </button>
    </div>
</div>
<script>
function openModal() {
    const password = document.getElementById("password").value.trim();

    if (password === "") {
        alert("비밀번호를 입력해 주세요.");
        document.getElementById("password").focus();
        return;
    }

    document.getElementById("confirmModal").style.display = "flex";
}

function submitWithdraw() {
    document.getElementById("withdrawForm").submit();
}

function goMypage() {
    location.href = "${pageContext.request.contextPath}/mypage";
}
</script>

</body>
</html>