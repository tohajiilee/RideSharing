<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <link rel="stylesheet" href="index.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ride-Sharing App</title>
</head>
<body>
<br>
<br>


<form method="post" action="login.jsp">


  <div class="container">
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <button type="submit">Login</button>
  </div>

</form>

<br>
Don't have an account? <a href="register.jsp">Register Here</a>

</body>
</html>