<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Kulim+Park:ital,wght@0,200;0,300;0,400;0,600;0,700;1,200;1,300;1,400;1,600;1,700&family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/LOG_MGMT/cssFiles/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="/LOG_MGMT/jsFiles/script.js"></script>
</head>
<body>
	<div id="landing-overlay"></div>
	<div class="landing-container">
		<h1 class="landing-header clw">CHITTARANJAN LOCOMOTIVE WORKS</h1>
		<h1 class="landing-header">Log Book Management</h1>
		<div class="card-parent">
			<div class="card-children">
				<h1 class="landing-header-icon"><i class="bi bi-people-fill"></i></h1>
				<h2 class="landing-header">Employee Logs</h2>
				<p class="landing-header">Record and Manage Employee Shifts, Leave etc.</p>
				<button class="landing-btn">Proceed</button>
			</div>
			<div class="card-children">
				<h1 class="landing-header-icon"><i class="bi bi-file-text-fill"></i></h1>
				<h2 class="landing-header">File Logs</h2>
				<p class="landing-header">Record and Manage Files, Letters with inward-outward movement</p>
				<button class="landing-btn">Proceed</button>
			</div>

			<div class="landing-login">
				<div class="left-section">
					<h1 class="landing-header">Login</h1>
					<p class="landing-header">Please Sign-in to start your session</p>
					<div class="login-input" fld-label="Userid" style="--icon: '\f007';">
						<input type="text" id="userid">
					</div>
					<div class="login-input" fld-label="Password" style="--icon: '\f023';">
						<input type="password" id="password">
					</div>
					<button class="btn btn-login" id="site-login">Login</button>
				</div>
				<div class="right-section">
					<h1 class="landing-header">Hello !</h1>
					<p class="landing-header">Please Register to use our site features</p>
					<button class="btn btn-register" id="switch-register">Sign Up</button>
				</div>
				<span class="close-dialog"><i class="fa fa-times" aria-hidden="true"></i></span>
			</div>

		</div>
	</div>

	
</body>
</html>