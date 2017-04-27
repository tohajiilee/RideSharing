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
					
			String from = request.getParameter("timeF");
			String to = request.getParameter("timeT");
			String date = request.getParameter("date");
			String dep = request.getParameter("dep");
			String dest = request.getParameter("dest");
			String veh= request.getParameter("veh");
			String driverName = (String)session.getAttribute("uname");


	
			String insert = "INSERT INTO OfferRide(from,to,date,departure,destination,driverName,vehicleInfo)"
					+ "VALUES (?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(insert);


			ps.setString(1, from);
			ps.setString(2, to);
			ps.setString(3, date);
			ps.setString(4, dep);
			ps.setString(5, dest);
			ps.setString(6, driverName);
			ps.setString(7, veh);

			//Run the query against the DB
			ps.executeUpdate();
			//close the connection
			con.close();
			 response.sendRedirect("driverDashboard.jsp");

%>
</body>
</html>