<%--
  Created by IntelliJ IDEA.
  User: farukhsaidmuratov
  Date: 5/7/18
  Time: 4:46 AM
  To change this template use File | Settings | File Templates.
--%>
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
            <li><a href="calendar.jsp"><h4><span class="black">Calendar</span></h4></a></li>
            <li><a href="logout.jsp"><h4><span class="black">Log out</span></h4></a></li>
        </ul>
    </nav>
</header>
<body>
<main>
<iframe src="https://calendar.google.com/calendar/embed?src=h6nhusl67tllh5p3vmmu66lurk%40group.calendar.google.com&ctz=America%2FNew_York"
        style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>
</main>
</body>
</html>

