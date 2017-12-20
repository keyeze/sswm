<%--
  Created by IntelliJ IDEA.
  User: keyez
  Date: 2017/4/2
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>contents</title>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/global.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/page/contents/js/contents.js"></script>
</head>
<body>
<%--<div id='contents' class="easyui-accordion" style="width:200px;height:100%;" border="false">
<div title='个人信息' style="overflow:auto;padding:10px;">
            <ul>
                <li><a href='javascript:void(0)'>个人资料</a></li>
                <li><a href='javascript:void(0)'>密码修改</a></li>
                <li><a href='javascript:void(0)'>课件下载</a></li>
                <li><a href='javascript:void(0)'>查看公告</a></li>
                <li><a href='javascript:void(0)'>留言板块</a></li>
                <li><a href='javascript:void(0)'>在线学习</a></li>
            </ul>
        </div>
        <div title='教学信息' style="overflow:auto;padding:10px;">
            <ul>
                <li><a href='javascript:void(0)'>个人资料</a></li>
                <li><a href='javascript:void(0)'>修改密码</a></li>
                <li><a href='javascript:void(0)'>上传课件</a></li>
                <li><a href='javascript:void(0)'>留言板块</a></li>
                <li><a href='javascript:void(0)'>试题库管理</a></li>
            </ul>
        </div>
        <div title='管理员权限' style="overflow:auto;padding:10px;">
            <ul>
                <li><a href='javascript:void(0)'>用户管理</a></li>
                <li><a href='javascript:void(0)'>留言管理</a></li>
                <li><a href='javascript:void(0)'>课件管理</a></li>
                <li><a href='javascript:void(0)'>试题管理</a></li>
            </ul>
        </div>

</div>--%>

</body>
</html>
