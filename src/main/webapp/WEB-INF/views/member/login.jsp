<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>YA900 회원가입</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: #222;
}



.header {
    width: 100%;
    height: 100px;

    display: flex;
    align-items: center;

    padding: 0 50px;

    border-bottom: 1px solid #999;
    background: white;
}

.logo {
    font-size: 30px;
    font-weight: bold;
}


.signup-container {
    width: 100%;

    display: flex;
    justify-content: center;

    padding: 50px 0;
}

.signup-box {
    width: 500px;

    border: 1px solid black;

    padding: 40px;
}

.signup-title {
    text-align: center;

    margin: 0 0 35px;
}

.input-group {
    margin-bottom: 20px;
}

.input-group label.title {
    display: block;

    margin-bottom: 7px;

    font-size: 14px;
    font-weight: bold;
}

.input {
    width: 100%;
    height: 42px;

    border: 1px solid #999;

    padding: 0 10px;

    font-size: 14px;
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

    border: 1px solid #555;

    background: #eee;

    cursor: pointer;

    font-size: 13px;
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
}

.gender-box input {
    margin-right: 5px;
}

.phone-box {
    display: flex;

    align-items: center;

    gap: 7px;
}

.phone-box input {
    width: 100%;

    height: 42px;

    border: 1px solid #999;

    padding: 0 10px;
}

.phone-box span {
    font-size: 18px;
}

.birth-box {
    display: flex;

    gap: 8px;
}

.birth-box select {
    flex: 1;

    height: 42px;

    border: 1px solid #999;

    padding: 0 8px;

    font-size: 14px;
}

.age-box {
    display: flex;

    align-items: center;

    gap: 10px;
}

.age-box input {
    width: 100%;

    height: 42px;

    border: 1px solid #999;

    padding: 0 10px;
}

.address-box {
    display: flex;

    gap: 8px;

    margin-bottom: 8px;
}

.address-box input {
    height: 42px;

    border: 1px solid #999;

    padding: 0 10px;
}

.zipcode {
    flex: 1;
}

.zipcode-btn {
    width: 110px;

    border: 1px solid #555;

    background: #eee;

    cursor: pointer;
}

.address-input {
    width: 100%;

    height: 42px;

    border: 1px solid #999;

    padding: 0 10px;

    margin-bottom: 8px;
}

.profile-box {
    width: 100%;

    height: 42px;

    border: 1px solid #999;

    padding: 9px;
}

.team-select {
    width: 100%;

    height: 42px;

    border: 1px solid #999;

    padding: 0 10px;

    font-size: 14px;
}


.agreement {
    margin-top: 30px;

    padding: 20px;

    border: 1px solid #ccc;

    background: #fafafa;
}

.agreement-title {
    margin: 0 0 15px;

    font-size: 15px;
}

.agreement-content {
    height: 100px;

    overflow-y: auto;

    padding: 10px;

    border: 1px solid #ccc;

    background: white;

    font-size: 12px;

    line-height: 1.6;
}

.agreement-check {
    margin-top: 12px;

    font-size: 13px;
}


.signup-btn {
    width: 100%;

    height: 45px;

    margin-top: 25px;

    border: none;

    border-radius: 5px;

    background: black;

    color: white;

    cursor: pointer;

    font-size: 15px;
}

.footer {
    width: 100%;

    height: 150px;

    border-top: 1px solid #999;

    display: flex;

    justify-content: center;

    align-items: center;

    color: #777;

    font-size: 13px;
}

</style>

</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<body>

<header class="header">

    <div class="logo">
        YA900
    </div>

</header>

