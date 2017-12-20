<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>
<style type='text/css'>
    .n_Main {
        width: 100%;
        display: table;
    }

    .n_Input_Box {
        width: 100%;
        height: 70px;
        margin: 5px;
        display: table-cell;
        vertical-align: top;
        text-align: center;
    }

    .n_postBtn {
        margin: 10px;
        display: inline;
    }

    .n_Input_text {
        width: 97%;
        height: 90px;
        outline: none;
    }

    .n_person_info {
        display: table-cell;
        text-align: center;
    }
</style>
<body>
<div class="n_Main">
    <div class="n_person_info">
        <img src='1.jpg' width="100px" height="100px" style="border-radius: 50%;overflow: hidden;"/>
        <br/>
        <p>小小明</p>
    </div>
    <div class="n_Input_Box">
        <div style="padding:5px;display:block;">
                <form name="nff" action="/addkula.action" method="post" target="n_id_iframe">

                <input type="hidden" name="labelAnswer.labelId" value="${labelId}"/>
                <div>
                    <textarea name="labelAnswer.content" class="n_Input_text"></textarea>
                </div>
                <div style="text-align:right;display:block;">
                    <p class="n_postBtn">
                        <a href="javascript:document.nff.submit();alert('回复成功');addaa(i);">回&nbsp复</a>
                        &nbsp&nbsp&nbsp
                        <a href="javascript:document.nff.reset();">重&nbsp置</a>
                    </p>
                </div>
            </form>
            <iframe id="n_id_iframe" name="n_id_iframe" style="display:none;"></iframe>
        </div>
    </div>
</div>

</body>
</html>