<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.ParseException" %>
<%@ page import="Model.WCCCourseCatalogScraper" %>
<%@ page import="Model.WCCRateProfessorScraper" %>
<%@ page import="Model.Course" %>
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
        if(request.getParameter("CName").equals("") || request.getParameter("begin").equals("") || request.getParameter("end").equals("")
                || request.getParameter("profFname").equals("") || request.getParameter("profLname").equals("")) {
            response.sendRedirect("add-courses-missingvalues.jsp");
            return;
        }
        else {
            String cname = request.getParameter("CName");
            String str_begin = request.getParameter("begin");
            String str_end = request.getParameter("end");
            String fname = request.getParameter("profFname");
            String lname = request.getParameter("profLname");
            int examNum = Integer.parseInt(request.getParameter("examNum"));

            Object college_obj = session.getAttribute("college");
            String college_name = (String)college_obj;

            Object userID = session.getAttribute("userID");
            int studentID = (int)userID;

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            try {
                Date start = sdf.parse(str_begin);
                Date end = sdf.parse(str_end);

                java.sql.Date sqlstart = new java.sql.Date(start.getTime());
                java.sql.Date sqlend = new java.sql.Date(end.getTime());

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://35.188.254.244:3306/studytime","root","T1konder0ga");
                    Statement statement = con.createStatement();

                    ResultSet resultSetCourse = statement.executeQuery("SELECT * FROM Grades, Courses, Professor WHERE " +
                            "Grades.StudentID=" + studentID  +
                            " AND Professor.FirstName='" + fname + "'" +
                            " AND Professor.LastName='" + lname + "'" +
                            " AND Courses.Name='" + cname + "'");

                    int i = 0;
                    while(resultSetCourse.next())
                        i++;
                    if(i != 0) {
                        response.sendRedirect("add-courses-coursealreadyexists.jsp");
                        return;
                    }

                    resultSetCourse.close();

                    WCCCourseCatalogScraper getCreds = new WCCCourseCatalogScraper(cname);
                    WCCRateProfessorScraper getProf = new WCCRateProfessorScraper(fname, lname);
                    Course course = new Course();

                    int creditHours = getCreds.getCreditHours();
                    float difficulty = getProf.getDifficulty();
                    course.setRecommendedHoursEmphasis(difficulty);
                    int recHours = course.calcRecHours(creditHours*2);

                    if(creditHours != -1 && difficulty != -1.0) {
                        ResultSet resultSetCourseCheck = statement.executeQuery("SELECT * FROM Courses WHERE Name = '" + cname + "'" +
                                "AND Begin='" + sqlstart  + "' AND End='"+ sqlend + "' AND ExamNum='" + examNum + "' AND College='" +
                                college_name + "'");

                        i = 0;
                        while(resultSetCourseCheck.next())
                            i++;
                        if(i == 0) {
                            statement.executeUpdate("INSERT INTO Courses VALUES('" + cname + "','" + sqlstart + "','" + sqlend +
                                    "','" + examNum + "','" + getCreds.getCreditHours() + "', NULL,'" + college_name + "')");
                        }

                        resultSetCourseCheck.close();

                        ResultSet resultSetProf = statement.executeQuery("SELECT * FROM Professor WHERE FirstName = '" + fname + "'" +
                                "AND LastName='" + lname  + "' AND College='"+ college_name + "'");

                        i = 0;
                        while(resultSetProf.next())
                            i++;
                        if(i == 0) {
                            statement.executeUpdate("INSERT INTO Professor VALUES('" + fname + "','" + lname + "', NULL,'" + college_name + "')");
                        }

                        resultSetProf.close();

                        ResultSet resultSetProfID = statement.executeQuery("SELECT * FROM Professor WHERE FirstName = '" + fname + "'" +
                                "AND LastName='" + lname  + "' AND College='"+ college_name + "'");
                        resultSetProfID.next();
                        int profID = resultSetProfID.getInt("ProfessorID");
                        resultSetProfID.close();

                        ResultSet resultSetCourseID = statement.executeQuery("SELECT * FROM Courses WHERE Name = '" + cname + "'" +
                                "AND Begin='" + sqlstart  + "' AND End='"+ sqlend + "' AND ExamNum='" + examNum + "' AND College='" +
                                college_name + "'");
                        resultSetCourseID.next();
                        int courseID = resultSetCourseID.getInt("CourseID");
                        resultSetCourseID.close();

                        statement.executeUpdate("INSERT INTO Grades VALUES(NULL, "+ courseID +","+ studentID +","+ profID +","+ recHours +")");

                        response.sendRedirect("homepage.jsp");
                        return;
                    }
                    else {
                        response.sendRedirect("add-courses-courseDoesNotExist.jsp");
                        return;
                    }
                }
                catch (Exception ex) {
                    ex.printStackTrace();
                }

            } catch(ParseException p) {
                p.getCause();
            }
        }
    %>
</body>
</html>