<main class="signup-container">

    <div class="signup-box">

        <h2 class="signup-title">
            회원가입
        </h2>


        <form>


            <div class="input-group">

                <label class="title">
                    아이디
                </label>

                <div class="input-button">

                    <input type="text"
                           class="input"
                           id="id"
                           name="id"
                           placeholder="아이디 입력">

                    <button type="button"
                            class="check-btn" id="id-check">
                        중복확인
                    </button>

                </div>
                <div id="id-message"></div>

            </div>
            <script>
                let idRegex= /^[가-힣A-Za-z0-9]{6,12}$/;
                $("#id-check").on("click", function(){
                    let id = $("#id").val();
                    if(!idRegex.test(id)){
                        $("#id-message").html("아이디 형식이 올바르지 않습니다.");
                        return;
                    }
                    $("#id-message").html("아이디 형식이 올바릅니다.");
                });

            </script>


            <div class="input-group">

                <label class="title">
                    비밀번호
                </label>

                <input type="password"
                       class="input"
                       id="pw"
                       name="pw"
                       placeholder="비밀번호 입력">

            </div>


            <div class="input-group">

                <label class="title">
                    비밀번호 확인
                </label>

                <input type="password"
                       class="input"
                       id="pw-check"
                       placeholder="비밀번호 다시 입력">

            </div>
            <div id="pw-message"></div>
            <script>
                let pw = document.getElementById("pw");
                let pw_check = document.getElementById("pw-check");
                let pw_message =document.getElementById("pw-message");
                let pwRegex = /^(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]).{8,}$/;
               
                pw.addEventListener("input", function(){
                
                    let password = pw.value;
                
                if(password ===""){
                    pw_message.textContent = "";
                }
                else if(!pwRegex.test(password)){
                    pw_message.textContent = "비밀번호 8자리 이상이며 특수 문자를 포함해야 합니다.";
                }
                else{
                    pw_message.textContent = "사용 가능한 비밀번호 입니다.";
                }
               });

               pw_check.addEventListener("input", function(){
                if(pw_check.value ===""){
                pw_message.textContent = "";
                }
                else if(pw.value === pw_check.value){
                    pw_message.textContent = "비밀번호가 일치합니다.";
                }
                else{
                    pw_message.textContent = "비밀번호가 일치하지 않습니다.";
                }
               });
               </script>


            <div class="input-group">

                <label class="title">
                    이름
                </label>

                <input type="text"
                       class="input"
                       id="name"
                       name="name"
                       placeholder="이름 입력">

            </div>
            <div id="name-message"></div>
            <script>
                let name = document.getElementById("name");
                let name_message = document.getElementById("name-message");
                let nameRegex = /^[가-힣]{2,5}$/;

                name.addEventListener("input", function(){
                    if(name.value ===""){
                        name_message.textContent="";
                    }
                    else if(!nameRegex.test(name.value)){
                        name_message.textContent="이름은 2~5글자로 입력해 주세요";
                    }
                    else{
                        name_message.textContent = "사용 가능한 이름입니다.";
                    }
                });
            </script>


            <div class="input-group">

                <label class="title">
                    이메일
                </label>

                <input type="email"
                       class="input"
                       name="email"
                       id="email"
                       placeholder="이메일 입력">

            </div>
            <div id="email-message"></div>
            <script>
            let emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
             let email = document.getElementById("email");
             let email_message = document.getElementById("email-message");  
             let timer;  

               email.addEventListener("input",function(){

                clearTimeout(timer);
                timer= setTimeout(function(){

                if(email.value === ""){
                    email_message.textContent="";
                }else if(!emailRegex.test(email.value)){
                    email_message.textContent="이메일 형식이 올바르지 않습니다.";
                }else{
                    email_message.textContent="사용 가능한 이메일 입니다.";
                }
            }, 1000);
               });
               </script>


            <div class="input-group">

                <label class="title">
                    휴대전화번호
                </label>

                <div class="phone-box">

                    <input type="text"
                           maxlength="3"
                           name="phone1"
                           id="phone1"
                           placeholder="010">

                    <span>-</span>

                    <input type="text"
                           maxlength="4"
                           name="phone2"
                           id="phone2"
                           placeholder="1234">

                    <span>-</span>

                    <input type="text"
                           maxlength="4"
                           name="phone3"
                           id="phone3"
                           inputmode="phone3"
                           placeholder="5678">

                </div>
                <div id="phone-message"></div>

            </div>

            <script>
                let phone1= document.getElementById("phone1");
                let phone2= document.getElementById("phone2");
                let phone3= document.getElementById("phone3");
                let phone_message= document.getElementById("phone-message");

                let phone1Regex = /^010$/;
                let phone2Regex = /^[0-9]{4}$/;
                let phone3Regex = /^[0-9]{4}$/;

                phone3.addEventListener("input", function(){
                if(phone1.value === "" ||
                    phone2.value === "" ||
                    phone3.value === "" 
                ){
                    phone_message.textContent= "";
                }else if(!phone1Regex.test(phone1.value)){
                    phone_message.textContent="010으로 입력해주세요";
                }else if(!phone2Regex.test(phone2.value)){
                    phone_message.textContent="4자리를 입력해 주세요";
                }else if(!phone3Regex.test(phone3.value)){
                    phone_message.textContent="4자리를 입력해 주세요";
                }else{
                    phone_message.textContent="사용가능한 전화번호 입니다.";
                }
                });
            </script>



            <div class="input-group">

                <label class="title">
                    성별
                </label>

                <div class="gender-box">

                    <label>

                        <input type="radio"
                               name="gender"
                               value="남성">

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
           <script>

    let form = document.querySelector("form");

    form.addEventListener("submit", function(e){

        let gender = document.querySelector('input[name="gender"]:checked');

        if(gender === null){

            alert("성별을 선택해주세요.");

            e.preventDefault();

            return;
        }

    });

