<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!DOCTYPE html> <html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<title>신고 완료</title>
</head>
<body>

<script>
	alert("신고가 정상적으로 접수됐습니다.");

	if("${param.target_type}" == "게시판") {
		window.opener.location.href = "/board/detail?seq=" + "${seq}";
	} else if("${param.target_type}" == "댓글") {
		window.opener.location.href = "/board/detail?seq=" + "${seq}";
	} else {
		window.opener.location.href = "/schedule/scheduledetail?game_id=" + "${seq}";
	}

	window.close();
</script>

</body>
</html>