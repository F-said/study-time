<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login-post.jsp</title>
</head>
<body>
<%
    if(request.getParameter("userName").equals("") || request.getParameter("Password").equals("")) {
        response.sendRedirect("login-missingvalues.jsp");
        return;
    }
    else {
        String user = request.getParameter("userName");
        String password = request.getParameter("Password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://35.188.254.244:3306/studytime","root","T1konder0ga");
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT * FROM Students WHERE Username = '" + user + "'");

            if(resultSet.next()) {
                if(resultSet.getObject("Password").equals(password)) {
                    session.setAttribute("userID", resultSet.getInt("StudentID"));
                    session.setAttribute("college", resultSet.getString("College"));

                    response.sendRedirect("homepage.jsp");
                    return;
                }
                else {
                    response.sendRedirect("login-incorrect.jsp");
                    return;
                }
            }
            else {
                response.sendRedirect("login-notYetMade.jsp");
                return;
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>
