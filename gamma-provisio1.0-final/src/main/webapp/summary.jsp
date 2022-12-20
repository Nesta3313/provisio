<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="provisio.acctBean" %>
<%@ page import="provisio.HotelBean" %>
<%@ page import="provisio.ReservationBean" %>
<%@ page import="provisio.ReservationBeanPeer" %>
<%
if(request.getMethod().equals("POST")){
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <title>Provisio Hotels and Resorts</title>
    <link rel='stylesheet'><link rel="stylesheet" href="styles/navigation.css">
    <link rel='stylesheet'><link rel="stylesheet" href="styles/navigation2.css">
    <link rel='stylesheet'><link rel="stylesheet" href="styles/summary.css">
  
</head>

<body>
       <!--First Nav Bar-->
      <nav class="navbar">
         <div class="container">
            <div class="navbar-header">
               <button class="navbar-toggler" data-toggle="open-navbar1">
               <span></span>
               <span></span>
               <span></span>
               </button>
               <a href="#">
               <img src="images/ProvisioLogo.png" alt="Paris" class="center" width="150px" height="auto">
               </a>
            </div>
            <div class="navbar-menu" id="open-navbar1">
               <ul class="navbar-nav">
                  <li><a href="index.html">HOME</a></li>
                  <li class="navbar-dropdown">
                     <a href="about.html" class="dropdown-toggler" data-dropdown="my-dropdown-id">
                     ABOUT US <i class="fa fa-angle-down"></i>
                     </a>
                  <li class="navbar-dropdown">
                     <a href="about.html" class="dropdown-toggler" data-dropdown="blog">
                     CONTACT <i class="fa fa-angle-down"></i>
                     </a>
                  </li>
                  <li><a href="locations.html">LOCATIONS</a></li>
                  <li><a href="makereservation.jsp">MAKE RESERVATIONS</a></li>
               </ul>
            </div>
         </div>
      </nav>
      <!--Second Nav Bar-->
      <nav class="navbar2">
         <div class="container">
            <div class="navbar2-menu" id="open-navbar2">
               <ul class="navbar2-nav">
                  <li><a href="loginsignup.jsp">SIGN IN</a></li>
                  <li><a href="loyaltypoints.jsp">LOYALTY POINTS</a></li>
                  <li><a href="search.jsp">SEARCH RESERVATIONS</a></li>
               </ul>
            </div>
         </div>
      </nav>
      
      <!-- partial -->
    <script  src="scripts/script.js"></script>

<% 
		
		/*int reservationid = (int)(Math.random()*99999);

		String location = request.getParameter("location");
		
		String checkin = request.getParameter("check_in");
		
		String checkout = request.getParameter("check_out");
	
		char checkin_day1 = checkin.charAt(8);  // find the date's first number
		char checkin_day2 = checkin.charAt(9);  // find the date's second number 
		String checkin_day = Character.toString(checkin_day1) + Character.toString(checkin_day2);  // put date together
		
		char checkout_day1 = checkout.charAt(8);  // find the date's first num
		char checkout_day2 = checkout.charAt(9);  // find the date's second num
		String checkout_day = Character.toString(checkout_day1) + Character.toString(checkout_day2);  // put date togetehr
		
		int loyaltypoints = (Integer.parseInt(checkout_day) - Integer.parseInt(checkin_day))*150;  // calculate loyalty points
		
		String numofguests = request.getParameter("number_of_guest");
		String roomsize = request.getParameter("room_size");
		
		String amenities[]= request.getParameterValues("amenities");*/
		
		int reservationid = (int)(Math.random()*99999);
		session.setAttribute("reservation_ID", reservationid);

		String location = request.getParameter("location");
		session.setAttribute("location", location);

		String checkin = request.getParameter("check_in");
		session.setAttribute("check_in", checkin);

		String checkout = request.getParameter("check_out");
		session.setAttribute("check_out", checkout);

		char checkin_day1 = checkin.charAt(8);  // find the date's first number
		char checkin_day2 = checkin.charAt(9);  // find the date's second number 
		
		String checkin_day = Character.toString(checkin_day1) + Character.toString(checkin_day2);  // put date together

		char checkout_day1 = checkout.charAt(8);  // find the date's first num
		char checkout_day2 = checkout.charAt(9);  // find the date's second num
		String checkout_day = Character.toString(checkout_day1) + Character.toString(checkout_day2);  // put date together

		
		int loyaltypoints = (Integer.parseInt(checkout_day) - Integer.parseInt(checkin_day))*150;  // calculate loyalty points
		session.setAttribute("loyalty_points", loyaltypoints);

		String numofguests = request.getParameter("number_of_guest");
		session.setAttribute("number_of_guest", numofguests);

		String roomsize = request.getParameter("room_size");
		session.setAttribute("room_size", roomsize);

		String amenities[]= request.getParameterValues("amenities");
		//session.setAttribute("amenities", amenities[]);

	
	%>



	<form>
    <div id="page">
		<div id="labels">
			<p> LOCATION </p>
			<p> CHECK-IN </p>
			<p> CHECK-OUT </p>
			<p> LOYALTY POINTS </p>
			<p> NUMBER OF GUESTS </p>
			<p> ROOM SIZE </p>
			<p> AMENITIES </p>
		</div>
        
        
        
        <div id="selections">
        
        	<p> <%out.print(location); %> </p>
        	<p> <%out.print(checkin); %></p>
        	<p> <%out.print(checkout); %></p>
        	<p> <%out.print(loyaltypoints); %></p>
        	<p> <%out.print(numofguests); %></p>
        	<p> <%out.print(roomsize); %></p>
        	<p><% 
        	
        	if(amenities != null)
    		{
    		%>
    		
    		<%
    		for(int i=0; i<amenities.length; i++)
    		{
    		%>
    		<%=amenities[i]%><br/>
    		<%
    		}
    		%>
    		
    		<%
    		}
        	else{
        		out.print("NONE");
        	}
        	
        	java.sql.Connection con;
    		java.sql.Statement stmt;
    		java.sql.PreparedStatement ps;
    		java.sql.ResultSet resultSet;
    		java.sql.ResultSetMetaData rsmd;

    		// ESTABLISH CONNECTION
    		try{
    			Class.forName("com.mysql.cj.jdbc.Driver");
    		    String url = "jdbc:mysql://localhost/provisio";
    		    String user = "root";
    		    String password = "MySQL8IsGreat!";
    		    con = java.sql.DriverManager.getConnection(url, user, password);
    		   
    		    out.println("<b>Database connection established...</b><br />");
    		    
    		    try{
    		    	ps = con.prepareStatement("insert into reservations(reservation_ID, hotel_ID, check_in, check_out, number_of_guest, customer_ID, location, room_size, amenities, loyalty_points) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    		    //ps.setInt(1, );
    	    	//ps.setInt(2, 400);
    	    	ps.setString(3,checkin);
    	    	ps.setString(4, checkout);
    	    	ps.setString(5, numofguests);
    	    	//ps.setInt(6, 123); //customer_ID
    	    	ps.setString(7, location);
    	    	ps.setString(8, roomsize);
    	    	//ps.setString(9, "hey");
    	    	ps.setInt(10, loyaltypoints);
    	    	
    		    	
    				ps.executeUpdate(); 
    				
    				out.println("Record insertion successful <br/><br/>");
    		    }
    		    catch(java.sql.SQLException e){
    		    	out.println("Record insertion unsuccessful...<br/>");
    		    	e.printStackTrace();
    		       
    		    }
    		}
    		catch(Exception ex){
    			out.println("Database connection error...");
    		}


    		%>
        	
        	</p>
        
        </div>
        
        
        
    </div>
    <div id="buttons">
        
        	<div id="submit-div"> <input class="button" type="submit" value="SUBMIT" formaction="#"/> </div>
        	<div id="cancel-div"> <input class="button" type="submit" value="CANCEL" formaction="#"/> </div>
        	 
     </form>
    
    </div>



    

 <footer>
        <div id="footer">
            <p> <a href="#" target="_blank"> PROVISIO </a> 
                &copy; <script>document.write(new Date().getFullYear());</script>
            </p>
        </div>
        
    </footer>
</body>
</html>

<%
ReservationBeanPeer reservation = new ReservationBeanPeer();
HotelBean hotel = new HotelBean();
ReservationBean reservationBean = new ReservationBean();
 
int reservation_id = (int)(Math.random()*9999);
 
acctBean acct = new acctBean();
int customer_id = acct.getCustomerID();  // get the customer id from the acctBean class

String  check_in = request.getParameter("check_in");
String check_out = request.getParameter("check_out");
String number_of_guest = request.getParameter("number_of_guest");

String location2 = request.getParameter("location");
int hotel_id = hotel.findHotelId(location2);  // get the hotel id

String room_size = request.getParameter("room_size");

String[] amenities2 = request.getParameterValues("amenities");

int loyalty_points = reservationBean.calculatePoints(check_in, check_out);

HttpSession sess = request.getSession(); 
sess.setAttribute("customer_ID", customer_id);
sess.setAttribute("hotel_ID", hotel_id);
sess.setAttribute("check_in", check_in);
sess.setAttribute("check_out", check_out);
sess.setAttribute("number_of_guest", number_of_guest);
sess.setAttribute("location", location2);
sess.setAttribute("room_size", room_size);
sess.setAttribute("amenities", amenities2);
sess.setAttribute("loyalty_points", loyalty_points);

reservationBean.setReservation_ID(reservation_id);
reservationBean.setHotel_ID(hotel_id);
reservationBean.setCheck_in(check_in);
reservationBean.setCheck_out(check_out);
reservationBean.setNumber_of_guest(number_of_guest);
reservationBean.setCustomer_ID(customer_id);
reservationBean.setLocation(location);
reservationBean.setRoom_size(room_size);
reservationBean.setAmenities(amenities);
reservationBean.setLoyalty_points(loyalty_points);

try {
    reservation.insertReservation(reservationBean);
} catch (Exception e) {
    e.printStackTrace();
}

response.sendRedirect("summary.jsp");


}
%>
 



<!-- 
source for printing checkbox values - https://www.devmanuals.com/tutorials/java/jsp/multiplecheckbox.html 

 -->
