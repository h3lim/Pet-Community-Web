<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DoggiVerse Signup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <style>
        body, html {
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            height: 100%;
            box-sizing: border-box;
        }

        main {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            padding: 20px;
            box-sizing: border-box;
        }

        .row {
            display: flex;
            width: 100%;
            max-width: 800px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(20,20,20,20);
            padding: 1em;
            align-items: center;
        }

        .left, .right {
            flex: 1;
            width: 50%;
            padding: 20px;
            box-sizing: border-box;
        }

        .left {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signup-form1 {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            width: 100%;
            max-width: 340px;
            box-sizing: border-box;
        }

        .input-box {
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="password"], input[type="email"], input[type="date"], select {
            width: 100%;
            height: 35px;
            padding: 0 10px;
            border: 1px solid black;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input:hover, input:focus, select:hover, select:focus {
            border-color: black;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: dimgrey;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .right {
            background: url('walk.jpeg') no-repeat center center;
            background-size: cover;
            height: 775px;
            margin-top: 25px;
        }
        .password-requirements {
            font-size: 10px; /* Smaller text size */
            color: #666;     /* Lighter text color for less emphasis */
            margin-top: 5px; /* Space from input box */
        }

        #address_list li {
            padding: 5px;
            cursor: pointer;
            border-bottom: 1px solid #ccc;
        }

        #address_list li:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/logo.jpeg" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
 
<main>
 <div class="slider-area2 slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2>로그인</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  <div class="row">
    <form id="signupForm" action="signup" method="post" accept-charset="UTF-8" class="signup-form1" >
      <div class="input-box">
          <label for="username">
              <i class="fa fa-user icon"></i> 아이디
          </label>
          <input type="text" id="username" name="username" required />
          <span id="username-feedback"></span>
      </div>
      <div class="input-box">
          <label for="password">
              <i class="fa fa-lock icon"></i> 비밀번호
          </label>
          <input type="password" id="password" name="password" required />
          <div class="password-requirements" style="margin-left: 8px;">
                          (영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합, 8자~16자)
          </div>
      </div>
      <div class="input-box">
          <label for="confirm_password">
              <i class="fa fa-lock icon"></i> 비밀번호 확인
          </label>
          <input type="password" id="confirm_password" name="confirm_password" required />
          <span id="password-match-feedback"></span>
      </div>
      <div class="input-box">
        <label for="email_prefix">
          <i class="fa fa-envelope icon"></i> 이메일
        </label>
        <div style="display: flex; gap: 10px;">
          <input type="text" id="email_prefix" name="email_prefix" style="flex-grow: 1; height: 35px; padding: 0 10px; border: 1px solid black; border-radius: 5px; box-sizing: border-box;" required  />
          <input type="text" id="custom_email_domain" name="custom_email_domain" style="display: none; flex-grow: 1; height: 35px; padding: 0 10px; border: 1px solid black; border-radius: 5px; box-sizing: border-box;"  />
          <select id="email_domain" name="email_domain" required style="flex-grow: 1; height: 35px; padding: 0 10px; border: 1px solid black; border-radius: 5px; box-sizing: border-box;">
            <option value="@gmail.com">@gmail.com</option>
            <option value="@naver.com">@naver.com</option>
            <option value="@daum.net">@daum.net</option>
            <option value="@nate.com">@nate.com</option>
            <option value="@hanmail.net">@hanmail.net</option>
            <option value="custom">직접 입력</option>
          </select>
        </div>
      </div>
      <div class="input-box">
          <label for="nickname">
              <i class="fa fa-smile icon"></i> 닉네임
          </label>
          <input type="text" id="nickname" name="nickname" required />
          <span id="nickname-feedback"></span>
      </div>
      <div class="input-box">
        <label for="dog_name">
          <i class="fa fa-paw icon"></i> 애완견 이름
        </label>
        <input type="text" id="dog_name" name="dog_name"  required />
      </div>
      <div class="input-box">
          <label for="address">
              <i class="fa fa-home icon"></i> 기본 주소
          </label>
          <input type="text" id="address" name="address" required readonly>
          <button type="button" onclick="openPostcode()">주소 검색</button>
      </div>
      <div class="input-box">
          <label for="addressDetail">
              상세 주소
          </label>
          <input type="text" id="addressDetail" name="addressDetail" required />
      </div>
      <div class="input-box">
        <label for="phone_number_1">
          <i class="fa fa-phone icon"></i> 전화번호
        </label>
        <div class="phone-inputs">
          <select id="phone_number_1" name="phone_number_1" required>
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
          </select>
          <input type="text" id="phone_number_2" name="phone_number_2" required maxlength="4" />
              <input type="text" id="phone_number_3" name="phone_number_3" required maxlength="4" />
        </div>
      </div>
      <div class="input-box">
              <label for="birthday">
                <i class="fa fa-birthday-cake icon"></i> 생년월일
              </label>
              <input type="date" id="birthday" name="birthday" required />
            </div>
      <button type="submit">회원가입</button>
    </form>

    <div class="right">
    </div>
  </div>


  <script>
  document.getElementById('password').addEventListener('input', checkPasswordsMatch);
  document.getElementById('confirm_password').addEventListener('input', checkPasswordsMatch);

  function checkPasswordsMatch() {
      var password = document.getElementById('password').value;
      var confirmPassword = document.getElementById('confirm_password').value;
      var feedback = document.getElementById('password-match-feedback');

      feedback.style.marginLeft = '8px';

      // Clear feedback when confirm password is empty
      if(confirmPassword === "") {
          feedback.textContent = '';
          return; // Exit the function early
      }

      if(password !== confirmPassword) {
          feedback.textContent = '패스워드가 일치하지 않습니다.';
          feedback.style.color = 'red';
          feedback.style.fontSize = '12px';
      } else {
          feedback.textContent = '패스워드가 일치합니다.';
          feedback.style.color = 'green';
          feedback.style.fontSize = '12px';
      }
  }
  </script>
  <script>
      window.onload = function() {
          var today = new Date();
          var minYear = today.getFullYear() - 100; // Users should be no older than 100 years
          var maxYear = today.getFullYear() - 13; // Users should be at least 13 years old

          var minDate = new Date(minYear, today.getMonth(), today.getDate()).toISOString().split('T')[0];
          var maxDate = new Date(maxYear, today.getMonth(), today.getDate()).toISOString().split('T')[0];

          document.getElementById('birthday').setAttribute('min', minDate);
          document.getElementById('birthday').setAttribute('max', maxDate);
      };
    </script>
</main>
<script>
    function debounce(func, wait, immediate) {
        var timeout;
        return function() {
            var context = this, args = arguments;
            var later = function() {
                timeout = null;
                if (!immediate) func.apply(context, args);
            };
            var callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow) func.apply(context, args);
        };
    }

    var validateNickname = debounce(function() {
        var nickname = document.getElementById('nickname').value;
        var feedback = document.getElementById('nickname-feedback');
        feedback.style.marginLeft = '8px';

        if (nickname.trim() === "") {
            feedback.textContent = '';
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'checkNickname?nickname=' + encodeURIComponent(nickname), true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var isExist = xhr.responseText === 'true';
                if (isExist) {
                    feedback.textContent = '사용 불가능한 닉네임입니다.';
                    feedback.style.color = 'red';
                    feedback.style.fontSize = '12px';
                } else {
                    feedback.textContent = '사용 가능한 닉네임입니다.';
                    feedback.style.color = 'green';
                    feedback.style.fontSize = '12px';
                }
            }
        };
        xhr.send();
    }, 250);

    document.getElementById('nickname').addEventListener('keyup', validateNickname);


    var validateUsername = debounce(function() {
        var username = document.getElementById('username').value;
        var feedback = document.getElementById('username-feedback');
        var validRegex = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,16}$/;

        feedback.style.marginLeft = '8px';

        if (username.trim() === "") {
            feedback.textContent = '';
            return;
        }

        if (!validRegex.test(username)) {
            feedback.textContent = '영문소문자와 숫자 각각 최소 1개 이상을 포함하여 4~16자';
            feedback.style.color = 'red';
            feedback.style.fontSize = '12px';
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'checkUsername?username=' + encodeURIComponent(username), true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var isExist = xhr.responseText === 'true';
                if (isExist) {
                    feedback.textContent = '사용 불가능한 아이디입니다.';
                    feedback.style.color = 'red';
                    feedback.style.fontSize = '12px';
                } else {
                    feedback.textContent = '사용 가능한 아이디입니다.';
                    feedback.style.color = 'green';
                    feedback.style.fontSize = '12px';
                }
            }
        };
        xhr.send();
    }, 250);

    document.getElementById('username').addEventListener('keyup', validateUsername);

