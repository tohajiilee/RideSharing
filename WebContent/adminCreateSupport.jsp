<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adminCreateSupport</title>
</head>
<body>
<%

//Create a connection string
String url = "jdbc:mysql://cs336ericzhuang.chqhpt0v9ibv.us-east-1.rds.amazonaws.com:3306";
//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
Class.forName("com.mysql.jdbc.Driver");

//Create a connection to your DB
Connection con = DriverManager.getConnection(url, "cs336ez", "cs336633");

//Create a SQL statement

String utype = request.getParameter("utype");
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");

String str = ("SELECT * FROM userTable WHERE username=?");
PreparedStatement stmt = con.prepareStatement(str);

ResultSet result = stmt.executeQuery();	

if (result.next()) {
    out.println("Username not available: <a href='register.jsp'> Try again here </a>");
} 

else{
	stmt = con.prepareStatement("INSERT INTO userTable(userType,username,password) VALUES (?,?,?)");
	stmt.setString(1, utype);
	stmt.setString(2, uname);
	stmt.setString(3, pass);
	int newAcc = stmt.executeUpdate();
	out.println("Registration successful: <a href='index.jsp'> Log in here </a>");
	}


//close the connection
con.close();



%>
</body>
</html>