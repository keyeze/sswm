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
</head>
<style type="text/css">
    .info_item p#title {
        background: #64B1FF;
        display: block;
        color: #FFF;
        padding: 5px 10px;
    }

    .info_item {
        background: #FFF;
        margin: 0 10px;
    }

    strong#table_item {
        color: #64B1FF;
        padding-right: 30px;
        display: inline-block;

    }

</style>

<body>
<div class='info_item'>
    <p id='title'>个人资料</p>
    <blockquote style="padding-bottom:15px;">
        <form method="post" action="/alteruserinfo.action">
            <table width='100%' cols="5" style="table-layout:fixed;">
                <input type="hidden" name="userinfomation.userId" value="${user.id}"/>
                <input type="hidden" name="userinfomation.id" value="${userinfo.id}"/>
                <input type="hidden" name="user.id" value="${user.id}"/>
                <tr>
                    <td colspan="2" align="right"><strong id='table_item'>用户名:</strong></td>
                    <td colspan="3"><input type="text" name="user.username" value="${user.username}" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><strong id='table_item'>姓名:</strong></td>
                    <td colspan="3"><input type="text" name="userinfomation.name" value="${userinfo.name}"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><strong id='table_item'>性别:</strong></td>
                    <td colspan="3">
                        <input type=radio <c:if test="${userinfo!=null}"> ${userinfo.sex==0?'checked="checked"':""}</c:if> value=0 name=sex/>男
                        <input type=radio <c:if test="${userinfo!=null}"> ${userinfo.sex==1?'checked="checked"':""}</c:if>value=1 name=sex/>女
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><strong id='table_item'>年龄:</strong></td>
                    <td colspan="3"><input type="text" name="userinfomation.age" value="${userinfo.age}"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><strong id='table_item'>所属学校:</strong></td>
                    <td colspan="3"><input type="text" name="userinfomation.school" value="${userinfo.school}"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><strong id='table_item'>所属专业:</strong></td>
                    <td colspan="3"><input type="text" name="userinfomation.major" value="${userinfo.major}"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><strong id='table_item'>手机号码:</strong></td>
                    <td colspan="3"><input type="text" name="user.phone" value="${user.phone}"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><strong id='table_item'>Email:</strong></td>
                    <td colspan="3"><input type="text" name="user.email" value="${user.email}"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><strong id='table_item'>家庭住址:</strong></td>
                    <td colspan="3"><input type="text" name="userinfomation.address" value="${userinfo.address}"/></td>
                </tr>
                <tr style="height:40px;">
                <tr>
                    <td colspan="5" align="center"><input type="submit" value="修改"/><input type="reset" value="重置"/>
                    </td>
                    </td>
                </tr>
            </table>
        </form>
    </blockquote>
</div>

</body>
</html>
