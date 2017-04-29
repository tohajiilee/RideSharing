<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
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
			Statement stmt = con.createStatement();

			String uname = request.getParameter("uname");
			String pass = request.getParameter("password");

			String str = ("SELECT username,password,userType,userBehavior FROM Accounts WHERE username='" + uname + "' and password='" + pass + "'" );

			boolean userBehavior = true;
			String userType = "";
			
			ResultSet result = stmt.executeQuery(str);
        if (result.next() && !(uname==null || uname=="" || pass==null || pass=="")) {
        	userType = result.getString(3);
			userBehavior = result.getBoolean(4);
			if(userBehavior == true && userType.equals("admin")) {
		    	session.setAttribute("uname", uname);
		        response.sendRedirect("adminDash.jsp");
			}
			else if(userBehavior == true && userType.equals("support")) {
		    	session.setAttribute("uname", uname);
		        response.sendRedirect("supportDash.jsp");
			}
			else if(userBehavior == true && userType.equals("enduser")) {
		    	session.setAttribute("uname", uname);
		        response.sendRedirect("dashboard.jsp");
			}
        else{			
        
            session.invalidate();
            request.setAttribute("loginError", "Invalid username or password");
            out.print(userBehavior);
            out.print(userType);
            out.print("This user has an incorrect username/password or has misbehaved and is locked out from our service.");

        }
        }
        
      //Close the connection.
      		con.close();
    
	%>

</body>
</html>
