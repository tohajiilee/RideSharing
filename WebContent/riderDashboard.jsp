<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="rider.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="uname"></td>
	</tr>
	<tr>    
	<td>Departure</td><td><input type="text" name="riderDep"></td>
	</tr>
	<tr>
	<td>Destination</td><td><input type="text" name="riderDest"></td>
	</tr>
	<tr>
	<td>Time Window</td><td><input type="text" name="riderTime"></td>
	</tr>
	</table>
	<input type="submit" value="Request Ride">
	</form>
</body>
</html>