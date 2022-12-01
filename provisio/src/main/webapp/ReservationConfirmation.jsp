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
    <link rel='stylesheet'><link rel="stylesheet" href="styles/reservationConfirmation.css">
    
  
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
                  <li><a href="location.html">LOCATIONS</a></li>
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
if(request.getMethod().equals("GET")){  // display a form
	HttpSession sess = request.getSession(); 
%>
    <div id="page">
    
	<div id="thankyou"> <h1> Thank You for Choosing Provisio! </h1> </div>	
		
	<div id="resid"> <h2> Your reservation ID is <% out.print(sess.getAttribute("reservation_id"));%></h2> </div>
    </div>

<%} %>

    <footer>
        <div id="footer">
            <p> <a href="#" target="_blank"> PROVISIO </a> 
                &copy; <script>document.write(new Date().getFullYear());</script>
            </p>
        </div>
        
    </footer>
      
</body>
</html>
