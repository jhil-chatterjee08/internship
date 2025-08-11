<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
	PreparedStatement ps,psmaxblock, psflush;
	ResultSet rs,rsmaxblock;
	String userid,password,jsonresponse,dburl,dbuser,dbpassword,usertype;
	int block_sl, sec_sl;
	HttpSession hs;
%>
<%

	//Connection codes please dont modify Start >>
	ServletContext context = getServletContext();
	dbuser=context.getInitParameter("dbuser");
	dbpassword=context.getInitParameter("dbpassword");
	dburl =context.getInitParameter("dburl");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(dburl,dbuser,dbpassword);
	
	// Connection codes please dont modify End <<
%>
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
	<style type="text/css">
		.clw-menu {
			color: white;
		}
	</style>
</head>
<body>
	<div class="main-div alternate-div">
		<div class="navbar">
			<!-- Dynamic loading menu -->
		</div>
		<div class="content-section">
			<section class="header">
				<h1 class="landing-header">LOG BOOK MANAGEMENT</h1>
				<div class="user-info">
					<span><i class="bi bi-person-square"></i></span> &nbsp;&nbsp;<span>Kaunish Kabasi</span>
				</div>
			</section>
			<section class="main">
				<div class="breadcrumb">
					<h2>Leave Register</h2>
				</div>
				<div class="page-body">
					<div class="form-items">
						<label>Control Number</label>
						<select id="control_no">
							<option value="NA">--Select an Employee--</option>
							<%
								ps = conn.prepareStatement("select control_no, CONTROL_NO||'-->'||DESIGNATION||'-->'||EMP_NAME  from emp_master");
								rs = ps.executeQuery();
								while(rs.next()) {
									%>
										<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
									<%
								}
							%>
						</select>
					</div>
					<br>
					<div class="form-items small-fld">
						<label>From Date</label>
						<input type="date" id="dated_from">
					</div>
					<div class="form-items small-fld">
						<label>To Date</label>
						<input type="date" id="dated_to">
					</div>
					<br>
					<div class="form-items">
						<label>Leave Type</label>
						<select id="leave_type">
							<option value="NA">--Select Leave--</option>
							<option value="CL">Casual Leave</option>
							<option value="SL">Sick leave</option>
							<option value="LAP">Leave On Average Pay</option>
							<option value="LHAP">Leave On Half Average Pay</option>
							<option value="RH">Restricted Holidays</option>
							<option value="OHD">Other Than Honorable Discharge</option>
							<option value="OTH">Others</option>
						</select>
					</div>
					<br>
					<div class="form-items">
						<label>Cause Of leave</label>
						<textarea rows="3" id="leave_desc"></textarea>
					</div>
					<br>
					<div class="form-items small-fld">
						<button class="btn btn-green" id="Submit">Submit</button>
					</div>
					
				</div>
			</section>
		</div>
	</div>
</body>
</html>