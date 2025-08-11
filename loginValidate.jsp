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

	try {
		
		hs = request.getSession();
		
		//Connection codes please dont modify Start >>
				ServletContext context = getServletContext();
				dbuser=context.getInitParameter("dbuser");
				dbpassword=context.getInitParameter("dbpassword");
				dburl =context.getInitParameter("dburl");
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn=DriverManager.getConnection(dburl,dbuser,dbpassword);
				
			// Connection codes please dont modify End <<
			
			userid = request.getParameter("userid");
			password = request.getParameter("password");
			
			ps = conn.prepareStatement("select FULL_NAME, DEPARTMENT, DESIGNATION, USER_TYPE from log_users where USERID = ? and  USER_PASSWORD = ?");
			ps.setString(1, userid);
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			if(rs.next()) {
					hs.setAttribute("FULL_NAME", rs.getString(1));
					hs.setAttribute("DEPARTMENT", rs.getString(2));
					hs.setAttribute("DESIGNATION", rs.getString(3));
					hs.setAttribute("USER_TYPE", rs.getString(4));
					jsonresponse = "{\"flag\":\"Y\"}";
			} else {
				jsonresponse = "{\"flag\":\"N\"}";
			}
			out.print(jsonresponse);
			
	} catch(Exception e) {
		out.print(e);
	}	

	
	
%>