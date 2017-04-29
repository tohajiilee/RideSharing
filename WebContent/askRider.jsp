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
	<%
	String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "asingh", "test1234");

	String requestNo=(String)request.getParameter("requestNo");
	String offerNo=(String)request.getParameter("offerNo");
	String driverName = (String)session.getAttribute("uname");
	
	//Send a message to rider
	
	String riderName= "SELECT riderName FROM Users.RequestRide WHERE requestNo=?";
	PreparedStatement ps2 = con.prepareStatement(riderName);
	ps2.setString(1, requestNo);
	ResultSet result = ps2.executeQuery();
	
	result.next();	
	String recipient=result.getString("riderName");

	PreparedStatement stmt = con.prepareStatement("INSERT INTO Users.offeredRides(riderName,requestNo,offerNo) VALUES (?,?,?)");
	stmt.setString(1,recipient);
	stmt.setString(2,requestNo);
	stmt.setString(3,offerNo);
	stmt.executeUpdate();
	
	String message= "Ride request " + requestNo + " accepted. <a href=riderDashboard.jsp>See details here.</a>";

		stmt = con.prepareStatement("INSERT INTO Messaging." + recipient + "inbox(sender,message,messageType) VALUES (?,?,?)");
		stmt.setString(1, "System");
		stmt.setString(2, message);
		stmt.setInt(3, 0);
		stmt.executeUpdate();
		
		stmt = con
				.prepareStatement("UPDATE Messaging.userNotifications SET notes = notes + 1 WHERE username = ?");
		stmt.setString(1, recipient);
		stmt.executeUpdate();
		
	    out.println("Message successfully sent. <a href='dashboard.jsp'>Click here to go back to your Dashboard.</a>");


	//close the connection
	con.close();

	

%>
</body>
</html>