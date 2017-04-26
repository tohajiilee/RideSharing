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
String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
Class.forName("com.mysql.jdbc.Driver");

//Create a connection to your DB
Connection con = DriverManager.getConnection(url, "asingh", "test1234");

//Create a SQL statement

String uname = request.getParameter("uname");
String pass = request.getParameter("password");

String str = ("SELECT * FROM Accounts WHERE username=?");
PreparedStatement stmt = con.prepareStatement(str);
stmt.setString(1, uname);

ResultSet result = stmt.executeQuery();	

if (result.next()) {
    out.println("That is not allowed: <a href='register.jsp'> Try again here </a>");
} 

else{
	stmt = con.prepareStatement("INSERT INTO Accounts(username,password) VALUES (?,?)");
	stmt.setString(1, uname);
	stmt.setString(2, pass);
	int newAcc = stmt.executeUpdate();

	if(newAcc > 0 && !(pass==null || pass=="") ){
		con.close();
		url = "jdbc:mysql://cs336instance.cpebridwlrpn.us-west-2.rds.amazonaws.com:3306/userstats";
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, "jjc372", "test1234");
		stmt = con.prepareStatement("INSERT INTO userstats(username,points) VALUES (?,0)");
    	stmt.setString(1, uname);
    	stmt.executeUpdate();
		out.println("Registration successful: <a href='index.jsp'> Log in here </a>");
	}	
	else{
	    out.println("Registration unsuccessful: <a href='register.jsp'> Try again here </a>");
    
}
}


//close the connection
con.close();



%>
</body>
</html>