<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Support Dashboard</title>
</head>
<body>
<br>
<br>

<!-- can you target a specific function within the jsp file?-->

<!-- reset end-user password - form to change pw 
new form. simply give random assortment of alphanumerics
-->
<form method="post" action="changePassword.jsp"> 
	<table>
	<tr>
	<td>Change User Password:</td><td><input type="text" name="username"></td>
	</tr>
	</table>
	<input type="submit" value="Change Password">
</form>
<br>
<br>

<!-- lock out end-user by setting Boolean in userTable. 1 is ok default. 0 is misbehave-->
<form method="post" action="userTimeout.jsp">
	<table>
	<tr>
	<td>Lockout User:</td><td><input type="text" name="username"></td>
	</tr>
	</table>
	<input type="submit" value="Lockout User">
</form>
<br>
<br>

<!-- add new ads to be displayed make 2 kinds of ad – 
rng show ad 1 or 2, increment count
Something like import jpeg to fit into a pre-designed div 
increment ad in adTable everytime it is accessed with a trigger or something-->
<form method="post" action="addAds.jsp">
	<table>
	<tr>
	<td>Add an Ad:</td><td><input type="text" name="username"></td>
	</tr>
	</table>
	<input type="submit" value="Add an Ad">
</form>
<br>
<br>

<!-- button for display statisical query -->
<form method="post" action="RunStatQuery.jsp"> 
	<table>
	<tr>
	<td>Lockout User:</td><td><input type="text" name="username"></td>
	</tr>
	</table>
	<input type="submit" value="Run and Display Query">
</form>
<br>
<br>

</body>
</html>