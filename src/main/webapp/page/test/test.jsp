<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CT-测试用户表</title>
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
    <%--
    <script type="text/javascript" src="<%=request.getContextPath()%>/functionmodule/cmdbmanage/js/auditTaskManage.js"></script>
    --%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/page/test/js/test.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/global.js"></script>
</head>
<body class="easyui-layout" border="false">
<div data-options="region:'north'" style="height: 120px;" border="false">
    <div id="grid_search_div" class="datagrid-toolbar">
        <label>操作：</label>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="dynamic-tbar-icon-search" onclick="">查询</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="dynamic-tbar-icon-reset" onclick="">重置</a>
    </div>
    <div style="padding: 5px 0px 0px 10px;">
        <table border="0" width="97%">
<%--            <tr>
                <td width="100px">姓名：</td>
                <td width="180px"><input class="easyui-textbox" id="MSG_ID" name="MSG_ID" style="width: 165px;"></td>
                <td width="100px">年龄：</td>
                <td width="180px"><input class="easyui-textbox" id="age" name="age" style="width: 165px;"></td>
            </tr>
            <tr>
                <td width="100px">地址：</td>
                <td width="180px"><input class="easyui-textbox" id="address" name="address" style="width: 165px;"></td>

                &lt;%&ndash;设置下拉框，并配置下拉查询action。&ndash;%&gt;
                <td width="100px">是否有车：</td>
                <td width="180px"><input id="has_car" name="has_car" style="width: 165px;"></td>
            </tr>
            <tr>
                <td width="100px">是否有宽带：</td>
                <td width="180px"><input id="has_broadband" name="has_broadband" style="width: 165px;"></td>
                <td width="100px">是否有手机：</td>
                <td width="180px"><input id="has_iphone" name="has_iphone" style="width: 165px;"></td>
            </tr>--%>
        </table>
    </div>
</div>
<div data-options="region:'center'" border="false">
    <table id="test_grid"></table>
</div>
<div id="win" class="easyui-window" closed="true" style="width:300px;height:600px;padding:5px;">
</div>
</body>
</html>