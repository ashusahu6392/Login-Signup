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
<link rel="stylesheet" href="css/signup.css">
</head>
<body>

	<div>
		<header>
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
				<form action="signUp" method="post">
					<h1>Create Your Account</h1>
					<h2>Join us and start your journey today</h2>
					<input type="text" id="fname" name="fname" placeholder="First Name">
					<input type="text" id="lname" name="lname" placeholder="Last Name"><br>
					<input type="date" id="age" name="age" placeholder="Age">
					<br> <input
						type="email" id="email" name="email" placeholder="Email Address">
						<input type="password" id="password" name="password"
						placeholder="Create Password"> <br>
					<input type="radio" id="male" name="gender" value="male"> <label
						for="male">Male</label> <input type="radio" id="female"
						name="gender" value="female"> <label for="female">Female</label>

					<input type="radio" id="other" name="gender" value="other">
					<label for="other">Other</label>

					<p><input type="checkbox" id="terms" name="terms"> I accept the <a>terms & conditions</a> and <a>Privacy Policy</a></p>
					
					<button type="submit">Sign Up</button>
					
					<p class="signin">
			 Already have an account? <a href="index.jsp">Sign In</a>
			</p>

				</form>

			</div>
		</div>

	</div>
</body>
</html>

