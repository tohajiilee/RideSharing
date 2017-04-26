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
			//Create a connection string
			String url = "jdbc:mysql://cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com:3306/userstats";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "jjc372", "test1234");
			
			//Create a SQL statement

			String uname = session.getAttribute("uname").toString();

			String str = ("SELECT * FROM userstats WHERE username=?");
			PreparedStatement stmt = con.prepareStatement(str);
			stmt.setString(1, uname);
			ResultSet result = stmt.executeQuery();	
        
        
        if (result.next() && !(uname==null || uname=="")) {
        	stmt = con.prepareStatement("UPDATE userstats SET points  = points + 1 WHERE username = ?");
        	stmt.setString(1, uname);
        	stmt.executeUpdate();
            out.println("Found on board");
        } 
        else 
        {
        	stmt = con.prepareStatement("INSERT INTO userstats(username,points) VALUES (?,1)");
        	stmt.setString(1, uname);
        	stmt.executeUpdate();
        	out.println("Made new account");
        }
        
      //Close the connection.
      		con.close();
	%>
</body>
</html>