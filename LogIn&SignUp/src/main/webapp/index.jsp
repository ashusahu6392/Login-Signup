<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Document</title>

  <!-- Meta description -->
  <meta name="description" content="A basic HTML5 boilerplate">

  <!-- Favicon -->
  <link rel="icon" href="favicon.ico" type="image/x-icon">

  <!-- CSS -->
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
	
	<div>
	<header >
	<nav>
	
		<h1 class="logo">HelloLogo</h1>
	
	<ul class="elements">
	
	<li class="ele-1"><a href="#">Home</a></li>
	<li class="ele-2"><a href="#">About</a></li>
	<li class="ele-3"><a href="#">Services</a></li>
	<li class="ele-4"><button>Contact Us</button></li>
	
	</ul>
	
	</nav>
	</header>
	<div class="hero">
	
	 <div class="hero-image">
	    <img src="images/login-image.png" alt="Login Illustration">
	 </div>
	
	
	<div class="login">
		<form action="login" method="post">
			<h1>Welcome Back!</h1>
			<h2>Log in to your account</h2>
			<input type="email" id="username" name="email" placeholder="Enter Email"><br><br>
			<input type="password" id="password" name="password" placeholder="Enter Password"><br>
			
			<h6>Remember Me</h6>
			<a href="#">Forget Password?</a>
			<input type="submit" value="Log In">
			
			<p class="signup">
			 Don't have an account? <a href="signuppage.jsp">Sign Up</a>
			</p>
			
		</form>
		
	</div>
	</div>
	
	</div>
</body>
</html>

