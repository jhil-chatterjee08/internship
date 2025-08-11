$(document).ready(function() {

	$(document).on("click", "#switch-register", function() {
		$(".left-section").animate({left : "50%"},500)
		$(".right-section").animate({right : "50%"},500).addClass("right-section-active")
		
		let register_template = `<h1 class="landing-header">Register</h1>
								 <p class="landing-header">Please fill out for registration</p>
								 <div class="login-input" fld-label="Control Number" style="--icon: '\\f007';">
									<input type="text" id="cno">
								 </div>
								 <div class="login-input" fld-label="Password" style="--icon: '\\f023';">
									<input type="password" id="password">
								 </div>
								 <div class="login-input" fld-label="Confirm Password" style="--icon: '\\f023';">
									<input type="password" id="password">
								 </div>
								 <button class="btn btn-login" id="site-register">Register</button>`

		setTimeout(function(){
			$(".left-section").html(register_template)
		}, 250)
		
		let login_msg = `<h1 class="landing-header">Welcome Back !</h1>
						 <p class="landing-header">Provide your credentials to enter site</p>
						 <button class="btn btn-register" id="switch-login">Sign In</button>`

		$(".right-section").html(login_msg)
		$(".close-dialog").animate({right: "95%"},500)
	})

	$(document).on("click", "#switch-login", function() {
		$(".left-section").animate({left : "0"},500)
		$(".right-section").animate({right : "0"},500).removeClass("right-section-active")
		
		let login_template = `<h1 class="landing-header">Login</h1>
							<p class="landing-header">Please Sign-in to start your session</p>
							<div class="login-input" fld-label="Userid" style="--icon: '\\f007';">
								<input type="text" id="userid">
							</div>
							<div class="login-input" fld-label="Password" style="--icon: '\\f023';">
								<input type="password" id="password">
							</div>
							<button class="btn btn-login" id="site-login">Login</button>`

		setTimeout(function(){
			$(".left-section").html(login_template)
		}, 250)
		
		let register_msg = `<h1 class="landing-header">Hello !</h1>
							<p class="landing-header">Please Register to use our site features</p>
							<button class="btn btn-register" id="switch-register">Sign Up</button>`

		$(".right-section").html(register_msg)
		$(".close-dialog").animate({right: "1rem"},500)
	})
	
	$(".landing-btn").click(function() {
		$(".card-children").fadeOut(250)
		setTimeout(function(){
			$(".landing-login").css({"display" : "flex"}).animate({"opacity" : "1"},250)
		}, 250)
	})

	$(document).on("click", ".close-dialog", function() {
		$(".landing-login").animate({"opacity" : "0"},250)
		setTimeout(function(){
			$(".landing-login").css({"display" : "none"})
			$(".card-children").fadeIn(250)
		}, 250)
	})
	
	// functionalities---------------------------------------
	
	$(".navbar").load("/LOG_MGMT/backgroundProcess/dynamic_menu.jsp")
	
	$("#site-login").click(function() {
		$.ajax({
					cache: false,
					async: false,
					type: "post",
					url: "/LOG_MGMT/backgroundProcess/loginValidate.jsp",
					data: {
						userid: $("#userid").val(),
						password: $("#password").val()
					},
					success: function(data) {
						let json_str = JSON.parse(data)
						if(json_str.flag=="N") {
							alert("Invalid Credentials")
						} else {
							window.location.href = "/LOG_MGMT/webPages/dashboard.jsp"
						}
					},
					error: function(request, status, error) {
						alert(request.responseText)
					}
				})
	})
	
	$("#act_present").click(function() {
		$.ajax({
					cache: false,
					async: false,
					type: "post",
					url: "/LOG_MGMT/backgroundProcess/attendance_action.jsp",
					data: {
						control_no: $("#control_no").val(),
						shift: $("#shift").val(),
						dated: $("#dated").val(),
						in_time: $("#in_time").val(),
						out_time: $("#out_time").val(),
						act_type: "PRESENT"
					},
					success: function(data) {
						alert(data)
					},
					error: function(request, status, error) {
						alert(request.responseText)
					}
				})
	})
	
	$("#act_absent").click(function() {
		$.ajax({
					cache: false,
					async: false,
					type: "post",
					url: "/LOG_MGMT/backgroundProcess/attendance_action.jsp",
					data: {
						control_no: $("#control_no").val(),
						shift: $("#shift").val(),
						dated: $("#dated").val(),
						act_type: "ABSENT"
					},
					success: function(data) {
						alert(data)
					},
					error: function(request, status, error) {
						alert(request.responseText)
					}
				})
	})
	
	$("#ymsel").change(function() {
		$("#att-reg-wrapper").width($(".page-body").width())
		$.ajax({
					cache: false,
					async: false,
					type: "post",
					url: "/LOG_MGMT/backgroundProcess/fetch_att_reg.jsp",
					data: {
						ymsel: $(this).val()
					},
					success: function(data) {
						$("#att-reg-wrapper").html(data)
					},
					error: function(request, status, error) {
						alert(request.responseText)
					}
				})
	})


})