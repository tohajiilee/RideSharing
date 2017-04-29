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
		<h2>Your Cars</h2>
	<table cellpadding="3" cellspacing="3" border="1">
		<tr>
		</tr>
		<tr>
			<th><b>Car #</b></th>
			<th><b>License Plate</b></th>
			<th><b>Model</b></th>
			<th><b>Year</b></th>
			<th><b>Maker</b></th>
			<th><b>Color</b></th>
			<th><b>Description</b></th>

		</tr>
		<%
			String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "asingh",
					"test1234");

			String uname3=(String)session.getAttribute("uname");		
			
			PreparedStatement statement3= con.prepareStatement("SELECT carNo,licensePlate,model,yr,maker,color,description FROM Car WHERE driverName=?");
			
			statement3.setString(1, uname3);
			
			ResultSet resultSet3 = statement3.executeQuery();

			while (resultSet3.next()) {
		%>
		<tr>
			<td><%=resultSet3.getInt("carNo")%></td>
			<td><%=resultSet3.getString("licensePlate")%></td>
			<td><%=resultSet3.getString("model")%></td>
			<td><%=resultSet3.getString("yr")%></td>
			<td><%=resultSet3.getString("maker")%></td>
			<td><%=resultSet3.getString("color")%></td>
			<td><%=resultSet3.getString("description")%></td>

		</tr>

		<%
			}
		%>

	</table>

	<br>
	<br>
	<br>
	
	
		<h2>Add A Car</h2>
	<form method="post" action="addCar.jsp">
	<table>
	<tr><td>License Plate</td><td><input type="text" name="lisc"></td></tr>
		<tr><td>Model</td><td><input type="text" name="model"></td></tr>
			<tr><td>Year</td><td><input type="text" name="yr"></td></tr>
				<tr><td>Maker</td><td><input type="text" name="maker"></td></tr>
					<tr><td>Color</td><td><input type="text" name="color"></td></tr>
					    <tr><td>Short Description </td><td><input type="text" placeholder="(Required)" name="description"></td></tr>	
	</table>
	 	<input type="submit" value="Add Car">
	</form>
	
	<br>
	<br>
	<br>
	
	
	<h2>Delete A Car</h2>
	<form method="post" action="deleteCar.jsp">
		<table>
			<tr>
				<td>Car #</td>
				<td><input type="text" name="delCarNo"></td>
			</tr>
		</table>
		<input type="submit" value="Delete Car">
	</form>
	
	<br>
	<br>
	<br>
	
	
	</form>
	<h2>Offer A Ride</h2>
	<form method="post" action="offerRide.jsp">
		<table>
			<tr>
				<td>Start Time</td>
				<td><input type="text" placeholder="00:00:00" name="timeF"></td>
			</tr>
			<tr>
				<td>End Time </td>
				<td><input type="text" placeholder="00:00:00" name="timeT"></td>
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
				<td>Car Number</td>
				<td><input type="text" name="vehicleNumber"></td>
			</tr>
			<tr>
			<td> Number of Passengers Limit </td>
			<td> <input type="text" name="passengersLim"></td>
			</tr>
			<tr>
			<td> Recurring? </td>
			<td> <select name="recurring">
				<option value="0">No</option>
				<option value="1">Every day</option>
				<option value="2">Every week</option>		
			</select></td>
			</tr>
		</table> 
 	<input type="submit" value="Offer Ride">
	</form>

	<br>
	<br>
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


			PreparedStatement statement = con
					.prepareStatement("SELECT R.requestNo,R.riderName,R.time,R.date,R.departure,R.destination FROM RequestRide R, OfferRide O WHERE R.time<=O.timeEnd AND R.time>=O.timeStart AND R.date=O.date AND R.accept=0 AND R.lim<=O.lim");
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

	<h2>Accept a Request</h2>
	<form method="post" action="askRider.jsp">
		<table>
			<tr>
				<td>Request #</td>
				<td><input type="text" name="requestNo"></td>
			</tr>
		</table>
		<input type="submit" value="Accept Ride">
	</form>
	
	<br>
	<br>
	<br>


	<h2>Your Scheduled Drives</h2>
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
	
	<br>
	<br>
	<br>

<%
con.close(); %>

</body>
</html>

