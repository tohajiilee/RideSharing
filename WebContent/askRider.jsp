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
	String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "asingh", "test1234");

	String requestNo=request.getParameter("requestNo");
	String driverName = (String)session.getAttribute("uname");
	
	request.setAttribute("rideInfo1",requestNo);
	request.setAttribute("rideInfo2",driverName);
	
	//Send a message to rider
	
	String riderName= "SELECT riderName FROM RequestRide WHERE requestNo=?";
	PreparedStatement ps2 = con.prepareStatement(riderName);
	ps2.setString(1, requestNo);
	ResultSet result = ps2.executeQuery();
	
	result.next();	
	String recipient=result.getString("riderName");
	
	String message= "Ride request" + requestNo + "accepted by" + driverName;
	
	con.close();
	
	String url2 = "jdbc:mysql://cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com:3306/usermessages";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con2 = DriverManager.getConnection(url2, "jjc372", "test1234");

		PreparedStatement stmt = con2.prepareStatement("INSERT INTO " + recipient + "inbox(sender,message) VALUES (?,?)");
		stmt.setString(1, driverName);
		stmt.setString(2, message);
		stmt.executeUpdate();
		
		PreparedStatement stmt2 = con2.prepareStatement("INSERT INTO " + driverName + "outbox(recipient,message) VALUES (?,?)");
		stmt2.setString(1, recipient);
		stmt2.setString(2, message);
		stmt2.executeUpdate();
	    out.println("Message successfully sent. <a href='messenger.jsp'>Click here to go to your Inbox.</a>");


	//close the connection
	con2.close();

	

%>
</body>
</html>