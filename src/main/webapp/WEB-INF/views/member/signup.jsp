<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>YA900 회원가입</title>

<style>

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, sans-serif;
	color: #111936;
	background: linear-gradient(135deg, #eef2f8 0%, #dce3f0 100%);
}

.header {
	width: 100%;
	height: 100px;
	display: flex;
	align-items: center;
	padding: 0 50px;
	background: #111936;
	border-bottom: 1px solid #0a1028;
}

.logo {
	font-size: 30px;
	font-weight: bold;
	color: white;
	letter-spacing: 1px;
}

.signup-container {
	width: 100%;
	display: flex;
	justify-content: center;
	padding: 55px 20px;
}

.signup-box {
	width: 500px;
	background: white;
	border: 1px solid #d6dceb;
	border-radius: 10px;
	padding: 40px;
	box-shadow: 0 10px 30px rgba(17, 25, 54, 0.08);
}

.signup-title {
	text-align: center;
	margin: 0 0 35px;
	color: #111936;
	font-size: 25px;
	font-weight: bold;
}

.input-group {
	margin-bottom: 20px;
}

.input-group label.title {
	display: block;
	margin-bottom: 7px;
	font-size: 14px;
	font-weight: bold;
	color: #111936;
}

.input {
	width: 100%;
	height: 42px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	padding: 0 10px;
	font-size: 14px;
	color: #222;
	background: white;
	outline: none;
	transition: 0.2s ease;
}

.input:focus {
	border-color: #476aaa;
	box-shadow: 0 0 0 2px rgba(71, 106, 170, 0.1);
}

.input-button {
	display: flex;
	gap: 8px;
}

.input-button .input {
	flex: 1;
}

.check-btn {
	width: 100px;
	height: 42px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	background: #edf1fa;
	color: #111936;
	cursor: pointer;
	font-size: 13px;
	transition: 0.2s ease;
}

.check-btn:hover {
	background: #dce4f5;
	border-color: #476aaa;
}

.gender-box {
	display: flex;
	gap: 30px;
	height: 42px;
	align-items: center;
}

.gender-box label {
	font-size: 14px;
	cursor: pointer;
	color: #333;
}

.gender-box input {
	margin-right: 5px;
	accent-color: #111936;
}

.phone-box {
	display: flex;
	align-items: center;
	gap: 7px;
}

.phone-box input {
	width: 100%;
	height: 42px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	padding: 0 10px;
	outline: none;
	font-size: 14px;
}

.phone-box input:focus {
	border-color: #476aaa;
	box-shadow: 0 0 0 2px rgba(71, 106, 170, 0.1);
}

.phone-box span {
	font-size: 18px;
	color: #777;
}

.birth-box {
	display: flex;
	gap: 8px;
}

.birth-box select {
	flex: 1;
	height: 42px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	padding: 0 8px;
	font-size: 14px;
	color: #333;
	background: white;
	outline: none;
}

.birth-box select:focus {
	border-color: #476aaa;
	box-shadow: 0 0 0 2px rgba(71, 106, 170, 0.1);
}

.age-box {
	display: flex;
	align-items: center;
	gap: 10px;
}

.age-box input {
	width: 100%;
	height: 42px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	padding: 0 10px;
	background: #f3f5fa;
	color: #555;
}

.address-box {
	display: flex;
	gap: 8px;
	margin-bottom: 8px;
}

.address-box input {
	height: 42px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	padding: 0 10px;
	background: white;
	outline: none;
}

.zipcode {
	flex: 1;
	background: #f3f5fa !important;
}

.zipcode-btn {
	width: 110px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	background: #edf1fa;
	color: #111936;
	cursor: pointer;
	font-size: 13px;
	transition: 0.2s ease;
}

.zipcode-btn:hover {
	background: #dce4f5;
	border-color: #476aaa;
}

.address-input {
	width: 100%;
	height: 42px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	padding: 0 10px;
	margin-bottom: 8px;
	font-size: 14px;
	outline: none;
}

.address-input:focus {
	border-color: #476aaa;
	box-shadow: 0 0 0 2px rgba(71, 106, 170, 0.1);
}

.profile-box {
	width: 100%;
	height: 42px;
	padding: 9px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	background: #f7f8fb;
}

