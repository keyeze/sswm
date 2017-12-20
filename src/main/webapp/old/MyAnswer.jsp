<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>
<style type='text/css'>
    .Main {
        width: 500px;
        display: table;
    }

    .Input_box {
        width: 500px;
        height: 200px;
        background: #DDD;
        margin: 5px;
        padding: 5px 30px 5px 5px;
        display: table-cell;
    }

    .postBtn {
        float: right;
        margin: 5px;
    }

    .Input_text {
        width: 855px;
        height: 185px;
        resize: none;
        margin: 0px 0px 5px 20px;
        padding: 5px;
    }

    .person_info {
        display: table-cell;
        text-align: center;

    }
</style>
<body>
<div class="Main">
    <div class="person_info">
        <img src='1.jpg' width="200px" height="200px"/>
        <br/>
        <p>小小明</p>
    </div>
    <form name="ff" action="#" method="post">
        <div class="Input_Box">
            <input type="hidden" value="${testId}"/>
            <textarea name="label" class="Input_text"></textarea>
        </div>
        <p class="postBtn">
            <a href="javascript:document.ff.submit();">回&nbsp复</a>
            &nbsp&nbsp&nbsp
            <a href="javascript:document.ff.reset();">重&nbsp置</a>
        </p>
    </form>
</div>

</body>
</html>