<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 신고</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        padding: 30px 16px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: "Noto Sans KR", "Malgun Gothic", sans-serif;
        color: #202944;
        background: linear-gradient(135deg, #111936 0%, #eef1f8 100%);
    }

    .report-container {
        width: 100%;
        max-width: 440px;
        padding: 32px;
        background: #fff;
        border: 1px solid rgba(71, 106, 170, 0.12);
        border-radius: 18px;
        box-shadow: 0 16px 45px rgba(11, 16, 38, 0.22);
    }

    .report-header {
        margin-bottom: 26px;
        padding-bottom: 20px;
        border-bottom: 1px solid #e8ebf3;
    }

    .report-icon {
        width: 48px;
        height: 48px;
        margin-bottom: 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 14px;
        background: #edf2fc;
        color: #365b9c;
        font-size: 25px;
    }

    .report-title {
        margin: 0 0 9px;
        font-size: 23px;
        font-weight: 800;
        letter-spacing: -0.7px;
        color: #111936;
    }

    .report-description {
        margin: 0;
        color: #7a8399;
        font-size: 13px;
        line-height: 1.7;
    }

    .section-title {
        display: block;
        margin-bottom: 13px;
        font-size: 14px;
        font-weight: 700;
        color: #303b59;
    }

    .report-options {
        display: flex;
        flex-direction: column;
        gap: 9px;
    }

    .report-option {
        position: relative;
        display: flex;
        align-items: center;
        gap: 12px;
        min-height: 52px;
        padding: 13px 15px;
        border: 1px solid #e2e6ef;
        border-radius: 11px;
        background: #fff;
        cursor: pointer;
        transition: background 0.2s, border-color 0.2s,
                    box-shadow 0.2s, transform 0.2s;
    }

    .report-option:hover {
        border-color: #8da5d1;
        background: #f8faff;
        transform: translateY(-1px);
    }

    .report-option:has(input:checked) {
        border-color: #476aaa;
        background: #edf2fc;
        box-shadow: 0 0 0 2px rgba(71, 106, 170, 0.08);
    }

    .report-option input[type="radio"] {
        width: 17px;
        height: 17px;
        margin: 0;
        flex-shrink: 0;
        accent-color: #476aaa;
        cursor: pointer;
    }

    .option-text {
        flex: 1;
        font-size: 14px;
        font-weight: 600;
        color: #343e59;
    }

    .option-description {
        display: block;
        margin-top: 4px;
        color: #9299aa;
        font-size: 11px;
        font-weight: 400;
    }

    .report-notice {
        margin-top: 18px;
        padding: 12px 14px;
        border-radius: 9px;
        background: #f5f6fa;
        color: #7b8498;
        font-size: 12px;
        line-height: 1.7;
    }

    .report-actions {
        display: flex;
        gap: 10px;
        margin-top: 24px;
    }

    .report-btn {
        min-height: 46px;
        border: none;
        border-radius: 10px;
        font-size: 14px;
        font-weight: 700;
        cursor: pointer;
        transition: background 0.2s, transform 0.2s;
    }

    .report-btn:active {
        transform: scale(0.98);
    }

    .submit-btn {
        flex: 1;
        background: linear-gradient(135deg, #263e70, #476aaa);
        color: #fff;
        box-shadow: 0 5px 12px rgba(43, 69, 119, 0.2);
    }

    .submit-btn:hover {
        background: linear-gradient(135deg, #1b305b, #38588f);
    }

    .cancel-btn {
        width: 100px;
        background: #edf0f6;
        color: #56617a;
    }

    .cancel-btn:hover {
        background: #e1e6f0;
    }

    @media (max-width: 420px) {
        body {
            padding: 18px 12px;
        }

        .report-container {
            padding: 24px 20px;
            border-radius: 15px;
        }

        .report-title {
            font-size: 21px;
        }

        .report-option {
            padding: 12px;
        }
    }
</style>
</head>

<body>
    <div class="report-container">

        <div class="report-header">
            <div class="report-icon">⚑</div>
            <h1 class="report-title">게시글 신고</h1>
            <p class="report-description">
                신고 사유를 선택해주세요.<br>
                신고 내용은 운영 정책에 따라 검토됩니다.
            </p>
        </div>

        <form action="/board/reportComplete" method="post" id="reportForm">

            <input type="hidden" name="target_contents"
                value="${param.target_contents}">
            <input type="hidden" name="target_type"
                value="${param.target_type}">
            <input type="hidden" name="target_seq"
                value="${param.target_seq}">
            <input type="hidden" name="parent_seq"
                value="${param.parent_seq}">
            <input type="hidden" name="target_id"
                value="${param.target_id}">
            <input type="hidden" name="reporter"
                value="${param.reporter}">

            <span class="section-title">신고 사유</span>

            <div class="report-options">
                <label class="report-option">
                    <input type="radio" name="report_type" value="광고">
                    <span class="option-text">
                        광고 및 홍보
                        <span class="option-description">상업적 광고, 도배성 홍보</span>
                    </span>
                </label>

                <label class="report-option">
                    <input type="radio" name="report_type" value="욕설">
                    <span class="option-text">
                        욕설 및 비방
                        <span class="option-description">욕설, 모욕, 타인에 대한 비방</span>
                    </span>
                </label>

                <label class="report-option">
                    <input type="radio" name="report_type" value="혐오표현">
                    <span class="option-text">
                        혐오 표현
                        <span class="option-description">특정 대상에 대한 혐오 및 차별 표현</span>
                    </span>
                </label>

                <label class="report-option">
                    <input type="radio" name="report_type" value="음란물">
                    <span class="option-text">
                        음란물 및 부적절한 콘텐츠
                        <span class="option-description">음란하거나 부적절한 게시물</span>
                    </span>
                </label>

                <label class="report-option">
                    <input type="radio" name="report_type" value="기타">
                    <span class="option-text">
                        기타
                        <span class="option-description">위 항목에 해당하지 않는 신고 사유</span>
                    </span>
                </label>
            </div>

            <div class="report-notice">
                ※ 신고 사유를 정확하게 선택해주세요. 허위 신고는 서비스 이용에
                제한을 받을 수 있습니다.
            </div>

            <div class="report-actions">
                <button type="button" class="report-btn cancel-btn"
                    id="cancelBtn">취소</button>
                <button type="button" class="report-btn submit-btn"
                    id="reportBtn">신고 접수</button>
            </div>

        </form>
    </div>

    <script>
        $("#reportBtn").on("click", function() {
            if ($("input[name='report_type']:checked").length === 0) {
                alert("신고 사유를 선택해주세요.");
                return;
            }

            if (confirm("선택한 사유로 신고하시겠습니까?")) {
                $("#reportForm").submit();
            }
        });

        $("#cancelBtn").on("click", function() {
            window.close();
        });
    </script>
</body>
</html>