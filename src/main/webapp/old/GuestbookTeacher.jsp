<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>coursewareManage</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/css/jquery-custom-init.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/kindeditor/kindeditor.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/kindeditor/lang/zh_CN.js"></script>
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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/old/css/Guestbook.css">
    <%----%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/old/js/Guestbook.js"></script>
</head>
<style type="text/css">
    .header_menu {
        width: 1120px;
    }
</style>
<script>
    KindEditor.ready(function (K) {
        window.editor = K.create('#msgContent');
    });
</script>
<body>
<div id='wrapper'>
    <div class='mywin'>
        <div class="talk_wrapper">
            <div class="talk_title">
                <p id='title'>留言板:</p>
            </div>

            <div class="say_place" align="center">
                <div class="Main">
                    <div class="person_info" style="vertical-align:top;">
                        <img src='${user.headSrc}' width="200px" height="200px">
                        <br>
                        <p>小小明</p>
                    </div>
                    <form name="ff" action="#" method="post">
                        <div class="Input_Box">
                            <%--<input type="hidden" value="${testId}"/>--%>
                            <textarea id="msgContent" style="width: 885px;height: 200px;resize:none;"></textarea>
                        </div>
                        <p class="postBtn">
                            <%--<a href="javascript:document.ff.submit();">回&nbsp复</a>--%>
                            <a href="javascript:void(0)" class="easyui-linkbutton" style="width:60px" onclick="">回复</a>
                            <%--<a href="javascript:document.ff.reset();">重&nbsp置</a>--%>
                            <a href="javascript:void(0)" class="easyui-linkbutton" style="width:60px" onclick="">重置</a>
                        </p>
                    </form>
                </div>

            </div>

            <div class="talk_place" style="overflow: auto;">


                <%--<div class="item_taking">
                    <div style="display: table-row">
                        <div class='person'>
                            <p>第x楼</p>
                            <a href="PersonInfomation.jsp">
                                <img src='1.jpg' width="200px" height="200px" style="padding-bottom: 10px;">
                                <span style="display: block">小小明</span>
                            </a>
                        </div>
                        <div class='talk_box'>
                            <div class='talk_top'>
                                <p> 发布 2016年10月27日 星期四 0:53:
                                    <a href='Talk_And_Answer.jsp'>评论(670)</a></p>
                            </div>
                            <div class='talk'>
                                <p style="padding: 2% 4% 2% 4%">
                                    机枪扫射声中我们寻找遮蔽的战壕 儿时沙雕的城堡毁坏了重新盖就好 可是你那件染血布满弹孔的军 外套 却就连祷告 手都举不好 在硝烟中想起冰棒汽水的味道
                                    和那些无所事事一整个夏天的年少
                                    机枪扫射声中我们寻找遮蔽的战壕 儿时沙雕的城堡毁坏了重新盖就好 可是你那件染血布满弹孔的军 外套 却就连祷告 手都举不好 在硝烟中想起冰棒汽水的味道
                                    和那些无所事事一整个夏天的年少
                                    机枪扫射声中我们寻找遮蔽的战壕 儿时沙雕的城堡毁坏了重新盖就好 可是你那件染血布满弹孔的军 外套 却就连祷告 手都举不好 在硝烟中想起冰棒汽水的味道
                                    和那些无所事事一整个夏天的年少天
                                </p>
                            </div>
                        </div>
                    </div>

                    <div style="display: block;background: #f9f9f9;height: 300px">

                        <iframe src="Talk_And_Answer.jsp" width="100%"
                                style="width: 90%;height:95%;border: none;margin-left: 10%;"/>

                    </div>

                </div>--%>

                <%--<div class='item_taking'>
                    <div style='display: table-row'>
                        <div class='person'>
                            <p id='talkNum'>werewrw</p>
                            <a href='PersonInfomation.jsp'>
                                <img id='p_headImg' width='200px' height='200px' style='padding-bottom: 10px;'>
                                <span style='display: block' id='p_sendor'>ewrwerewr</span>
                            </a>
                        </div>
                        <div class='talk_box'>
                            <div class='talk_top'>
                                <p style="display: block;"> 发布于:<span id='p_createDate'>sdfsdf</span>
                                    <a id='answer_btn' href='javascript:void(0)' onclick=''>回复</a></p>
                            </div>
                            <div class='talk'>
                                <p style='padding: 2% 4% 2% 4%' id='content'>
                                    dsfsrwerewfdsf
                                </p>
                                &lt;%&ndash; <span style="display: block;">
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    </span>&ndash;%&gt;
                            </div>
                        </div>
                    </div>
                    <div class='answerDiv'>
                        <iframe id='answer' width='100%' style='width: 90%;height:95%;border: none;margin-left: 10%;'/>
                    </div>
                </div>--%>
                <%--  <div class="item_taking">
                     <div style="display: table-row">
                         <div class='person'>
                             <p>第x楼</p>
                             <a href="PersonInfomation.jsp">
                                 <img src='1.jpg' width="200px" height="200px" style="padding-bottom: 10px;">
                                 <span style="display: block">小小明</span>
                             </a>
                         </div>
                         <div class='talk_box'>
                             <div class='talk_top'>
                                 <p> 发布 2016年10月27日 星期四 0:53:
                                     <a href='Talk_And_Answer.jsp'>评论(670)</a></p>
                             </div>
                             <div class='talk'>
                                 <p style="padding: 2% 4% 2% 4%">
                                 </p>
                             </div>
                         </div>
                     </div>

                     <div style="display: block;background: #f9f9f9;height: 300px">

                         <iframe src="Talk_And_Answer.jsp" width="100%"
                                 style="width: 90%;height:95%;border: none;margin-left: 10%;"/>

                     </div>

                 </div>--%>

            </div>

            <div class="foot">
            </div>
        </div>
    </div>
</div>
</body>
</html>