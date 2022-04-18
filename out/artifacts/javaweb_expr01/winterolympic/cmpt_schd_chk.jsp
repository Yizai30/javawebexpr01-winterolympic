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
        .buttons {
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
        .inputs {
            border-color: blueviolet;
        }
    </style>
</head>
<body class="cmpt-schd-chk-background">

<%--通过 jsp 标签使用 JavaBean--%>
<jsp:useBean id="cmpt" class="winterolympic.vo.Cmpt" scope="page"/>

<jsp:setProperty name="cmpt" property="uid" value="mena"/>
<jsp:setProperty name="cmpt" property="cmptName" value="花样滑冰"/>
<jsp:setProperty name="cmpt" property="time" value="2022-2-18 17:30:00"/>
<jsp:setProperty name="cmpt" property="place" value="no.177 course"/>

<h2 style="margin-left: 3%;font-weight: bold;">Start To Check Your Schedule</h2>
<div>
    <txt style="margin-left: 3%;font-size: medium;font-weight: bold">记者编号</txt><input type="text">
    <button class="buttons" id="btn_read" onclick="Show_Table()">query</button>
    <button class="buttons" id="btn_create" onclick="Create_Row_Cmpt()" disabled="disabled">create</button>
</div>
<div style="margin-top:10px;display: none" id="Record">
    <div class="table-responsive" style="margin-left: 3%;" >
        <hr>
        <h3>待记录项目</h3>
        <table class="table"><thead><tr><td>项目名称</td><td>比赛时间</td><td>比赛场地</td></tr></thead>
            <tbody id="recording_cmpts">
                <tr><td><jsp:getProperty name="cmpt" property="cmptName"/></td><td><jsp:getProperty name="cmpt" property="time"/></td><td><jsp:getProperty name="cmpt" property="place"/></td></tr>
            </tbody>
        </table>
        <hr>
        <h3>待记录运动员</h3>
        <table class="table"><thead><tr><td>姓名</td><td>项目名称</td><td>性别</td><td>国籍</td></tr></thead>
            <tbody>

            </tbody>
        </table>
        <hr>
    </div>
</div>

<script>
    function Show_Table() {

        // 将表格设为可见
        var target = document.getElementById('Record');
        if (target.style.display === "none") {
            target.style.display = "";
        }

        // 将 Create 按钮设为可点击
        var btn_create = document.getElementById('btn_create');
        btn_create.removeAttribute('disabled');
    }
    function Create_Row_Cmpt() {

        // 在待记录项目列表中，添加新行需要的节点元素
        let tbody = document.getElementById('recording_cmpts');
        let trow = document.createElement('tr');
        let td_name = document.createElement('td');
        let td_time = document.createElement('td');
        let td_place = document.createElement('td');
        let input_name = document.createElement('input');
        let input_time = document.createElement('input');
        let input_place = document.createElement('input');
        let btn_ok = document.createElement('button');

        // 三个单元格
        td_name.setAttribute('id', 'td_name');
        td_time.setAttribute('id', 'td_time');
        td_place.setAttribute('id', 'td_place');

        // 三个输入框
        input_name.setAttribute('id', 'cmpt_name');
        input_name.setAttribute('placeholder', '项目名称');
        input_name.setAttribute('type', 'text');
        input_name.setAttribute('class', 'inputs');

        input_time.setAttribute('id', 'cmpt_time');
        input_time.setAttribute('placeholder', '比赛时间');
        input_time.setAttribute('type', 'text');
        input_time.setAttribute('class', 'inputs');

        input_place.setAttribute('id', 'cmpt_place');
        input_place.setAttribute('placeholder', '比赛场地');
        input_place.setAttribute('type', 'text');
        input_place.setAttribute('class', 'inputs');

        // 一个确认按钮
        btn_ok.setAttribute('id', 'tmp_ok');
        btn_ok.setAttribute('class', 'buttons');
        btn_ok.setAttribute('style', 'font-size: small;padding: 10px 15px')
        btn_ok.setAttribute('onclick', 'Ok()');
        btn_ok.innerText = 'OK';

        // 组装节点元素
        tbody.appendChild(trow);
        trow.appendChild(td_name);
        trow.appendChild(td_time);
        trow.appendChild(td_place);
        td_name.appendChild(input_name);
        td_time.appendChild(input_time);
        td_place.appendChild(input_place);
        trow.appendChild(btn_ok);
    }
    function Ok() {

        // 根据 id 获得三个输入框
        let input_name = document.getElementById('cmpt_name');
        let input_time = document.getElementById('cmpt_time');
        let input_place = document.getElementById('cmpt_place');

        // 获取三个输入框内容
        var name = input_name.value;
        var time = input_time.value;
        var place = input_place.value;

        // 校验输入内容
        if (!isTime(time)) {
            alert("请输入合法的比赛时间");
            return false;
        }
        if (!isPlace(place)) {
            alert("请输入合法的比赛场地");
            return false;
        }

        // 根据 id 获取三个单元格
        let td_name = document.getElementById('td_name');
        let td_time = document.getElementById('td_time');
        let td_place = document.getElementById('td_place');

        // 清除单元格 id，并设置单元格文本
        td_name.removeAttribute('id');
        td_time.removeAttribute('id');
        td_place.removeAttribute('id');
        td_name.innerText = name;
        td_time.innerText = time;
        td_place.innerText = place;

        // 将三个输入框删除
        input_name.remove();
        input_time.remove();
        input_place.remove();

        // 根据 id 获得确认按钮，并删除
        let ok_button = document.getElementById('tmp_ok');
        ok_button.remove();
    }
    function isTime(str) {
        var reg = /^(2022-02-(0[1-9]|1[0-9]|2[0-8])\s(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9])$/;
        return reg.test(str);
    }
    function isPlace(str) {
        var reg = /^(no.[0-9][0-9][0-9]\scourse)$/;
        return reg.test(str);
    }
</script>
</body>
</html>
