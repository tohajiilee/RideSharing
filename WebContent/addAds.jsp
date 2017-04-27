<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Timeout</title>
</head>
<body>
	<%
	//Create a connection string
	String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");

	//Create a connection to your DB
	Connection con = DriverManager.getConnection(url, "asingh", "test1234");
	String adname = request.getParameter("adname");
	
	String str = ("UPDATE adTable SET adShown = adShown + 1 WHERE adName = ?");
	

	PreparedStatement stmt = con.prepareStatement(str);
	stmt.setString(1,adname);
	int result = stmt.executeUpdate();	
	
	out.print("User "+ "'"+ adname +"'" +" has been unlocked out");
	
    con.close();
	%>
</body>
</html>