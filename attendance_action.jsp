<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
	PreparedStatement ps,psmaxblock, psflush;
	ResultSet rs,rsmaxblock;
	String jsonresponse,dburl,dbuser,dbpassword,usertype;
	String control_no, shift, dated, in_time, out_time, act_type;
	int block_sl, sec_sl;
	HttpSession hs;
	CallableStatement cs;
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
			
			control_no = request.getParameter("control_no");
			shift = request.getParameter("shift");
			dated = request.getParameter("dated");
			in_time = request.getParameter("in_time");
			out_time = request.getParameter("out_time");
			act_type = request.getParameter("act_type");
			
			if(act_type.equals("PRESENT")) {
				cs = conn.prepareCall("{call attendance_prod('P',?,?,?,?,?)}");
				cs.setString(1, control_no);
				cs.setString(2, dated);
				cs.setString(3, shift);
				cs.setString(4, in_time);
				cs.setString(5, out_time);
				cs.execute();
				out.print("Marked Present");
				
			} else if(act_type.equals("ABSENT")) {
				cs = conn.prepareCall("{call attendance_prod('A',?,?,?)}");
				cs.setString(1, control_no);
				cs.setString(2, dated);
				cs.setString(3, shift);
				cs.execute();
				out.print("Marked Absent");
			}
			
	} catch(Exception e) {
		out.print(e);
	}	

	
	
%>