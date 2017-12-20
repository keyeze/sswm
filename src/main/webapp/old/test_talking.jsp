<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>
<style type='text/css'>
    .body {
        text-align: center;
        margin: 0;
        padding: 0;
        border: 0;
        background: #C6E2FF;
        overflow: hidden;
        font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
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
        padding: 3px 0px;
        background: #DDD;
        padding: 2px 12px;
        display: table-row;
    }

    .talk {
        padding: 12px 20px;
        display: table-row;
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


</style>

<body>
<div class="talk_wrapper">
    <div class="talk_title">
        <p id='title'>评论区:</p>
    </div>
    <div class="say_place" align="center">
        <jsp:include page="answer.jsp"/>

    </div>

    <div class="talk_place">

        <div class="item_taking">
            <div class='person'>
                <p><br/>第x楼</p>
                <a href="PersonInfomation.jsp">

                    <img src='1.jpg' width="200px" height="200px"/>
                    <br/>
                    小小明
                </a>

                <p>好友:20 声望:600</p>


            </div>
            <div class='talk_box'>
                <div class='talk_top'>
                    <p> 发布 2016年10月27日 星期四 0:53:
                        <a href='#'>引用</a>
                        <a href='#'>赞(12)</a>
                        <a href='#'>踩(5)</a>
                        <a href='Talk_And_Answer.jsp'>评论(670)</a></p>
                </div>
                <div class='talk'>
                    <p>
                        机枪扫射声中我们寻找遮蔽的战壕 儿时沙雕的城堡毁坏了重新盖就好 可是你那件染血布满弹孔的军 外套 却就连祷告 手都举不好 在硝烟中想起冰棒汽水的味道 和那些无所事事一整个夏天的年少
                        机枪扫射声中我们寻找遮蔽的战壕 儿时沙雕的城堡毁坏了重新盖就好 可是你那件染血布满弹孔的军 外套 却就连祷告 手都举不好 在硝烟中想起冰棒汽水的味道 和那些无所事事一整个夏天的年少
                        机枪扫射声中我们寻找遮蔽的战壕 儿时沙雕的城堡毁坏了重新盖就好 可是你那件染血布满弹孔的军 外套 却就连祷告 手都举不好 在硝烟中想起冰棒汽水的味道 和那些无所事事一整个夏天的年少天
                    </p>
                </div>
            </div>
        </div>
        <div class="item_taking">
            <div class='person'>
                <p><br/>第x楼</p>
                <a href="PersonInfomation.jsp">

                    <img src='1.jpg' width="200px" height="200px"/>
                    <br/>
                    小小明
                </a>

                <p>好友:20 声望:600</p>


            </div>
            <div class='talk_box'>
                <div class='talk_top'>
                    <p> 发布 2016年10月27日 星期四 0:53:
                        <a href='#'>引用</a>
                        <a href='#'>赞(12)</a>
                        <a href='#'>踩(5)</a>
                        <a href='Talk_And_Answer.jsp'>评论(670)</a></p>
                </div>
                <div class='talk'>
                    <p>
                        机枪扫射声中我们寻找遮蔽的战壕 儿时沙雕的城堡毁坏了重新盖就好 可是你那件染血布满弹孔的军 外套 却就连祷告 手都举不好 在硝烟中想起冰棒汽水的味道 和那些无所事事一整个夏天的年少
                        机枪扫射声中我们寻找遮蔽的战壕 儿时沙雕的城堡毁坏了重新盖就好 可是你那件染血布满弹孔的军 外套 却就连祷告 手都举不好 在硝烟中想起冰棒汽水的味道 和那些无所事事一整个夏天的年少
                        机枪扫射声中我们寻找遮蔽的战壕 儿时沙雕的城堡毁坏了重新盖就好 可是你那件染血布满弹孔的军 外套 却就连祷告 手都举不好 在硝烟中想起冰棒汽水的味道 和那些无所事事一整个夏天的年少天
                    </p>
                </div>
            </div>
        </div>


    </div>


</div>
</body>
</html>