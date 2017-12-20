<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>
<style type='text/css'>
    div#wrapper {
        margin: 0 auto;
        padding: 5px 5px 5px 5px;
        border: 0;
        width: 1134px;
        text-align: left;
        background: #64B1FF;
    }

    .header_menu {
        width: 1120px;
    }

    .context {
        width: 1110px;
        margin: 5px;
        padding: 5px 5px 5px 5px;
        background: #FFF;
    }

    .item_num {
        background: #64B1FF;
    }

    p#item_number {
        margin: 5px;
        padding: 5px 5px;
        font-size: 24px;
        display: inline-block;

    }

    p#item_style {
        font-size: 16px;
        display: inline-block;
    }

    .item_body {
        background: #64B1FF;

    }

    p#question {
        margin: 5px;
        padding: 10px 10px 0px 10px;
        display: block;
    }

    .item {
        font-size: 18px;
        background: #FFF;
        margin: 5px;
        padding: 5px;

    }

    .item_foot {
        background: #64B1FF;
        padding: 0 45px 15px 5px;

    }

    .btn {
        width: 120px;
        height: 40px;
        line-height: 40px;
        display: inline-block;
        color: #FFF;
    }

    .btn:link, visited {
        text-decoration: none;
        color: #999;
    }

    .btn:hover, active, focus { /* 这将更改鼠标和键盘导航的背景和文本颜色 */
        background-color: #0080FF;
        color: #999;
    }

    .Progress {
        background: #64B1FF;
        padding: 5px 0px 2px 0px;

    }

    .Progress_bar {
        width: 84%;
        border: 2px solid #FFF;
        border-radius: 20px;
        background: #FFF;
        height: 15px;
        display: inline-block;
        overflow: hidden;
        position: relative;

    }

    #Progress_bar_block {
        width: 10%;
        background: #DEC;
        color: #000;
        display: block;
        float: left;
        border-radius: 20px;
        height: 100%;
        text-align: center;
        font-size: 0.6em;
        position: absolute;
        top: 0;
        left: 0;
    }

    #Progress_bar_block_show {
        width: 100%;
        background: none;
        color: #000;
        display: block;
        float: left;
        border-radius: 20px;
        height: 100%;
        text-align: center;
        font-size: 0.6em;
        position: absolute;
        top: 0;
        left: 0;
    }

    strong#title {
        margin: 0 15px;
    }

    .foot {
        margin: 20px;
    }

    .numbar {
        background: #64B1FF;
        margin: 5px 0px;
        padding: 5px;
    }

    .numbar a.btn:hover, active, focus, link, visited {
        color: #FFF;
        border-radius: 6px;

    }

    .numbar div.btn {
        border: 3px solid #FFF;
        border-radius: 10px;
        overflow: hidden;
    }

    .result_standard {
        margin: 5px 0;
        background: #64B1FF;
        padding: 20px 0;
    }

    .text {
        background: #FFF;
        padding: 20px;
        color: #000;
    }

    div#talk {
        margin: 15px 0px 5px 0px;

    }

</style>
<script type="text/javascript">
    function go() {
        var str = '${param.testId}';
        runNewJsp(str);
        runQuestionView(str);
        <c:if test="${param.numb!=null}">
        alert("已打开评论所对应的回复列表...");
        </c:if>

    }
    function runNewJsp(str) {

        var xmlhttp;
        if (window.XMLHttpRequest) {
            //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
            xmlhttp = new XMLHttpRequest();
        }
        else {
            // IE6, IE5 浏览器执行代码
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("runJsp").innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", "dealresult.action?testId=" + str, true);
        xmlhttp.send();
    }
    function runQuestionView(str) {
        var xmlhttp;
        if (window.XMLHttpRequest) {
            //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
            xmlhttp = new XMLHttpRequest();
        }
        else {
            // IE6, IE5 浏览器执行代码
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("item_body").innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", "showquestion.action?testId=" + str, true);
        xmlhttp.send();
    }
    function upAndFlush() {
        document.ff.submit();
        alert('发送成功');
        var str = document.getElementsByName('hid').item(i - 1).innerText;
        runNewJsp(str);
    }
    function addtalk(str, numb) {
        var lls = document.getElementsByName("ula");
        var ll = document.getElementsByName("ula").item(numb);
        if (ll.innerHTML == "") {
            j = numb;
            for (var ak = 0; ak < lls.length; ak++) {
                lls.item(ak).innerHTML = "";
            }
            runNewTalk(str, numb);

        } else {
            ll.innerHTML = "";
        }

    }

    function runNewTalk(str, numb) {
        var xmlhttp;
        if (window.XMLHttpRequest) {
            //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
            xmlhttp = new XMLHttpRequest();
        }
        else {
            // IE6, IE5 浏览器执行代码
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementsByName("ula").item(numb).innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", "talkandanswertest.action?labelId=" + str, true);
        xmlhttp.send();

    }
</script>

<body onload="go();<c:if test="${param.numb!=null}">addtalk('${param.id}',${param.numb});</c:if>">
<div id='wrapper'>
    <div class='header_menu'>
        <jsp:include page="Header.jsp"/>
    </div>
    <div class='context'>
        <div class="question_wrapper">
            <div class="item_num">
                <p id='item_style'>[单选题]</p>
            </div>
            <div id="item_body" class="item_body">

            </div><!--item_body ending -->
            <div id="runJsp">

            </div>
        </div><!--question_wrapper ending -->

    </div>

</div>
</body>
</html>