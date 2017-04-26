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
			//Create a connection string
			String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "asingh", "test1234");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String str= "SELECT * FROM Rider";
			ResultSet result = stmt.executeQuery(str);
	

			out.print('<'+"style"+'>'+
					"table, th, td {"+
					    "border: 1px solid black;"+
					"}"+
					'<'+"/style"+'>'+"");
			out.print("<h1>Available Rides</h1>");
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("departure");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("destination");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("timeWindow");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Rider");
			out.print("</td>");
			out.print("<td>");
			out.print("Accept");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current 
				out.print(result.getString("departure"));
				out.print("</td>");
				out.print("<td>");
				//Print out current 
				out.print(result.getString("destination"));
				out.print("</td>");
				out.print("<td>");
				//Print out current
				out.print(result.getString("timeWindow"));
				out.print("</td>");
				//Print out current
				out.print("<td>");
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print('<'+"input type="+'"'+"button"+'"'+ "onclick="+'"'+"location.href='rideAccepted.jsp'"+'"'+'>');
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");

			//close the connection.
			con.close();
			
			
			 %>

</body>
</html>