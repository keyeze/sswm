<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link rel="stylesheet" type="text/css" id="css" href="old/style/main.css"/>
    <link rel="stylesheet" type="text/css" id="css" href="old/style/style1.css"/>
    <script src="js/base.js" type="text/javascript"></script>
    <script type='text/javascript'>
        function refrush() {
            this.authCode.src = '<c:url value="/authCode.servlet"/>' + "?time=" + new Date().getTime();
        }
    </script>

    <style type="text/css">
        body{
            text-align: center;
        }

        <!--
        table {
            border-spacing: 1px;
            border: 1px solid #A2C0DA;
        }

        td, th {
            padding: 2px 5px;
            border-collapse: collapse;
            text-align: left;
            font-weight: normal;
        }

        thead tr th {
            height: 30px;
            background: #FFFFFF;
            border: 1px solid white;
        }

        thead tr th.line1 {
            background: #FFFFFF;
        }

        thead tr th.line4 {
            background: #C6C6C6;
        }

        tbody tr td {
            height: 35px;
            background: #CBE2FB;
            border: 1px solid white;
            vertical-align: middle;
        }

        tbody tr td.line4 {
            background: #D5D6D8;
        }

        tbody tr th {
            height: 35px;
            background: #DFEDFF;
            border: 1px solid white;
            vertical-align: middle;
        }

        tfoot tr td {
            height: 35px;
            background: #FFFFFF;
            border: 1px solid white;
            vertical-align: middle;
            text-align: center
        }

        -->
    </style>

</head>
<script type="text/javascript">
    <c:if test="${msg!=null}">
    alert('${msg}');
    </c:if>
</script>
<body>
<div id="center">

    <div id="ltd">
        <h2>新会员注册</h2>
        <table cellspacing=0 cellpadding=0 border=0>
            <tr>
                <td width="100%">
                    <form onsubmit="return validateRegisterForm(this);"
                          action='register.action' method=post>
                        <table width="100%">
                            <thead>
                            <tr>
                                <th colspan=3><font
                                        face="Arial, Helvetica, sans-serif"><b>
                                    请填写个人资料：（注意带有<font color=#ff0000>*</font>的项目必须填写）
                                </b></font></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th width="25%">
                                    <div align="right">
                                        <font color=#ff0000>*</font>用户名：
                                    </div>
                                </th>
                                <td width="30%"><input maxlength=14 name=username
                                                       style="width:200px"/></td>
                                <th width="45%"><font color=#ff0000>昵称可使用长度为0-16的任何字符</font></th>
                            </tr>
                            <tr>
                                <th>
                                    <div align="right">
                                        <font color=#ff0000>*</font> 密码：
                                    </div>
                                </th>
                                <td><input type=password maxlength=14
                                           style="width:200px" name=password /></td>
                                <th><font color=#ff0000>密码可使用长度为6-14的任何字符，并区分英文字母大小写</font>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    <div align=right>
                                        <font color=#ff0000>*</font>密码确认：
                                    </div>
                                </th>
                                <td><input type=password maxlength=14
                                           style="width:200px" name=passwords /></td>
                                <th><font color=#ff0000>请再输入一次密码</font></th>
                            </tr>
                            <tr>
                                <th>
                                    <div align=right>
                                        <font color=#ff0000>*</font>电子邮箱：
                                    </div>
                                </th>
                                <td><input maxlength=30 style="width:200px" name=email />
                                </td>
                                <th><font color=#ff0000>请输入您常用的其它电子邮箱</font></th>
                            </tr>
                            <tr>
                                <th>
                                    <div align=right>
                                        <font color=#ff0000>*</font> 密码提示问题：
                                    </div>
                                </th>
                                <td><input style="width:200px" name=validateQuestion />
                                </td>
                                <th><font color=#ff0000>例如：我的哥哥是谁？</font></th>
                            </tr>
                            <tr>
                                <th>
                                    <div align=right>
                                        <font color=#ff0000>*</font> 密码提示答案：
                                    </div>
                                </th>
                                <td><input style="width:200px" name=validateAnswer />
                                </td>
                                <th><font color=#ff0000>注意：密码提示问题答案长度不少于6位</font></th>
                            </tr>

                            <tr>
                                <th>
                                    <div align=right>联系电话：</div>
                                </th>
                                <td><input style="width:200px" name=phone /></td>
                                <th><font color=#ff0000>请输入区号和真实的电话，以便我们与您联系</font></th>
                            </tr>
                            <tr>
                                <th>
                                    <div align=right>身份：</div>
                                </th>
                                <td>
                                    <select name="identity">
                                        <option value="student">student</option>
                                        <option value="teacher">teacher</option>
                                    </select>
                                </td>
                                <th><font color=#ff0000>选择学生身份可以直接完成注册,选择老师则需要管理员验证信息</font></th>
                            </tr>
                            <tr style="display: none;">
                                <th>
                                    <div align=right>验证码：</div>
                                </th>
                                <td><input style="width:200px" name=authCode /></td>
                                <th><a href="javascript:refrush();"> <img
                                        id="authCode" alt=authCode
                                        src='<c:url value="/authCode.servlet"/>'/></a>
                                </th>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan=3>
                                    <div align=center>
                                        <input style="CURSOR: hand" type=submit value='提交'/>
                                        &nbsp;&nbsp;
                                        <input style="CURSOR: hand" type=reset value='重置'/>
                                        &nbsp;&nbsp;
                                        <input style="CURSOR: hand" type=button onclick="javascript:history.go(-1);"
                                               value='返回'/>
                                    </div>
                                </td>
                            </tr>
                            </tfoot>

                        </table>
                    </form>
                </td>
            </tr>
        </table>

    </div>

</div>
</body>
</html>


