<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.DBConnection" %>
<%
    String name = request.getParameter("user_name");
    String username = request.getParameter("user_id");
    String password = request.getParameter("user_pwd");
    String phonePrefix = request.getParameter("phone_prefix");
    String phoneNumber = request.getParameter("phone_number");
    String phone = phonePrefix + phoneNumber;  // 휴대폰 번호 합치기
    String email = request.getParameter("email");
    String birthday = request.getParameter("birthdate");
    String mbti = request.getParameter("mbti");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        conn = DBConnection.getConnection();

        // 아이디 중복 체크
        String checkSql = "SELECT COUNT(*) FROM users WHERE username = ?";
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();
        rs.next();
        int count = rs.getInt(1);

        if (count > 0) {
            out.println("<script>alert('이미 존재하는 아이디입니다.'); history.back();</script>");
        } else {
            // 생일 날짜 형식 검증 및 변환
            java.sql.Date sqlDate = null;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date parsedDate = sdf.parse(birthday);
                sqlDate = new java.sql.Date(parsedDate.getTime());
            } catch (Exception e) {
                throw new IllegalArgumentException("잘못된 날짜 형식입니다. yyyy-MM-dd 형식으로 입력해주세요.");
            }

            String sql = "INSERT INTO users (name, username, password, phone, email, birthday, mbti) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, username);
            pstmt.setString(3, password);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.setDate(6, sqlDate);
            pstmt.setString(7, mbti);

            int row = pstmt.executeUpdate();
            if (row > 0) {
                out.println("<script>alert('회원가입 성공!'); location.href='index.jsp';</script>");
            } else {
                out.println("<script>alert('회원가입 실패.'); history.back();</script>");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류가 발생했습니다. 다시 시도해주세요.'); history.back();</script>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
