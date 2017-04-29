<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
      String saveFile = "";
	  String saveFileFull = "";
      String contentType = request.getContentType();
      if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1, contentType.length());
            int pos;
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
            

            
//             saveFileFull = "C:/Users/eric.GALLANT/Documents/spring17/cs336/WebContent/images/" + saveFile;
            saveFileFull = saveFile;

            //Goes to local workspace but not local project directory.. 
            //Example: C:\Users\eric.GALLANT\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\RideSharing\images\filename.file
            String relativeWebPath = "/images/";
            String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
            File ff = new File(absoluteDiskPath, saveFileFull);
			out.print(absoluteDiskPath + saveFileFull +" added");
//             getServletContext().getRealPath("/RideSharing/WebContent/images/");
//             ServletContext context = request.getServletContext();
            
//            File ff = new File(saveFileFull);

        	//Create a connection string
        	String url = "jdbc:mysql://cs336db.cqgstqm2na1g.us-east-1.rds.amazonaws.com:3306/Users";
        	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
        	Class.forName("com.mysql.jdbc.Driver");

        	//Create a connection to your DB
        	Connection con = DriverManager.getConnection(url, "asingh", "test1234");
        	
			String[] tokens = saveFile.split("\\.(?=[^\\.]+$)");
			Arrays.toString(tokens);
			String tokenPrefix = tokens[0];
			out.print(tokenPrefix +" added");
			
         	String str = "INSERT INTO adTable(adName) VALUES (?)";
         	PreparedStatement stmt = con.prepareStatement(str);
         	
         	stmt.setString(1,tokenPrefix);
         	out.print(stmt.toString());
        	stmt.execute();	
         	
            FileOutputStream fileOut = new FileOutputStream(ff);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
            fileOut.close();
            
%><br>

<table>
      <tr>
            <td><b>Uploaded file. Name: </b>
            <%
                  out.println(saveFile);
                  }
            %>
            </td>
      </tr>
</table>