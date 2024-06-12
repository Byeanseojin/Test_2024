<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FAQ</title>
    <link rel="stylesheet"  href="../css/main.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        /* FAQ 스타일 */
        .faq-container {
            width: 70%;
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .faq-question {
            margin-bottom: 20px;
        }
        .faq-question h3 {
            margin-bottom: 10px;
        }
        .faq-answer {
            margin-bottom: 30px;
        }

        /* 문의하기 버튼 스타일 */
        .contact-button {
            background-color: #bbb4ff;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            height: auto; /* 버튼의 높이를 자동으로 조정 */
            padding: 8px 16px; /* 버튼의 내부 여백 설정 */
            display: inline-block; /* 인라인 블록 요소로 표시하여 텍스트에 맞게 설정 */
            float: right;
        }

        .contact-button:hover {
            color: inherit; /* 텍스트 색상을 상속 */
            border-color: transparent; /* 테두리 색상 투명으로 설정 */
        }

    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <!-- 로고 이미지 추가 -->
            <div class="logo">
                <img src="${pageContext.request.contextPath}/imgs/mmm_logo2.png" alt="MMM">
            </div>
        </div>
    </div>
    <!-- 사이드바 -->
<%@ include file="../sidebar.jsp" %>


    <div class="faq-container">
        <div class="faq-question">
            <h1 style="text-align: center">자주 묻는 질문</h1><hr>
            <h3>질문 1</h3>
            <div class="faq-answer">
                답변 내용이 여기에 들어갑니다.
            </div>
        </div><hr>
        <div class="faq-question">
            <h3>질문 2</h3>
            <div class="faq-answer">
                답변 내용이 여기에 들어갑니다.
            </div>
        </div><hr>
        <div class="faq-question">
            <h3>질문 3</h3>
            <div class="faq-answer">
                답변 내용이 여기에 들어갑니다.
            </div>
        </div><hr>
        <div class="faq-question">
            <h3>질문 4</h3>
            <div class="faq-answer">
                답변 내용이 여기에 들어갑니다.
            </div>
        </div><hr>
        <div class="faq-question">
            <h3>질문 5</h3>
            <div class="faq-answer">
                답변 내용이 여기에 들어갑니다.
            </div>
        </div><hr>
        <!-- 직접 문의하기 링크 -->
        <a href="#" class="contact-button">직접 문의하기</a>
    </div>
    <div class="menu-toggle">&#9776;</div>
</div>
</body>
<script src="../js/main.js"></script>
</html>