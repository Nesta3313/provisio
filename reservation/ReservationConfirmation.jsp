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
    <link rel='stylesheet'><link rel="stylesheet" href="./reservationConfirmation.css">
    
  
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
