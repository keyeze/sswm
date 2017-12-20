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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/old/css/KnowList.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/old/js/KnowList.js"></script>
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
            <div class="bar">
                <ul>
                    <li>
                        <a href="javascript:CtChanOnloadMethod.ChangeType(2)">
                            <span class="item-wrap bor-tx">学习章节</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:CtChanOnloadMethod.ChangeType(3)">
                            <span class="item-wrap bor-tx">课件下载</span>
                        </a>
                    </li>
                    <li>
                        <a href="KnowStudy.jsp" target="_blank">
                            <span class="item-wrap bor-tx">在线学习</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="centinfo">

            </div>
            <div class="foot">
            </div>
            <br>
        </div>
    </div>
</div>
</body>
</html>
