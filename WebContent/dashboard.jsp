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
	<div style="float: right">
		<form method="post" action="logout.jsp">
			<input type="submit" value="Logout" />
		</form>
	</div>
<h1>Enduser Dashboard</h1>

<body>
	<%
		String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "asingh",
				"test1234");

		String uname = session.getAttribute("uname").toString();
		String str = ("SELECT * FROM Stats.userstats WHERE username=?");

		PreparedStatement stmt = con.prepareStatement(str);
		stmt.setString(1, uname);
		ResultSet result = stmt.executeQuery();

		if (result.next() && !(uname == null || uname == "")) {
			stmt = con
					.prepareStatement("SELECT * FROM Stats.userstats WHERE username = ?");
			stmt.setString(1, uname);
			result = stmt.executeQuery();
			result.next();
			int currPoints = result.getInt("points");
			str = ("Your points: " + currPoints);
		}

		stmt = con
				.prepareStatement("SELECT * FROM Messaging.userNotifications WHERE username = ?");
		stmt.setString(1, uname);
		result = stmt.executeQuery();
		result.next();
		int currNotes = result.getInt("notes");
		out.println("<a href='messenger.jsp'>You have " + currNotes
				+ " new notifications. "
				+ "Click here to go to your Inbox.</a><br>");
		out.println(str);
		con.close();
	%>
	<h1>Select Option:</h1>
	<input type="button" onclick="location.href='riderDashboard.jsp'">
	Rider
	<br>
	<br>
	<input type="button" onclick="location.href='driverDashboard.jsp'">
	Driver
	<br>
	<br>
</body>
</html>