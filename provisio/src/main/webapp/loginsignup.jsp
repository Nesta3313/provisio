<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Provisio Hotels and Resorts</title>
<link rel="stylesheet" href="styles/navigation.css">
<link rel="stylesheet" href="styles/navigation2.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="styles/loginstyle.css">

<script type="text/javascript">
	function success2() {
		var pass = document.getElementById("password2").value;
		var confirmpass = document.getElementById("confirmpass").value;
		
		document.getElementById("fname_error").innerHTML = "";
		document.getElementById("lname_error").innerHTML = "";
		document.getElementById("email2_error").innerHTML = "";
		document.getElementById("password2_error").innerHTML = "";
		document.getElementById("confirm_error").innerHTML = "";

		if (       document.getElementById("first_name").value === ""
				|| document.getElementById("last_name").value === ""
				|| document.getElementById("email2").value === ""
				|| document.getElementById("password2").value === ""
				|| document.getElementById("confirmpass").value === "") {
			
			document.getElementById('button2').disabled = true;
			
			if (document.getElementById("first_name").value === ""){
				document.getElementById('button2').disabled = true;
				document.getElementById("fname_error").innerHTML = "Please enter a first name";
			}

			if (document.getElementById("last_name").value === ""){
				document.getElementById('button2').disabled = true;
				document.getElementById("lname_error").innerHTML = "Please enter a last name";
			}
			
			if (document.getElementById("email2").value === ""){
				document.getElementById('button2').disabled = true;
				document.getElementById("email2_error").innerHTML = "Please enter an email";
			}
			
			if (document.getElementById("password2").value === ""){
				document.getElementById('button2').disabled = true;
				document.getElementById("password2_error").innerHTML = "Please enter a password";
			}
			
			if (document.getElementById("confirmpass").value === ""){
				document.getElementById('button2').disabled = true;
				document.getElementById("confirm_error").innerHTML = "Please enter password again";
			}
		}else if (pass != confirmpass) {
			document.getElementById('button2').disabled = true;
			document.getElementById("confirm_error").innerHTML = "Passwords do not match";
		}  else {
			document.getElementById('button2').disabled = false;
		}
		
	}

	function success() {
		document.getElementById("email_error").innerHTML = "";
		document.getElementById("password_error").innerHTML = "";
			
		if (document.getElementById("email").value === ""
	     || document.getElementById("password").value === "") {
			document.getElementById('button').disabled = true;
			
			if(document.getElementById("email").value ===""){
				document.getElementById("email_error").innerHTML = "Please enter an email";
			}
			
			if(document.getElementById("password").value === ""){
				document.getElementById("password_error").innerHTML = "Please enter your password";

			}
		} else {
			document.getElementById('button').disabled = false;
		}
	}
</script>
</head>
<body>
	<!--First Nav Bar-->
	<nav class="navbar">
		<div class="container">

			<div class="navbar-header">
				<button class="navbar-toggler" data-toggle="open-navbar1">
					<span></span> <span></span> <span></span>
				</button>
				<a href="index.html"> <img src="images/ProvisioLogo.png"
					alt="Paris" class="center" width="150px" height="auto">
				</a>

			</div>

			<div class="navbar-menu" id="open-navbar1">
				<ul class="navbar-nav">
					<li><a href="index.html">HOME</a></li>
					<li class="navbar-dropdown"><a href="about.html"
						class="dropdown-toggler" data-dropdown="my-dropdown-id"> ABOUT
							US <i class="fa fa-angle-down"></i>
					</a>
						<ul class="dropdown" id="my-dropdown-id">
							<li><a href="#">Actions</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="separator"></li>
							<li><a href="#">Seprated link</a></li>
							<li class="separator"></li>
							<li><a href="#">One more seprated link.</a></li>
						</ul></li>
					<li class="navbar-dropdown"><a href="contact.html"
						class="dropdown-toggler" data-dropdown="blog"> CONTACT <i
							class="fa fa-angle-down"></i>
					</a>
						<ul class="dropdown" id="blog">
							<li><a href="#">Some category</a></li>
							<li><a href="#">Some another category</a></li>
							<li class="separator"></li>
							<li><a href="#">Seprated link</a></li>
							<li class="separator"></li>
							<li><a href="#">One more seprated link.</a></li>
						</ul></li>
					<li><a href="locations.jsp">LOCATIONS</a></li>
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
					<li><a href="reservations.jsp">SEARCH RESERVATIONS</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- partial:index.partial.html -->
	<!-- BEGIN FORM LOGIN -->
	<div class="cont">
		<div class="form sign-in">
			<form name="login" action="${pageContext.request.contextPath}/verify"
				method="get" onSubmit="document.getElementById('login').reset();">
				<h2>Welcome to Provisio Hotels and Resorts</h2>
				<label> <span>Email</span> 
				<input id="email" type="email"
					name="email" onkeyup="success()" />
				</label> 
				<span id="email_error"></span>
				<label> <span>Password</span> 
				<input id="password"
					type="password" name="password" onkeyup="success()" />
				</label>
				<span id="password_error"></span>
				<p class="forgot-pass">Forgot password?</p>

				<button id="button" type="submit" class="submit" disabled>Sign
					In</button>
			</form>
		</div>
		<!-- END FORM LOGIN -->
		<div class="sub-cont">
			<div class="img">
				<div class="img__text m--up">
					<h2>New here?</h2>
					<p>Enroll now for lower rates and other member benefits</p>
				</div>
				<div class="img__text m--in">
					<h2>One of us?</h2>
					<p>Sign in to your account</p>
				</div>
				<div class="img__btn">
					<span class="m--up">Sign Up</span> <span class="m--in">Sign
						In</span>
				</div>
			</div>
			<!-- BEGIN FORM SIGN UP -->

			<div class="form sign-up">
				<form name="register"
					action="${pageContext.request.contextPath}/create" method="post">
					<h2>Join Provisio Rewards</h2>
					<label> <span>First Name</span> <input type="text"
						id="first_name" name="first_name" onkeyup="success2()">
					</label>
					<span id="fname_error"></span>
					<label> <span>Last Name</span> <input type="text"
						id="last_name" name="last_name" onkeyup="success2()">
					</label>
					<span id="lname_error"></span>
					<label> <span>Email</span> <input type="email" id="email2"
						name="email2" onkeyup="success2()">
					</label>
					<span id="email2_error"></span>
					<label> <span>Password</span> <input type="password"
						id="password2" name="password2" onkeyup="success2()">
					</label>
					<span id="password2_error"></span>
					<label> <span>Confirm Password</span> <input
						type="password" id="confirmpass" name="confirmpass"
						onkeyup="success2()">
					</label>
					<span id="confirm_error"></span>
					<button id="button2" type="submit" class="submit" disabled>Sign Up</button>
				</form>
			</div>
			<!-- END FORM SIGN UP -->
		</div>
	</div>
	<footer>
		<div id="footer">
			<p>
				<a href="#" target="_blank"> PROVISIO </a> &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
			</p>
		</div>
	</footer>

	<!-- partial -->
	<script src="scripts/script.js"></script>

</body>
</html>