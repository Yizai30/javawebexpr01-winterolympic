<%--
  Created by IntelliJ IDEA.
  User: Mena
  Date: 2022/4/6
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Submit</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/prism.css" rel="stylesheet" />
    <style>
        .article-submit-background {
            background: url("./images/article-submit-background.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-attachemt: fixed;
        }
        .submit-link {
            margin-top: 30px;
            margin-left: 3%;
            padding: 15px 25px;
            background: #f4f5f7;
            color: #161616;
            font-weight: bold;
            font-size: x-large;
            border: 0 none;
            cursor: pointer;
            border-radius: 3px;
        }
    </style>
</head>
<body class="article-submit-background">
<h2 style="margin-left: 3%;font-weight: bold;color: black">Start To Create Your Article</h2>
<div class="input-group" style="margin-bottom:10px">
    <textarea class="form-control" id="article-content" cols="150" rows="10" style="margin-left: 3%">

    </textarea>
</div>
<div>
    <input type="submit" class="submit-link" value="submit">
</div>

<%
    if (request.getSession().getAttribute("usr") == null) {
        response.sendRedirect("ArticleServlet");
    }
%>

</body>
</html>
