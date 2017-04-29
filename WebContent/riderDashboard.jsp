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
	<a href="https://www.ricksteves.com/europe/italy"><img
		src="<%=request.getContextPath()%>/images/ad2.jpg" width="550"
		height="200" /></a>
	<br>
	<br>


	<div style="float: right">
		<form method="post" action="logout.jsp">
			<input type="submit" value="Logout" />
		</form>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			String dburl = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
			Connection con1 = DriverManager.getConnection(dburl, "asingh",
					"test1234");
			String adIncrement = ("UPDATE adTable SET adShown = adShown + 1 WHERE adName = 'ad2'");
			PreparedStatement ad = con1.prepareStatement(adIncrement);
			ad.executeUpdate();
		%>
		<br>
		<form method="post" action="requestRide.jsp">
			<table>
				<tr>
					<td>Departure Time</td>
					<td><input type="text" placeholder="00:00:00" name="time"></td>
				</tr>
				<tr>
					<td>Date</td>
					<td><input type="text" placeholder="YYYY-MM-DD" name="date"></td>
				</tr>
				<tr>
					<td>Origin</td>
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
					<td>Parking Lot Number (optional)</td>
					<td><input type="text" name="lotNum"></td>
				</tr>
				<tr>
					<td>Destination</td>
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
					<td>Number of Passengers</td>
					<td><input type="text" name="passengersLim"></td>
				</tr>
				<tr>
					<td>Recurring?</td>
					<td><select name="recurring">
							<option value="0">No</option>
							<option value="1">Every day</option>
							<option value="2">Every week</option>
					</select></td>
				</tr>
			</table>
			<input type="submit" value="Request Ride">
		</form>

		<br> <br> <br>


		<h2>Your Open Ride Requests</h2>
		<table cellpadding="3" cellspacing="3" border="1">
			<tr>
			</tr>
			<tr>
				<th><b>Request #</b></th>
				<th><b>Time</b></th>
				<th><b>Date</b></th>
				<th><b>Destination</b></th>
				<th><b>Departure</b></th>
			</tr>



			<%
				String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
				//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, "asingh",
						"test1234");

				PreparedStatement statement = con
						.prepareStatement("SELECT * FROM RequestRide R Where R.accept=0 AND R.riderName='"
								+ (String) session.getAttribute("uname") + "'");

				ResultSet resultSet = statement.executeQuery();
				while (resultSet.next()) {
					if (resultSet.getInt("accept") == 0) {
			%>
			<tr>
				<td><%=resultSet.getString("requestNo")%></td>
				<td><%=resultSet.getString("time")%></td>
				<td><%=resultSet.getString("date")%></td>
				<td><%=resultSet.getString("destination")%></td>
				<td><%=resultSet.getString("departure")%></td>
			</tr>

			<%
				}
				}
			%>
		</table>
		<br> <br> <br>
		<h2>Your Accepted Ride Requests</h2>
		<table cellpadding="3" cellspacing="3" border="1">
			<tr>
			</tr>
			<tr>
				<th><b>Request #</b></th>
				<th><b>Driver Name</b></th>
				<th><b>Car Description</b></th>
			</tr>



			<%
				statement = con
						.prepareStatement("SELECT * FROM offeredRides R WHERE R.riderName='"
								+ (String) session.getAttribute("uname") + "'");
				resultSet = statement.executeQuery();
				String drivername, requestNo, offerNo;
				while (resultSet.next()) {
					requestNo = resultSet.getString("requestNo");
					offerNo = resultSet.getString("offerNo");
					statement = con
							.prepareStatement("SELECT * FROM OfferRide R where R.offerNo=?");
					statement.setString(1, resultSet.getString("offerNo"));
					ResultSet resultSet2 = statement.executeQuery();
					resultSet2.next();
					drivername = resultSet2.getString("driverName");
					statement = con
							.prepareStatement("SELECT * FROM Car R where R.carNo=?");
					statement.setString(1, resultSet2.getString("vehicleInfo"));
					ResultSet resultSet3 = statement.executeQuery();
					resultSet3.next();
			%>
			<tr>
				<td><%=resultSet.getString("requestNo")%></td>
				<td><%=resultSet2.getString("driverName")%></td>
				<td><%=resultSet3.getString("description")%></td>
				<td><form method="post" action="acceptRide.jsp">
						<input type="radio" name="decision" value="Accept"> Accept
						Offer <input type="radio" name="decision" value="Reject">
						Reject Offer <input type="hidden" name="offerNo" id="offerNo"
							value="<%out.print(offerNo);%>"> <input type="hidden"
							name="requestNo" id="requestNo" value="<%out.print(requestNo);%>">
						<input type="hidden" name="driverName" id="driverName"
							value="<%out.print(drivername);%>"> <input type="submit"
							value="Respond">
					</form></td>
			</tr>

			<%
				}
			%>
		</table>
		<br> <br> <br>

		<h2>Your Scheduled Rides</h2>
		<table cellpadding="3" cellspacing="3" border="1">
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
				String uname2 = (String) session.getAttribute("uname");

				PreparedStatement statement2 = con
						.prepareStatement("SELECT O.offerNo,R.requestNo,R.driverName,R.time,R.date,R.departure,R.destination FROM RequestRide R, OfferRide O WHERE R.time<=O.timeEnd AND R.time>=O.timeStart AND R.date=O.date AND R.accept=1 AND R.riderName=?");

				statement2.setString(1, uname2);

				ResultSet resultSet2 = statement2.executeQuery();

				while (resultSet2.next()) {
			%>
			<tr>
				<td><%=resultSet2.getInt("offerNo")%></td>
				<td><%=resultSet2.getInt("requestNo")%></td>
				<td><%=resultSet2.getString("time")%></td>
				<td><%=resultSet2.getString("date")%></td>
				<td><%=resultSet2.getString("departure")%></td>
				<td><%=resultSet2.getString("destination")%></td>
				<td><%=resultSet2.getString("driverName")%></td>
				<td><form method="post" action="rideComplete.jsp">
						<input type="hidden" name="offerNo" id="offerNo"
							value="<%=resultSet2.getInt("offerNo")%>"> <input
							type="hidden" name="requestNo" id="requestNo"
							value="<%=resultSet2.getInt("requestNo")%>"> <input
							type="hidden" name="driverName" id="driverName"
							value="<%=resultSet2.getString("driverName")%>"> <input
							type="submit" value="Complete Ride">
					</form></td>
			</tr>

			<%
				}
			%>
		</table>
		<br> <br> <br>
</body>
</html>