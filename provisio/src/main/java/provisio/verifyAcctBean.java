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
	ResultSet rs;
	String dbemail = null;
	String dbpassword = null;

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String eQUERY = "SELECT * FROM registrations WHERE email = '" + email + "';";
		String target = "";

		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio", "root", "password");

			PreparedStatement stmt = conn.prepareStatement(eQUERY)) {
			acctBean acct = new acctBean();
			rs = stmt.executeQuery();

			if (rs.next() == false) {
				showMessageDialog(null, "Email is not on file. Please sign up first.");
				target = "loginsignup.jsp";
				
				response.sendRedirect(target);
				return;
			}
			
			do{

				dbemail = rs.getString(4);
				dbpassword = rs.getString(5);
				dbemail = dbemail.toString();
				dbpassword = dbpassword.toString();

				if (password.equals(dbpassword)) {

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

					target = "loyaltypoints.jsp";	
					response.sendRedirect(target);
					return;
				}

				if (!password.equals(dbpassword)) {

					showMessageDialog(null, "Password incorrect. Please try again.");
					target = "loginsignup.jsp";
					response.sendRedirect(target);
					return;
				}


			} while(rs.next());
			
			response.sendRedirect(target);
			return;

		} catch (SQLException e) {
			printSQLException(e);
		}

	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
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
