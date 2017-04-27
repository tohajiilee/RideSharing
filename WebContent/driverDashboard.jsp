<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="offerRide.jsp">
	<table>
	<tr>    
	<td>From (00:00:00)</td><td><input type="text" name="timeF"></td>
	</tr>
	<tr>    
	<td>To (00:00:00)</td><td><input type="text" name="timeT"></td>
	</tr>
	<tr>
	<td>Date (YYYY-MM-DD) </td><td><input type="text" name="date"></td>
	</tr>
	<tr>
	<td>Departure </td><td><input type="text" name="dep"></td>
	</tr>
	<tr>
	<td>Destination </td><td><input type="text" name="dest"></td>
	</tr>
	<tr>
	<td>Vehicle information:</td><td><input type="text" name="veh"></td>
	</tr>
	</table>
	<br> Recurring? <select name="recurring" size=1>
		<option value="0">Yes</option>
		<option value="1">No</option>
	</select>&nbsp;<br>
	<br>
	<input type="submit" value="Offer Ride">
	</form>
</body>
</html>

