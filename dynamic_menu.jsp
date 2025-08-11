<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
	PreparedStatement ps,psglobal;
	ResultSet rs,rsglobal;
	String userid,pwd,jsonresponse,dburl,dbuser,dbpassword,usertype, alertcnt, upfile;
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
<h1 class="landing-header clw-menu">CLW</h1>
<ul class="nav-menu">
	<li class="level-1"><a href="/LOG_MGMT/webPages/dashboard.jsp"><i class="fa fa-tachometer" aria-hidden="true"></i> &nbsp;&nbsp;Dashboard</a></li>
	<li class="level-1"><a href="/LOG_MGMT/webPages/attendance_register.jsp"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> &nbsp;&nbsp;Attendance Register</a></li>
	<li class="level-1"><a href="/LOG_MGMT/webPages/mark_attendance.jsp"><i class="fa fa-book" aria-hidden="true"></i> &nbsp;&nbsp;Mark Attendance</a></li>
	<li class="level-1"><a href="/LOG_MGMT/webPages/leave_register.jsp"><i class="fa fa-address-book" aria-hidden="true"></i> &nbsp;&nbsp;Leave Register</a></li>
</ul>
<%
	conn.close();
%>