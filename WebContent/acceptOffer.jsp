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
	String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "asingh", "test1234");

	String requestNo=request.getParameter("requestNo");
	String driverUsername = (String)session.getAttribute("uname");

	String update = "UPDATE RequestRide SET accept='1', driverName=? Where requestNo=?";
	//Create a Prepared SQL statement allowing you to introduce the parameters of the query
	PreparedStatement ps = con.prepareStatement(update);
	

	//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	ps.setString(1, driverUsername);
	ps.setString(2, requestNo);
	

	//Run the query against the DB
	ps.executeUpdate();
	

%>
</body>
</html>