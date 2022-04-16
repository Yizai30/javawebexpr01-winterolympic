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
    <link rel="stylesheet" href="./css/main.css">
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
            <input id="uid" name="uid" placeholder="Uid" type="text" required class="validate" autocomplete="off">
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
            <input id="age" name="age" placeholder="Age" type="text" required class="validate" autocomplete="off">
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
            <span style="color: #DDD">I accept Terms of Service</span>
        </div>

        <input type="submit" value="Register" onclick="check_register()"/>
    </form>

    <div class="privacy">
        <a href="#">Privacy Policy</a>
    </div>

    <div class="register">
        Do you already have an account?
        <a href="login.jsp"><button id="register-link">Log In here</button></a>
    </div>
</div>
<script type="text/javascript">
    function check_register() {
        if(!isText(document.getElementById("uid").value))
        {
            alert("账号必须填写3-16位的(英文字符,数字,下划线)");
            document.getElementById("uid").focus();
            return false;
        }
        if (!isAge(document.getElementById("age").value)) {
            alert("年龄必须在18岁到150岁之间");
            document.getElementById("age").focus();
            return false;
        }
        if(!isPassword(document.getElementById("passwd").value))
        {
            alert("密码必须由大于等于3位的字母、数字、下划线组成");
            document.getElementById("passwd").focus();
            return false;
        }
        /*运行到这里说明验证通过返回true submit提交按钮起作用提交表单*/
        alert("注册成功")
        return true;
    }
    function isText(str)
    {
        var reg=/^[a-zA-Z0-9_]{3,16}$/;   /*定义验证表达式*/
        return reg.test(str);     /*进行验证*/
    }
    function isAge(str) {
        var reg=/^(1[8-9]|[2-9][0-9]|1[0-4][0-9]|150)$/;   /* 定义验证表达式 */
        return reg.test(str);       /* 进行验证 */
    }
    function isPassword(str)
    {
        var reg=/^[a-zA-Z\d_]{3,}$/;   /*定义验证表达式*/
        return reg.test(str);     /*进行验证*/
    }
</script>
</body>
