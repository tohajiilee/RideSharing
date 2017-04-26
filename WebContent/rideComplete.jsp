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
        
        	Calendar cal = Calendar.getInstance();
        	int currMonth = cal.get(Calendar.MONTH) + 1;
        	stmt = con.prepareStatement("UPDATE monthstats SET points  = points + 1 WHERE monthid = ?");
        	stmt.setInt(1, currMonth);
        	stmt.executeUpdate();
        	
        	int currYear = cal.get(Calendar.YEAR);
        	stmt = con.prepareStatement("SELECT * FROM yearstats WHERE yearid=?");
        	stmt.setInt(1, currYear);
			result = stmt.executeQuery();
			
		if (result.next() && !(currYear==0)) {
	        stmt = con.prepareStatement("UPDATE yearstats SET points  = points + 1 WHERE yearid = ?");
	        stmt.setInt(1, currYear);
	        stmt.executeUpdate();
	    } 
	    else 
	    {
	       	stmt = con.prepareStatement("INSERT INTO yearstats(yearid,points) VALUES (?,1)");
	        stmt.setInt(1, currYear);
	        stmt.executeUpdate();
	    }
		
			int dayOfMonth = cal.get(Calendar.DAY_OF_MONTH);
			String dayStr = (currMonth + "-" + dayOfMonth + "-" + currYear);
			stmt = con.prepareStatement("SELECT * FROM daystats WHERE dayid=?");
        	stmt.setString(1, dayStr);
			result = stmt.executeQuery();
			
			if (result.next()) {
		        stmt = con.prepareStatement("UPDATE daystats SET points  = points + 1 WHERE dayid = ?");
		        stmt.setString(1, dayStr);
		        stmt.executeUpdate();
		    } 
		    else 
		    {
		       	stmt = con.prepareStatement("INSERT INTO daystats(dayid,points) VALUES (?,1)");
		        stmt.setString(1, dayStr);
		        stmt.executeUpdate();
		    }
			
      		con.close();
	%>
</body>
</html>