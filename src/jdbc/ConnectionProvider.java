package jdbc;

import java.sql.*;

public class ConnectionProvider {

    private static String jdbcDriver = "jdbc:mysql://54.180.99.234:3306/testdb?" + "useUnicode=true&characterEncoding=utf8&"
            + "useJDBCCompliantTimezoneShift=true&" + "useLegacyDatetimeCode=false&" + "serverTimezone=UTC";
    private static String dbUser = "root";
    private static String dbPass = "qkrcksgud1574";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    }
}
