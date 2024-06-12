<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="sidebar" class="col-lg-5 sidebar">
    <% if (session.getAttribute("username") != null) { %>
        <span id="username"><%= session.getAttribute("username") %></span>
        <span id="logout"><a href="${pageContext.request.contextPath}/logout.jsp" class="logout">로그아웃</a></span>
    <% } else { %>
        <span id="login"><a href="${pageContext.request.contextPath}/login.jsp" class="login">로그인</a></span>
        <span id="join"><a href="${pageContext.request.contextPath}/join.jsp" class="join">회원가입</a></span>
    <% } %>
    <ul id="ul1">
        <li><a href="${pageContext.request.contextPath}/side/popularKeyword.jsp" class="item"><div>인기키워드</div></a></li>
        <li><a href="${pageContext.request.contextPath}/side/popularTopCourse.jsp" class="item"><div>인기 Top 코스</div></a></li>
        <li><a href="${pageContext.request.contextPath}/side/bestFood.jsp" class="item"><div>Best 맛집</div></a></li>
        <li><a href="${pageContext.request.contextPath}/side/community.jsp" class="item"><div>커뮤  니티</div></a></li>
        <li><a href="${pageContext.request.contextPath}/side/reviews.jsp" class="item"><div>후기글 모음</div></a></li>
        <li><a href="${pageContext.request.contextPath}/side/FAQ.jsp" class="item"><div>FAQ</div></a></li>
        <hr class="sidebar-hr">
        <li><a href="${pageContext.request.contextPath}/side/myPage.jsp" class="item"><div>마이페이지</div></a></li>
        <li>
            <ul id="ul2">
                <li><a href="#" class="item2"><div class="mypageItem">개인정보 수정</div></a></li>
                <li><a href="#" class="item2"><div class="mypageItem">찜코스</div></a></li>
                <li><a href="#" class="item2"><div class="mypageItem">커뮤니티</div></a></li>
            </ul>
        </li>
        <hr class="sidebar-hr">
        <li><div class="sidebar-insta">인스타추천</div></li>
        <li><div class="instaImg"><img src="${pageContext.request.contextPath}/imgs/instagram.png" width="30" height="30"></div></li>
    </ul>
</div>