function validatePassword(password) {
    var hasUpperCase = /[A-Z]/.test(password);
    var hasLowerCase = /[a-z]/.test(password);
    var hasNumbers = /\d/.test(password);
    var hasNonalphas = /\W/.test(password);

    // Count the number of true values among the types of characters
    var validationCount = [hasUpperCase, hasLowerCase, hasNumbers, hasNonalphas].filter(Boolean).length;

    // Check for at least two types of characters and length constraints
    return password.length >= 8 && password.length <= 16 && validationCount >= 2;
}

document.getElementById('signupForm').addEventListener('submit', function(event) {
    var isValid = true;
    var messages = [];

    var username = document.getElementById('username').value.trim();
    var password = document.getElementById('password').value.trim();
    var confirmPassword = document.getElementById('confirm_password').value.trim();
    var emailPrefix = document.getElementById('email_prefix').value.trim();
    var emailDomain = document.getElementById('email_domain').value;
    var customEmailDomain = document.getElementById('custom_email_domain').value.trim();
    var cnt = 0;

    if (emailDomain === 'custom') {
        if (customEmailDomain) {
            emailDomain = customEmailDomain;
        } else {
            isValid = false;
            cnt += 1;
            messages.push('이메일 도메인을 입력하세요.');
        }
    }
    var email = emailPrefix + emailDomain;

    var nickname = document.getElementById('nickname').value.trim();
    var dogName = document.getElementById('dog_name').value.trim();
    var address = document.getElementById('address').value;
    var detail = document.getElementById('addressDetail').value.trim();
    var phoneNumber1 = document.getElementById('phone_number_1').value.trim();
    var phoneNumber2 = document.getElementById('phone_number_2').value.trim();
    var phoneNumber3 = document.getElementById('phone_number_3').value.trim();
    var birthday = document.getElementById('birthday').value.trim();

    if (detail) {
            address += ' ' + detail;
            if (!document.getElementById('address').value.trim()) {
                        cnt += 1;
                        isValid = false;
                        messages.push('주소를 입력해주세요.');
                } else {
                    document.getElementById('address').value = address; // Set the full address as a single string
                }
    }else{
        cnt += 1;
        isValid = false;
        messages.push('주소를 입력해주세요.');
    }


    var usernameRegex = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,16}$/;
    if (!usernameRegex.test(username)) {
        cnt += 1;
        isValid = false;
        messages.push('아이디는 영문 소문자와 숫자 각각 1개 이상 포함, 4~16자로 입력해 주세요.');
    }

    if (password !== confirmPassword) {
        cnt += 1;
        isValid = false;
        messages.push('패스워드가 일치하지 않습니다.');
    }

    if (!/^\d{3,4}$/.test(phoneNumber2) || !/^\d{4}$/.test(phoneNumber3)) {
        cnt += 1;
        isValid = false;
        messages.push('전화번호를 확인해주세요.');
    }

    if (!validatePassword(password)) {
        cnt += 1;
        isValid = false;
        messages.push('비밀번호 형식을 확인하세요.');
    }

    if (!isValid && cnt == 1) {
        alert(messages.join('\n'));
        event.preventDefault(); // Prevent form submission
    }else if (!isValid && cnt > 1){
        alert("회원가입에 실패했습니다. 회원 가입 정보를 확인해주세요.");
        event.preventDefault();
    }
});

