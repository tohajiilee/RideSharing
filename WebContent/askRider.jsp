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
	String driverUsername = (String)session.getAttribute("uname");
	
	request.setAttribute("rideInfo1",requestNo);
	request.setAttribute("rideInfo2",driverUsername);
	
	//Send a message to rider
	
	String riderName= "SELECT riderName FROM RequestRide WHERE requestNo=?";
	PreparedStatement ps2 = con.prepareStatement(riderName);
	ps2.setString(1, requestNo);
	ResultSet result = ps2.executeQuery();
	result.next();
	
	String recipient=result.getString("riderName");
	String message=("Ride request "+ requestNo +" accepted by "+ driverUsername + "\n" +%> <a href="acceptRide.jsp">Accept</a><%+ "\n"+%>
	<a href="declineRide.jsp">Decline</a><%);
	
	out.print(message); //*replace with message to rider, used this for testing purposes 

	

%>
</body>
</html>