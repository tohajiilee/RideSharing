<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="requestRide.jsp">
	<table>
	<tr>    
	<td>Departure Time: (00:00:00 )</td><td><input type="text" name="time"></td>
	</tr>
	<tr>
	<td>Date:(YYYY-MM-DD) </td><td><input type="text" name="date"></td>
	</tr>
	<tr>
	<td>Departure </td><td><input type="text" name="dep"></td>
	</tr>
	<tr>
	<td>Destination </td><td><input type="text" name="dest"></td>
	</tr>
	</table>
	<input type="submit" value="Request Ride">
	</form>
</body>
</html>