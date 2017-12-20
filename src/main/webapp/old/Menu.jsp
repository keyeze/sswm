<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Meum</title>
    <style type="text/css">
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

        /* ~~ 此固定宽度容器包含所有其它 div ~~ */

        /* ~~ 以下是此布局的列。 ~~

        1) 填充只会放置于 div 的顶部和/或底部。此 div 中的元素侧边会有填充。这样，您可以避免使用任何“方框模型数学”。请注意，如果向 div 自身添加任何侧边填充或边框，这些侧边填充或边框将与您定义的宽度相加，得出 *总计* 宽度。您也可以选择删除 div 中的元素的填充，并在该元素中另外放置一个没有任何宽度但具有设计所需填充的 div。

        2) 由于这些列均为浮动列，因此未对其指定边距。如果必须添加边距，请避免在浮动方向一侧放置边距（例如：div 中的右边距设置为向右浮动）。在很多情况下，都可以改用填充。对于必须打破此规则的 div，应向该 div 的规则中添加“display:inline”声明，以控制某些版本的 Internet Explorer 会使边距翻倍的错误。

        3) 由于可以在一个文档中多次使用类（并且一个元素可以应用多个类），因此已向这些列分配类名，而不是 ID。例如，必要时可堆叠两个侧栏 div。您可以根据个人偏好将这些名称轻松地改为 ID，前提是仅对每个文档使用一次。

        4) 如果您更喜欢在右侧（而不是左侧）进行导航，只需使这些列向相反方向浮动（全部向右，而非全部向左），它们将按相反顺序显示。您无需在 HTML 源文件中移动 div。

        */
        .sidebar1 {
            float: left;
            width: 100%;
            background-color: #AAD5FF;
            padding-bottom: 10px;
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
        }

        ul.nav li {
            border-bottom: 1px solid #666; /* 这将创建按钮间隔 */
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

        /* ~~ 其它浮动/清除类 ~~ */
        .fltrt { /* 此类可用于在页面中使元素向右浮动。浮动元素必须位于其在页面上的相邻元素之前。 */
            float: right;
            margin-left: 8px;
        }

        .fltlft { /* 此类可用于在页面中使元素向左浮动。浮动元素必须位于其在页面上的相邻元素之前。 */
            float: left;
            margin-right: 8px;
        }

        .container {
            width: 100%;
            background-color: #AAD5FF;
            margin: 0 auto; /* 侧边的自动值与宽度结合使用，可以将布局居中对齐 */
            overflow: hidden; /* 此声明可使 .container 了解其内部浮动列的结束位置以及包含列的位置 */
        }

        -->
    </style>
</head>
<script type="text/javascript">
    var box1 = document.getElementById('show_course_1');
    var str = course_1.style.display
    function hideOrShow(x) {
        var item = document.getElementsByName('course').item(x).style;
        if (item.display == "block") {
            item.display = "none";
        } else {
            item.display = "block";
        }
    }
    function changeVideo(videoPath){
        document.getElementsByTagName('embed').item(0).src=videoPath;
    }

</script>

<body>

<div class="container">
    <div class="sidebar1">
        <ul class="nav">
            <c:if test="${knowledgebanks!=null}">
                <li>
                    <a href="#" onclick="hideOrShow(0)" style="display: none;">1 课程</a>
                    <ul class="nav">
                        <div name="course" style="display:none">
                            <c:forEach items="knowledgebanks" var="item">
                                <li><a href="javascript:changeVideo('${item.savepath}');">${item.courseName}</a></li>
                            </c:forEach>
                        </div>

                    </ul>
                </li>
            </c:if>
        </ul>
        <!-- end .sidebar1 --></div>

</body>
</html>