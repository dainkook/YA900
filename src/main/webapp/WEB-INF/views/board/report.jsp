<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!DOCTYPE html> <html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
신고 사유를 선택해주세요.<hr>
<input type="radio" name="reason" value="광고">광고<br>
<input type="radio" name="reason" value="욕설">욕설<br>
<input type="radio" name="reason" value="혐오표현">혐오표현<br>
<input type="radio" name="reason" value="음란물">음란물<br>
<input type="radio" name="reason" value="기타">기타<br>
<button type="button" id="reportBtn">확인</button>
<script>
$("#reportBtn").on("click", function() {
    if($("input[name='reason']:checked").length == 0) {
        alert("신고 사유를 선택해주세요.");
        return;
    }
    let reason = $("input[name='reason']:checked").val();
    if(window.opener.reportForm != null) {
        window.opener.reportForm.find(".report_type").val(reason);
        window.opener.reportForm[0].submit();
    } else {
        window.opener.$("#report_type").val(reason);
        window.opener.$("#boardReport")[0].submit();
    }
    alert("신고가 정상적으로 접수됐습니다.");
    window.close();
});
</script>
</body>
</html>