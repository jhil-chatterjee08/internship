<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
	PreparedStatement ps,psmaxblock, psflush;
	ResultSet rs,rsmaxblock;
	String jsonresponse,dburl,dbuser,dbpassword,usertype;
	String control_no, shift, dated, in_time, out_time, act_type, ymsel;
	int block_sl, sec_sl, i;
	String arr[];
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
			
			ymsel = request.getParameter("ymsel");
%>
	<table class="custom-table-1">
		<thead>
			<tr>
				<th>Employee</th>
			<%
				for(i=1; i<=31; i++) {
					%>
						<th><%=i%></th>
					<%
				}
			%>
			</tr>
		</thead>
		<tbody>
			<%			
				ps = conn.prepareStatement("select a.CONTROL_NO, emp_name, designation, nvl(DAY1,'X'), nvl(DAY2,'X'), nvl(DAY3,'X'), nvl(DAY4,'X'), nvl(DAY5,'X'), nvl(DAY6,'X'), nvl(DAY7,'X'), nvl(DAY8,'X'), nvl(DAY9,'X'), nvl(DAY10,'X'), nvl(DAY11,'X'), nvl(DAY12,'X'), nvl(DAY13,'X'), nvl(DAY14,'X'), nvl(DAY15,'X'), nvl(DAY16,'X'), nvl(DAY17,'X'), nvl(DAY18,'X'), nvl(DAY19,'X'), nvl(DAY20,'X'), nvl(DAY21,'X'), nvl(DAY22,'X'), nvl(DAY23,'X'), nvl(DAY24,'X'), nvl(DAY25,'X'), nvl(DAY26,'X'), nvl(DAY27,'X'), nvl(DAY28,'X'), nvl(DAY29,'X'), nvl(DAY30,'X'), nvl(DAY31,'X') from attendance_calendar a, EMP_MASTER e where a.control_no = e.control_no and yearmonth = ?");
				ps.setString(1, ymsel);
				rs = ps.executeQuery();
				while(rs.next()) {
					%>
						<tr>
							<td><strong><%=rs.getString(2)%></strong><br><%=rs.getString(1)%><br><em><%=rs.getString(3)%></em></td>
							<%
								for(i=4; i<=34; i++) {
									arr = rs.getString(i).split("#");
									if(arr[0].equals("P")) {
										switch(arr[1]) {
											case "M" :
												%>
													<td class="present"><%=arr[2]%><br>Morning<br><%=arr[3]%></td>
												<%
											break;
											case "D" :
												%>
													<td class="present"><%=arr[2]%><br>Day<br><%=arr[3]%></td>
												<%
											break;
											case "N" :
												%>
													<td class="present"><%=arr[2]%><br>Night<br><%=arr[3]%></td>
												<%
											break;
											case "G" :
												%>
													<td class="present"><%=arr[2]%><br>General<br><%=arr[3]%></td>
												<%
											break;
										}
									} else if(arr[0].equals("A")) {
										switch(arr[1]) {
											case "M" :
												%>
													<td class="absent">Morning</td>
												<%
											break;
											case "D" :
												%>
													<td class="absent">Day</td>
												<%
											break;
											case "N" :
												%>
													<td class="absent">Night</td>
												<%
											break;
											case "G" :
												%>
													<td class="absent">General</td>
												<%
											break;
										}
									} else if(arr[0].equals("L")) {
										%>
											<td class="leave"><%=arr[0]%></td>
										<%
									} else {
										%>
											<td>-</td>
										<%
									}
									
								}
							%>
						</tr>
					<%
				}
			%>
		</tbody>
	</table>


<%	
	} catch(Exception e) {
		out.print(e);
	}	

	
	
%>