<%--
  Created by IntelliJ IDEA.
  User: 201311270
  Date: 2019-12-10
  Time: 오후 5:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jdbc.ConnectionProvider"%>
<%@ page import="jdbc.JdbcUtil"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>테스트</title>
</head>
<body>
<table width="100%" border = "1">
    <tr>
        <td>이름</td><td>아이디</td><td>이메일</td>
    </tr>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            /*String jdbcDriver = "jdbc:mysql://54.180.99.234:3306/testdb?" + "useUnicode=true&characterEncoding=utf8&"
                    + "useJDBCCompliantTimezoneShift=true&" + "useLegacyDatetimeCode=false&" + "serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "qkrcksgud1574";*/
            String query = "select * from MEMBER order by MEMBERID";

            conn = ConnectionProvider.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while(rs.next()) {
                %>
    <tr>
        <td><%= rs.getString("NAME")%></td>
        <td><%= rs.getString("MEMBERID")%></td>
        <td><%= rs.getString("EMAIL")%></td>
    </tr>
    <%
        }
        }catch (SQLException e) {
            out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(stmt);
            JdbcUtil.close(conn);
        }
    %>
</table>
</body>
</html>