document.getElementById('email_domain').addEventListener('change', function() {
    var customDomainInput = document.getElementById('custom_email_domain');
    var emailPrefix = document.getElementById('email_prefix');
    if (this.value === 'custom') {
        customDomainInput.style.display = 'block'; // Show the custom domain input
        this.parentNode.insertBefore(customDomainInput, emailPrefix.nextSibling); // Move custom input to the left of domain list
        customDomainInput.required = true;
    } else {
        customDomainInput.style.display = 'none'; // Hide the custom domain input
        customDomainInput.required = false;
    }
});

function validateEmail(email) {
    var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function searchAddress(input) {
    if (input.length < 2) return; // Avoid overwhelming the server with too many requests

    var apiUrl = 'https://api.jusogo.kr/address/search'; // This URL will need to be confirmed
    var params = {
        query: input,
        key: 'devU01TX0FVVEgyMDI0MDYwNTE0NDYxNjExNDgyNDY=' // Replace with your actual API key
    };

    fetch(apiUrl + '?query=' + encodeURIComponent(params.query) + '&key=' + params.key)
        .then(response => response.json())
        .then(data => {
            var list = document.getElementById('address_list');
            list.innerHTML = ''; // Clear previous results
            data.addresses.forEach(function(address) {
                var li = document.createElement('li');
                li.textContent = address.text; // Adjust depending on the structure of the response
                li.onclick = function() {
                    document.getElementById('address').value = address.text; // Populate the address input
                    list.innerHTML = ''; // Clear the list after selection
                };
                list.appendChild(li);
            });
        })
        .catch(error => console.error('Error fetching addresses:', error));
}

function openPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullAddress = data.address;
            var extraAddress = '';

            if (data.addressType === 'R') {
                if (data.bname !== '') {
                    extraAddress += data.bname;
                }
                if (data.buildingName !== '') {
                    extraAddress += (extraAddress !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                fullAddress += (extraAddress !== '' ? ' (' + extraAddress + ')' : '');
            }

            document.getElementById('address').value = fullAddress; // Set the primary address
            document.getElementById('addressDetail').focus(); // Focus on detailed address for user input
        }
    }).open();
}
</script>

<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/js/jquery.slicknav.min.js"></script>
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>
</body>
</html>