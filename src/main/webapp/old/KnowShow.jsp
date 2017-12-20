<%--
  Created by IntelliJ IDEA.
  User: keyez
  Date: 2017/4/24
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>coursewareManage</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/css/jquery-custom-init.css">
    <script type="text/javascript">
        var ctx = "<%=request.getContextPath()%>";
        var msgId = "<%=request.getParameter("msgId")%>"
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/lib/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/custom/plugins/json2.js"></script>
    <%--自己的js部分。。--%>
    <%--
    <script type="text/javascript" src="<%=request.getContextPath()%>/functionmodule/cmdbmanage/js/auditTaskManage.js"></script>
    --%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/old/css/KnowShow.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/old/js/KnowShow.js"></script>
</head>
<style type="text/css">
    .header_menu {
        width: 1120px;
    }
</style>
<body>
<div id='wrapper'>
    <div class='header_menu'>
        <jsp:include page="Header.jsp"/>
    </div>
    <div class='mywin'>
        <div class='center'>
            <div class='info-row'>
                <div style="text-align: center;">
                    <h1 style="margin-top: 5px">标题</h1>
                </div>
                <hr>
                <div style="text-align: right;">
                <span style="color: #8fa7b3;">
                    <span id="createDate">日期:</span>
                    <br>
                    <span id="sendor">发布人:</span>
                </span>
                </div>
            </div>

            <div class='info-row'>
                <div class="info-content" style="min-height: 400px;" id="msgContent">
                </div>
            </div>

            <div class='info-row'>
                <span style="margin-left: 60px">附件:<a href="javascript:void(0)" id="file"></a></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
