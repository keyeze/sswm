/**
 * Created by keyez on 2017/4/24.
 */

$(function () {
    CtChanOnloadMethod.queryInfo();
});
var CtChanOnloadMethod = {
    MSG_TYPE: 2,
    queryInfo: function () {
        $.ajax({
                url: ctx + "/msg/queryMsgInfo.do?msgId=" + msgId,
                dataType: 'json',
                type: 'GET',
                success: function (data) {
                    if (data.success) {
                        var result = data.result;
                        $("div.center div.info-row div h1").html(result.msgTitle);
                        $("#createDate").html("日期:" + result.p_createDate);
                        $("#sendor").html("发布人:" + result.p_sendor);
                        $("#msgContent").html(result.content);
                        $("#file").html(result.p_file);
                        $("#file").attr("href", ctx + "/msg/downFile.do?msgId=" + result.msgId);
                    } else {
                        alert(data.msg);
                    }

                }
            }
        )
    }
}