<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.Course"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
    <title>Home Page</title>
</head>
<header>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" />
    <link rel= "stylesheet" href= "main.css">
    <h1>STUDY<a href="index.jsp" style="color: #fb3f00; text-decoration: none;"><span class="orange">TIME</span></a>!</h1>
    <nav>
        <ul class="nav navbar-nav">
            <li><a href="homepage.jsp"><h4><span class="black">Courses</span></h4></a></li>
            <li><a href="timer.jsp"><h4><span class="black">Timer</span></h4></a></li>
            <li><a href="homepage.jsp"><h4><span class="black">Calendar</span></h4></a></li>
            <li><a href="logout.jsp"><h4><span class="black">Log out</span></h4></a></li>
        </ul>
    </nav>
</header>
<body>
<main>
    <%
        Object userID = session.getAttribute("userID");
        int studentID = (int)userID;

        Object college_obj = session.getAttribute("college");
        String college_name = (String)college_obj;

        ArrayList<Course> courses = new ArrayList<>();
        ArrayList<Integer> courseIDS = new ArrayList<>();
        ArrayList<Integer> profIDS = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://35.188.254.244:3306/studytime","root","T1konder0ga");
            Statement statement = con.createStatement();

            ResultSet resultSetGrade= statement.executeQuery("SELECT * FROM Grades WHERE StudentID = '" + studentID + "'");

            if(resultSetGrade.next()) {
                courseIDS.add(resultSetGrade.getInt("CourseID"));
                profIDS.add(resultSetGrade.getInt("ProfessorID"));
                while(resultSetGrade.next()) {
                    courseIDS.add(resultSetGrade.getInt("CourseID"));
                    profIDS.add(resultSetGrade.getInt("ProfessorID"));
                }
                resultSetGrade.close();

                for(int i = 0; i < courseIDS.size(); ++i) {
                    ResultSet resultSetCourse = statement.executeQuery("SELECT * FROM Courses WHERE CourseID = '" + courseIDS.get(i) + "'");
                    resultSetCourse.next();
                    String courseName = resultSetCourse.getString("Name");
                    Date dateBegin = resultSetCourse.getDate("Begin");
                    Date dateEnd = resultSetCourse.getDate("End");
                    int examNum = resultSetCourse.getInt("ExamNum");
                    resultSetCourse.close();

                    ResultSet resultSetProf= statement.executeQuery("SELECT * FROM Professor WHERE ProfessorID = '" + profIDS.get(i) + "'");
                    resultSetProf.next();
                    String fname = resultSetProf.getString("FirstName");
                    String lname = resultSetProf.getString("LastName");
                    resultSetProf.close();

                    Course addend = new Course(courseName, fname, lname, dateBegin, dateEnd, examNum, college_name);
                    courses.add(addend);
                }
            }
            %>
    <div class="container">
        <h2>Courses</h2>
    <p>Click "Add courses" to add more courses. Click the "See More" button to view more information about your course.</p>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Course Name</th>
            <th>Recommended Hours</th>
            <th>Completed</th>
            <th>See More</th>
        </tr>
        </thead>
        <tbody>
        <% for(int i = 0; i < courses.size(); ++i) { %>
        <tr>
            <td><%=courses.get(i).getCourseName()%></td>
            <td><%=courses.get(i).getRecommendedHours()%></td>
            <td><input type="checkbox" name="coursecompleted"></td>
            <td><button type="submit" class="btn btn-default" value="Seemore">...</button></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <a href="add-courses.jsp">Add courses</a>
    </div>
    <%
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }%>
</main>
</body>
</html>
