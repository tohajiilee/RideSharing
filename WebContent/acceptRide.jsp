<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "asingh", "test1234");
	
	String requestNo=(String)request.getAttribute("rideInfo1");
	String driverUsername=(String)request.getAttribute("rideInfo2");

	String acceptRide = "UPDATE RequestRide SET accept='1', driverName=? Where requestNo=?";
	
	PreparedStatement ps = con.prepareStatement(acceptRide);
	
	ps.setString(1, driverUsername);
	ps.setString(2, requestNo);
	

	//Run the query against the DB
	ps.executeUpdate();
	
	con.close();

	%>
</body>
</html>