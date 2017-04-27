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
	<div style="float: right">
		<form method="post" action="logout.jsp">
			<input type="submit" value="Logout" />
		</form>
	</div>

	<form method="post" action="offerRide.jsp">
		<table>
			<tr>
				<td>From (00:00:00)</td>
				<td><input type="text" name="timeF"></td>
			</tr>
			<tr>
				<td>To (00:00:00)</td>
				<td><input type="text" name="timeT"></td>
			</tr>
			<tr>
				<td>Date (YYYY-MM-DD)</td>
				<td><input type="text" name="date"></td>
			</tr>
			<tr>
				<td>Origin:</td>
				<td><select name="dep">
						<option value="College Avenue">College Avenue Campus</option>
						<option value="Cook/Douglass">Cook/Douglass Campus</option>
						<option value="Busch">Busch Campus</option>
						<option value="Livingston">Livingston Campus</option>
						<option value="Train Station">Train Station on College
							Avenue</option>
				</select></td>
			</tr>
			<tr>
				<td>Destination:</td>
				<td><select name="dest">
						<option value="College Avenue">College Avenue Campus</option>
						<option value="Cook/Douglass">Cook/Douglass Campus</option>
						<option value="Busch">Busch Campus</option>
						<option value="Livingston">Livingston Campus</option>
						<option value="Train Station">Train Station on College
							Avenue</option>
				</select></td>
			</tr>
			<tr>
				<td>Vehicle information:</td>
				<td><input type="text" name="veh"></td>
			</tr>
		</table>
		<br> Recurring? <select name="recurring" size=1>
			<option value="0">No</option>
			<option value="1">Everyday</option>
			<option value="1">Every week</option>
		</select>&nbsp;<br> <br> <input type="submit" value="Offer Ride">
	</form>

	<br>
	<h2>Available Ride Requests</h2>
	<table cellpadding="3" cellspacing="3" border="1">
		<tr>
		</tr>
		<tr>
			<th><b>Request #</b></th>
			<th><b>Departure Time</b></th>
			<th><b>Date</b></th>
			<th><b>Departure</b></th>
			<th><b>Destination </b></th>
			<th><b>Rider Name </b></th>

		</tr>
		<%
			String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "asingh",
					"test1234");

			PreparedStatement statement = con
					.prepareStatement("SELECT R.requestNo,R.riderName,R.time,R.date,R.departure,R.destination FROM RequestRide R, OfferRide O WHERE R.time<=O.timeEnd AND R.time>=O.timeStart AND R.date=O.date AND R.accept=0");
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getInt("requestNo")%></td>
			<td><%=resultSet.getString("time")%></td>
			<td><%=resultSet.getString("date")%></td>
			<td><%=resultSet.getString("departure")%></td>
			<td><%=resultSet.getString("destination")%></td>
			<td><%=resultSet.getString("riderName")%></td>


		</tr>

		<%
			}
		%>

	</table>

	<br>
	<br>

	<br>
	<br>
	<h2>Accepting a Request</h2>
	<form method="post" action="acceptOffer.jsp">
		<table>
			<tr>
				<td>Request #</td>
				<td><input type="text" name="requestNo"></td>
			</tr>
		</table>
		<input type="submit" value="Accept Ride">
	</form>


	<h2>Scheduled Rides</h2>
	<table align="left" cellpadding="3" cellspacing="3" border="1">
		<tr>
		</tr>
		<tr>
			<TH><b>Request #</b></th>
			<TH><b>Departure Time</b></th>
			<th><b>Date</b></th>
			<th><b>Departure</b></th>
			<th><b>Destination </b></th>
			<th><b>Rider Name </b></th>

		</tr>

		<%
			String uname2 = (String) session.getAttribute("uname");

			PreparedStatement statement2 = con
					.prepareStatement("SELECT R.requestNo,R.riderName,R.time,R.date,R.departure,R.destination FROM RequestRide R, OfferRide O WHERE R.time<=O.timeEnd AND R.time>=O.timeStart AND R.date=O.date AND R.accept=1 AND R.driverName=?");

			statement2.setString(1, uname2);

			ResultSet resultSet2 = statement2.executeQuery();

			while (resultSet2.next()) {
		%>
		<tr>
			<td><%=resultSet2.getInt("requestNo")%></td>
			<td><%=resultSet2.getString("time")%></td>
			<td><%=resultSet2.getString("date")%></td>
			<td><%=resultSet2.getString("departure")%></td>
			<td><%=resultSet2.getString("destination")%></td>
			<td><%=resultSet2.getString("riderName")%></td>
		</tr>

		<%
			}
		%>
	</table>




</body>
</html>

