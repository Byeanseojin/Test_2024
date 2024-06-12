<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.DBConnection" %>

<%
    // 사용자가 입력한 아이디와 비밀번호 가져오기
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // DBConnection 클래스를 사용하여 로그인 정보 검증
    boolean loginSuccess = DBConnection.login(username, password);

    if (loginSuccess) {
        // 로그인이 성공한 경우, 세션에 사용자 정보를 저장합니다.
        session.setAttribute("username", username);
        // 인덱스 페이지로 리다이렉트합니다.
        response.sendRedirect("index.jsp");
    } else {
        // 사용자가 존재하지 않는 경우, 로그인 페이지로 다시 리다이렉트합니다.
        response.sendRedirect("login.jsp?error=invalid");
    }
%>
