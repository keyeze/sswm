<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>
<style type='text/css'>
    .person_head {
        width: 180px;
        height: 180px;
        border-radius: 50%;
        overflow: hidden;
        margin: 0px 10px 8px 10px;
        background: #000;
    }

    .center {
        width: 100%;
        background: #DEC;
    }

    .left_center {
        display: table-cell;
        background: #FFF;
        padding: 0 10px;
        vertical-align: top;
    }

    .right_center {
        display: table-cell;
        background: #FFF;
        width: 100%;
    }

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

    .circle {
        width: 120px;
        height: 120px;
        position: absolute;
        border-radius: 50%;
    }

    .pie_left, .pie_right {
        width: 120px;
        height: 120px;
        position: absolute;
        top: 0;
        left: 0;
    }

    .left, .right {
        display: block;
        width: 120px;
        height: 120px;
        border-radius: 50%;
        position: absolute;
        background: #DEC;
        top: 0;
        left: 0;

    }

    .pie_right, .right {
        clip: rect(0, auto, auto, 60px);
    }

    .pie_left, .left {
        clip: rect(0, 60px, auto, 0);
    }

    .mask {
        width: 90px;
        height: 90px;
        border-radius: 50%;
        left: 15px;
        top: 15px;
        background: #FFF;
        position: absolute;
        text-align: center;
        line-height: 90px;
        font-size: 16px;
    }

    .circle_wrapper {
        width: 130px;
        height: 120px;
        display: table-cell;
        vertical-align: top;

    }

    .person_card {
        width: 200px;
        height: 400px;
        background: #64B1FF;
        border-radius: 5px;
        margin: 15px 0;
        overflow: hidden;
        padding: 5px;

    }

    .person_card_inner {
        width: 100%;
        height: 81%;

        background: #FFF;

    }

    .Progress {
        background: #64B1FF;
        padding: 5px 0px 2px 0px;

    }

    .Progress_bar {
        width: 62%;
        border: 2px solid #FFF;
        border-radius: 20px;
        background: #FFF;
        height: 15px;
        display: inline-block;
        overflow: hidden;
        border: 1px solid #64B1FF;
        text-align: center;
        position: relative;

    }

    #Progress_bar_block {
        position: absolute;
        top: 0;
        left: 0;
        width: 60%;
        background: #DEC;
        color: #000;
        display: inline-block;
        float: left;
        border-radius: 20px;
        height: 100%;
        text-align: center;
        font-size: 0.6em;

    }

    ul.friendOL_ul, ul.friendNOL_ul {
        display: none;
    }

    ul.friendOL_ul li {
        color: #0F0;
    }

    ul.friendOL_ul li a:link, visited {
        color: #000;
        text-decoration: none;

    }

    ul.friendOL_ul li a:hover, active {
        color: #0CF;
        text-decoration: none;

    }

    ul.friendNOL_ul li {
        color: #F00;
    }

    ul.friendNOL_ul li a:link, visited {
        color: #000;
        text-decoration: none;

    }

    ul.friendNOL_ul li a:hover, active {
        color: #0CF;
        text-decoration: none;

    }

    table#awr td {
        text-align: center;
        border: 1px solid;
    }
</style>
<script type="text/javascript">
    function dosomething() {
        for (var i = 0; i < document.getElementsByClassName('circle').length; i++) {
            var num = document.getElementsByClassName('circle').item(i).getElementsByTagName('span').item(0).innerHTML * 3.6;
            if (num <= 180) {
                document.getElementsByClassName("right").item(i).style.transform = ("rotate(" + num + "deg)");
            } else {
                document.getElementsByClassName("left").item(i).style.transform = ("rotate(" + (num - 180) + "deg)");
                document.getElementsByClassName("right").item(i).style.transform = ("rotate(180deg)");
            }
        }
    }
    window.onload = dosomething;
    function show(n, aaa) {
        document.getElementsByClassName(aaa).item(0).style.display = 'block';
        document.getElementsByName('bb').item(n).href = "javascript:hide(" + n + ",'" + aaa + "')";


    }
    function hide(n, aaa) {
        document.getElementsByClassName(aaa).item(0).style.display = 'none';
        document.getElementsByName('bb').item(n).href = "javascript:show(" + n + ",'" + aaa + "')";

    }
    function ccccc() {
        window.open('${t_url}', '注册', 'height=600,width=450,top=10,left=10, toolbar=no, menubar=no,scrollbars=no, resizable=no,location=no, status=no');
    }
