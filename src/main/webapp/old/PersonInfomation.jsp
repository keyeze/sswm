<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
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
    <script type="text/javascript" src="js/person.js"></script>
    <link rel="stylesheet" href="css/person.css" type="text/css"/>
</head>
<style type="text/css">
    .header_menu {
        width: 1120px;

    }
</style>

<body class="easyui-layout" border="false" style="padding: 10px">

<div id='wrapper'>
    <div class='header_menu'>
        <jsp:include page="Header.jsp"/>
    </div>
    <div class='mywin'>
        <div class='center'>
            <div class='left_center'>
                <div class='person_card'>
                    <strong style='color:#FFF' id="head_username"></strong>
                    <div class='person_card_inner'>
                        <br/>
                        <div class='person_head'><img width='180px' height='180px' id='head'
                                                      src='<c:url value="${user.headSrc}"/>' id="headImg"/></div>
                        <hr style='width:90%;color:#00F;'/>
                    </div>
                    <div align="center"><br/>
                        <input id="up_head_file" type="file" name="upHeadFile" style="display: none;"/>
                        <button onclick="$('#up_head_file').click();" style='width:80px;'>上传头像</button>
                        <button onclick="" style='width:80px;'>修改密码</button>
                    </div>
                </div>
            </div>
            <div class='right_center'>
                <div class='info_item'>
                    <p id='title1' style="color: #FFFFFF;background: #64B1FF;padding: 3px;">个人资料
                        <font align="right" style="display: inline-block;text-align:right;float: right;">
                            <button onclick="">修改</button>
                        </font>
                    </p>
                    <blockquote style="padding-bottom:15px;">
                        <table width='100%' cols="5" style="table-layout:fixed;">
                            <tr>
                                <td colspan="2"><strong id='username' class="table_item">用户名:</strong>${user.username}
                                </td>
                                <td colspan="3"><strong id='name' class="table_item">姓名:</strong>${user.name}</td>
                            </tr>
                            <tr>

                                <td colspan="2"><strong id='sex' class="table_item">性别:</strong>
                                    <c:if test="${user.sex == 0}">男</c:if>
                                    <c:if test="${user.sex == 1}">女</c:if>
                                </td>
                                <td colspan="3"><strong id='age' class="table_item">年龄:</strong>${user.age}</td>
                            </tr>

                            <tr>
                                <td colspan="2"><strong id='phone' class="table_item">手机号码:</strong>${user.phone}</td>
                                <td colspan="3"><strong id='email' class="table_item">Email:</strong>${user.email}</td>
                            </tr>
                            <tr>
                                <td colspan="2"><strong id='qq' class="table_item">QQ:</strong>${user.qq}</td>
                                <td colspan="3"><strong id='address' class="table_item">家庭住址:</strong>${user.address}
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"><strong id='last_login_date'
                                                        class="table_item">最后登录时间:</strong><fmt:formatDate
                                        value="${user.lastLoginDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                            <tr>
                                <td colspan="5"><strong id='create_date'
                                                        class="table_item">注册日期:</strong><fmt:formatDate
                                        value="${user.createDate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                        </table>
                    </blockquote>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="personWin" class="easyui-window" title="个人信息修改">

    <div class='info_item'>
        <p id='title'>个人资料</p>
        <center>
            <blockquote style="padding-bottom:15px;">
                <form method="post" id="pinInfo">
                    <table width='100%' cols="5" style="table-layout:fixed;">
                        <input type="hidden" name="userId" value="${user.userId}"/>
                        <tr>
                            <td colspan="2" align="right"><strong class='table_item'>用户名:</strong></td>
                            <td colspan="3"><input type="text" class="easyui-validatebox" name="username"
                                                   value="${user.username}" readonly="readonly"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right"><strong class='table_item'>姓名:</strong></td>
                            <td colspan="3"><input type="text" class="easyui-validatebox" name="name"
                                                   value="${user.name}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right"><strong class='table_item'>性别:</strong></td>
                            <td colspan="3">
                                <input type=radio
                                       <c:if test="${user.sex == 0}">checked="checked"</c:if> value="0" name="sex"/>男
                                <input type=radio
                                       <c:if test="${user.sex == 1}">checked="checked"</c:if> value="1" name="sex"/>女
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right"><strong class='table_item'>年龄:</strong></td>
                            <td colspan="3"><input type="text" class="easyui-validatebox" name="age"
                                                   value="${user.age}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right"><strong class='table_item'>QQ:</strong></td>
                            <td colspan="3"><input type="text" class="easyui-validatebox" name="qq"
                                                   value="${user.qq}"/></td>
                        </tr>
<%--                        <tr>
                            <td colspan="2" align="right"><strong class='table_item'>所属专业:</strong></td>
                            <td colspan="3"><input type="text" class="easyui-validatebox" name="userinfomation.major"
                                                   value="${userinfo.major}"/></td>
                        </tr>--%>
                        <tr>
                            <td colspan="2" align="right"><strong class='table_item'>手机号码:</strong></td>
                            <td colspan="3"><input type="text" class="easyui-validatebox" name="phone"
                                                   value="${user.phone}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right"><strong class='table_item'>Email:</strong></td>
                            <td colspan="3"><input type="text" class="easyui-validatebox" name="email"
                                                   value="${user.email}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right"><strong class='table_item'>家庭住址:</strong></td>
                            <td colspan="3"><input type="text" class="easyui-validatebox" name="address"
                                                   value="${user.address}"/></td>
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
</div>

<div id="pwdWin" class="easyui-window" title="修改密码" style="width:600px;height:400px">
    <form id="pwd" method="post" style="padding-top: 30px;">
        <table align="center" style="padding-bottom: 15px;">
            <tr>
                <td><label for="oldPwd"><strong class="table_item">原始密码</strong></label></td>
                <td><input class="easyui-validatebox" type="password" name="oldPwd" id="oldPwd" required="true"></td>
            </tr>
            <tr>
                <td><label for="newPwd"><strong class="table_item">新密码</strong></label></td>
                <td><input class="easyui-validatebox" type="password" name="newPwd" id="newPwd" required="true"></td>
            </tr>
            <tr>
                <td><label for="againPwd"><strong class="table_item">再次输入</strong></label></td>
                <td><input class="easyui-validatebox" type="password" name="againPwd" id="againPwd" required="true">
                </td>
            </tr>
        </table>
        <center>
            <a href="javascript:void(0)" class="easyui-linkbutton" style="width:80px" onclick="">确定</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" style="width:80px" onclick="">重置</a>
        </center>
    </form>
</div>
</body>
</html>