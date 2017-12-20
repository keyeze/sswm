<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>

</head>
<style type="text/css">

    div#header {
        margin: 12px -5px 5px 5px;
        padding: 5px;
        height: 220px;
        background-color: #FFF;
    }

    div#main_menu {
        height: 60px;
        width: 100%;
        margin: 5px;
        padding: 5px 0;
        border: 0;
        background: #FFF;
    }

    div#item {
        display: inline-block;
        float: left;
        margin: 0 0.5%;
        width: 19%;
        line-height: 60px;
        text-align: center;
        height: 60px;
        background: #64B1FF;

    }

    div#item:link, visited {
        text-decoration: none;
        color: #999;
    }

    div#item:hover, active, focus { /* 这将更改鼠标和键盘导航的背景和文本颜色 */
        background-color: #0080FF;
        color: #999;
    }

    div#item a, div#item a:visited { /* 对这些选择器进行分组可确保链接即使在访问之后也能保持其按钮外观 */
        display: block; /* 这将为链接赋予块属性，使其填满包含它的整个 LI。这样，整个区域都可以响应鼠标单击操作。 */
        width: 100%; /*此宽度使整个按钮在 IE6 中可单击。如果您不需要支持 IE6，可以删除它。请用侧栏容器的宽度减去此链接的填充来计算正确的宽度。 */
        text-decoration: none;
        color: #666;
    }

    div#item a:hover, div#item a:active, div#item a:focus { /* 这将更改鼠标和键盘导航的背景和文本颜色 */
        background-color: #0080FF;
        color: #FFF;
    }

    .head_person {
        margin: 10px 10px;
        display: inline-block;
        float: right;

    }

    .logo {
        display: inline-block;
        height: 220px;
    }

    p#tip {
        color: #F00;
    }

    a#tip {
        color: #39F;
    }

    span span span a:hover, span span span a:active {
        color: #F00;
    }

</style>
<script type="text/javascript">
    var ctx = '<%=request.getContextPath()%>';
    function logout() {
        window.location.href = ctx + "/logout.jsp";
    }
    function goManagePage() {
        window.location.href = ctx + "/main.jsp";
    }
</script>
<body>
<div id="header">
    <div class='logo'>
        <img src="<%=request.getContextPath()%>/image/headImg.jpg" height="100%">
    </div>
</div>
<div>
    <span style="color:#FFFFFF;">
        <span style="display: inline-block;width:39%;padding-left: 10px;">欢迎 , <a id='tip' href='#'
                                                                                  style="color:#d9534f;">${user.name==null || ("" eq user.name)?user.username:user.name} </a> 同学登陆&nbsp;</span>
        <span style="display: inline-block;width:59%;text-align: right">
            <span style="color: mistyrose">您上次的登陆时间为:  </span>${user.p_lastLoginDate}
            ${user.root>0?"<button onclick='goManagePage()'>后台</button>":""}
            <button onclick="logout()">注销</button>
        </span>
    </span>
</div>
<div id="main_menu">
    <div id='item'><a href="<%=request.getContextPath()%>/old/Welcome.jsp">
        <div style="width:100%;height:100%;">首页</div>
    </a></div>
    <div id='item'><a href="<%=request.getContextPath()%>/old/PersonInfomation.jsp">
        <div style="width:100%;height:100%;">个人中心</div>
    </a></div>
    <div id='item'><a href="<%=request.getContextPath()%>/old/KnowList.jsp">
        <div style="width:100%;height:100%;">学习课堂</div>
        <%--知识点,课件下载,在线课堂--%>
    </a></div>
    <div id='item'><a href="<%=request.getContextPath()%>/old/Guestbook.jsp">
        <div style="width:100%;height:100%;">留言板块</div>
    </a></div>
    <%--<div id='item'><a href="KnowStudy.jsp">--%>
    <%--<div style="width:100%;height:100%;">知识讲堂</div>--%>
    <%--</a></div>--%>

    <div id='item'><a href="<%=request.getContextPath()%>/old/TestOnline.jsp">
        <div style="width:100%;height:100%;">在线测试</div>
    </a></div>
</div>
</body>
</html>