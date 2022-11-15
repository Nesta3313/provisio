package provisio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class createAcctBean {

    public int createAcct(acctBean acct) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO provisio.registrations" +
            "  (customer_id, first_name, last_name, email, password) VALUES " +
            " (?, ?, ?, ?, ?);";

        int result = 0;
        int rand = ((int)(Math.random() * 9999999) + 1);
        
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection conn = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/provisio", "root", "password");

            PreparedStatement stmt = conn.prepareStatement(INSERT_USERS_SQL)) {
        	stmt.setInt(1, rand);
            stmt.setString(2, acct.getFirstName());
            stmt.setString(3, acct.getLastName());
            stmt.setString(4, acct.getEmail());
            stmt.setString(5, acct.getPassword())
;
            System.out.println(stmt);
            result = stmt.executeUpdate();
            
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
