<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html,
        body {
            margin: 0;
            padding: 0;
        }

        ul {
            list-style: none;
        }

        .home-link {
            margin-top: 80px;
            margin-left: 10%;
            padding: 15px 25px;
            background: #f4f5f7;
            color: #161616;
            font-weight: bold;
            font-size: xx-large;
            border: 0 none;
            cursor: pointer;
            border-radius: 3px;
            background-image: url("./images/home-button.png");
            background-color: transparent;
        }

        .home-link-background {
            background: url("./images/login-background.png");
            opacity: 0.8;
            height: 200px;
            width: 2000px;
        }

        .drop_down_list {
            display: none;
        }

        .drop_down:hover .drop_down_list {
            display: block;
        }

        #slideshow {
            width: 100vw;
            height: 95vh;
            overflow: hidden;
            position: relative;
            margin: 0 auto;
        }

        #imglist li {
            width: 2000px;
            height: 480px;
            position: absolute;
            /* 全部图片设为透明 */
            opacity: 0;
            transition: opacity 3.5s;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }

        #imglist>li img {
            width: 2000px;
            height: 880px;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }

        #dotlist {
            position: absolute;
            bottom: 30px;
            width: 100px;
            display: flex;
            justify-content: space-between;
            left: 50%;
            transform: translate(-50%);
        }

        #dotlist>li {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background-color: rgb(206, 16, 16);
            /* 全部小圆点设为半透明 */
            opacity: 0.3;
            cursor: pointer;
            user-select: none;
        }
        /* 具有appear类的元素设为 不透明 即显示 */

        #imglist>li.appear,
        #dotlist>li.appear {
            opacity: 1;
        }
        /* 左右轮播按钮 */

        #pre,
        #next {
            position: absolute;
            font-size: 100px;
            color: rgba(0, 0, 0, .3);
            top: 50%;
            transform: translate(0, -50%);
            font-weight: bold;
            cursor: pointer;
            user-select: none;
        }

        #pre {
            left: 20px;
        }

        #next {
            right: 20px;
        }

        #pre:hover,
        #next:hover {
            color: rgba(255, 255, 255, .3);
        }
    </style>
</head>

<body>
<div style="background-color: #5bc0de;color: snow;font-size: large;padding: 1%;display: flex">
    <h1 style="width: 100%">Welcome to Beijing Winter Olympic!</h1>
    <div class="drop_down">
        <h1 style="display: flex;justify-content: flex-end;width: 100%">User</h1>
        <div class="drop_down_list">
            <ul>
                <li class><a href="#">用户中心</a></li>
                <li class><a href="../winterolympic/LogoutServlet">注销</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="slideshow">
    <ul id="imglist">
        <li><img src="./images/1.jpg"></li>
        <li><img src="./images/2.jpg"></li>
        <li><img src="./images/3.jpg"></li>
        <li><img src="./images/4.jpg"></li>
        <li><img src="./images/5.jpg"></li>
    </ul>
    <ul id="dotlist">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
    <div id="pre">&lt;</div>
    <div id="next">&gt;</div>
</div>
<div class="home-link-background">
    <a href="ArticleServlet"><button class="home-link">Article Contributing</button></a>
    <a href="CmptServlet"><button class="home-link">Competition Schedule Checking</button></a>
</div>
<script>
    // 找对象
    var slideShow = document.getElementById("slideshow");
    var imgList = document.getElementById("imglist");
    var imgs = imgList.children;
    var dotList = document.getElementById("dotlist");
    var dots = dotlist.children;
    var pre = document.getElementById("pre");
    var next = document.getElementById("next");
    var duration = 3000; // 设置轮播时间间隔
    var Index = 0;
    var count = imglist.children.length; // 获取图片数量
    var timer; // 设置一个计时器

    window.onload = function() {

        <%
        if (request.getSession().getAttribute("usr") == null) {
            response.sendRedirect("HomeServlet");
        }
        %>

        imgList.children[0].classList.add("appear"); // 初始时显示第一幅图片
        dotList.children[0].classList.add("appear"); // 初始时第一个点为白色

        //为每个点添加单击处理函数
        for (var i = 0; i < dots.length; i++) {
            dots[i].index = i;
            dots[i].onclick = changeMe;
        }

        //启动动画自动播放
        timer = setInterval(rotate, duration);

        // 鼠标移到图片上面时，停止动画
        slideShow.onmouseover = function(event) {
            clearInterval(timer);
        };

        // 鼠标离开图片上面时，启动动画
        slideShow.onmouseout = function(event) {
            timer = setInterval(rotate, duration);
        };

        //左右播放图片
        pre.onclick = preImg;
        next.onclick = nextImg;
    }

    //改变图片和点的当前状态（通过 添加 或 移除 appear 属性）
    function change() {
        for (var i = 0; i < dots.length; i++) {
            dots[i].classList.remove("appear");
            imgs[i].classList.remove("appear");
        }
        dots[Index].classList.add("appear");
        imgs[Index].classList.add("appear");
    }

    //循环切换图片
    function rotate() {
        Index++;
        if (Index == count) {
            Index = 0;
        }
        change();
    }

    //切换上一幅图片
    function preImg() {
        Index--;
        if (Index < 0) {
            Index = count - 1;
        }
        change();
    }

    //切换下一幅图片
    function nextImg() {
        Index++;
        if (Index == count) {
            Index = 0;
        }
        change();
    }

    //单击某个圆点，切换到相应图片
    function changeMe() {
        Index = this.index;
        change();
    }
</script>
</body>

</html>