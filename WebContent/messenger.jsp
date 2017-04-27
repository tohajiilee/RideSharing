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
	<td>Recipient:</td><td><input type="text" name="recipient"></td>
	</tr>
	<tr>
	<td>Message:</td></br><td><textarea name="message" cols="50" rows="10"></textarea></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
	
	<%
			String url = "jdbc:mysql://cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com:3306/usermessages";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "jjc372", "test1234");
			
			String uname = session.getAttribute("uname").toString();
			String str = ("SELECT * FROM " + uname + "inbox");
			PreparedStatement stmt = con.prepareStatement(str);
			ResultSet result = stmt.executeQuery();	
        	
			out.print('<'+"style"+'>'+
					"table, th, td {"+
					    "border: 1px solid black;"+
					"}"+
					'<'+"/style"+'>'+"");
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
				out.print("</tr>");
			}
			out.print("</table>");
			
			url = "jdbc:mysql://cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com:3306/usermessages";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "jjc372", "test1234");
			
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
				out.print("</tr>");
			}
			out.print("</table>");
			
      		con.close();
	%>
</body>
</html>