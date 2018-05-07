<html>
<head>
    <title>complete-courses</title>
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
    <div class="submit-grade-form-form">
        <h2>Thank you for using our website.</h2>
        <p>If you prefer, please enter your final grade so that we may refine the calculation of the recommended amount
            of hours a student should study to achieve the best grade.</p>
        <form action="complete-courses-post.jsp" method="Post">
            <div class="form-group">
                Final Grade<br/>
                <select name="grade">
                    <option value="NA" name="grade">Prefer not to answer</option>
                    <option value="A+" name="grade">A+</option>
                    <option value="A" name="grade">A</option>
                    <option value="A-" name="grade">A-</option>
                    <option value="B+" name="grade">B+</option>
                    <option value="B" name="grade">B</option>
                    <option value="B-" name="grade">B-</option>
                    <option value="C+" name="grade">C+</option>
                    <option value="C" name="grade">C</option>
                    <option value="C-" name="grade">C-</option>
                    <option value="D+" name="grade">D+</option>
                    <option value="D" name="grade">D</option>
                    <option value="D-" name="grade">D-</option>
                    <option value="F" name="grade">F</option>
                </select><br/>
                <button type="submit" class="btn btn-default">Submit</button>
            </div>
        </form>
    </div>
</main>
</body>
</html>
