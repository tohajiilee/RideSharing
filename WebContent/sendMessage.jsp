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
String url = "jdbc:mysql://cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com:3306/usermessages";
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, "jjc372", "test1234");

String recipient = request.getParameter("recipient");
String recipIn = recipient + "inbox";
String message = request.getParameter("message");

String str = ("SHOW TABLES LIKE ?");
PreparedStatement stmt = con.prepareStatement(str);
stmt.setString(1, recipIn);
ResultSet result = stmt.executeQuery();	
String uname = session.getAttribute("uname").toString();

if (result.next()) {
	stmt = con.prepareStatement("INSERT INTO " + recipient + "inbox(sender,message) VALUES (?,?)");
	stmt.setString(1, uname);
	stmt.setString(2, message);
	stmt.executeUpdate();
	
	stmt = con.prepareStatement("INSERT INTO " + uname + "outbox(recipient,message) VALUES (?,?)");
	stmt.setString(1, recipient);
	stmt.setString(2, message);
	stmt.executeUpdate();
    out.println("Message successfully sent. <a href='messenger.jsp'>Click here to go back to your Inbox.</a>");
} 
else{
	out.println("Recipient does not exist. <a href='messenger.jsp'>Click here to go back to your Inbox.</a>");
}


//close the connection
con.close();



%>
</body>
</html>