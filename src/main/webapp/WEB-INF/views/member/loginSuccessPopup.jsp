<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 완료 - YA900</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<p>로그인 성공! 메인페이지로 돌아갑니다.</p>

<script>
    if (window.opener && !window.opener.closed) {
        window.opener.location.reload();
        window.close();
    } else {
        location.href = "${pageContext.request.contextPath}/";
    }
</script>

</body>
</html>