.profile-box input {
	width: 100%;
	font-size: 13px;
	color: #555;
}

.team-select {
	width: 100%;
	height: 42px;
	border: 1px solid #c7cee0;
	border-radius: 5px;
	padding: 0 10px;
	font-size: 14px;
	color: #333;
	background: white;
	outline: none;
}

.team-select:focus {
	border-color: #476aaa;
	box-shadow: 0 0 0 2px rgba(71, 106, 170, 0.1);
}

#id-message,
#email-message,
#pw-message,
#name-message,
#phone-message {
	margin-top: 6px;
	font-size: 12px;
	color: #476aaa;
}

.agreement {
	margin-top: 30px;
	padding: 20px;
	border: 1px solid #d6dceb;
	border-radius: 7px;
	background: #f7f8fb;
}

.agreement-title {
	margin: 0 0 15px;
	font-size: 15px;
	color: #111936;
}

.agreement-content {
	height: 100px;
	overflow-y: auto;
	padding: 10px;
	border: 1px solid #d6dceb;
	border-radius: 5px;
	background: white;
	font-size: 12px;
	line-height: 1.6;
	color: #555;
}

.agreement-check {
	margin-top: 12px;
	font-size: 13px;
	color: #333;
}

.agreement-check input {
	accent-color: #111936;
}

.signup-btn {
	width: 100%;
	height: 45px;
	margin-top: 25px;
	border: none;
	border-radius: 5px;
	background: #111936;
	color: white;
	cursor: pointer;
	font-size: 15px;
	font-weight: bold;
	transition: 0.2s ease;
}

.signup-btn:hover {
	background: #1d2852;
}

.footer {
	width: 100%;
	height: 150px;
	border-top: 1px solid #c7cee0;
	display: flex;
	justify-content: center;
	align-items: center;
	background: #111936;
	color: #b8bfd3;
	font-size: 13px;
}

@media (max-width: 600px) {

	.header {
		height: 75px;
		padding: 0 25px;
	}

	.logo {
		font-size: 25px;
	}

	.signup-container {
		padding: 30px 15px;
	}

	.signup-box {
		width: 100%;
		padding: 30px 20px;
	}

	.signup-title {
		font-size: 22px;
		margin-bottom: 30px;
	}

	.input-button {
		gap: 5px;
	}

	.check-btn {
		width: 90px;
	}

	.phone-box {
		gap: 5px;
	}

	.birth-box {
		gap: 5px;
	}

	.address-box {
		gap: 5px;
	}

	.zipcode-btn {
		width: 100px;
	}

	.footer {
		height: 120px;
		font-size: 12px;
	}

}

</style>

</head>

