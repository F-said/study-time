<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create-post.JSP</title>
</head>
<body>
<%
    if(request.getParameter("college").equals("Blank") || request.getParameter("userName").equals("")
            || request.getParameter("password").equals("") || request.getParameter("confpassword").equals("") ) {
        response.sendRedirect("create-account-missingvalues.jsp");
        return;
    }
    else if(request.getParameter("password").equals(request.getParameter("confpassword"))) {
        String user = request.getParameter("userName");
        String password = request.getParameter("password");
        String college = request.getParameter("college");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://35.188.254.244:3306/studytime","root","T1konder0ga");
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT StudentID FROM Students WHERE Username = '" + user + "'");

            int count = 0;
            while(resultSet.next()) {
                count++;
            }

            if(count != 0) {
                response.sendRedirect("create-account-usernametaken.jsp");
                return;
            }
            else {
                statement.executeUpdate("INSERT INTO Students VALUES('" + user + "','" + password + "','" + college + "', NULL)");
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("login.jsp");
    }
    else {
        response.sendRedirect("create-account-wrongpass.jsp");
    }
%>
</body>
</html>
