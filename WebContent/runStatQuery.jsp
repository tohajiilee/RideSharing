<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ad Statistics</title>
</head>
<body>
<%

//Create a connection string
String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
Class.forName("com.mysql.jdbc.Driver");

//Create a connection to your DB
Connection con = DriverManager.getConnection(url, "asingh", "test1234");

//Create a SQL statement



String str = ("SELECT * FROM adTable ORDER BY adShown DESC");

PreparedStatement stmt = con.prepareStatement(str);
ResultSet result = stmt.executeQuery();	

out.print('<'+"style"+'>'+
		"table, th, td {"+
		    "border: 1px solid black;"+
		"}"+
		'<'+"/style"+'>'+"");
out.print("<h1>Ad Statistics</h1>");

//Make an HTML table to show the results in:
out.print("<table>");

//make a row
out.print("<tr>");
//make a column
out.print("<td>");
//print out column header
out.print("Ad name");
out.print("</td>");
//make a column
out.print("<td>");
out.print("Number times each ad has been displayed");
out.print("</td>");

while (result.next()) {
	//make a row
	out.print("<tr>");
	//make a column
	out.print("<td>");
	//Print out current 
	out.print(result.getString("adName"));
	out.print("</td>");
	out.print("<td>");
	//Print out current 
	out.print(result.getString("adShown"));
	out.print("</td>");
	out.print("</tr>");
}
out.print("</table>");


//close the connection
con.close();



%>
</body>
</html>