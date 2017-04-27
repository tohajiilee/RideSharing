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
			String url = "jdbc:mysql://cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com:3306/userstats";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "jjc372", "test1234");
			
			String uname = session.getAttribute("uname").toString();
			String str = ("SELECT * FROM userstats WHERE username=?");
			
			PreparedStatement stmt = con.prepareStatement(str);
			stmt.setString(1, uname);
			ResultSet result = stmt.executeQuery();	
        
        if (result.next() && !(uname==null || uname=="")) {
        	stmt = con.prepareStatement("SELECT * FROM userstats WHERE username = ?");
        	stmt.setString(1, uname);
        	result = stmt.executeQuery();
        	result.next();
        	int currPoints = result.getInt("points");
        	str = ("Your points: " + currPoints);
            out.println(str);
        } 
        else 
        {
        	stmt = con.prepareStatement("INSERT INTO userstats(username,points) VALUES (?,1)");
        	stmt.setString(1, uname);
        	stmt.executeUpdate();
        	str = ("Your points: 0");
        }

      		con.close();
	%>
<h1>Select Option:</h1>
<input type="button" onclick="location.href='riderDashboard.jsp'"> Rider
<br>
<br>
<input type="button" onclick="location.href='driverDashboard.jsp'"> Driver 
<br>
<br>
<input type="button" onclick="location.href='supportDash.jsp'"> Support 
<br>
<br>
<input type="button" onclick="location.href='adminDash.jsp'"> Admin
</body>
</html>