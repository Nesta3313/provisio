package provisio;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/create")
public class createServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private createAcctBean createAcct;

    public void init() {
        createAcct = new createAcctBean();
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email2");
        String password = request.getParameter("password2");

        HttpSession sess = request.getSession(); 
        sess.setAttribute("firstName", first_name);
        sess.setAttribute("lastName", last_name);
        sess.setAttribute("email", email);
        sess.setAttribute("password", sess);

        acctBean acct = new acctBean();
        acct.setFirstName(first_name);
        acct.setLastName(last_name);
        acct.setEmail(email);
        acct.setPassword(password);

        try {
            createAcct.createAcct(acct);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("loyaltypoints.jsp");
    }
}