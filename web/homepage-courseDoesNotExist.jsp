<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.Course"%>
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
    <span class="red">Course, or Professor does not exist in your college. Please be sure to input names as seen on syllabus.</span>
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
            <%
                Object userID = session.getAttribute("userID");
                int studentID = (int)userID;

                ArrayList<Course> courses = new ArrayList<>();
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://35.188.254.244:3306/studytime","root","T1konder0ga");
                    Statement statement = con.createStatement();

                    ResultSet resultSetGrade= statement.executeQuery("SELECT * FROM Grades WHERE StudentID = '" + studentID + "'");

                    int count = 0;
                    while(resultSetGrade.next()) {
                        count++;
                    }

                    if(count != 0) {
                        int courseID = resultSetGrade.getInt("CourseID");
                        int profID = resultSetGrade.getInt("ProfessorID");

                        ResultSet resultSetCourse = statement.executeQuery("SELECT * FROM Courses WHERE CourseID = '" + courseID + "'");
                        ResultSet resultSetProf= statement.executeQuery("SELECT * FROM Professor WHERE ProfessorID = '" + profID + "'");

                        while(resultSetCourse.next()) {
                            Course addend = new Course(resultSetCourse.getString("Name"), resultSetProf.getString("FirstName"),
                                    resultSetProf.getString("LastName"), resultSetCourse.getDate("Begin"), resultSetCourse.getDate("End"),
                                    resultSetCourse.getInt("ExamNum"), resultSetCourse.getString("College"));
                            courses.add(addend);
                        }
                    }
                }
                catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>
            <%
                for(int i = 0; i < courses.size(); ++i) {%>
            <tr>
                <td><%courses.get(i).getCourseName();%></td>
                <td><%courses.get(i).getRecommendedHours();%></td>
                <td><input type="checkbox" name="coursecompleted"></td>
                <td><button type="submit" class="btn btn-default" value="Seemore">...</button></td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <form action="add-courses-post.jsp" method="Post">
            <div class="form-group">
                Course Name<br/>
                <input type="text" name="CName"/>
            </div>
            <div class="form-group">
                Begin Date<br/>
                <input type="date" name="begin"/>
            </div>
            <div class="form-group">
                End Date<br/>
                <input type="date" name="end"/>
            </div>
            <div class="form-group">
                Professor First Name<br/>
                <input type="text" name="profFname"/>
            </div>
            <div class="form-group">
                Professor First Name<br/>
                <input type="text" name="profLname"/>
            </div>
            <div class="form-group">
                How many exams?<br/>
                <select name="examNum">
                    <option value="0" name="examNum">0</option>
                    <option value="1" name="examNum">1</option>
                    <option value="2" name="examNum">2</option>
                    <option value="3" name="examNum">3</option>
                    <option value="4" name="examNum">4</option>
                    <option value="5" name="examNum">5</option>
                    <option value="6" name="examNum">6</option>
                </select><br/>
            </div>
            <button type="submit" class="btn btn-default">Create</button>
        </form>
    </div>
</main>
</body>
</html>
