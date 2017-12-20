<%--
  Created by IntelliJ IDEA.
  User: keyez
  Date: 2016/11/8
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/person.css" type="text/css"/>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
    <link rel="stylesheet" href="../person/css/person.css" type="text/css"/>
</head>
</head>
<body class="easyui-layout">

<div class='info_item'>
    <p id='title'>个人资料</p>
    <center>
        <blockquote style="padding-bottom:15px;">
            <form method="post">
                <table width='100%' cols="5" style="table-layout:fixed;">
                    <input type="hidden" name="userinfomation.userId" value="${user.id}"/>
                    <input type="hidden" name="userinfomation.id" value="${userinfo.id}"/>
                    <input type="hidden" name="user.id" value="${user.id}"/>
                    <tr>
                        <td colspan="2" align="right"><strong class='table_item'>用户名:</strong></td>
                        <td colspan="3"><input type="text" class="easyui-validatebox" name="user.username" value="${user.username}" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><strong class='table_item'>姓名:</strong></td>
                        <td colspan="3"><input type="text" class="easyui-validatebox" name="userinfomation.name" value="${userinfo.name}"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><strong class='table_item'>性别:</strong></td>
                        <td colspan="3">
                            <input type=radio
                            <c:if test="${userinfo!=null}"> ${userinfo.sex==0?'checked="checked"':""}</c:if> value=0 name=sex/>男
                            <input type=radio <c:if test="${userinfo!=null}"> ${userinfo.sex==1?'checked="checked"':""}</c:if>value=1 name=sex/>女
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><strong class='table_item'>年龄:</strong></td>
                        <td colspan="3"><input type="text" class="easyui-validatebox" name="userinfomation.age" value="${userinfo.age}"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><strong class='table_item'>所属学校:</strong></td>
                        <td colspan="3"><input type="text" class="easyui-validatebox" name="userinfomation.school" value="${userinfo.school}"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><strong class='table_item'>所属专业:</strong></td>
                        <td colspan="3"><input type="text" class="easyui-validatebox" name="userinfomation.major" value="${userinfo.major}"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><strong class='table_item'>手机号码:</strong></td>
                        <td colspan="3"><input type="text" class="easyui-validatebox" name="user.phone" value="${user.phone}"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><strong class='table_item'>Email:</strong></td>
                        <td colspan="3"><input type="text" class="easyui-validatebox" name="user.email" value="${user.email}"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><strong class='table_item'>家庭住址:</strong></td>
                        <td colspan="3"><input type="text" class="easyui-validatebox" name="userinfomation.address" value="${userinfo.address}"/></td>
                    </tr>
                    <tr style="height:40px;">

                    </tr>
                </table>

                <a href="javascript:void(0)" class="easyui-linkbutton" style="width:80px" onclick="">确定</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" style="width:80px" onclick="">重置</a>

            </form>
        </blockquote>
    </center>
</div>



</body>
</html>
