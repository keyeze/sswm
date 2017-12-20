<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        var p_msgId = '<%=request.getParameter("p_msgId")%>';
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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/old/css/Talk.css">
    <%----%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/old/js/Talk.js"></script>
</head>
<style type="text/css">
    .header_menu {
        width: 1120px;
    }
</style>
<script>
    KindEditor.ready(function (K) {
        window.editor = K.create('#msgContent');
    });
</script>
<body style="margin: 0;padding: 0;">
<div id='wrapper'>
    <div class='mywin'>
        <div class="talk_wrapper">
            <div class="talk_title">
                <p id='title'>留言板:</p>
            </div>

            <div class="say_place" align="center">
                <div class="Main">
                    <div class="person_info" style="vertical-align:top;">
                        <img src='${user.headSrc}' width="200px" height="200px">
                        <br>
                        <p>小小明</p>
                    </div>
                    <form name="ff" action="#" method="post">
                        <input type="hidden" name="receivor" value="<%=request.getParameter("p_msgId")%>">
                        <input type="hidden" name="msgTitle" value="回复信息">
                        <input type="hidden" name="msgTypeId" value="12">
                        <div class="Input_Box">
                            <%--<input type="hidden" value="${testId}"/>--%>
                            <textarea id="msgContent" name="content"
                                      style="width: 880px;height: 200px;resize:none;"></textarea>
                        </div>
                        <p class="postBtn">
                            <%--<a href="javascript:document.ff.submit();">回&nbsp复</a>--%>
                            <a href="javascript:void(0)" class="easyui-linkbutton" style="width:60px" onclick="">回复</a>
                            <%--<a href="javascript:document.ff.reset();">重&nbsp置</a>--%>
                            <a href="javascript:void(0)" class="easyui-linkbutton" style="width:60px" onclick="">重置</a>
                        </p>
                    </form>
                </div>

            </div>

            <div class="talk_place" style="overflow: auto;">


            </div>

            <div class="foot">
            </div>
        </div>
    </div>
</div>
</body>
</html>