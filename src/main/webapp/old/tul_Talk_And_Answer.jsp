<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>
<style type='text/css'>
    .talk_item {
        display: block;
        margin-top: 10px;
        border-bottom: 1px solid #ddd;
        width: 100%;

    }

    .person_info {

        display: table-cell;
        vertical-align: top;
        margin: 5px;
    }

    .yuan_head {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        overflow: hidden;
        display: block;
    }

    .talk_body {
        display: table-cell;
        width: 100%;
        padding: 5px;
    }

    .talk_head {
        display: table-row;
        padding: 5px;
    }

    .talk_center {

    }

    .your_talk {
        display: block;
        width: 100%;
    }
</style>
<body>
<div class='your_talk' style="padding:20px 10px 20px 0px;">
    <jsp:include page="tul_answer.jsp?laberId=${labelId}"/>
</div>
<div style="overflow: auto;max-height:350px;padding:40px 15px 5px 20px;">
    <c:if test="${labelAnwsers!=null}">
        <c:forEach var="item" items="${labelAnwsers}" varStatus="i">
            <div class='talk_item'>
                <div class='person_info'>
                    <div class='yuan_head'>
                        <img id='head_img'
                             src='${answerUsers[i.index].imagePath==null?"/1.jpg":answerUsers[i.index].imagePath}'
                             width="50px" height="50px"/>
                    </div>
                </div>
                <div class='talk_body'>
                    <div class='talk_head'>
                        <a href='PersonInfomation.jsp?userId=${answerUsers[i.index].userId}'>${answerUsers[i.index].name}</a>&nbsp;&nbsp;&nbsp;
                        回复于:${item.answerDate}
                    </div>
                    <div class='talk_center'>
                            ${item.content}

                    </div>
                    <div class='talk_foot' align="right" style="padding-right:30px">
                        第${i.index+1}楼:
                        <a href='#'>回复</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>
</body>
</html>