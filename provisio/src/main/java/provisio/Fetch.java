package provisio;

import java.io.*; 
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

 
@WebServlet("/Fetch") 
public class Fetch extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

   
 
    public Fetch() { 
        super(); 
        // TODO Auto-generated constructor stub 
    } 
    
   
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		// TODO Auto-generated method stub 
		response.getWriter().append("Served at: ").append(request.getContextPath()); 
	} 
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		// TODO Auto-generated method stub 
		//doGet(request, response); 
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter(); 


		 
		 Statement st=null;
         
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio", "root", "MySQL8IsGreat!");
			String ID = request.getParameter("id");
			int id = Integer.parseInt(ID);
		
			
			HttpSession sess = request.getSession();
			
			int customerId = (int)sess.getAttribute("customer_id");
				
			String query = "select * from reservations where reservation_ID ='" + id + "' and customer_ID='" + customerId + "'";
			st = conn.createStatement();
			
			ArrayList al = null;
            ArrayList pid_list = new ArrayList();
			
			ResultSet rs = st.executeQuery(query);
			
			if(rs.next() == false) {
				
				int input = JOptionPane.showOptionDialog(null, "No Reservation Found!", "Error", JOptionPane.OK_CANCEL_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);

				if(input == JOptionPane.OK_OPTION)
				{
				
					response.sendRedirect("search.jsp");
				}
				if(input == JOptionPane.CANCEL_OPTION)
				{
					
					response.sendRedirect("makereservation.jsp");
				}
				
			} else {
				do {
					al = new ArrayList();

		              al.add(rs.getString(7));
		              al.add(rs.getString(8));
		              al.add(rs.getString(5));
		              al.add(rs.getString(9));
		              al.add(rs.getString(3));
		              al.add(rs.getString(4));

		              
		              pid_list.add(al);
		              request.setAttribute("piList", pid_list);
		              RequestDispatcher view = request.getRequestDispatcher("view.jsp");
		              view.forward(request, response);
		              conn.close();
					
				} while(rs.next());
			}
			
		
		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally { 
			out.close(); 
		} 
	 
	} 
 
} 
