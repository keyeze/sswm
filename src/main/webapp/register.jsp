<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link rel="stylesheet" type="text/css" id="css" href="js/css/style/main.css"/>
    <link rel="stylesheet" type="text/css" id="css" href="js/css/style/style1.css"/>
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
    <script type='text/javascript'>
        function refrush() {
            this.authCode.src = '<c:url value="/authCode.servlet"/>' + "?time=" + new Date().getTime();
        }
        $(function () {
            $('form#register').form({
                url: ctx + '/user/register.do',
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (data) {
                    var obj = JSON.parse(data);
                    if (obj.success) {
                        window.location.href = ctx + '/login.jsp';
                    } else {
                        alert(obj.msg);
                    }
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                /*必须和某个字段相等*/
                equalTo: {
                    validator: function (value, param) {
                        return $(param[0]).val() == value;
                    },
                    message: '两次输入密码不一致'
                }

            });
        })

    </script>

    <style type="text/css">
        body {
            text-align: left;
        }

        div#center {
            margin: auto;
        }

        form {
            display: table;
        }

        form div {
            display: table-row;

        }

        form div div, form div input, form div font {
            display: table-cell;
            padding-left: 10px;
            padding-top: 10px;
        }

        form div font {
            text-align: left;
        }

        form div div font {
            text-align: right;
            display: inline;
        }

        form div div {
            padding-left: 0;
            width: 100px;
        }

        form div.foot {
            display: table-footer-group;
            width: 100%;
            text-align: center;
        }

        form div.foot div input {
            margin-left: 5px;
            padding: 3px;
        }

    </style>

</head>

<body class="easyui-layout">
<div id="center">
    <div style="text-align: center">
        <font face="Arial, Helvetica, sans-serif"><b>
            请填写个人资料：（注意带有<font color=#ff0000>*</font>的项目必须填写）
        </b></font>
    </div>
    <br/>
    <form action='javascript:void(0);' method=post id="register">

        <div>
            <div align="right"><font color=#ff0000>*</font>用户名：</div>

            <input class="easyui-validatebox" maxlength=14 name='username' style="width:200px" required="true">
            <font color=#ff0000>昵称可使用长度为0-16的任何字符</font>

        </div>
        <div>
            <div align="right"><font color=#ff0000>*</font> 密码：</div>
            <input type='password' maxlength=20 style="width:200px" name='password' class="pwd easyui-validatebox"
                   validType="length[6,20]" invalidMessage="长度不足6个字符" id="pwd" required="true">
            <font color=#ff0000>密码可使用长度为6-20的任何字符，并区分英文字母大小写</font>

        </div>
        <div>
            <div align=right>
                <font color=#ff0000>*</font>密码确认：
            </div>

            <input type='password' maxlength=14 style="width:200px" name='PASSWORD_AGAIN' class="pwd easyui-validatebox"
                   required="required" validType="equalTo['#pwd']">

            <font color=#ff0000>请再输入一次密码</font>

        </div>
        <div>
            <div align=right>电子邮箱：</div>

            <input maxlength=30 style="width:200px" name='email' class="easyui-validatebox"
                   data-options="validType:'email'">
            <font color=#ff0000>请输入您常用的其它电子邮箱</font>

        </div>
        <div>
            <div align=right><font color=#ff0000>*</font>密码提示问题：</div>

            <input style="width:200px" name='pwdQuestion' class="easyui-validatebox"
            <%--required="true"--%>>

            <font color=#ff0000>例如：我的哥哥是谁？</font>
            </tr>

        </div>
        <div>
            <div align=right><font color=#ff0000>*</font>密码提示答案：</div>
            <input style="width:200px" name='pwdAnswer' class="easyui-validatebox" <%--required="true"--%>>
            <font color=#ff0000>注意：密码提示问题答案长度不少于6位</font>
        </div>
        <div>
            <div align=right>联系电话：</div>
            <input style="width:200px" name='phone' class="easyui-validatebox" <%--required="true"--%>>
            <font color=#ff0000>请输入区号和真实的电话，以便我们与您联系</font>
        </div>
        <div>
            <div align=right>身份：</div>
            <select name="root">
                <option value="">请选择</option>
                <option value="0">student</option>
                <option value="1">teacher</option>
            </select>
            <font color=#ff0000>选择用户身份</font>
        </div>
        <%--
            <div>
                <div align=right>验证码：</div>
                <input style="width:60px;padding-left: 0;padding-top:0;" name='authCode'>
                <a href="javascript:refrush();">
                    <img id="authCode" class="easyui-validatebox" src='<c:url value="/authCode.servlet"/>'/>
                </a>
            </div>
        --%>
        <div class="foot">
            <div></div>
            <div>
                <input class="easyui-linkbutton" type='submit' value='提交' onclick="register.submit();">
                <input class="easyui-linkbutton" type='reset' value='重置'>
                <input class="easyui-linkbutton" type='button' onclick="javascript:history.go(-1);" value='返回'>
            </div>
        </div>
    </form>


</div>
</body>
</html>


