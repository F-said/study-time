<html>
<head>
    <title>add-courses</title>
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
    <div class="create-form">
        <h2>Course Add</h2>
        <p>Enter course info as seen on syllabus.</p>
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
                Professor Last Name<br/>
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
        <span class="red">Course, or Professor does not exist in your college. Please be sure to input names as seen on syllabus.</span>
    </div>
</main>
</body>
</html>
