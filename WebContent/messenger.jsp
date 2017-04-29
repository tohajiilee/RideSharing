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

	<a href='dashboard.jsp'>Return to your Dashboard</a>
	<br>
	<h1>Send Message:</h1>
	<form method="post" action="sendMessage.jsp">
		<table>
			<tr>
				<td>Recipient:</td>
				<td><input type="text" name="recipient"></td>
			</tr>
			<tr>
				<td>Message:</td>
				<td><textarea name="message" cols="50" rows="10"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="submit">
	</form>

	<%
		String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Messaging";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "asingh",
				"test1234");

		String uname = session.getAttribute("uname").toString();
		String str = ("SELECT * FROM " + uname + "inbox");
		PreparedStatement stmt = con.prepareStatement(str);
		ResultSet result = stmt.executeQuery();
		
		stmt = con
				.prepareStatement("UPDATE userNotifications SET notes = 0 WHERE username = ?");
		stmt.setString(1, uname);
		stmt.executeUpdate();

		out.print('<' + "style" + '>' + "table, th, td {"
				+ "border: 1px solid black;" + "}" + '<' + "/style" + '>'
				+ "");
		out.print("<h1>Inbox</h1>");
		//Make an HTML table to show the results in:
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Sender");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Message");
		out.print("</td>");
		out.print("<td>Delete</td></tr>");

		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current 
			out.print(result.getString(1));
			out.print("</td>");
			out.print("<td>");
			//Print out current 
			out.print(result.getString(2));
			out.print("</td>");
			if(result.getInt(3) < 1){
			out.print("<td><form method=\"post\" action=\"deleteMessage.jsp\">"
					+ "<input type=\"hidden\" name=\"deleteName\" value=\""
					+ result.getString(1)
					+ "\">"
					+ "<input type=\"hidden\" name=\"deleteMsg\" value=\""
					+ result.getString(2)
					+ "\">"
					+ "<input type=\"hidden\" name=\"deleteType\" value=\"In\">"
					+ "<input type=\"submit\" value=\"Delete\">"
					+ "</form></td>");
			}
			out.print("</tr>");
		}
		out.print("</table>");

		uname = session.getAttribute("uname").toString();
		str = ("SELECT * FROM " + uname + "outbox");
		stmt = con.prepareStatement(str);
		result = stmt.executeQuery();

		out.print("<h1>Outbox</h1>");

		//Make an HTML table to show the results in:
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Sender");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Message");
		out.print("</td>");
		out.print("<td>Delete</td></tr>");

		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current 
			out.print(result.getString(1));
			out.print("</td>");
			out.print("<td>");
			//Print out current 
			out.print(result.getString(2));
			out.print("</td>");
			out.print("<td><form method=\"post\" action=\"deleteMessage.jsp\">"
					+ "<input type=\"hidden\" name=\"deleteName\" value=\""
					+ result.getString(1)
					+ "\">"
					+ "<input type=\"hidden\" name=\"deleteMsg\" value=\""
					+ result.getString(2)
					+ "\">"
					+ "<input type=\"hidden\" name=\"deleteType\" value=\"Out\">"
					+ "<input type=\"submit\" value=\"Delete\">"
					+ "</form></td>");
			out.print("</tr>");
		}
		out.print("</table>");

		con.close();
	%>
</body>
</html>