<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登陆页面</title>
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
    <script type="text/javascript">
        $(function () {

            $('form#login').submit(function () {
                $.ajax({
                    url: ctx + '/user/login.do',
                    dataType: 'json',
                    data: $('form#login').serialize(),
                    type: "post",
                    success: function (data) {
                        if (data.success) {
                            var root = $('select#root option:selected').val();
                            switch (eval(root)) {
                                case 0:
                                    window.location.href = ctx + '/old/Welcome.jsp';
                                    break;
                                case 1:
                                    window.location.href = ctx + '/main.jsp';
                                    break;
                                case 2:
                                    window.location.href = ctx + '/main.jsp';
                                    break;
                            }

                        } else {
                            $.messager.alert("系统提示", data.msg, "info");
                        }
                    }
                })
            })
        })
    </script>
</head>
<link rel="stylesheet" href="js/css/login.css">
<body>
<div class="content">
    <div class="panel">
        <form id="login" method="post" action="javascript:void(0)">
            <div class="group">
            </div>
            <div class="group">
                <label>用户名</label>
                <input type="text" name="username">
            </div>
            <div class="group">
                <label>密码</label>
                <input type="password" name="password">
            </div>
            <div class="group">
                <select name="root" id="root">
                    <option value="0" selected="selected">学生</option>
                    <option value="1">教师</option>
                    <option value="2">管理员</option>
                </select>
            </div>

            <div class="login">
                <button>登陆</button>
            </div>
        </form>
        <form action="<%=request.getContextPath()%>/register.jsp">
            <div class="register">
                <button>注册</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>