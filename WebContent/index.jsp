<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ride-Sharing App</title>
</head>
<body>
Ride-Sharing Application(Contributors: Eric Zhuang, Aman Singh, Joel Carrillo)
<br>
<br>
Login:

<form method="post" action="login.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="uname"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="password" name="password"></td>
	</tr>
	</table>
	<input type="submit" value="Login">
	</form>
	
<br>
Don't have an account? <a href="register.jsp">Register Here</a>

</body>
</html>