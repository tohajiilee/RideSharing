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

			String driverName = (String)session.getAttribute("uname");
	
			String insert = "INSERT INTO OfferRide(timeStart,timeEnd,date,departure,destination,driverName,vehicleInfo)"
					+ "VALUES (?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(insert);


			ps.setString(1, request.getParameter("timeF"));
			ps.setString(2, request.getParameter("timeT"));
			ps.setString(3, request.getParameter("date"));
			ps.setString(4, request.getParameter("dep"));
			ps.setString(5, request.getParameter("dest"));
			ps.setString(6, driverName);
			ps.setString(7, request.getParameter("veh"));

			//Run the query against the DB
			ps.executeUpdate();
			//close the connection
			con.close();
			 response.sendRedirect("driverDashboard.jsp");

%>
</body>
</html>