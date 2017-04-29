<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try{
String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, "asingh", "test1234");
		
	
		String delCarNo=request.getParameter("delCarNo");
		String driverName=(String)session.getAttribute("uname");
		
		String del= "DELETE FROM Car WHERE carNo=? AND driverName=?"; 
		
		PreparedStatement ps = con.prepareStatement(del);

		ps.setInt(1, Integer.parseInt(delCarNo));
		ps.setString(2, driverName);

		ps.executeUpdate();
		//close the connection
		con.close();
		
		 response.sendRedirect("driverDashboard.jsp");
		}
		catch(Exception e){
			out.print("Car add failed, try again");
		}

%>
</body>
</html>