<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%----%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/old/js/KnowStudy.js"></script>

</head>

<style type="text/css">

    div#wrapper {
        margin: 0 auto;
        padding: 5px 5px 5px 5px;
        border: 0;
        width: 1134px;
        text-align: left;
        background: #64B1FF;
    }

    div.mywin {
        margin: 0 5px 5px 5px;
        padding: 10px 0;
        border: 0;
        width: 1120px;
        min-height: 600px;
        text-align: left;
        background: #FFF;
    }

    div.video {
        padding: 5px 0px 5px 5px;
        width: 80%;
        display: inline-block;
        vertical-align: top;

    }

    div.select {
        padding: 5px 0px 5px 5px;
        display: inline-block;
        width: 18%;

    }

    div#talk {
        margin: 20px 5px 5px 5px;
        background: #FFF;
        padding: 5px;

    }

    .header_menu {
        width: 1120px;

    }

    <!--

    /* ~~ 元素/标签选择器 ~~ */
    ul, ol, dl { /* 由于浏览器之间的差异，最佳做法是在列表中将填充和边距都设置为零。为了保持一致，您可以在此处指定需要的数值，也可以在列表所包含的列表项（LI、DT 和 DD）中指定需要的数值。请注意，除非编写一个更为具体的选择器，否则您在此处进行的设置将会层叠到 .nav 列表。 */
        padding: 0;
        margin: 0;
    }

    h1, h2, h3, h4, h5, h6, p {
        margin-top: 0; /* 删除上边距可以解决边距会超出其包含的 div 的问题。剩余的下边距可以使 div 与后面的任何元素保持一定距离。 */
        padding-right: 15px;
        padding-left: 15px; /* 向 div 内的元素侧边（而不是 div 自身）添加填充可避免使用任何方框模型数学。此外，也可将具有侧边填充的嵌套 div 用作替代方法。 */
    }

    a img { /* 此选择器将删除某些浏览器中显示在图像周围的默认蓝色边框（当该图像包含在链接中时） */
        border: none;
    }

    /* ~~ 站点链接的样式必须保持此顺序，包括用于创建悬停效果的选择器组在内。 ~~ */
    a:link {
        color: #42413C;
        text-decoration: underline; /* 除非将链接设置成极为独特的外观样式，否则最好提供下划线，以便可从视觉上快速识别 */
    }

    a:visited {
        color: #FFFFFF;
        text-decoration: underline;
    }

    a:hover, a:active, a:focus { /* 此组选择器将为键盘导航者提供与鼠标使用者相同的悬停体验。 */
        text-decoration: none;
    }

    .sidebar1 {
        float: left;
        width: 100%;
        background-color: #AAD5FF;
        padding-bottom: 10px;
        height: 530px;
        overflow: hidden;
    }

    /* ~~ 此分组的选择器为 .content 区域中的列表提供了空间 ~~ */
    .content ul, .content ol {
        padding: 0 15px 15px 40px; /* 此填充反映上述标题和段落规则中的右填充。填充放置于下方可用于间隔列表中其它元素，置于左侧可用于创建缩进。您可以根据需要进行调整。 */
    }

    /* ~~ 导航列表样式（如果选择使用预先创建的 Spry 等弹出菜单，则可以删除此样式） ~~ */
    ul.nav {
        list-style: none; /* 这将删除列表标记 */
        border-top: 1px solid #666; /* 这将为链接创建上边框 – 使用下边框将所有其它项放置在 LI 中 */
        margin-bottom: 15px; /* 这将在下面内容的导航之间创建间距 */
        max-height: 530px;
        overflow: auto;
    }

    ul.nav li {
        border-bottom: 1px solid #666; /* 这将创建按钮间隔 */
        overflow: hidden;
    }

    ul.nav a, ul.nav a:visited { /* 对这些选择器进行分组可确保链接即使在访问之后也能保持其按钮外观 */
        padding: 5px 5px 5px 15px;
        display: block; /* 这将为链接赋予块属性，使其填满包含它的整个 LI。这样，整个区域都可以响应鼠标单击操作。 */
        width: 100%; /*此宽度使整个按钮在 IE6 中可单击。如果您不需要支持 IE6，可以删除它。请用侧栏容器的宽度减去此链接的填充来计算正确的宽度。 */
        text-decoration: none;
        background-color: #64B1FF;
    }

    ul.nav a:hover, ul.nav a:active, ul.nav a:focus { /* 这将更改鼠标和键盘导航的背景和文本颜色 */
        background-color: #0080FF;
        color: #FFF;
    }

    .container {
        width: 100%;
        background-color: #AAD5FF;
        margin: 0 auto; /* 侧边的自动值与宽度结合使用，可以将布局居中对齐 */
        overflow: hidden; /* 此声明可使 .container 了解其内部浮动列的结束位置以及包含列的位置 */
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

    -->
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

<body>
<div id='wrapper'>
    <div class='header_menu'>
        <jsp:include page="Header.jsp"/>
    </div>
    <div class='mywin'>
        <div class="video">
            <embed id="movie" src='/image/1.jpg' quality='high' width='100%'
                   height='530' align='middle' allowScriptAccess='always' allowFullScreen='true' mode='transparent'
                   type='application/x-shockwave-flash'></embed>
        </div>
        <div class='select'>
            <div class="container">
                <div class="sidebar1">
                    <ul class="nav">
                        <li>
                            <a href="javascript:hideOrShow(0);">课程</a>
                            <ul class="nav">
                                <div id="course">
                                </div>

                            </ul>
                        </li>
                    </ul>
                    <!-- end .sidebar1 --></div>
            </div>
        </div>
    </div>
    <div id="runJsp_Know">

    </div>
</div>
</body>
</html>