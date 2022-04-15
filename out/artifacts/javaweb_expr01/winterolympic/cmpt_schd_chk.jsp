<%--
  Created by IntelliJ IDEA.
  User: Mena
  Date: 2022/4/6
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Competition Schedule Checking</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/prism.css" rel="stylesheet" />
    <style>
        .cmpt-schd-chk-background {
            background: url("./images/article-submit-background.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-attachemt: fixed;
        }
        .query-button {
            margin-top: 3%;
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
<body class="cmpt-schd-chk-background">
<h2 style="margin-left: 3%;font-weight: bold;">Start To Check Your Schedule</h2>
<div>
    <txt style="margin-left: 3%;font-size: medium;font-weight: bold">记者编号</txt><input type="text">
    <button class="query-button" id="btn_show" onclick="Show_Table()">query</button>
</div>
<div style="margin-top:10px" id="Record"></div>
<script>
    function Show_Table() {
        // console.log(SymbolTable);
        var inner_html = "<div class=\"table-responsive\" style=\"margin-left: 3%;\" >";

        inner_html += "<hr>";

        inner_html += "<h3>待记录项目</h3><table class=\"table\"><thead><tr><td>项目名称</td><td>时间</td><td>场地</td></tr></thead><tbody>";
        // for (i = 0; i < SymbolTable.global_symbol_table.length; i++) {
        //     inner_html += "<tr><td>" + SymbolTable.global_symbol_table[i].cmptname + "</td><td>" + SymbolTable.global_symbol_table[i].time + "</td><td>" + SymbolTable.global_symbol_table[i].place + "</td></tr>";
        // }
        inner_html += "</tbody><table></div>";

        inner_html += "<hr>";

        inner_html += "<h3>待记录运动员</h3>";
        // for (i = 0; i < SymbolTable.local_symbol_tables.length; i++) {
            // inner_html += "<h4>" + SymbolTable.local_symbol_tables[i].name + "</h4>";
            inner_html += "<table class=\"table\"><thead><tr><td>姓名</td><td>项目名称</td><td>性别</td><td>国籍</td></tr></thead><tbody>";
            // for (j = 0; j < SymbolTable.local_symbol_tables[i].local_var.length; j++) {
            //     inner_html += "<tr><td>" + SymbolTable.local_symbol_tables[i].local_var[j].name + "</td><td>" + SymbolTable.local_symbol_tables[i].local_var[j].cmptname + "</td><td>" + SymbolTable.local_symbol_tables[i].local_var[j].gender + "</td><td>" + SymbolTable.local_symbol_tables[i].local_var[j].nationality + "</td></tr>";
            // }
            inner_html += "</tbody><table>";
        // }

        inner_html += "<hr>";

        document.getElementById("Record").innerHTML = inner_html;
    }
</script>
</body>
</html>
