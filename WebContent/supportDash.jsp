<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Support Dashboard</title>
</head>
<h1>Support Dashboard</h1>
<body>
<div style="float: right">
		<form method="post" action="logout.jsp">
			<input type="submit" value="Logout" />
		</form>
	</div>
<br>
<br>

<!-- can you target a specific function within the jsp file?-->

<!-- reset end-user password - form to change pw 
new form. simply give random assortment of alphanumerics
-->
<form method="post" action="changePassword.jsp"> 
	<table>
	<tr>
	<td>Change User Password:</td><td><input type="text" name="uname"></td>
	</tr>
	</table>
	<input type="submit" value="Change Password">
</form>
<br>
<br>

<!-- lock out end-user by setting Boolean in userTable. true is ok & is default. false is misbehave
Also will support functionality to un-lockout end-users
This means that this user will be unable to login when that username/pw is input-->
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
	<td>Enter Username to Unlockout:</td><td><input type="text" name="uname"></td>
	</tr>
	</table>
	<input type="submit" value="Unlockout User">
</form>
<br>
<br>

<!-- add new ads to be displayed make 2 kinds of ad – 
rng show ad 1 or 2, increment count
Something like import jpeg to fit into a pre-designed div 
increment ad in adTable everytime it is accessed with a trigger or something-->

<FORM ENCTYPE="multipart/form-data" ACTION="uploadFile.jsp" METHOD=POST>
<br>
<br>
<br>
<table border="0" >
      <tr><td colspan="2"> <B>Upload an Image File</B></td></tr>
      <tr>
            <td><b>Choose the file To Upload:</b></td>
            <td><INPUT NAME="file" TYPE="file"></td>
      </tr>
      <!-- tr><td>Enter ad Name (e.g. "n7.png" would be entered as "n7"):</td><td><input type="text" name="adname"></td></tr-->
      <tr>
            <td colspan="2" ><input type="submit" value="Send File"></td>
      </tr>
      </table>

</form>

<br>
<br>

<!-- button for display statistical query -->
<form method="post" action="runStatQuery.jsp"> 
<table>
	<tr><td>Run an Ad Query:</td></tr>
</table>
<input type="submit" value="Run Ad Query">
</form>
<br>
<br>

</body>
</html>