<body>

	<header class="header">

		<div class="logo">YA900</div>

	</header>

	<main class="signup-container">

		<div class="signup-box">

			<h2 class="signup-title">회원가입</h2>

			<form action="${pageContext.request.contextPath}/signup"
				method="post" enctype="multipart/form-data" id="signupForm">

				<div class="input-group">

					<label class="title"> 아이디 </label>

					<div class="input-button">

						<input type="text" class="input" id="id" name="id"
							placeholder="아이디 입력" required>

						<button type="button" class="check-btn" id="id-check">
							중복확인</button>

					</div>

					<div id="id-message"></div>

				</div>

				<div class="input-group">

					<label class="title"> 비밀번호 </label>

					<input type="password"
						class="input"
						id="pw"
						name="pw"
						placeholder="비밀번호 입력"
						required>

					<div id="pw-message"></div>

				</div>

				<div class="input-group">

					<label class="title"> 비밀번호 확인 </label>

					<input type="password"
						class="input"
						id="pw-check"
						placeholder="비밀번호 다시 입력"
						required>

				</div>

				<div class="input-group">

					<label class="title"> 이름 </label>

					<input type="text"
						class="input"
						id="name"
						name="name"
						placeholder="이름 입력"
						required>

					<div id="name-message"></div>

				</div>

				<div class="input-group">

					<label class="title"> 이메일 </label>

					<div class="input-button">

						<input type="email"
							class="input"
							id="email"
							name="email"
							placeholder="이메일 입력"
							required>

						<button type="button"
							class="check-btn"
							id="email-check">
							중복확인
						</button>

					</div>

					<div id="email-message"></div>

				</div>

				<div class="input-group">

					<label class="title"> 휴대전화번호 </label>

					<div class="phone-box">

						<input type="text"
							maxlength="3"
							name="phone1"
							id="phone1"
							placeholder="010"
							required>

						<span>-</span>

						<input type="text"
							maxlength="4"
							name="phone2"
							id="phone2"
							placeholder="1234"
							required>

						<span>-</span>

						<input type="text"
							maxlength="4"
							name="phone3"
							id="phone3"
							placeholder="5678"
							required>

					</div>

					<div id="phone-message"></div>

				</div>

				<div class="input-group">

					<label class="title"> 성별 </label>

					<div class="gender-box">

						<label>
							<input type="radio"
								name="gender"
								value="남성"
								required>
							남성
						</label>

						<label>
							<input type="radio"
								name="gender"
								value="여성">
							여성
						</label>

					</div>

				</div>

				<div class="input-group">

					<label class="title"> 생년월일 </label>

					<div class="birth-box">

						<select name="birth_year"
							id="birth_year"
							required>

							<option value="">년도</option>

							<%
							int currentYear =
								java.time.Year.now().getValue();

							for(int year = currentYear;
								year >= 1930;
								year--){
							%>

							<option value="<%=year%>">
								<%=year%>
							</option>

							<%
							}
							%>

						</select>

						<select name="birth_month"
							id="birth_month"
							required>

							<option value="">월</option>

							<%
							for(int month = 1;
								month <= 12;
								month++){
							%>

							<option value="<%=month%>">
								<%=month%>
							</option>

							<%
							}
							%>

						</select>

						<select name="birth_day"
							id="birth_day"
							required>

							<option value="">일</option>

							<%
							for(int day = 1;
								day <= 31;
								day++){
							%>

							<option value="<%=day%>">
								<%=day%>
							</option>

							<%
							}
							%>

						</select>

					</div>

				</div>

				<div class="input-group">

					<label class="title"> 나이 </label>

					<div class="age-box">

						<input type="text"
							id="age"
							name="age"
							placeholder="만 나이"
							readonly
							required>

					</div>

				</div>

				<div class="input-group">

					<label class="title"> 프로필 이미지 </label>

					<div class="profile-box">

						<input type="file"
							name="uploadFile"
							accept="image/*">

					</div>

				</div>

				<div class="input-group">

					<label class="title"> 응원 팀 </label>

					<select class="team-select"
						name="team"
						id="team"
						required>

						<option value="">응원 팀을 선택하세요</option>

						<option value="KT">KT</option>
						<option value="삼성">삼성</option>
						<option value="한화">한화</option>
						<option value="KIA">KIA</option>
						<option value="롯데">롯데</option>
						<option value="NC">NC</option>
						<option value="LG">LG</option>
						<option value="두산">두산</option>
						<option value="SSG">SSG</option>
						<option value="키움">키움</option>

					</select>

				</div>

				<div class="input-group">

					<label class="title"> 주소 </label>

					<div class="address-box">

						<input type="text"
							class="zipcode"
							name="zipcode"
							id="zipcode"
							placeholder="우편번호"
							readonly
							required>

						<button type="button"
							class="zipcode-btn"
							id="zipcode_btn">
							우편번호 찾기
						</button>

					</div>

					<input type="text"
						class="address-input"
						name="address1"
						id="address1"
						placeholder="주소를 입력하세요"
						readonly
						required>

					<input type="text"
						class="address-input"
						name="address2"
						id="address2"
						placeholder="상세주소를 입력하세요"
						required>

				</div>

				<div class="agreement">

					<h3 class="agreement-title">
						개인정보 수집 및 이용 동의
					</h3>

					<div class="agreement-content">

						YA900은 회원가입을 위해 다음과 같은 개인정보를 수집합니다.
						<br>
						<br>

						수집 항목 :
						아이디, 비밀번호, 이름, 이메일, 휴대전화번호, 주소, 성별,
						생년월일, 프로필 이미지, 응원 팀

						<br>
						<br>

						수집 목적 : 회원 식별 및 서비스 제공

						<br>
						<br>

						개인정보는 회원 탈퇴 시
						관련 법령에 따라 보관이 필요한 정보를 제외하고 삭제됩니다.

					</div>

					<div class="agreement-check">

						<label>

							<input type="checkbox"
								name="personalInformation"
								value="동의"
								required>

							개인정보 수집 및 이용에 동의합니다.

						</label>

					</div>

				</div>

				<button type="submit"
					class="signup-btn">
					회원가입
				</button>

			</form>

		</div>

	</main>

	<footer class="footer">
		개인정보처리방침 | 전체 서비스 | 문제 신고 | 고객센터
	</footer>

