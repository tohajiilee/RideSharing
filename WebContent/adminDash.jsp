<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>
<br>
<br>
Create System Support Staff:

<form method="post" action="adminCreateSupport.jsp"> <!-- also send userType = support -->
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="uname"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="password" name="password" ></td>
	</tr>
	<tr>
	<td>Rutgers Email</td><td><input type="text" name="RUemail" ></td>
	</tr>
	<tr>
	<td>Secondary Email</td><td> <input type="text" name="email" id="email"></td>
	</tr>
	<tr>
	<td>Address</td><td><input type="text" name="addr" ></td>
	</tr>
	<tr>
	<td>Phone Number</td><td><input type="text" name="ph#" ></td>
	</tr>
	<tr>
	<td>Usertype</td><td><input type="text" name ="utype" value="support"></td>
	</tr>
	</table>
	<input type="submit" value="Submit">
	</form>
<br>
<br>
Would you like to run an ad query?
<!-- run stats query with button or smth -->
<form method="post" action="runStatQuery.jsp"> 
<input type="submit" value="Run Ad Query">
</form>
<br>
<br>

Would you like to run a ride statistic query?
<!-- run stats query with button or smth -->
<form method="post" action="runRideQuery.jsp"> 
	<select name = dbselect>        
    	<option value="daystats">day stats</option>
        <option value="deststats">destination stats</option>
        <option value="monthstats">month stats</option>
        <option value="originstats">origin stats</option>
        <option value="userstats">user stats</option>
        <option value="yearstats">year stats</option>
	</select>
<input type="submit" value="Run Ride Statistics Query">
</form>
<br>
<br>

<form method="post" action="userTimeout.jsp">
	<table>
	<tr>
	<td>Enter Username to Lockout:</td><td><input type="text" name="uname"></td>
	</tr>
	</table>
	<input type="submit" value="Lockout User">
</form>
<br>
<form method="post" action="userTimein.jsp">
	<table>
	<tr>
	<td>Enter Username to Lockout:</td><td><input type="text" name="uname"></td>
	</tr>
	</table>
	<input type="submit" value="Unlockout User">
</form>
<br>
<br>

</body>
</html>