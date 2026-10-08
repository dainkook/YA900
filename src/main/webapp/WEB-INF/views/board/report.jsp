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
<form action="/board/reportComplete" method="post" id="reportForm">

    <input type="hidden" name="target_contents" value="${param.target_contents}">
    <input type="hidden" name="target_type" value="${param.target_type}">
    <input type="hidden" name="target_seq" value="${param.target_seq}">
    <input type="hidden" name="parent_seq" value="${param.parent_seq}">
    <input type="hidden" name="target_id" value="${param.target_id}">
    <input type="hidden" name="reporter" value="${param.reporter}">

    <input type="radio" name="report_type" value="광고">광고<br>
	<input type="radio" name="report_type" value="욕설">욕설<br>
	<input type="radio" name="report_type" value="혐오표현">혐오표현<br>
	<input type="radio" name="report_type" value="음란물">음란물<br>
	<input type="radio" name="report_type" value="기타">기타<br>

    <button type="button" id="reportBtn">확인</button>

</form>
<script>
	$("#reportBtn").on("click", function() {

    	if($("input[name='report_type']:checked").length == 0) {
        	alert("신고 사유를 선택해주세요.");
        	return;
    	}

    	alert("신고가 정상적으로 접수됐습니다.");
    	$("#reportForm").submit();
	});
</script>
</body>
</html>