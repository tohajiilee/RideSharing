<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Registration
<br>
<br>
Enter information below:

<form method="post" action="registerUpdate.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="uname"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="password" name="password"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
Have an account already? <a href="index.jsp">Log in here</a>
</body>
</html>