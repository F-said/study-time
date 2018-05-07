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
    //If User Name field or Password field is blank, redirect user to indicate that fields are missing, and return
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

            // If the resultSet of Students contains values continue.
            if(resultSet.next()) {
                // If password is correct, set the attributes of the session to the user information.
                // This user information will be used in the homepage. Send user to the homepage.
                if(resultSet.getObject("Password").equals(password)) {
                    session.setAttribute("userID", resultSet.getInt("StudentID"));
                    session.setAttribute("college", resultSet.getString("College"));

                    response.sendRedirect("homepage.jsp");
                    return;
                }
                // If password is incorrect, redirect user to indicate incorrect password, and return
                else {
                    response.sendRedirect("login-incorrect.jsp");
                    return;
                }
            }
            // If the resultSet of Students is empty, that means that the user has either entered both Username and
            // password incorrectly, or they have not made an account yet.
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
