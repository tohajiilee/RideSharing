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

			String dep = request.getParameter("riderDep");
			String dest = request.getParameter("riderDest");
			String time= request.getParameter("riderTime");
			String uname= request.getParameter("uname");
				
			
			String newRide = ("INSERT INTO Rider(departure,destination,timeWindow,username) VALUES ('"+ dep + "','" + dest +"','" + time +"','" + uname +"')");

			stmt.executeUpdate(newRide);
			 %>

</body>
</html>