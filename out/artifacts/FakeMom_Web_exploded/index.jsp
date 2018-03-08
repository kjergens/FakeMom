<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Hello World - JSP tutorial</title>
</head>
<body>
<h1>Hello</h1>

<%
    String p_key = "";
    int rows = 0;

    try {
        // Connect to MySQL db fakemom
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/fakemom";
        Connection con = DriverManager.getConnection(url, "gwc2018", "gwc2018");

        // Create & execute query
        String query = "select id from Users where username like '%katie%' and password like '%1234%'";
        java.sql.Statement stmt = con.createStatement();
        java.sql.ResultSet rs = stmt.executeQuery(query);

        // Evaluate results
        while(rs.next()) {
            p_key = rs.getString("id");
            rows++;
        }

        if(p_key.length() > 0) {
            System.out.println("p_key is " + p_key);
            response.sendRedirect("loggedin.html");
        } else {
            System.out.println("No data.");
        }

    } catch (Exception e) {
        System.out.println(e);
    }
%>
<p>pkey is <%=p_key%></p>
<p><%=rows%> rows</p>


</body>
</html>
