<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try{
			String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "asingh", "test1234");
					
			String timeStart = request.getParameter("timeF");
			String timeEnd = request.getParameter("timeT");
			String date = request.getParameter("date");
			String dep = request.getParameter("dep");
			String dest = request.getParameter("dest");
			String veh= request.getParameter("vehicleNumber");
			String driverName = (String)session.getAttribute("uname");
			String passengersLim= request.getParameter("passengersLim");
			String rec=request.getParameter("recurring");
	
	
			String insert = "INSERT INTO OfferRide(timeStart,timeEnd,date,departure,destination,driverName,vehicleInfo,lim,recurring)"
					+ "VALUES (?,?,?,?,?,?,?,?,?)";
			
		 
			PreparedStatement ps = con.prepareStatement(insert);


			ps.setString(1, timeStart);
			ps.setString(2, timeEnd);
			ps.setString(3, date);
			ps.setString(4, dep);
			ps.setString(5, dest);
			ps.setString(6, driverName);
			ps.setInt(7, Integer.parseInt(veh));
			ps.setString(8, passengersLim);
			ps.setString(9, rec);

			//Run the query against the DB
			ps.executeUpdate();
			//close the connection
			con.close();
			 response.sendRedirect("driverDashboard.jsp");
} catch (Exception e){
	out.print("Ride offer failed, try again");
}

%>
</body>
</html>