<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="driver.jsp">
	<table>
	<tr>    
	<td>Departure</td><td><input type="text" name="driverDep"></td>
	</tr>
	<tr>
	<td>Destination</td><td><input type="text" name="driverDest"></td>
	</tr>
	<tr>
	<td>Time Window</td><td><input type="text" name="driverTime"></td>
	</tr>
	<tr>
	<td>Car Description</td><td><input type="text" name="driverCar"></td>
	</tr>
	</table>
	<input type="submit" value="Offer Ride">
	</form>
</body>
</html>