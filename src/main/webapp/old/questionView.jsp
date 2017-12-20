<%--
  Created by IntelliJ IDEA.
  User: keyez
  Date: 2016/11/10
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div name='question'>
    <strong><p id="question">${testbank.title}</p></strong>
    <blockquote>
        <div name='item_A' class='item'>正确选项.&nbsp;${testbank.rightSelect}</div>
        <div name='item_B' class='item'>其他选项.&nbsp;${testbank.errorSelect1}</div>
        <div name='item_C' class='item'>其他选项.&nbsp;${testbank.errorSelect2}</div>
        <div name='item_D' class='item'>其他选项.&nbsp;${testbank.errorSelect3}</div>
    </blockquote>
    <br/>
</div><!--questtion ending -->

</body>
</html>
