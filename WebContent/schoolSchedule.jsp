<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<a href="https://en.wikipedia.org/wiki/Frostbite_(game_engine)"><img src="<%=request.getContextPath()%>/images/n7.png" width="550" height="200"/></a>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		String dburl="jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
		Connection con1 = DriverManager.getConnection(dburl, "asingh", "test1234");
		String adIncrement = ("UPDATE adTable SET adShown = adShown + 1 WHERE adName = 'ad1'");
		PreparedStatement ad = con1.prepareStatement(adIncrement);
		ad.executeUpdate();
	%>

<script type="text/javascript">
function createTable()
{
    var num_rows = document.getElementById('rows').value;
    var theader = '<table border="1">\n';
    
    var tbody = '';
    
    tbody += '<tr><td>Time for</td>';
    tbody += '<td>Monday</td>';
    tbody += '<td>Tuesday</td>';
    tbody += '<td>Wednesday</td>';
    tbody += '<td>Thursday</td>';
    tbody += '<td>Friday</td>';
    tbody += '<td>Saturday</td>';
    tbody += '<td>Sunday</td>';
    tbody += '</tr>\n';

    for( var i=0; i<num_rows;i++)
    {
            tbody += '<tr>';
            tbody += '<td>';
            tbody += 'Class ' + i;
            tbody += '</td>'
            tbody+= '<td><input type="text" name="time'+ i +'" size="5"></td>';
            tbody+= '<td><input type="text" name="time'+ i +'" size="5"></td>';
            tbody+= '<td><input type="text" name="time'+ i +'" size="5"></td>';
            tbody+= '<td><input type="text" name="time'+ i +'" size="5"></td>';
            tbody+= '<td><input type="text" name="time'+ i +'" size="5"></td>';
            tbody+= '<td><input type="text" name="time'+ i +'" size="5"></td>';
            tbody+= '<td><input type="text" name="time'+ i +'" size="5"></td>';            

            tbody += '</tr>\n';
    }
    
    var tfooter = '</table>';
    document.getElementById('wrapper').innerHTML = theader + tbody + tfooter;
}
</script>
</head>

<body>
<form name="tablegen">
<label># of classes <input type="text" name="rows" id="rows"/></label><br />
<input name="generate" type="button" value="Build Schedule" onclick='createTable();'/>
</form>
<div id="wrapper"></div>

</body>
</html>