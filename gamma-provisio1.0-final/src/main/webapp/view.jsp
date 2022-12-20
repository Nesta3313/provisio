<%@ page import="java.util.*" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet'><link rel="stylesheet" href="./styles/navigation.css">
	<link rel='stylesheet'><link rel="stylesheet" href="./styles/navigation2.css">
	<link rel='stylesheet'><link rel="stylesheet" href="./styles/view.css">
	
    <title>Your Reservation</title>
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
                <a href="about.html" class="dropdown-toggler" data-dropdown="blog">
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
	
		
		
	
		 <%
			if(request.getAttribute("piList") != null) {
				ArrayList al = (ArrayList)request.getAttribute("piList");
				
				Iterator itr = al.iterator();
				
				while(itr.hasNext()) {
					 ArrayList pList = (ArrayList) itr.next();
					 
					 
					 String amenities = pList.get(3).toString();
						String amenitieslist = " ";
						
						if(amenities.contains("wifi") && !amenities.contains("parking") && !amenities.contains("breakfast")){
							amenitieslist = "wifi";
						}
						
						else if(amenities.contains("parking")&& !amenities.contains("wifi") && !amenities.contains("breakfast")){
							amenitieslist = "parking";
						}
						
						else if(amenities.contains("breakfast") && !amenities.contains("wifi") && !amenities.contains("parking")){
							amenitieslist = "breakfast";
						}
						
						else if(amenities.contains("wifi") && amenities.contains("breakfast") && !amenities.contains("parking")){
							amenitieslist = "wifi, breakfask";
						}
						else if(amenities.contains("wifi") && amenities.contains("parking") && !amenities.contains("breakfast")){
							amenitieslist = "wifi, parking";
						}
						
						else if(amenities.contains("parking") && amenities.contains("breakfast") && !amenities.contains("wifi")){
							amenitieslist = "parking, breakfast";
						}
		
						
						else if(amenities.contains("wifi") && amenities.contains("breakfast") && amenities.contains("parking")){
							amenitieslist = "wifi, breakfast, parking";
						}
						
						
						
						
						
						
						 
						 
					
					
					 

		%>
		<div class="grid-container">
		
    			<div class="card">

  					<div class="card-container">
  						<h2 class="top">Here is Your Reservation</h2>
  			
  						<p class="text"><b>Hotel Location:</b> <%=pList.get(0)%></><br>
						<p class="text"><b>Room Size:</b> <%=pList.get(1)%></p><br>
						<p class="text"><b>Number of Guests:</b> <%=pList.get(2)%></p><br>
						<p class="text"><b>Amenities:</b> <%out.print(amenitieslist);%></p><br>
						<p class="text"><b>Check In Date:</b> <%=pList.get(4)%></p><br>
						<p class="text"><b>Check Out Date:</b> <%=pList.get(5)%></p>
    					
  					</div>
				</div>
  
   	 	</div>
				
		<%
					 
					 
				}
			} 
		
			if(request.getAttribute("piList") == null) {
				out.print("Nothing found");
			}
			
			
			
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
    
    