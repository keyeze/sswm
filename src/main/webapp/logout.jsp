<%--
  Created by IntelliJ IDEA.
  User: keyez
  Date: 2017/4/30
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/jquery/jquery.min.js"></script>
</head>
<script>
    var ctx = '<%=request.getContextPath()%>';
    $(function () {
        $.ajax({
            url: ctx + "/user/logout.do",
            success: function (data) {
                window.location.href = ctx + "/login.jsp";
            },
            error: function () {
                alert("注销失败!");
                window.location.href = ctx + "/old/Welcome.jsp";
            }
        })
    })
</script>
<body>

</body>
</html>
