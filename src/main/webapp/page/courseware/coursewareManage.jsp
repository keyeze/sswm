<%--
  Created by IntelliJ IDEA.
  User: keyez
  Date: 2017/4/6
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>coursewareManage</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/css/jquery-custom-init.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/kindeditor/kindeditor.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/kindeditor/lang/zh_CN.js"></script>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/page/courseware/js/courseware.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/global.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/global.css">
</head>
<script>
    KindEditor.ready(function (K) {
        window.editor = K.create('#content');
    });
</script>
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
                <td width="100px">课件名称：</td>
                <td width="180px"><input class="easyui-textbox" id="msg_title" name="msg_title" style="width: 165px;">
                </td>
                <td width="100px">课件编号：</td>
                <td width="180px"><input class="easyui-textbox" id="msg_id" name="msg_id" style="width: 165px;"></td>
            </tr>
        </table>
    </div>
</div>
<div data-options="region:'center'" border="false">
    <table id="courseware_grid"></table>
</div>
<div id="win" class="easyui-window" closed="true" style="width:750px;height:400px;padding:5px;">
    <form id="MsgInfo" method="post" enctype="multipart/form-data"
          action="<%=request.getContextPath()%>/msg/saveMsg.do">
        <div class="someshow">
            <label for="MsgId" style="display: inline-block;width: 15%;"></label>
            <input class="easyui-validatebox" type="text" name="id" id="id" disabled="true" style="width: 65%">
        </div>
        <input type="hidden" id="msgTypeId" name="msgTypeId">
        <input type="hidden" id="msgId" name="msgId">
        <div>
            <%--@declare id="msg_name"--%>
            <label for="MsgTitle" style="display: inline-block;width: 15%;"></label>
            <input class="easyui-validatebox" type="text" name="msgTitle" id="msgTitle" style="width: 65%">
        </div>
        <%--        <div style="display: none" class="someshow">
                    &lt;%&ndash;@declare id="msg_title"&ndash;%&gt;
                    <label for="MsgTypeId"></label>
                    <input class="easyui-validatebox" type="text" name="msgTypeId" />
                </div>--%>
        <div>
            <%--@declare id="msg_type_id"--%>
            <label for="Content"></label>
            <textarea name="content" id="content" style="width:600px;height:300px;resize:none;"></textarea>
            <br>
        </div>
        <div class="someshow">
            <label for="CreateDate" style="display: inline-block;width: 15%;"></label>
            <input class="easyui-validatebox" type="text" name="createDate" id="createDate" disabled="true"
                   style="width: 65%">
        </div>
        <div class="someshow">
            <label for="Sendor" style="display: inline-block;width: 15%;"></label>
            <input class="easyui-validatebox" type="text" name="p_sendor" id="p_sendor" disabled="true"
                   style="width: 65%">
        </div>
        <div class="someshow">
            <label for="Status" style="display: inline-block;width: 15%;"></label>
            <input class="easyui-validatebox" type="text" name="p_status" id="p_status" disabled="true"
                   style="width: 65%">
        </div>

        <%--        <div class="someshow">
                    <label for="IsReceivor"></label>
                    <input class="easyui-validatebox" type="text" name="isReceivor" />
                </div>--%>
        <div>
            <label for="FileId" style="display: inline-block;width: 15%;"></label>
            <input class="easyui-validatebox" type="text" name="fileName" id="fileName" style="width: 35%">
            <span style="display: inline-block;width: 15%;">上传文件:</span>
            <input class="easyui-filebox" name="file" id="file" style="width: 200px" style="width: 35%">
            <br>
            <br>
        </div>

    </form>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="">提交</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="">重置</a>
</div>
</body>
</html>
