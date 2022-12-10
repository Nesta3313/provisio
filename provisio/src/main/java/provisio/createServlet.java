package provisio;

import java.io.IOException;
import java.util.Base64;

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
 
	public String caesarCipherEncrypt(String plain) {
		   String b64encoded = Base64.getEncoder().encodeToString(plain.getBytes());

		   String reverse = new StringBuffer(b64encoded).reverse().toString();

		   StringBuilder tmp = new StringBuilder();
		   final int OFFSET = 4;
		   for (int i = 0; i < reverse.length(); i++) {
		      tmp.append((char)(reverse.charAt(i) + OFFSET));
		   }
		   return tmp.toString();
		}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email2");
        String password = request.getParameter("password2");

        password = caesarCipherEncrypt(request.getParameter("password2"));

        HttpSession sess = request.getSession(); 
        sess.setAttribute("firstName", first_name);
        sess.setAttribute("lastName", last_name);
        sess.setAttribute("email", email);
        sess.setAttribute("password", password);

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