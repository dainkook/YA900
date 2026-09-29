<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background-color: #f5f5f5;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.container {
    width: 450px;
    padding: 50px 40px;
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin: 0 0 40px;
    font-size: 32px;
}

.input-box {
    margin-bottom: 25px;
}

.input-box label {
    display: block;
    margin-bottom: 10px;
    font-size: 18px;
    font-weight: bold;
}

.input-box input {
    width: 100%;
    height: 55px;
    padding: 0 15px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 16px;
}

.login-btn {
    width: 100%;
    height: 55px;
    margin-top: 10px;
    border: none;
    border-radius: 8px;
    background-color: #333;
    color: white;
    font-size: 18px;
    cursor: pointer;
}

.login-btn:hover {
    background-color: #555;
}
</style>
</head>
<body>
	
	<h1>관리자 로그인</h1>

	<form action="/admin/login" method="post">

		<div class="input-box">
			<label for="adminId">관리자 아이디</label> 
			<input type="text" id="adminId"
				name="admin_id" placeholder="관리자 아이디를 입력하세요.">
		</div>

		<div class="input-box">
			<label for="adminPw">비밀번호</label> 
			<input type="password" id="adminPw"
				name="admin_pw" placeholder="비밀번호를 입력하세요.">
		</div>

		<button type="submit" class="login-btn">로그인</button>

	</form>
</body>
</html>