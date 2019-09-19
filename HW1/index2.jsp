<%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection example</h1>
	<%
//String db = request.getParameter("cs157a"); //or root
//String user = cs157a; // assumes database name is the same as username
try {
	java.sql.Connection con;
	Class.forName("org.gjt.mm.mysql.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&useSSL=false","root","");
	out.println ("cs157a "+ "database successfully opened.");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from emp");
	while(rs.next())
	out.println("<br>" + "Id: " + rs.getInt(1)+" "+ "Name: " +rs.getString(2)+" " + "Age: " +rs.getInt(3)); 
	
	con.close();

} catch(SQLException e) {
	out.println("SQLException caught: " +e.getMessage()); 
	}
/* finally {
} */

%>
</body>

</html>