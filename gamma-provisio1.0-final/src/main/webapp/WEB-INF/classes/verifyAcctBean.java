package provisio;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static javax.swing.JOptionPane.showMessageDialog;

@WebServlet("/verify")

public class verifyAcctBean extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void verify(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException, ClassNotFoundException {
    	acctBean acct = new acctBean();
    	String dbemail = null;
    	String dbpassword = null;
    	
        String eQUERY = "SELECT * FROM registrations;";

        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection conn = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/registrations", "root", "password");

            PreparedStatement stmt = conn.prepareStatement(eQUERY)) {
      	
            rs = stmt.executeQuery();
            while (rs.next()) {
                dbemail = rs.getString(3);
                dbpassword = rs.getString(4);
                              
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                
                if (email == dbemail && password == dbpassword) {
        	        String first_name = request.getParameter("first_name");
        	        String last_name = request.getParameter("last_name");
        	        
        	        HttpSession sess = request.getSession(); 
        	        sess.setAttribute("firstName", first_name);
        	        sess.setAttribute("lastName", last_name);
        	        sess.setAttribute("email", email);
        	        sess.setAttribute("password", password);

        	        acct.setFirstName(first_name);
        	        acct.setLastName(last_name);
        	        acct.setEmail(email);
        	        acct.setPassword(password);
        	        
        	        response.sendRedirect("loyaltypoints.jsp");        
                }
                
                if (email == dbemail && password != dbpassword) {
                	showMessageDialog(null, "Password incorrect. Please try again.");
                	break;
                }
                if (email != dbemail && !rs.next()) {
                	showMessageDialog(null, "Email not on file. Please sign up.");
                	break;
                }
                
            }
            
        } catch (SQLException e) {
            printSQLException(e);
        }
 
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

