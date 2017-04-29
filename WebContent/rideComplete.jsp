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
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "asingh", "test1234");

		String uname = session.getAttribute("uname").toString();
		String requestNo = ((String)request.getParameter("requestNo"));
		String driverName = ((String)request.getParameter("driverName"));
		String str = ("SELECT * FROM Stats.userstats WHERE username=?");

		PreparedStatement stmt = con.prepareStatement(str);
		stmt.setString(1, uname);
		ResultSet result = stmt.executeQuery();


		if (result.next() && !(uname == null || uname == "")) {
			stmt = con
					.prepareStatement("UPDATE Stats.userstats SET points  = points + 1 WHERE username = ?");
			stmt.setString(1, driverName);
			stmt.executeUpdate();
		}

		Calendar cal = Calendar.getInstance();
		int currMonth = cal.get(Calendar.MONTH) + 1;
		stmt = con
				.prepareStatement("UPDATE Stats.monthstats SET points  = points + 1 WHERE month= ?");
		stmt.setInt(1, currMonth);
		stmt.executeUpdate();

		int currYear = cal.get(Calendar.YEAR);
		stmt = con
				.prepareStatement("SELECT * FROM Stats.yearstats WHERE year=?");
		stmt.setInt(1, currYear);
		result = stmt.executeQuery();

		if (result.next() && !(currYear == 0)) {
			stmt = con
					.prepareStatement("UPDATE Stats.yearstats SET points  = points + 1 WHERE year= ?");
			stmt.setInt(1, currYear);
			stmt.executeUpdate();
		}

		int dayOfMonth = cal.get(Calendar.DAY_OF_MONTH);
		String dayStr = (currMonth + "-" + dayOfMonth + "-" + currYear);
		stmt = con.prepareStatement("SELECT * FROM Stats.daystats WHERE day=?");
		stmt.setString(1, dayStr);
		result = stmt.executeQuery();

		if (result.next()) {
			stmt = con
					.prepareStatement("UPDATE Stats.daystats SET points  = points + 1 WHERE day= ?");
			stmt.setString(1, dayStr);
			stmt.executeUpdate();
		} else {
			stmt = con.prepareStatement("INSERT INTO Stats.daystats(day,points) VALUES (?,1)");
			stmt.setString(1, dayStr);
			stmt.executeUpdate();
		}
		
		String usermonthStr = (currMonth + "-" + currYear);
		stmt = con.prepareStatement("SELECT * FROM Stats.usermonthstats WHERE username=? AND month=?");
		stmt.setString(1, driverName);
		stmt.setString(2, usermonthStr);
		result = stmt.executeQuery();
		if (result.next()) {
			stmt = con
					.prepareStatement("UPDATE Stats.usermonthstats SET points  = points + 1 WHERE month=? AND username=?");
			stmt.setString(1, usermonthStr);
			stmt.setString(2, driverName);
			stmt.executeUpdate();
		} else {
			stmt = con
					.prepareStatement("INSERT INTO Stats.usermonthstats(username,month,points) VALUES (?,?,?)");
			stmt.setString(1, driverName);
			stmt.setString(2, usermonthStr);
			stmt.setInt(3, 1);
			stmt.executeUpdate();
		}
		
		stmt = con.prepareStatement("DELETE FROM Users.RequestRide WHERE requestNo = ?");
		stmt.setString(1, requestNo);
		stmt.executeUpdate();
		con.close();
	%>
	response.sendRedirect(riderDashboard.jsp);
</body>
</html>