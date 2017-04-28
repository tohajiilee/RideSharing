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
String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/";
//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
Class.forName("com.mysql.jdbc.Driver");

//Create a connection to your DB
Connection con = DriverManager.getConnection(url, "asingh", "test1234");

//Create a SQL statement

String uname = request.getParameter("uname");
String pass = request.getParameter("password");
String ruemail = request.getParameter("RUemail");
String email = request.getParameter("email");
String addr = request.getParameter("addr");
String phonenum = request.getParameter("ph#");

String str = ("SELECT * FROM Users.Accounts WHERE username=?");
PreparedStatement stmt = con.prepareStatement(str);
stmt.setString(1, uname);

ResultSet result = stmt.executeQuery();	

if (result.next()) {
    out.println("That is not allowed: <a href='register.jsp'> Try again here </a>");
} 

else{
	stmt = con.prepareStatement("INSERT INTO Users.Accounts(username,password,ruEmail,secEmail,address,phonenum) VALUES (?,?,?,?,?,?)");
	stmt.setString(1, uname);
	stmt.setString(2, pass);
	stmt.setString(3, ruemail);
	stmt.setString(4, email);
	stmt.setString(5, addr);
	stmt.setString(6, phonenum);
	int newAcc = stmt.executeUpdate();

	if(newAcc > 0 && !(pass==null || pass=="") ){
		out.println("Registration successful: <a href='index.jsp'> Log in here </a>");
		stmt = con.prepareStatement("INSERT INTO Stats.usermonthstats(username, month, points) VALUES (?,?,?)");
		stmt.setString(1, uname);
		Calendar cal = Calendar.getInstance();
		int currMonth = cal.get(Calendar.MONTH) + 1;
		int currYear = cal.get(Calendar.YEAR);
		String monthStr = (currMonth + "-" + currYear);
		stmt.setString(2, monthStr);
		stmt.setInt(3, 0);
		stmt.executeUpdate();
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