<script>

let idCheckOk = false;

let idRegex =
	/^[가-힣A-Za-z0-9]{6,12}$/;

$("#id-check").on("click", function(){

	let id = $("#id").val();

	if(!idRegex.test(id)){

		$("#id-message").html(
			"아이디는 6~12자의 한글, 영문, 숫자만 사용할 수 있습니다."
		);

		idCheckOk = false;

		return;
	}

	$.ajax({

		url: "${pageContext.request.contextPath}/idcheck",

		type: "POST",

		data: {
			id: id
		},

		success: function(result){

			if(result == 0){

				$("#id-message").html(
					"사용 가능한 아이디입니다."
				);

				idCheckOk = true;

			}
			else{

				$("#id-message").html(
					"이미 사용 중인 아이디입니다."
				);

				idCheckOk = false;

			}

		},

		error: function(){

			alert("아이디 중복검사 중 오류가 발생했습니다.");

			idCheckOk = false;

		}

	});

});

$("#id").on("input", function(){

	idCheckOk = false;

	$("#id-message").html("");

});

let emailCheckOk = false;

let emailRegex =
	/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

$("#email-check").on("click", function(){

	let email = $("#email").val();

	if(!emailRegex.test(email)){

		$("#email-message").html(
			"이메일 형식이 올바르지 않습니다."
		);

		emailCheckOk = false;

		return;
	}

	$.ajax({

		url: "${pageContext.request.contextPath}/emailcheck",

		type: "POST",

		data: {
			email: email
		},

		success: function(result){

			if(result == 0){

				$("#email-message").html(
					"사용 가능한 이메일입니다."
				);

				emailCheckOk = true;

			}
			else{

				$("#email-message").html(
					"이미 사용 중인 이메일입니다."
				);

				emailCheckOk = false;

			}

		},

		error: function(){

			alert("이메일 중복검사 중 오류가 발생했습니다.");

			emailCheckOk = false;

		}

	});

});

$("#email").on("input", function(){

	emailCheckOk = false;

	$("#email-message").html("");

});

let pw =
	document.getElementById("pw");

let pw_check =
	document.getElementById("pw-check");

let pw_message =
	document.getElementById("pw-message");

let pwRegex =
	/^(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]).{8,}$/;

pw.addEventListener("input", function(){

	let password = pw.value;

	if(password === ""){

		pw_message.textContent = "";

	}
	else if(!pwRegex.test(password)){

		pw_message.textContent =
			"비밀번호는 8자리 이상이며 특수문자를 포함해야 합니다.";

	}
	else{

		pw_message.textContent =
			"사용 가능한 비밀번호입니다.";

	}

});

pw_check.addEventListener("input", function(){

	if(pw_check.value === ""){

		pw_message.textContent = "";

	}
	else if(pw.value === pw_check.value){

		pw_message.textContent =
			"비밀번호가 일치합니다.";

	}
	else{

		pw_message.textContent =
			"비밀번호가 일치하지 않습니다.";

	}

});

let nameInput =
	document.getElementById("name");

let nameMessage =
	document.getElementById("name-message");

let nameRegex =
	/^[가-힣]{2,5}$/;

nameInput.addEventListener("input", function(){

	if(nameInput.value === ""){

		nameMessage.textContent = "";

	}
	else if(!nameRegex.test(nameInput.value)){

		nameMessage.textContent =
			"이름은 2~5글자로 입력해 주세요.";

	}
	else{

		nameMessage.textContent =
			"이름 형식이 올바르게 입력 되었습니다.";

	}

});

let phone1 = document.getElementById("phone1");
let phone2 = document.getElementById("phone2");
let phone3 = document.getElementById("phone3");

