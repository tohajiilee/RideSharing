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
<br>
<form method="post" action="requestRide.jsp">
	<table>
	<tr>    
	<td>Departure Time (00:00:00 )</td><td><input type="text" name="time"></td>
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
	</table>
	<input type="submit" value="Request Ride">
	</form>
	</br>
	
<h2> Current Ride Requests </h2>
<table cellpadding = "3" cellspacing = "3" border = "1">
<tr>
</tr>
<tr>
<th><b>Time</b></th>
<th><b>Date</b></th>
<th><b>Destination</b></th>
<th><b>Departure</b></th>
</tr>



	<%
	
	String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "asingh", "test1234");
			
	PreparedStatement statement = con.prepareStatement("SELECT * FROM RequestRide R Where R.accept=0 AND R.riderName='"+(String)session.getAttribute("uname")+"'");
	
	ResultSet resultSet = statement.executeQuery();
	while (resultSet.next()) {
	%>
		<tr>
		<td><%=resultSet.getString("time")%></td>
		<td><%=resultSet.getString("date")%></td>
		<td><%=resultSet.getString("destination")%></td>
		<td><%=resultSet.getString("departure")%></td>
		</tr>			
		
	<%
	}
%>
</table>
<br>
<br>
<br>
<br>
<h2> Scheduled Rides</h2>
				<table cellpadding = "3" cellspacing = "3" border = "1">
				<tr>
				</tr>
				<tr>
				<th><b>Offer #</b></th>
				<th><b>Request #</b></th>
				<th><b>Departure Time</b></th>
				<th><b>Date</b></th>
				<th><b>Departure </b></th>
				<th><b>Destination </b></th>
				<th><b>Driver </b></th>
		
				</tr>

	<%
	String uname2 = (String)session.getAttribute("uname");
	
	PreparedStatement statement2 = con.prepareStatement("SELECT O.offerNo,R.requestNo,R.driverName,R.time,R.date,R.departure,R.destination FROM RequestRide R, OfferRide O WHERE R.time<=O.to AND R.time>=O.from AND R.date=O.date AND R.accept=1 AND R.riderName=?");
	
	statement2.setString(1,uname2);
	
	ResultSet resultSet2 = statement2.executeQuery();
	
	while (resultSet2.next()) {
		%>
			<tr>
			<td><%=resultSet2.getInt("offerNo")%></td>
			<td><%=resultSet2.getInt("requestNo")%></td>
			<td><%=resultSet2.getString("time")%></td>
			<td><%=resultSet2.getString("date")%></td>
			<td><%=resultSet2.getInt("departure")%></td>
			<td><%=resultSet2.getInt("destination")%></td>
			<td><%=resultSet2.getString("driverName")%></td>
			</tr>			
			
		<%
		}
	%>
</table>
</body>
</html>