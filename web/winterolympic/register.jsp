<%--
  Created by IntelliJ IDEA.
  User: Mena
  Date: 2022/4/5
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <meta name="description" content="Login - Register Template">
    <meta name="author" content="Lorenzo Angelino aka MrLolok">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
<div id="container-register">
    <div id="title">
        <i class="material-icons lock">lock</i> Register
    </div>

    <form action="RegisterServlet" method="post">
        <div class="input">
            <div class="input-addon">
                <i class="material-icons">face</i>
            </div>
            <input name="uid" placeholder="Uid" type="text" required class="validate" autocomplete="off">
        </div>

        <div class="clearfix"></div>

        <div class="input">
            <div class="input-addon">
                <i class="material-icons">face</i>
            </div>
            <input name="name" placeholder="Name" type="text" required class="validate" autocomplete="off">
        </div>

        <div class="clearfix"></div>

        <div class="input" style="height: 28px">
            <div class="input-addon">
                <i class="material-icons">face</i>
            </div>
            <input name="gender" type="radio" value="1" required class="validate">男
            <input name="gender" type="radio" value="2" required class="validate">女
        </div>

        <div class="clearfix"></div>

        <div class="input">
            <div class="input-addon">
                <i class="material-icons">face</i>
            </div>
            <input name="age" placeholder="Age" type="text" required class="validate" autocomplete="off">
        </div>

        <div class="clearfix"></div>

        <div class="input">
            <div class="input-addon">
                <i class="material-icons">vpn_key</i>
            </div>
            <input name="passwd" placeholder="Password" type="password" required class="validate" autocomplete="off">
        </div>

        <div class="remember-me">
            <input type="checkbox">
            <span style="color: #DDD">I accept Terms of Service</span>
        </div>

        <input type="submit" value="Register" />
    </form>

    <div class="privacy">
        <a href="#">Privacy Policy</a>
    </div>

    <div class="register">
        Do you already have an account?
        <a href="login.jsp"><button id="register-link">Log In here</button></a>
    </div>
</div>
</body>
