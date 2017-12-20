<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/css/jquery-custom-init.css">
    <script type="text/javascript">
        var ctx = "<%=request.getContextPath()%>";
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/lib/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/custom/plugins/json2.js"></script>
    <%--自己的js部分。。--%>
    <%----%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/old/js/TestOnline.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/old/css/TestOnline.css">

</head>
<style type='text/css'>
    .header_menu {
        width: 1120px;
    }
</style>
<body>
<div id='wrapper'>
    <div class='header_menu'>
        <jsp:include page="Header.jsp"/>
    </div>
    <div class='context'>
        <div class="question_wrapper">
            <div class="item_num">
                <strong><p id='item_number'>第1题</p></strong>
                <p id='item_style'>[单选题]</p>
            </div>
            <div class="Progress" align="center">
                <div class="Progress_bar">
                    <strong id="Progress_bar_block"></strong>
                    <strong id="Progress_bar_block_show"> <span id="span_process"></span></strong>
                </div>
            </div>
            <div class="item_body">
                <form name="ff" action='/test/dealTest.do' method="post">
                    <input type="hidden" name="questNum" id="questNum">
                </form>

            </div><!--item_body ending -->
            <div class='item_foot' align="right">
                <div id='per_btn' class="btn" style='background:#AAD5FF;' align="center">
                    <a id='per_a' class='btn' onclick="return pervious();">上一题</a>
                </div>
                <div id='next_btn' class="btn" style='background:#CF6;' align="center">
                    <a id='next_a' class='btn' onclick="return next();">下一题</a>
                </div>
                <div id='sub_btn' class="btn" style='background:#F00;' align="center">
                    <a class='btn' href="javascript:mysumbit();">提交</a>
                </div>
            </div>

        </div><!--question_wrapper ending -->
    </div>
</div>


</body>
</html>

