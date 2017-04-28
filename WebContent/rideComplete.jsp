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
	String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Stats";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "asingh", "test1234");

		String uname = session.getAttribute("uname").toString();
		String str = ("SELECT * FROM userstats WHERE username=?");

		PreparedStatement stmt = con.prepareStatement(str);
		stmt.setString(1, uname);
		ResultSet result = stmt.executeQuery();

		if (result.next() && !(uname == null || uname == "")) {
			stmt = con
					.prepareStatement("UPDATE userstats SET points  = points + 1 WHERE username = ?");
			stmt.setString(1, uname);
			stmt.executeUpdate();
		}

		Calendar cal = Calendar.getInstance();
		int currMonth = cal.get(Calendar.MONTH) + 1;
		stmt = con
				.prepareStatement("UPDATE monthstats SET points  = points + 1 WHERE monthid = ?");
		stmt.setInt(1, currMonth);
		stmt.executeUpdate();

		int currYear = cal.get(Calendar.YEAR);
		stmt = con
				.prepareStatement("SELECT * FROM yearstats WHERE yearid=?");
		stmt.setInt(1, currYear);
		result = stmt.executeQuery();

		if (result.next() && !(currYear == 0)) {
			stmt = con
					.prepareStatement("UPDATE yearstats SET points  = points + 1 WHERE yearid = ?");
			stmt.setInt(1, currYear);
			stmt.executeUpdate();
		} else {
			stmt = con.prepareStatement("INSERT INTO yearstats(yearid,points) VALUES (?,1)");
			stmt.setInt(1, currYear);
			stmt.executeUpdate();
		}

		int dayOfMonth = cal.get(Calendar.DAY_OF_MONTH);
		String dayStr = (currMonth + "-" + dayOfMonth + "-" + currYear);
		stmt = con.prepareStatement("SELECT * FROM daystats WHERE dayid=?");
		stmt.setString(1, dayStr);
		result = stmt.executeQuery();

		if (result.next()) {
			stmt = con
					.prepareStatement("UPDATE daystats SET points  = points + 1 WHERE dayid = ?");
			stmt.setString(1, dayStr);
			stmt.executeUpdate();
		} else {
			stmt = con.prepareStatement("INSERT INTO daystats(dayid,points) VALUES (?,1)");
			stmt.setString(1, dayStr);
			stmt.executeUpdate();
		}

		con.close();
	%>
	Please rate the quality of your riding experience:
	<form method="post" action="rateUser.jsp">
		<select name=dbselect>
			<option value="norating">No Rating</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select> <br>
		<br>
		Leave behind a comment (optional): <br>
		<textarea name="message" cols="50" rows="10"></textarea><br>
		<input type="submit" value="Rate Driver">
	</form>
</body>
</html>