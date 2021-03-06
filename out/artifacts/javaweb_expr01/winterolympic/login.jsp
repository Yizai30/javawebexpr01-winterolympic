<%--
  Created by IntelliJ IDEA.
  User: Mena
  Date: 2022/4/5
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="description" content="Login - Register Template">
    <meta name="author" content="Lorenzo Angelino aka MrLolok">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="./css/main.css">
<%--    <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>--%>
</head>

<body>
    <div id="container-login">
        <div id="title">
            Welcome to Beijing Winter Olympic!
        </div>

        <form action="LoginServlet" method="post">
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">face</i>
                </div>
                <input id="uid" name="uid" placeholder="Uid" type="text" required class="validate" autocomplete="off">
            </div>

            <div class="clearfix"></div>

            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div>
                <input id="passwd" name="passwd" placeholder="Password" type="password" required class="validate" autocomplete="off">
            </div>

            <div class="remember-me">
                <input type="checkbox">
                <span style="color: #DDD">Remember Me</span>
            </div>

            <input type="submit" value="Log In" onclick="check()" />
        </form>

        <div class="forgot-password">
            <a href="#">Forgot your password?</a>
        </div>
        <div class="privacy">
            <a href="#">Privacy Policy</a>
        </div>

        <div class="register">
            Don't have an account yet?
            <a href="register.jsp"><button id="register-link">Register here</button></a>
        </div>
    </div>

    <script type="text/javascript">
        function check() {
            if(!isText(document.getElementById("uid").value))
            {
                alert("??????????????????3-16??????(????????????,??????,?????????)");
                document.getElementById("uid").focus();
                return false;
            }
            if(!isPassword(document.getElementById("passwd").value))
            {
                alert("???????????????");
                document.getElementById("passwd").focus();
                return false;
            }
            /*???????????????????????????????????????true submit?????????????????????????????????*/
            alert("????????????")
            return true;
        }
        function isText(str)
        {
            var reg=/^[a-zA-Z0-9_]{3,16}$/;   /*?????????????????????*/
            return reg.test(str);     /*????????????*/
        }
        function isPassword(str)
        {
            var reg=/^[a-zA-Z\d_]{3,}$/;   /*?????????????????????*/
            return reg.test(str);     /*????????????*/
        }
    </script>
</body>

</html>
