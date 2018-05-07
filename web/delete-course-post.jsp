<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete-courses-post.jsp</title>
</head>
<body>
<main>
    <div class="loader"></div>
</main>
<%
    try {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://35.188.254.244:3306/studytime", "root", "T1konder0ga");
            Statement statement = con.createStatement();

            Object studentIDObj = session.getAttribute("userID");
            int studentID = (int) studentIDObj;

            Object profIDObj = session.getAttribute("profID");
            int profID = (int) profIDObj;

            Object courseIDObj = session.getAttribute("courseID");
            int courseID = (int) courseIDObj;

            statement.executeUpdate("DELETE FROM Grades WHERE StudentID=" + studentID + " AND ProfessorID=" + profID + " AND CourseID=" + courseID);

            response.sendRedirect("homepage.jsp");
            return;
        } catch (ClassNotFoundException p) {
            p.getCause();
        }
    } catch (Exception ex) {
        ex.getStackTrace();
    }
%>
</body>
</html>
