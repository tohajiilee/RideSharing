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

<a href='messenger.jsp'>Return to your Inbox</a>
<br><br>
	
	<%
			String url = "jdbc:mysql://cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com:3306/usermessages";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "jjc372", "test1234");
			
			String uname = session.getAttribute("uname").toString();
        	
			String deleteName = request.getParameter("deleteName");
			String deleteMsg = request.getParameter("deleteMsg");
			String type = request.getParameter("deleteType");
			
			if(type.equals("Out")){
				uname = uname + "outbox";
				String str = ("DELETE FROM "+ uname +" WHERE recipient=? AND message=?");
				PreparedStatement stmt = con.prepareStatement(str);
				stmt.setString(1, deleteName);
				stmt.setString(2, deleteMsg);
				stmt.executeUpdate();
			}
			else if(type.equals("In")){
				uname = uname + "inbox";
				String str = ("DELETE FROM "+ uname +" WHERE sender=? AND message=?");
				PreparedStatement stmt = con.prepareStatement(str);
				stmt.setString(1, deleteName);
				stmt.setString(2, deleteMsg);
				stmt.executeUpdate();
			}
			out.print("Deletion successful.");
      		con.close();
	%>
</body>
</html>