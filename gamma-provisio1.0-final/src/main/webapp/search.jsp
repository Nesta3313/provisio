<!DOCTYPE html> 
<html> 
<head> 
<meta content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel='stylesheet'><link rel="stylesheet" href="./styles/navigation.css">
<link rel='stylesheet'><link rel="stylesheet" href="./styles/navigation2.css">
<link rel='stylesheet'><link rel="stylesheet" href="./styles/search.css">

<title>Find Reservation</title> 
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
                <li><a href="#">SEARCH RESERVATIONS</a></li>
              </ul>
            </div>
          </div>
      </nav>
	<script  src="./scripts/script.js"></script>

	<div class="grid-container">
		
    	<div>
        	<form action="Fetch" method="post" class="form"> 
        		<p class="call">Find Your Reservation</p><br>
				<input type="text" class="search" placeholder="Enter Reservation ID" name="id" required> 
				<input type="submit" class="submit" value="SEARCH"> 
			</form> 
   	 	</div>

    	<div>
        	<img src="images/court.png" class= "pic"alt="Girl in a jacket" width="500" height="400">
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