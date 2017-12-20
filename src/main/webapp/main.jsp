<%--
  Created by IntelliJ IDEA.
  User: keyez
  Date: 2017/4/2
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/css/jquery-custom-init.css">
    <script type="text/javascript">
        var ctx = "<%=request.getContextPath()%>";
        var root = '${user==null?0:user.root}';
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/global.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
    <div id="tabs" class="easyui-tabs" style="width:100%;height: 100%;"></div>
</div>
<div data-options="region:'north'" style="height: 150px;overflow: hidden;" split="false" collapsible="false">
    <img src="image/headImg2.jpg" style="width: 100%">
</div>
<div data-options=" region:'west'" style="width: 200px" split="true" collapsible="false" title='目录' id='menu'>
</div>
</body>
</html>
