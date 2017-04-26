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

<form method="post" action="registerUpdate.jsp" onsubmit="return validateEmail();">
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
	</table>
	<input type="submit" value="submit">
	</form>

<script>
function validateEmail() {
    var x =  document.getElementById("email").value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    //var ru = x.indexOf("scarletmail.rutgers.edu")
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length ) {
        alert("Not a valid e-mail address");
        return false;
    }
}
</script>

<br>
Have an account already? <a href="index.jsp">Log in here</a>
</body>
</html>