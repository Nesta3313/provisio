<%@ page import="java.util.*" %>
<%@page import="provisio.ReservationBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet'><link rel="stylesheet" href="./styles/navigation.css">
	<link rel='stylesheet'><link rel="stylesheet" href="./styles/navigation2.css">
	<link rel='stylesheet'><link rel="stylesheet" href="./styles/loyaltypoints.css">
	
    <title>Loyalty Points</title>
</head>

<body>
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
              <li><a href="./index.html">HOME</a></li>
              <li class="navbar-dropdown">
                <a href="about.html" class="dropdown-toggler" data-dropdown="my-dropdown-id">
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
                <a href="contact.html" class="dropdown-toggler" data-dropdown="blog">
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
              <li><a href="location.html">LOCATIONS</a></li>
              <li><a href="makereservation.jsp">MAKE RESERVATIONS</a></li>
            </ul>
          </div>
        </div>
      </nav>
	<nav class="navbar2">
        <div class="container">
            <div class="navbar2-menu" id="open-navbar2">
              <ul class="navbar2-nav">
                <li><a href="./loginsignup.jsp">SIGN IN</a></li>
                <li><a href="loyaltypoints.jsp">LOYALTY POINTS</a></li>
                <li><a href="search.jsp">SEARCH RESERVATIONS</a></li>
              </ul>
            </div>
          </div>
    </nav>
	<script  src="./scripts/script.js"></script>
	
		
		<div class="cont">
			<sql:setDataSource var = "provisio" driver = "com.mysql.cj.jdbc.Driver"
	         url = "jdbc:mysql://localhost/provisio"
	         user = "root"  password = "MySQL8IsGreat!"/>
	 
	      	<sql:query dataSource = "${provisio}" var = "result">
	      		
	         	SELECT reservation_ID, location, check_in, check_out, loyalty_points FROM reservations where customer_ID = ?
	         	<sql:param value="${customer_id}"/>
	      	</sql:query>
	      
	      
	 
	      <table>
	         <tr>
	            <th>Reservation Id</th>
	            <th>Location</th>
	            <th>Check in</th>
	            <th>Check out</th>
	            <th>Loyalty Points</th>
	         </tr>
	         
	         <c:set var="total" value ="0"/>
	         
	         <c:forEach var = "row" items = "${result.rows}">
	            <tr>
	               <td><c:out value = "${row.reservation_ID}"/></td>
	               <td><c:out value = "${row.location}"/></td>
	               <td><c:out value = "${row.check_in}"/></td>
	               <td><c:out value = "${row.check_out}"/></td>
	               <td><c:out value = "${row.loyalty_points}"/></td>
	            </tr>
	            
	            <c:set var = "total" value = "${total+row.loyalty_points}"  />
	         </c:forEach>
	         
	      </table>
	      <br>
	     	<div>
	     		<p> Your Total Points: <c:out value="${total}"/></p>
	     	</div>
	    
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