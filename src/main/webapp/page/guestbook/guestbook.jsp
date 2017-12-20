<%--
  Created by IntelliJ IDEA.
  User: keyez
  Date: 2017/4/11
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>留言板块</title>
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
    <script type="text/javascript" src="js/guestbook.js"></script>
    <link rel="stylesheet" href="css/guestbook.css" type="text/css"/>
</head>
<body class="easyui-layout" border="false" style="padding: 10px;margin: 0 auto;">
<%--
<div class="easyui-panel" style="width: 750px;">


    <div id="msg_item' + itemNum + '" name="msg_item" class="easyui-panel msg_item">
        <div class="top">
            <div>
                <laber><strong>标题:</strong>哈哈哈</laber>
                <laber><strong>摘要:</strong>哈哈哈</laber>
                <laber><strong>发件人:</strong>小明</laber>
                <laber><strong>发送时间:</strong>2011-02-01 下午 3:15</laber>
            </div>
            <div class="show">
                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="">查看</a>
            </div>

        </div>
        <div class="center">
            <hr/>
            <div class="left">
                <div>
                    <img src='../../image/1.jpg'/>
                </div>
                <span>小明</span>
            </div>
            <div class="right">

                <textarea readonly="readonly">
我害怕你心碎没人帮你擦眼泪
别离开身边
拥有你我的世界才能完美
他们猜 随便猜 不重要
连上彼此的讯号 才有个依靠
有太多人太多事
夹在我们之间咆哮
噪声太多讯号弱
就连风吹都要干扰
可是你不想一直走在黑暗地下道
想吹风 想自由 想要一起手牵手
去看海 绕世界流浪
我害怕你心碎没人帮你擦眼泪
别管那是非 只要我们感觉对
我害怕你心碎没人帮你擦眼泪
                </textarea>
            </div>
            <br/>
            <div class="answer">
                <hr/>
                <div>
                    <input type="text" class="easyui-validatebox" style="margin-left:50px;width: 500px;">
                    <a class="easyui-linkbutton" href="javascript:void(0)" onclick="">回复</a>
                    <a class="easyui-linkbutton" href="javascript:void(0)" onclick="">重置</a>
                </div>
                <br/>
                <div class="answer_items">

                    <div>
                        <div class="left">
                            <div>
                                <img src='../../image/1.jpg'/>
                            </div>
                            <span>小明</span>
                        </div>
                        <div class="right">

                        </div>
                    </div>

                    <br/>
                    <div>
                        <div class="left">
                            <div>
                                <img src='../../image/1.jpg'/>
                            </div>
                            <span>小明</span>
                        </div>
                        <div class="right">

                        </div>
                    </div>
                </div>
                <br/>

            </div>

        </div>
    </div>
</div>
<hr/>
--%>


</body>
</html>
