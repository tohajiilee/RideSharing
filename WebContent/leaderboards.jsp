<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
			String url = "jdbc:mysql://cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com:3306/userstats";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "jjc372", "test1234");
			
			String str = ("SELECT * FROM userstats ORDER BY points DESC LIMIT 10");
			
			PreparedStatement stmt = con.prepareStatement(str);
			ResultSet result = stmt.executeQuery();	
        	
			out.print('<'+"style"+'>'+
					"table, th, td {"+
					    "border: 1px solid black;"+
					"}"+
					'<'+"/style"+'>'+"");
			out.print("<h1>Top Rides Given</h1>");
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Username");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Points");
			out.print("</td>");
			
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current 
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				//Print out current 
				out.print(result.getString("points"));
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");
			
      		con.close();
	%>
</body>
</html>