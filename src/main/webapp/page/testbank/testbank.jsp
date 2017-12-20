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
        var root = "${user==null?0:user.root}";
        var loginUserId = '${user.userId}';
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/page/testbank/js/testbank.js"></script>
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
            <tr>
                <td width="100px">试题编号：</td>
                <td width="180px"><input class="easyui-textbox" id="F_TEST_ID" name="F_TEST_ID" style="width: 165px;">
                </td>
                <td width="100px">问题：</td>
                <td width="180px"><input class="easyui-textbox" id="F_TITLE" name="F_TITLE" style="width: 165px;"></td>
            </tr>
        </table>
    </div>
</div>
<div data-options="region:'center'" border="false">
    <table id="testbank_grid"></table>
</div>
<div id="win" class="easyui-window" closed="true" style="width:300px;height:300px;padding:5px;">
    <form id="TestInfo" method="post" enctype="multipart/form-data"
          action="#">
        <div class="someshow">
            <label for="testId">试题ID</label>
            <input class="easyui-validatebox" type="text" name="id" id="id" disabled="true"/>
        </div>
        <input type="hidden" id="testId" name="testId">
        <div>
            <label for="title">试题问题</label>
            <input class="easyui-validatebox" type="text" name="title" id="title"/>
        </div>
        <%--        <div style="display: none" class="someshow">
                    &lt;%&ndash;@declare id="msg_title"&ndash;%&gt;
                    <label for="MsgTypeId"></label>
                    <input class="easyui-validatebox" type="text" name="msgTypeId" />
                </div>--%>
        <div>
            <label for="rightselect">正确的解释:</label>
            <input class="easyui-validatebox" type="text" name="answer" id="answer">
        </div>
        <div>
            <label for="rightselect">正确答案:</label>
            <input class="easyui-validatebox" type="text" name="rightselect" id="rightselect">
        </div>
        <div>
            <label for="errorselect1">错误答案1:</label>
            <input class="easyui-validatebox" type="text" name="errorselect1" id="errorselect1">
        </div>
        <div>
            <label for="errorselect2">错误答案2:</label>
            <input class="easyui-validatebox" type="text" name="errorselect2" id="errorselect2">
        </div>
        <div>
            <label for="errorselect3">错误答案3:</label>
            <input class="easyui-validatebox" type="text" name="errorselect3" id="errorselect3">
        </div>
        <div class="someshow">
            <label for="p_sendor">创建人:</label>
            <input class="easyui-validatebox" type="text" name="p_sendor" id="p_sendor" disabled="true"/>
        </div>
        <div class="someshow">
            <label for="CreateDate">创建时间:</label>
            <input class="easyui-validatebox" type="text" name="createDate" id="createDate" disabled="true"/>
        </div>
    </form>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="">提交</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="">重置</a>

    <input type="file" name="upFile" style="display: none;" id="upFile">
</div>
</body>
</html>