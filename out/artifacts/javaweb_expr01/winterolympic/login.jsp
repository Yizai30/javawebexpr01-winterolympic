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
    <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
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
                alert("账号必须填写3-16位的(英文字符,数字,下划线)");
                document.getElementById("uid").focus();
                return false;
            }
            if(!isPassword(document.getElementById("passwd").value))
            {
                alert("密码不规范");
                document.getElementById("passwd").focus();
                return false;
            }
            /*运行到这里说明验证通过返回true submit提交按钮起作用提交表单*/
            alert("登录成功")
            return true;
        }
        function isText(str)
        {
            var reg=/^[a-zA-Z0-9_]{3,16}$/;   /*定义验证表达式*/
            return reg.test(str);     /*进行验证*/
        }
        function isPassword(str)
        {
            var reg=/^[a-zA-Z\d_]{3,}$/;   /*定义验证表达式*/
            return reg.test(str);     /*进行验证*/
        }
    </script>
</body>

</html>
