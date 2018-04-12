<%--
  Created by IntelliJ IDEA.
  User: farukhsaidmuratov
  Date: 4/8/18
  Time: 11:41 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log In/Create Account</title>
</head>
<header>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" />
    <link rel= "stylesheet" href= "main.css">
    <h1>STUDY<span class="orange">TIME</span>!</h1>
    <nav>
        <ul class="nav navbar-nav">
            <li><a href="login.jsp"><h4>Log In</h4></a></li>
            <li><a href="create-account.jsp"><h4>Create Account</h4></a></li>
        </ul>
    </nav>
</header>
<body>
<main>
    <form action="login.jsp">
        <div class="form-group">
            User Name<br/>
            <input type="text" name="User Name"/>
        </div>
        <div class="form-group">
            Password<br/>
            <input type="text" name="Password"/>
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
        <a href="create-account.jsp">Forgot Password?</a>
    </form>
</main>
</body>
</html>
