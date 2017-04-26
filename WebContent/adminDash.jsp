<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>
<br>
<br>
Create System Support Staff:

<form method="post" action="adminCreateSupport.jsp"> <!-- also send userType = support -->
	<table>
	<tr>
	<td>Usertype</td><td><input type="text" value="support"></td>
	</tr>
	<tr>
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="password" name="password"></td>
	</tr>
	</table>
	<input type="submit" value="Submit">
	</form>
<br>
<br>
Would you like to run a statistical query?
<!-- run stats query with button or smth -->
<form method="post" action="runStatQuery.jsp"> 
<input type="submit" value="Run Query">
</form>

</body>
</html>