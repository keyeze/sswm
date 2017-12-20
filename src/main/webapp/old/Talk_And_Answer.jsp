<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
        var msgId = "<%=request.getParameter("msgId")%>";
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/lib/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/custom/plugins/json2.js"></script>
    <%--自己的js部分。。--%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/old/js/Talk_And_Answer.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/old/css/Talk_And_Answer.css">
</head>
<body>
<div class='your_talk'>
    <div class="n_Main">
        <div class="n_Input_Box">
            <form id="nff" name="nff" action="/study/msg/saveAnswer.do" method="post" target="n_id_iframe">

                <input type="hidden" name="receivor" value="<%=request.getParameter("msgId")%>">
                <input type="hidden" name="msgTitle" value="回复信息">
                <input type="hidden" name="msgTypeId" value="12">
                <div>
                    <hr/>
                    <input class="easyui-validatebox" name="content" type="text" style="width:70%" required="true">&nbsp
                    <a href="javascript:CtChanOnloadMethod.MySubmit();"
                       class="easyui-linkbutton">回&nbsp复</a>
                    &nbsp
                    <a href="javascript:document.nff.reset();" class="easyui-linkbutton">重&nbsp置</a>
                </div>
            </form>
            <iframe id="n_id_iframe" name="n_id_iframe" style="display:none;"></iframe>
        </div>
    </div>
</div>
<div class="answers">
</div>
</body>
</html>