</script>


            <div class="input-group">

                <label class="title">
                    생년월일
                </label>

                <div class="birth-box">



                    <select name="birth_year" id="birth_year">

                        <option value="">
                            년도
                        </option>

                        <%
                            for(int year = 1900; year <= 2026; year++) {
                        %>

                        <%
                            }
                        %>

                    </select>



                    <select name="birth_month" id="birth_month">

                        <option value="">
                            월
                        </option>

                        <%
                            for(int month = 1; month <= 12; month++) {
                        %>

                        <%
                            }
                        %>

                    </select>



                    <select name="birth_day" id="birth_day">

                        <option value="">
                            일
                        </option>

                        <%
                            for(int day = 1; day <= 31; day++) {
                        %>

                        <%
                            }
                        %>

                    </select>

                </div>

            </div>


            <div class="input-group">

                <label class="title">
                    나이
                </label>

                <div class="age-box">

                    <input type="text"
                            id="age"
                           name="age"
                           placeholder="만 나이"
                           readonly>

                </div>

            </div>
            <script>

    let birth_year = document.getElementById("birth_year");
    let birth_month = document.getElementById("birth_month");
    let birth_day = document.getElementById("birth_day");
    let age = document.getElementById("age");


    // 년도
    for (let year = 1900; year <= new Date().getFullYear(); year++) {

        birth_year.innerHTML +=
            `<option value="${year}">${year}</option>`;

    }


    // 월
    for (let month = 1; month <= 12; month++) {

        birth_month.innerHTML +=
            `<option value="${month}">${month}</option>`;

    }


    // 일
    for (let day = 1; day <= 31; day++) {

        birth_day.innerHTML +=
            `<option value="${day}">${day}</option>`;

    }


    // 만 나이 계산
    function calculateAge() {

        let year = Number(birth_year.value);
        let month = Number(birth_month.value);
        let day = Number(birth_day.value);


        if (!year || !month || !day) {

            age.value = "";

            return;
        }


        let today = new Date();

        let currentYear = today.getFullYear();
        let currentMonth = today.getMonth() + 1;
        let currentDay = today.getDate();


        let ageValue = currentYear - year;


        if (
            currentMonth < month ||
            (currentMonth === month && currentDay < day)
        ) {

            ageValue--;

        }


        age.value = ageValue;

    }


    birth_year.addEventListener("change", calculateAge);
    birth_month.addEventListener("change", calculateAge);
    birth_day.addEventListener("change", calculateAge);

</script>


            <div class="input-group">

                <label class="title">
                    프로필 이미지
                </label>

                <div class="profile-box">

                    <input type="file"
                           name="profile_img"
                           accept="image/*">

                </div>

            </div>


            <div class="input-group">

                <label class="title">
                    응원 팀
                </label>

                <select class="team-select"
                        name="team">

                    <option value="">
                        응원 팀을 선택하세요
                    </option>

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

                <label class="title">
                    주소
                </label>

                <div class="address-box">

                    <input type="text"
                           class="zipcode"
                           name="zipcode"
                           placeholder="우편번호">

                    <button type="button"
                            class="zipcode-btn">
                        우편번호 찾기
                    </button>

                </div>

                <input type="text"
                       class="address-input"
                       name="address1"
                       placeholder="주소를 입력하세요">

                <input type="text"
                       class="address-input"
                       name="address2"
                       placeholder="상세주소를 입력하세요">

            </div>


            <div class="agreement">

                <h3 class="agreement-title">

                    개인정보 수집 및 이용 동의

                </h3>


                <div class="agreement-content">

                    YA900은 회원가입을 위해 다음과 같은 개인정보를 수집합니다.

                    <br><br>

                    수집 항목 : 아이디, 비밀번호, 이름, 이메일,
                    휴대전화번호, 주소, 성별, 생년월일,
                    프로필 이미지, 응원 팀

                    <br><br>

                    수집 목적 : 회원 식별 및 서비스 제공

                    <br><br>

                    개인정보는 회원 탈퇴 시 관련 법령에 따라
                    보관이 필요한 정보를 제외하고 삭제됩니다.

                </div>


                <div class="agreement-check">

                    <label>

                        <input type="checkbox"
                               name="personalInformation"
                               value="동의">

                        개인정보 수집 및 이용에 동의합니다.

                    </label>

                </div>

            </div>



            <button type="button"
                    class="signup-btn">

                회원가입

            </button>


        </form>

    </div>

</main>


<footer class="footer">

    개인정보처리방침　|　전체 서비스　|　문제 신고　|　고객센터

</footer>


</body>

</html>