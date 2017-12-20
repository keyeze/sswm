<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/lib/jquery/jquery.min.js"></script>
    <script>
        var ctx = "<%=request.getContextPath()%>"
    </script>
</head>
<body>
<div style="display: inline-block;padding: 5px;">
    <label for="url" style="width: 30px">url:</label><input type="text" id="url" style="width:400px">
    <button style="width: 50px">请求</button>
    <br/><br/>
    <label for="json" style="vertical-align: top">data:</label><br/>
    <textarea id="json" style="width:480px;height: 300px;resize: none;"></textarea><br/>
</div>
<div style="display: inline-block;vertical-align: top">
    <br/>
    <label for="type">method:</label>
    <div style="margin-left: 50px">
        <input type="radio" id="GET" name="type" class="type" VALUE="GET" checked>GET
        <input type="radio" id="POST" name="type" class="type" VALUE="POST">POST<br/>
    </div>
    <br/><br/>
    <label for="dataConvert">dataConvert:</label><br/>
    <div style="margin-left: 50px">
        <input type="radio" id="default" name="dataConvert" class="dataConvert" value="default" checked>默认<br/>
        <input type="radio" id="traditional" name="dataConvert" class="dataConvert" value="traditional">使用traditional（tradtional=true）<br/>
        <input type="radio" id="jsonStr" name="dataConvert" class="daetConvert" value="jsonStr">将数据转为JsonStr格式<br/>
    </div>
    <br/><br/>
    <label for="address">address:</label><br/>
    <div style="margin-left: 50px">
        <input type="radio" id="inner" name="address" class="address" value="inner" checked>内网
        <input type="radio" id="outer" name="address" class="address" value="outer">外网
    </div>
</div>
</body>
<script>
    $(function () {
        $("label#url").css("width", $("label#json").css("width"));
        $("button").on("click", function () {
            ajaxForm =
                {
                    dataType: "json",
                    type: $('input.type:checked').val(),
                    success: function (data) {
                        console.log(data);
                    }
                };
            if ($("#inner").prop("checked")) {
                ajaxForm.url = ctx + "/" + $('input#url').val();
            } else {
                ajaxForm.url = $('input#url').val();
            }
            if ($("#jsonStr").prop("checked")) {
                ajaxForm.contentType = 'application/json;charset=utf-8';
                ajaxForm.data = JSON.stringify(eval('(' + $('#json').val() + ')'));
            } else {
                ajaxForm.data = eval('(' + $('#json').val() + ')');
            }
            ajaxForm.traditional = $("#traditional").prop("checked");
            $.ajax(ajaxForm);
        });

    })
    var ajaxForm = {};
    var myData = function () {
        if ($("#jsonStr").prop("checked")) {
            ajaxForm.contentType = 'application/json;charset=utf-8';
            return JSON.stringify(eval('(' + $('#json').val() + ')'));
        } else {
            return eval('(' + $('#json').val() + ')');
        }

    }
</script>
</html>