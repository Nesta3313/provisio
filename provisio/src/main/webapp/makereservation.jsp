<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="provisio.acctBean"%>
<%@page import="provisio.ReservationBean"%>
<%@page import="provisio.ReservationBeanPeer"%>
<%@page import="provisio.HotelBean"%>

    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <title>Provisio Hotels and Resorts</title>
    <link rel='stylesheet'><link rel="stylesheet" href="styles/navigation.css">
    <link rel='stylesheet'><link rel="stylesheet" href="styles/navigation2.css">
    <link rel='stylesheet'><link rel="stylesheet" href="styles/reservation.css">
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
                  <li><a href="summary.jsp">SEARCH RESERVATIONS</a></li>
               </ul>
            </div>
         </div>
      </nav>
      
      <!-- partial -->
    <script  src="scripts/script.js"></script>

<% 
if(request.getMethod().equals("GET")){  // display a form
	acctBean acct = new acctBean();
HttpSession sess = request.getSession();

	sess.getAttribute("customer_id");
	//request.getAttribute("email");
	
%>
    <div id="page">

        <div id="form-div">
        
        	<form action="<%if(sess.getAttribute("email") == null){%>loginsignup.jsp <%}else{%>makereservation.jsp<%} %>" method="POST">
        	
        		<div id="upper-form">
        		
        			<div id="location-div">
        				
        				<label>Location (city, state)</label><br/>
  						<select name="location" id="location" required> 
    					<option value="Las Vegas, NV">Las Vegas, NV</option>
    					<option value="Atlanta GA">Atlanta, GA</option>
    					<option value="Chicago IL">Chicago, IL</option>
  						</select>
        			</div>
        			
        			<div id="checkin-div">
        				<label>Check-in</label><br/>
        				<input value="checkin" id="checkin" name="check_in" type="date" required/>
        			</div>
        			
        			<div id="checkout-div">
        				<label>Check-out</label><br/>
        				<input value="checkout" id="checkout" name="check_out" type="date" required/>
        			</div>
        			
        	
        		</div>
        	
        	
        	
        		<div id="lower-form">
        	
        			<div id="num-guests-div">
        				<label> Number of Guests </label><br/>
        				
        				<input type="radio" id="1-3" name="number_of_guest" value="1-3" required>
  						<label for="1-3">1-3 (rate: $115 per night)</label><br>

  						<input type="radio" id="3-5" name="number_of_guest" value="3-5">
  						<label for="3-5">3-5 (rate: $150 per night)</label><br>
  						
        			</div>
        			
        			
        			<div id="room-size-div"> 
        				<label> Room Size </label><br/>
        				
        				<input type="radio" id="doublefull" name="room_size" value="double full" required>
  						<label for="double full">double full</label><br>

  						<input type="radio" id="queen" name="room_size" value="queen">
  						<label for="queen">queen</label><br>

						<input type="radio" id="doublequeen" name="room_size" value="double queen">
  						<label for="double queen">double queen</label><br>

						<input type="radio" id="king" name="room_size" value="king">
  						<label for="king">king</label><br>
        			</div>
        			
        			
        			<div id="amenities-div"> 
        				<label> Amenities </label><br/>
        				<input type="checkbox" id="wifi" name="amenities" value="wifi" >
  						<label for="wifi"> wifi (rate: $12.99 flat)</label><br>
  						<input type="checkbox" id="breakfast" name="amenities" value="breakfast">
  						<label for="breakfast"> breakfast (rate: $8.99 per night)</label><br>
  						<input type="checkbox" id="parking" name="amenities" value="parking">
  						<label for="parking">parking (rate: $19.99 per night)</label><br>
        			</div>
        			
        		</div>
        		
        		<div id="button-div">
        			<div id="inner-button-div"> <input name="continue" id="button" type="submit" value="CONTINUE" /> </div>
        		</div>
        		
  
        		
        	</form>
      
        </div>
        
    </div>
    
    

<%} %>

<%
	if(request.getMethod().equals("POST")) {  // save form data to database 
		
	
	acctBean acct = new acctBean();
	
	
		ReservationBeanPeer reservation = new ReservationBeanPeer();
		HotelBean hotel = new HotelBean();
		ReservationBean reservationBean = new ReservationBean();
		 
		
		int customer_id = acct.getCustomerID();  // get the customer id from the acctBean class
		
		int reservation_id = (int)(Math.random()*9999);
		
		String  check_in = request.getParameter("check_in");
		String check_out = request.getParameter("check_out");
		String number_of_guest = request.getParameter("number_of_guest");

		String location = request.getParameter("location");
		// int hotel_id = hotel.findHotelId(location);  // get the hotel id

		String room_size = request.getParameter("room_size");

		String[] amenities = request.getParameterValues("amenities");

		int loyalty_points = reservationBean.calculatePoints(check_in, check_out);

		// set session objects
		HttpSession sess = request.getSession(); 
		sess.setAttribute("reservation_id", reservation_id);
		//sess.setAttribute("customer_ID", customer_id);
		
		sess.setAttribute("check_in", check_in);
		sess.setAttribute("check_out", check_out);
		sess.setAttribute("number_of_guest", number_of_guest);
		sess.setAttribute("location", location);
		sess.setAttribute("room_size", room_size);
		sess.setAttribute("amenities", amenities);
		sess.setAttribute("loyalty_points", loyalty_points);

		
		// code for passing parameters to form reservation bean object
		reservationBean.setReservation_ID(reservation_id);
				
		int hotel_id = reservationBean.findHotel(location);
				
		reservationBean.setHotel_ID(hotel_id);
		//out.print(reservationBean.getHotel_ID());
		sess.setAttribute("hotel_ID", hotel_id);
		// reservationBean.setHotel_ID(200);
		reservationBean.setCheck_in(check_in);
		reservationBean.setCheck_out(check_out);
		reservationBean.setNumber_of_guest(number_of_guest);
		
		//reservationBean.setCustomer_ID(customer_id);
		//reservationBean.setCustomer_ID(100);
		reservationBean.setCustomer_ID((int)sess.getAttribute("customer_id"));
		
		
		
		reservationBean.setLocation(location);
		reservationBean.setRoom_size(room_size);
		reservationBean.setAmenities(amenities);
		reservationBean.setLoyalty_points(loyalty_points);

		try {
		    reservation.insertReservation(reservationBean);
		} catch (Exception e) {
		    e.printStackTrace();
		}

		//response.sendRedirect("summary.jsp");
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
        	<p> <%out.print(check_in); %></p>
        	<p> <%out.print(check_out); %></p>
        	<p> <%out.print(loyalty_points); %></p>
        	<p> <%out.print(number_of_guest); %></p>
        	<p> <%out.print(room_size); %></p>
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
        	
        
    		%>
        	
        	</p>
        
        </div>
        
        
        
    </div>
    <div id="buttons">
        	
        	<div id="submit-div"> <input class="button" type="submit" value="SUBMIT" formaction="ReservationConfirmation.jsp"/> </div>
        	<div id="cancel-div"> <input class="button" type="submit" value="CANCEL" formaction="dropReservationRecord.jsp"/> </div>
        	
     	</form>
     </div>
<%

} // closes request.getMethod...

%>

    <footer>
        <div id="footer">
            <p> <a href="#" target="_blank"> PROVISIO </a> 
                &copy; <script>document.write(new Date().getFullYear());</script>
            </p>
        </div>
        
    </footer>
      
</body>
</html>


