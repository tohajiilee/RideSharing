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
		try {

			String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "asingh", "test1234");
					
			String time = request.getParameter("time");
			String date = request.getParameter("date");
			String dep = request.getParameter("dep");
			String dest = request.getParameter("dest");
			String riderName = (String)session.getAttribute("uname");
			String passengersLim= request.getParameter("passengersLim");
			String temp=request.getParameter("recurring");
			int recurring=Integer.parseInt(temp);


	
			String insert = "INSERT INTO RequestRide(time,date,departure,destination,riderName,lim)"
					+ "VALUES (?,?,?,?,?,?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);


			ps.setString(1, time);

			ps.setString(3, dep);
			ps.setString(4, dest);
			ps.setString(5, riderName);
			ps.setString(6,passengersLim);
			switch(recurring){
			
			case 0:
				ps.setString(2, date);


		
			case 1:
				java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
				java.util.Date nDate = df.parse(date);
				Calendar cal = Calendar.getInstance();
				cal.setTime(nDate);
				cal.add(Calendar.DATE, +1);
				
				ps.setString(2, df.format(cal.getTime()));
			
				date = df.format(cal.getTime());

				
			case 2:
				java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
				java.util.Date nDate2 = df2.parse(date);
				Calendar cal2 = Calendar.getInstance();
				cal2.setTime(nDate2);
				cal2.add(Calendar.DATE, +7);
				
				ps.setString(2, df2.format(cal2.getTime()));

				
				date = df2.format(cal2.getTime());

		
		}
		
		ps.executeUpdate();
			con.close();
			 response.sendRedirect("riderDashboard.jsp");
} catch (Exception e) {
			out.print("ride request failed");
		}
%>
</body>
</html>