<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add-courses.jsp</title>
</head>
<body>
<main>
    <div class="loader"></div>
</main>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://35.188.254.244:3306/studytime","root","T1konder0ga");
        Statement statement = con.createStatement();

        Object studentIDObj = session.getAttribute("userID");
        int studentID = (int) studentIDObj;

        Object profIDObj = session.getAttribute("profID");
        int profID = (int) profIDObj;

        Object courseIDObj = session.getAttribute("courseID");
        int courseID = (int) courseIDObj;

        ResultSet resultSetGrade = statement.executeQuery("SELECT * FROM Grades WHERE CourseID = " + courseID  +
                " AND StudentID=" + studentID  + " AND ProfessorID="+ profID);
        resultSetGrade.next();
        String setGrade = resultSetGrade.getString("Grade");
        resultSetGrade.close();

        if(setGrade == null) {
            String grade = request.getParameter("grade");
            statement.executeUpdate("UPDATE Grades SET Grade='" + grade + "' WHERE CourseID = " + courseID +
                    " AND StudentID=" + studentID  + " AND ProfessorID="+ profID);
            response.sendRedirect("homepage.jsp");
            return;
        }
        else {
            response.sendRedirect("complete-course-alreadycompleted.jsp");
            return;
        }
    } catch(Exception c) {
        c.getCause();
    }
%>
</body>
</html>