let phone1Regex = /^[0-9]{3}$/;
let phone2Regex = /^[0-9]{4}$/;
let phone3Regex = /^[0-9]{4}$/;

function checkPhone(){

	if(phone1.value === "" || phone2.value === "" || phone3.value === ""){
		return;
	}

	if(!phone1Regex.test(phone1.value)){
		return;
	}

	if(!phone2Regex.test(phone2.value)){
		return;
	}

	if(!phone3Regex.test(phone3.value)){
		return;
	}

}

phone1.addEventListener("input", checkPhone);
phone2.addEventListener("input", checkPhone);
phone3.addEventListener("input", checkPhone);

let birthYear =
	document.getElementById("birth_year");

let birthMonth =
	document.getElementById("birth_month");

let birthDay =
	document.getElementById("birth_day");

let age =
	document.getElementById("age");

function calculateAge(){

	let year =
		Number(birthYear.value);

	let month =
		Number(birthMonth.value);

	let day =
		Number(birthDay.value);

	if(!year || !month || !day){

		age.value = "";

		return;
	}

	let today = new Date();

	let currentYear =
		today.getFullYear();

	let currentMonth =
		today.getMonth() + 1;

	let currentDay =
		today.getDate();

	let ageValue =
		currentYear - year;

	if(
		currentMonth < month ||
		(
			currentMonth === month &&
			currentDay < day
		)
	){

		ageValue--;

	}

	age.value = ageValue;

}

birthYear.addEventListener(
	"change",
	calculateAge
);

birthMonth.addEventListener(
	"change",
	calculateAge
);

birthDay.addEventListener(
	"change",
	calculateAge
);

let zipcodeBtn =
	document.getElementById("zipcode_btn");

zipcodeBtn.addEventListener("click", function(){

	new daum.Postcode({

		oncomplete: function(data){

			let zipcode =
				document.getElementById("zipcode");

			let address1 =
				document.getElementById("address1");

			zipcode.value =
				data.zonecode;

			address1.value =
				data.roadAddress;

		}

	}).open();

});

let signupForm =
	document.getElementById("signupForm");

signupForm.addEventListener("submit", function(e){

	if(!idCheckOk){

		alert("아이디 중복확인을 해주세요.");

		e.preventDefault();

		return;

	}

	if(!emailCheckOk){

		alert("이메일 중복확인을 해주세요.");

		e.preventDefault();

		return;

	}

	if(!pwRegex.test(pw.value)){

		alert(
			"비밀번호는 8자리 이상이며 특수문자를 포함해야 합니다."
		);

		e.preventDefault();

		return;

	}

	if(pw.value !== pw_check.value){

		alert("비밀번호가 일치하지 않습니다.");

		e.preventDefault();

		return;

	}

	if(!nameRegex.test(nameInput.value)){

		alert("이름을 올바르게 입력해주세요.");

		e.preventDefault();

		return;

	}

	if(
		!phone1Regex.test(phone1.value) ||
		!phone2Regex.test(phone2.value) ||
		!phone3Regex.test(phone3.value)
	){

		alert("전화번호를 올바르게 입력해주세요.");

		e.preventDefault();

		return;

	}

	if(
		birthYear.value === "" ||
		birthMonth.value === "" ||
		birthDay.value === ""
	){

		alert("생년월일을 선택해주세요.");

		e.preventDefault();

		return;

	}

	if(age.value === ""){

		alert("나이를 확인해주세요.");

		e.preventDefault();

		return;

	}

	let team =
		document.getElementById("team");

	if(team.value === ""){

		alert("응원팀을 선택해주세요.");

		e.preventDefault();

		return;

	}

	let zipcode =
		document.getElementById("zipcode");

	let address1 =
		document.getElementById("address1");

	let address2 =
		document.getElementById("address2");

	if(
		zipcode.value === "" ||
		address1.value === "" ||
		address2.value === ""
	){

		alert("주소를 모두 입력해주세요.");

		e.preventDefault();

		return;

	}

	let personalInformation =
		document.querySelector(
			'input[name="personalInformation"]'
		);

	if(!personalInformation.checked){

		alert("개인정보 수집 및 이용에 동의해주세요.");

		e.preventDefault();

		return;

	}

});

</script>

</body>

</html>