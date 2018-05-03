<%--
  Created by IntelliJ IDEA.
  User: farukhsaidmuratov
  Date: 4/10/18
  Time: 11:01 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Account</title>
</head>
<header>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" />
    <link rel= "stylesheet" href= "main.css">
    <h1>STUDY<span class="orange">TIME</span>!</h1>
    <nav>
        <ul class="nav navbar-nav">
            <li><a href="login.jsp"><h4><span class="black">Log In</span></h4></a></li>
            <li><a href="create-account.jsp"><h4><span class="black">Create Account</span></h4></a></li>
        </ul>
    </nav>
</header>
<body>
<main>
    <div class="general-form">
    <form action="login.jsp" method="POST">
        <div class="form-group">
            User Name<br/>
            <input type="text" name="User Name"/>
        </div>
        <div class="form-group">
            Password<br/>
            <input type="password" name="Password"/>
        </div>
        <div class="form-group">
            Confirm Password<br/>
            <input type="password" name="Confirm Password"/>
        </div>
        Institution<br/>
        <select name="college">
            <option value="Blank"> </option>
            <option value="WCC">Westchester Community College</option>
        </select><br/>
        <br/>
        <button type="submit" class="btn btn-default" value="register">Create</button>
    </form>
    </div>
</main>
</body>
</html>