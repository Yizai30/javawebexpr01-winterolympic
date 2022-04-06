<%--
  Created by IntelliJ IDEA.
  User: Mena
  Date: 2022/4/6
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>

</head>
<body>
<div id="BackgroundArea">
    <div id="home-banner" class="no-padding banner-section home-banner">
        <!-- Container -->
        <div class="container">
            <div id="main-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <div class="col-md-6 col-sm-6 no-padding">
                            <div class="banner-left">
                                <span>Pathological speech recognition helps more dysarthria recover!</span>
                                <h3>we care for your health</h3>
                                <p>Qualified Staff With Expertise in Services We Offer for more Resonable cost with love, Just explore about More!</p>
                                <a href="#">View Our Services<i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 no-padding">
                            <div class="banner-right">
                                <img src="images/banner-main.png" alt="banner-main"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-6 col-sm-6 no-padding">
                            <div class="banner-left">
                                <span>Pathological speech recognition helps more dysarthria recover!</span>
                                <h3>we care for your health</h3>
                                <p>Qualified Staff With Expertise in Services We Offer for more Resonable cost with love, Just explore about More!</p>
                                <a href="#">View Our Services<i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 no-padding">
                            <div class="banner-right">
                                <img src="images/banner-main.png" alt="banner-main"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var imgArr=["https://rs1.huanqiucdn.cn/dp/api/files/imageDir/4fff778561dd012f5ea5334a8a88ea7d.png?w=1260",
    "http://5b0988e595225.cdn.sohucs.com/images/20200508/66ed43872c75470cbc2a042a6aa938a7.png",
    "https://photo.16pic.com/00/93/59/16pic_9359967_b.png"];
    var index =parseInt(Math.random()*(imgArr.length-1));
    var currentImage=imgArr[index];
    document.getElementById("BackgroundArea").style.backgroundImage="url("+currentImage+")";
</script>
</body>
</html>
