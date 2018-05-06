<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <li><a href="Logout.jsp"><h4><span class="black">Log out</span></h4></a></li>
        </ul>
    </nav>
</header>
<body>
<main>
    <div class="container">
        <h2>Courses</h2>
        <p>Click the "+" icon to add more courses. Enter course name as it appears on your syllabus.</p>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Course Name</th>
                <th>Recorded Hours</th>
                <th>Recommended Hours</th>
                <th>Completed</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <div contenteditable="true">
                <td>CS101</td>
                <td>0</td>
                </div>
                <td>6</td>
                <td>checkboxhere</td>
            </tr>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
