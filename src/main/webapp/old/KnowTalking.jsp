<%--
  Created by IntelliJ IDEA.
  User: keyez
  Date: 2016/11/10
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">

</script>
<body>
<div id='talk'>
    <div class="talk_wrapper">
        <div class="talk_title">
            <p id='title'>评论区:</p>
        </div>
        <div class="say_place" align="center">
            <jsp:include page="/know_answer.jsp?knowId=${knowbank.id}"/>
        </div>

        <div class="talk_place" style="max-height:800px;overflow:auto;">
            <c:if test="${knowLabels!=null}">
                <c:forEach items="${knowLabels}" var="item" varStatus="i">
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
                                        <a href='javascript:addtalk("${item.id}", ${i.index});'>评论(${kula_counts[i.index]})</a>
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
