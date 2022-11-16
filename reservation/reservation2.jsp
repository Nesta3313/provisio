<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="provisio.beans.acctBean"%>
<%@page import="provisio.beans.ReservationBean"%>
<%@page import="provisio.model.ReservationBeanPeer"%>
<%@page import="provisio.beans.HotelBean"%>
<jsp:useBean id="dataManager" scope="application"
  class="provisio.model.DataManager"/>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <title>Provisio Hotels and Resorts</title>
    <link rel='stylesheet'><link rel="stylesheet" href="./navigation.css">
    <link rel='stylesheet'><link rel="stylesheet" href="./navigation2.css">
    <link rel='stylesheet'><link rel="stylesheet" href="./reservation.css">
    <link rel='stylesheet'><link rel="stylesheet" href="./summary.css">
  
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
                <img src="images/provisiologo.jpg" alt="Paris" class="center" width="150px" height="auto">
              </a>
            
          </div>
      
          <div class="navbar-menu" id="open-navbar1">
            <ul class="navbar-nav">
              <li><a href="./index.html">HOME</a></li>
              <li class="navbar-dropdown">
                <a href="#" class="dropdown-toggler" data-dropdown="my-dropdown-id">
                  ABOUT US <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown" id="my-dropdown-id">
                  <li><a href="#">Actions</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="separator"></li>
                  <li><a href="#">Seprated link</a></li>
                  <li class="separator"></li>
                  <li><a href="#">One more seprated link.</a></li>
                </ul>
              </li>
              <li class="navbar-dropdown">
                <a href="#" class="dropdown-toggler" data-dropdown="blog">
                  CONTACT <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown" id="blog">
                  <li><a href="#">Some category</a></li>
                  <li><a href="#">Some another category</a></li>
                  <li class="separator"></li>
                  <li><a href="#">Seprated link</a></li>
                  <li class="separator"></li>
                  <li><a href="#">One more seprated link.</a></li>
                </ul>
              </li>
              <li><a href="#">LOCATIONS</a></li>
              <li><a href="reservation2.jsp">MAKE RESERVATIONS</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <!--Second Nav Bar-->
      <nav class="navbar2">
        <div class="container">
            <div class="navbar2-menu" id="open-navbar2">
              <ul class="navbar2-nav">
                <li><a href="./login-signup.html">SIGN IN</a></li>
                <li><a href="#">LOYALTY POINTS</a></li>
                <li><a href="#">SEARCH RESERVATIONS</a></li>
              </ul>
            </div>
          </div>
      </nav>
      
      <!-- partial -->
    <script  src="../script.js"></script>

<% 
if(request.getMethod().equals("GET")){  // display a form
%>
    <div id="page">

        <div id="form-div">
        
        	<form action="reservation2.jsp" method="POST">
        	
        		<div id="upper-form">
        		
        			<div id="location-div">
        				
        				<label>Location (city, state)</label><br/>
  						<select name="location" id="location" required> 
    					<option value="Los Vegas NV">Los Vegas, NV</option>
    					<option value="Atlanta, GA">Atlanta, GA</option>
    					<option value="Chicago, IL">Chicago, IL</option>
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
		
		
		
	
		ReservationBeanPeer reservation = new ReservationBeanPeer();
		HotelBean hotel = new HotelBean();
		ReservationBean reservationBean = new ReservationBean();
		 
		acctBean acct = new acctBean();
		int customer_id = acct.getCustomerID();  // get the customer id from the acctBean class
		
		int reservation_id = (int)(Math.random()*9999);
		
		String  check_in = request.getParameter("check_in");
		String check_out = request.getParameter("check_out");
		String number_of_guest = request.getParameter("number_of_guest");

		String location = request.getParameter("location");
		int hotel_id = hotel.findHotelId(location);  // get the hotel id

		String room_size = request.getParameter("room_size");

		String[] amenities = request.getParameterValues("amenities");

		int loyalty_points = reservationBean.calculatePoints(check_in, check_out);

		HttpSession sess = request.getSession(); 
		sess.setAttribute("reservation_id", reservation_id);
		sess.setAttribute("customer_ID", customer_id);
		sess.setAttribute("hotel_ID", hotel_id);
		sess.setAttribute("check_in", check_in);
		sess.setAttribute("check_out", check_out);
		sess.setAttribute("number_of_guest", number_of_guest);
		sess.setAttribute("location", location);
		sess.setAttribute("room_size", room_size);
		sess.setAttribute("amenities", amenities);
		sess.setAttribute("loyalty_points", loyalty_points);

		reservationBean.setReservation_ID(reservation_id);
		//reservationBean.setHotel_ID(hotel_id);
		reservationBean.setHotel_ID(200);
		reservationBean.setCheck_in(check_in);
		reservationBean.setCheck_out(check_out);
		reservationBean.setNumber_of_guest(number_of_guest);
		//reservationBean.setCustomer_ID(customer_id);
		reservationBean.setCustomer_ID(100);
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





