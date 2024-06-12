<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("user_id");

    String url = "jdbc:mysql://localhost:3306/dbdvm";
    String dbUser = "dbdvm"; // MySQL 사용자 이름
    String dbPassword = "1234"; // MySQL 비밀번호

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();
        rs.next();
        int count = rs.getInt(1);

        if (count > 0) {
            out.print("사용 불가능한 아이디입니다.");
        } else {
            out.print("사용 가능한 아이디입니다.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("오류가 발생했습니다. 다시 시도해주세요.");
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
