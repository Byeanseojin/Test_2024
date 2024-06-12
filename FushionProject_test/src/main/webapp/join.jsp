<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <!-- 부트스트랩 CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
  $(document).ready(function() {
	    // 아이디 중복확인
	    $('#check-username-btn').click(function() {
	      var userId = $('#user_id').val();
	      if (userId === '') {
	        alert('아이디를 입력하세요.');
	        return;
	      }
	      $.ajax({
	        url: 'check_username.jsp',
	        type: 'GET',
	        data: { user_id: userId },
	        success: function(response) {
	          if (response.trim() === '사용 가능한 아이디입니다.') {
	            $('#user_id').removeClass('is-invalid').addClass('is-valid');
	          } else {
	            $('#user_id').removeClass('is-valid').addClass('is-invalid');
	          }
	        },
	        error: function() {
	        }
	      });
	    });

	    // 비밀번호 확인
	    $('#user_pwd_re').on('input', function() {
	      var password = $('#user_pwd').val();
	      var passwordRe = $(this).val();
	      if (password !== passwordRe) {
	        $('#user_pwd, #user_pwd_re').removeClass('is-valid').addClass('is-invalid');
	      } else {
	        $('#user_pwd, #user_pwd_re').removeClass('is-invalid').addClass('is-valid');
	      }
	    });

	    // 폼 제출 시 비밀번호 확인
	    $('#register-form').submit(function(event) {
	      var password = $('#user_pwd').val();
	      var passwordRe = $('#user_pwd_re').val();
	      if (password !== passwordRe) {
	        alert('비밀번호가 일치하지 않습니다.');
	        event.preventDefault();
	      }
	    });
	  });
</script>
  <style>
    /* 추가적인 스타일링 */
    .register-container {
      max-width: 900px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
      margin-top: 50px;
    }
    /* 입력란을 같은 높이로 맞추기 */
    .form-group {
      display: flex;
      align-items: center;
    }

    /* 라벨 너비 조정 */
    label {
      width: 150px; /* 라벨의 너비를 조정합니다. */
      margin-right: 10px;
    }
	.is-valid {
    border-color: #28a745 !important;
  	}
	.is-invalid {
    border-color: #dc3545 !important;
  	}
  </style>
</head>
<body>
<form id="register-form" action="insert.jsp" method="post">
  <div class="container">
    <div class="row">
      <div class="col-md-8 offset-md-2 register-container">
        <h2 class="text-center mb-4">회원가입</h2>
        <div class="form-group">
          <label for="user_name">이름</label>
          <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름을 입력하세요">
        </div>
        <div class="form-group">
          <label for="user_id">아이디</label>
          <div class="input-group">
            <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력하세요">
            <div class="input-group-append">
              <button class="btn btn-outline-secondary" type="button" id="check-username-btn">중복확인</button>
            </div>
          </div>
          <small id="username-check-result" class="form-text text-muted"></small>
        </div>
        <div class="form-group">
          <label for="user_pwd">비밀번호</label>
          <input type="password" class="form-control" id="user_pwd" name="user_pwd" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="form-group">
          <label for="user_pwd_re">비밀번호 확인</label>
          <input type="password" class="form-control" id="user_pwd_re" name="user_pwd_re" placeholder="비밀번호를 다시 입력하세요">
          <small id="password-check-result" class="form-text text-muted"></small>
        </div>
        <div class="form-row">
          <div class="form-group col-sm-4">
            <label for="phone_prefix">휴대폰</label>
            <select class="form-control form-control-sm" id="phone_prefix" name="phone_prefix">
              <option>010</option>
              <option>011</option>
              <option>012</option>
            </select>
          </div>
          <div class="form-group col-sm-8">
            <label class="sr-only" for="phone_number">휴대폰 번호</label>
            <div class="input-group">
              <input type="text" class="form-control" id="phone_number" name="phone_number" placeholder="번호를 입력하세요">
            </div>
          </div>
        </div>
        <div class="form-group">
          <button type="button" class="btn btn-primary btn-block">인증번호 발송</button>
        </div>
        <div class="form-group">
          <label for="verification_code">핸드폰 인증번호</label>
          <div class="input-group">
            <input type="text" class="form-control" id="verification_code" placeholder="인증번호를 입력하세요">
            <div class="input-group-append">
              <button class="btn btn-secondary" type="button">확인</button>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label for="email">이메일</label>
          <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
        </div>
        <div class="form-group">
          <label for="birthdate">생년월일</label>
          <input type="date" class="form-control" id="birthdate" name="birthdate">
        </div>
        <div class="form-group">
          <label for="mbti">MBTI</label>
          <select class="form-control" id="mbti" name="mbti">
            <option selected disabled>선택하세요</option>
            <option value="ISTJ">ISTJ</option>
            <option value="ISFJ">ISFJ</option>
            <option value="INFJ">INFJ</option>
            <option value="INTJ">INTJ</option>
            <option value="ISTP">ISTP</option>
            <option value="ISFP">ISFP</option>
            <option value="INFP">INFP</option>
            <option value="INTP">INTP</option>
            <option value="ESTP">ESTP</option>
            <option value="ESFP">ESFP</option>
            <option value="ENFP">ENFP</option>
            <option value="ENTP">ENTP</option>
            <option value="ESTJ">ESTJ</option>
            <option value="ESFJ">ESFJ</option>
            <option value="ENFJ">ENFJ</option>
            <option value="ENTJ">ENTJ</option>
          </select>
        </div>
        <button type="submit" class="btn btn-primary btn-block">가입하기</button>
      </div>
    </div>
  </div>
</form>


</body>
</html>
