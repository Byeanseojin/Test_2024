<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <!-- 부트스트랩 CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body, html {
      height: 100%;
      margin: 0;
      justify-content: center; /* 수평 중앙 정렬 */
      align-items: center
    }
    .login-container {
      margin-top: 25%;
      margin-left: 25%;
      max-width: 600px;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
      background-color: #fff;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }
    .social-login-btn {
      display: block;
      align-items: center;
      justify-content: center;
      background-color: #FEE500;
      border: none;
      color: #000;
      font-weight: bold;
      width: 50%;
      padding: 10px;
      margin-top: 10px;
      margin-left: 25%;
      border-radius: 5px;
      text-align: center;
    }
    .social-login-btn img {
      height: 24px;
      margin-right: 8px;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-6 login-container">
      <h2 class="text-center mb-4">로그인</h2>
      <form action="loginAction.jsp" method="post">
        <div class="form-group row">
          <label for="username" class="col-sm-3 col-form-label">아이디</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" id="username" name="username" placeholder="아이디를 입력하세요">
          </div>
        </div>
        <div class="form-group row">
          <label for="password" class="col-sm-3 col-form-label">비밀번호</label>
          <div class="col-sm-9">
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요">
          </div>
        </div>
        <button type="submit" class="btn btn-primary btn-block mb-3">로그인</button>
        <div class="text-center">
          <p>아직 회원이 아니신가요? <a href="${pageContext.request.contextPath}/join.jsp">회원가입</a>하세요.</p>
        </div>
      </form>
      <hr>
      <button class="social-login-btn">
        <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" alt="KakaoTalk Logo">
        카카오톡으로 로그인
      </button>
    </div>
  </div>
</div>
<!-- 부트스트랩 JS 및 jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
