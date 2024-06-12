<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.DBConnection" %>
<%
    String username = (String) session.getAttribute("username");
    String name = "";
    String mbti = "";

    if (username != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT name, mbti FROM users WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                mbti = rs.getString("mbti");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
%>
        <script>
            alert("로그인이 필요한 시스템입니다");
            window.location.href = "${pageContext.request.contextPath}/login.jsp";
        </script>
<%
        return; // Ensure the rest of the page is not processed
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="../css/main.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        .content-wrapper {
            display: flex;
            justify-content: flex-start;
            margin-left: 500px;
            margin-top: 80px;
            flex-wrap: nowrap;
        }

        .content {
            display: flex;
            flex-wrap: nowrap;
            gap: 40px; /* Increased gap between the two divs */
            width: 100%;
        }

        #MyInformation, #management {
            flex: 1 1 calc(50% - 20px); /* Calculate width based on gap */
            background: #9b9dff;
            padding: 20px;
            min-width: 300px; /* Minimum width to prevent too much shrinking */
            max-width: 500px; /* Maximum width to control the size */
            height: 70vh;
            transition: all 0.3s ease; /* Smooth transition */
        }

        #management {
            background: #4CAF50;
            color: black;
        }

        @media (max-width: 1200px) {
            .content-wrapper {
                margin-left: 300px; /* Adjust margin for smaller screens */
            }
        }

        @media (max-width: 1000px) {
            .content-wrapper {
                margin-left: 0; /* Remove left margin for small screens */
                flex-direction: column; /* Stack items vertically on small screens */
                padding: 20px;
            }
            .sidebar {
                position: fixed;
                transform: translateX(-300px); /* Hide sidebar */
            }
            .menu-toggle {
                width: 25px;
                border-radius: 3px;
                color: #000000;
                display: block;
            }
            .sidebar.active {
                transform: translateX(0); /* Show sidebar */
            }
        }
        /* 수정 및 관리 부분 */
        .ManagementItem{
            color: black;
            text-decoration: none;
            font-size: 30px;
        }
        #Information-Modification{
            margin-bottom: 50px ;
        }
        #Courses-Management{
            margin-bottom: 50px ;
        }
        #Community-Management{
            margin-bottom: 50px ;
            width: 400px;
            background-color: #9b9dff;
            border: 1px solid black;
            border-radius:5px ;
        }
        #Review-Management{
            width: 400px;
            background-color: #9b9dff;
            border: 1px solid black;
            border-radius:5px ;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <!-- 로고 이미지 추가 -->
            <div class="logo">
               <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/imgs/mmm_logo2.png" alt="MMM"></a>
            </div>
        </div>
    </div>
    <!-- 사이드바 -->
<%@ include file="../sidebar.jsp" %>
    <!-- 토글 버튼 -->
    <div class="menu-toggle">&#9776;</div>
</div>
<div class="container-fluid">
    <div class="content-wrapper">
        <div class="content">
            <div id="MyInformation">
                <div id="profile">
                    <div><img src="${pageContext.request.contextPath}/imgs/profile.png" alt="Profile"></div>
                    <div>이름: <%= name %></div>
                    <div>아이디: <%= username %></div>
                    <div>MBTI: <%= mbti %></div>
                </div>
            </div>
            <div id="management">
                <div id="Information-Modification"><a href="#" class="ManagementItem"><img src="${pageContext.request.contextPath}/imgs/myPage1.png" alt="이미지_설명" width="40">    개인정보수정</a></div>
                <div id="Courses-Management"><a href="#" class="ManagementItem">찜코스 관리</a></div>
                <div id="Community-Management">
                    <a href="#" class="ManagementItem">커뮤니티 관리</a>
                    <div>내가 쓴 글</div>
                    <div>내 댓글</div>
                </div>
                <div id="Review-Management">
                    <a href="#" class="ManagementItem">후기글 관리</a>
                    <div>내가 쓴 글</div>
                    <div>좋아요한 글</div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/toggle.js"></script>
</body>
</html>