</script>
<body>
<div class='center'>
    <div class='left_center'>
        <div class='person_card'>
            <strong style='color:#FFF'>小小明</strong><br/>
            见习学生 五级
            <div class='person_card_inner'>
                <br/>
                <div class='person_head'><img width='180px' height='180px' src='1.jpg'/></div>
                <hr style='width:90%;color:#00F;'/>
                <div style='width:90%;color:#00F;'>
                    <strong id='table_item'
                            style="font-size:12px;padding:10px 0px 4px 10px">答&nbsp;&nbsp;题&nbsp;&nbsp;数</strong>
                    <div class="Progress_bar" style="height:10px">
                        <strong id="Progress_bar_block" style="background:#FC0;"></strong>
                        <strong id="Progress_bar_block" style="background:none;width:100%"> <span>12/60</span>
                        </strong>
                    </div>
                    <strong id='table_item' style="font-size:12px;padding:4px 0px 4px 10px">学习进度</strong>
                    <div class="Progress_bar" style="height:10px">
                        <strong id="Progress_bar_block" style="background:#6F9;"></strong>
                        <strong id="Progress_bar_block" style="background:none;width:100%"> <span>12/60</span>
                        </strong>
                    </div>
                    <strong id='table_item'
                            style="font-size:12px;padding:4px 0px 4px 10px">回&nbsp;&nbsp;帖&nbsp;&nbsp;数</strong>
                    <div class="Progress_bar" style="height:10px">
                        <strong id="Progress_bar_block" style="background:#FF3;"></strong>
                        <strong id="Progress_bar_block" style="background:none;width:100%"> <span>12/60</span>
                        </strong>
                    </div>
                </div>
            </div>
            <%--  <div align="right">
                  <font>好友数量:15</font>
                  <button onclick="" style='width:60px;'>关&nbsp;注</button>
              </div>
          </div>
           <div class='info_item'>
               <p id='title'>好友列表(12/50 )</p>
               <a name='bb' href="javascript:show(0,'friendOL_ul');" style="display:block">在线好友</a>
               <ul class='friendOL_ul'>
                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>

               </ul>
               <a name='bb' href="javascript:show(1,'friendNOL_ul');" style="display:block">离线好友</a>
               <ul class='friendNOL_ul'>

                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>
                   <li><a href='#'>小明</a></li>
               </ul>
           </div>--%>

        </div>

        <div class='right_center'>
            <div class='info_item'>
                <p id='title'>个人资料<font align="right" style="display: inline-block;text-align:right;float: right;"><a
                        href="javascript:ccccc();">修改</a></font></p>
                <blockquote style="padding-bottom:15px;">
                    <table width='100%' cols="5" style="table-layout:fixed;">
                        <tr>
                            <td colspan="3"><strong id='table_item'>用户名:</strong>${user.username}</td>
                            <td colspan="2"><strong id='table_item'>姓名:</strong>小小明</td>
                        </tr>
                        <tr>

                            <td colspan="2"><strong id='table_item'>性别:</strong>男</td>
                            <td colspan="3"><strong id='table_item'>年龄:</strong>12</td>

                        </tr>
                        <tr>
                            <td colspan="2"><strong id='table_item'>所属学校:</strong>吉首大学</td>
                            <td colspan="3"><strong id='table_item'>所属专业:</strong>计算机科学与技术</td>
                        </tr>

                        <tr>
                            <td colspan="2"><strong id='table_item'>手机号码:</strong>${user.phone}</td>
                            <td colspan="2"><strong id='table_item'>Email:</strong>${user.email}</td>
                            <td align="center"><a href='#'>验证</a></td>
                        </tr>
                        <tr>
                            <td colspan="5"><strong id='table_item'>家庭住址:</strong>北京市东花市北里20号楼6单元501室</td>
                        </tr>
                        <tr>
                            <td colspan="5"><strong id='table_item'>最后登录时间:</strong>${user.lastLogin}</td>
                        </tr>
                    </table>
                </blockquote>
            </div>
            <div class='info_item'>
                <p id='title'>学习情况</p>
                <blockquote style="padding-bottom:15px;display:table;table-layout:fixed;width:100%;">
                    <div style='display:table-cell;width:45%;'>
                        <strong id='table_item'>学业进展:</strong>
                        <blockquote>
                            <div class="circle_wrapper">
                                <div class="circle" style='background:#0C0'>
                                    <div class="pie_left">
                                        <div class="left"></div>
                                    </div>
                                    <div class="pie_right">
                                        <div class="right"></div>
                                    </div>
                                    <div class="mask"><span>67.5</span>%</div>
                                </div>
                            </div>
                            <div style="display:table-cell">
                                <p>直至目前,你一共学会了 20 章知识.</p>
                                <p>击败了目前76%的学生</p>
                                <p>接下来你还需要学习 40 章知识点</p>
                                <p align="right"><a href='http://localhost/mytest/KnowStudy.jsp'>立即学习</a></p>

                            </div>
                        </blockquote>

                    </div>
                    <div style='display:table-cell;width:50%;'>
                        <strong id='table_item'>在线测试:</strong>
                        <blockquote>
                            <div class="circle_wrapper">
                                <div class="circle" style='background:#0CF'>
                                    <div class="pie_left">
                                        <div class="left"></div>
                                    </div>
                                    <div class="pie_right">
                                        <div class="right"></div>
                                    </div>
                                    <div class="mask"><span>45</span>%</div>
                                </div>
                            </div>
                            <div style="display:table-cell">
                                <p>您已经做了798道题啦,击败了目前76%的学生</p>
                                <p>其中正确的有532道,正确率有45%</p>
                                <p align="right"><a href='http://localhost/mytest/TestOnline.jsp'>我要刷题 </a></p>


                            </div>
                        </blockquote>
                    </div>
                </blockquote>

            </div>
            <div class='info_item'>
                <p id='title'>评论动态</p>
                <blockquote style="padding-bottom:15px;">
                    <table id='awr' align="center" width="80%">

                        <tr>
                            <th>编号</th>
                            <th>主题</th>
                            <th>回复动态</th>
                            <th>最后回复人</th>
                            <th>最后回复时间</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="#">请问1+1等于几?</a></td>
                            <td><a href="#">10条<font color="red">new</font></a></td>
                            <td><a href="#">小小明</a></td>
                            <td>2016-11-4 1:32</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><a href="#">请问11+1等于几?</a></td>
                            <td><a href="#">7条<font color="red">new</font></a></td>
                            <td><a href="#">小小明</a></td>
                            <td>2016-11-4 1:32</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><a href="#">请问1+11等于几?</a></td>
                            <td><a href="#">7条<font color="red">new</font></a></td>
                            <td><a href="#">小小明</a></td>
                            <td>2016-11-4 1:32</td>
                        </tr>

                    </table>

                </blockquote>

            </div>

        </div>

    </div>

</body>
</html>