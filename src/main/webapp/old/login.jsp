<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>
<link rel="stylesheet" href="login.css">
<script type='text/javascript'>
    function refrush() {
        this.authCode.src = "<c:url value="/authCode.servlet"/>" + "?time=" + new Date().getTime();
    }
</script>
<body>
<div class="content">
    <div class="panel">
        <form action="login.action" method="post">
            <div class="group">
                <label style="color: #FF0000">${errorMsg eq null?"":errorMsg}</label>
            </div>
            <div class="group">
                <label>用户名</label>
                <input type="text" name="username"/>
            </div>
            <div class="group">
                <label>密码</label>
                <input type="password" name="password"/>
            </div>
            <div class="group" style="display: none;">
                <select name="identity">
                    <option value="student" selected="selected">学生</option>
                    <option value="teacher">教师</option>
                    <option value="admin">管理员</option>
                </select>
            </div>
            <div class="group" style="display: none;">
                <input type="text" name="authCode" style="width: 65%;display: inline-block"/>
                <a href="javascript:refrush();">
                    <img id="authCode" alt=authCode src='<c:url value="/authCode.servlet"/>'/>
                </a>
            </div>

            <div class="login">
                <button>登陆</button>
            </div>
        </form>
        <form action="register.jsp">
            <div class="register">
                <button>注册</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>