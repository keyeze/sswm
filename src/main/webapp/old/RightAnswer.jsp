<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>
<style type='text/css'>
    .result_standard {
        margin: 5px 0;
        background: #64B1FF;
        padding: 20px 0;
    }

    .text {
        background: #FFF;
        padding: 20px;
        color: #000;
    }

    .foot {
        margin: 20px;
    }

    strong#title {
        margin: 0 15px;
    }

    div#talk {
        margin: 15px 0px 5px 0px;

    }

    .talk_wrapper {
        margin: 5px 0px 5px 0px;
        padding: 5px 0px 5px 0px;
        border: 0;
        width: 1110px;
        text-align: left;
        background: #FFF;
    }

    p#title {
        font-size: 24px;
        margin: 10px 0px;
        padding: 10px 5px;
        background: #DEC;

    }

    .talk_place {
        width: 100%;
        background: #FFF;

    }

    .item_taking {
        margin: 12px 0px 12px 0px;
        background: #DEC;
        display: block;
        padding: 0px 0px 0px 0px;
        width: 100%;

    }

    .person {
        width: 250px;
        background: #64B1FF;
        text-align: center;
        padding: 0px 0px 20px 0px;
        margin: 0px;
        display: table-cell;

    }

    .talk_box {
        width: 860px;
        min-height: 320px;
        background: #F9F9F9;
        display: table-cell;
        margin: 0px;
    }

    .talk_top {
        text-align: right;
        margin: 0px;
        height: 40px;
        background: #DDD;
        padding: 12px 20px;
        display: block;
    }

    .talk {
        padding: 12px 20px;
        display: block;
        display: block;
    }

    .p {
        margin: 1px;
        padding: 1px;
    }

    .say_place {
        display: table;
        background: #DEC;
        padding: 12px;
    }

    .Main {
        width: 500px;
        display: table;
    }

    .Input_box {
        width: 500px;
        height: 200px;
        background: #DDD;
        margin: 5px;
        padding: 5px 30px 5px 5px;
        display: table-cell;
    }

    .postBtn {
        float: right;
        margin: 5px;
    }

    .Input_text {
        width: 855px;
        height: 185px;
        resize: none;
        margin: 0px 0px 5px 20px;
        padding: 5px;
    }

    .person_info {
        display: table-cell;
        text-align: center;

    }
</style>
<script type="text/javascript">

</script>
<body>
<div class='result_standard'>
    <strong id='title'>答案解析:</strong>
    <blockquote>
        <div class='text'>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            ${testbank.answer}
        </div>
    </blockquote>
    <div class='foot' align="right">
        <a href='#'>赞(12)</a>
        <a href='#'>踩(32)</a>
    </div>
</div>
<div id='talk'>
    <div class="talk_wrapper">
        <div class="talk_title">
            <p id='title'>评论区:</p>
        </div>
        <div class="say_place" align="center">
            <jsp:include page="/test_answer.jsp?testId=${testbank.id}"/>
        </div>
        <div class="talk_place" style="max-height:800px;overflow:auto;">
            <c:if test="${testLabels!=null}">
                <c:forEach items="${testLabels}" var="item" varStatus="i">
                    <div class="item_taking">
                        <div class='person'>
                            <p><br/>第${i.index+1}楼</p>
                            <a href="PersonInfomation.jsp?userId=${answerUsers[i.index].userId}">
                                <img src='${answerUsers[i.index].imagePath==null?"/1.jpg":answerUsers[i.index].imagePath}'
                                     width="200px" height="200px"/>
                                <br/>
                                    ${answerUsers[i.index].name}
                            </a>
                            <p>好友:20 声望:600</p>
                        </div>
                        <div class='talk_box'>
                            <div>
                                <div class='talk_top'>
                                    <p style="width: 100%;display: block;"> ${item.pubDate}:
                                        <a href='#'>引用</a>
                                        <a href='#'>赞(${item.up})</a>
                                        <a href='#'>踩(${item.tread})</a>
                                        <a href='javascript:addtalk("${item.id}",${i.index})'>评论(${tula_counts[i.index]})</a>
                                    </p>
                                </div>
                                <div class='talk'>
                                    <p>
                                            ${item.label}
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div name="ula"></div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>