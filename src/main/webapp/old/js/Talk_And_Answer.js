/**
 * Created by keyez on 2017/4/27.
 */

$(function () {
    CtChanOnloadMethod.queryList();

});
CtChanOnloadMethod = {
    queryList: function () {
        var obj = {
            msgId: msgId
        }
        $.ajax({
            url: ctx + "/msg/queryAnswer.do",
            data: obj,
            dataType: 'json',
            success: function (data) {
                $("div.answers").empty();
                for (var i in data.result) {
                    var answerDiv = $(
                        "<div class='talk_item'>"
                        + "<div class='person_info'>"
                        + "<div class='yuan_head'>"
                        + "<img id='head_img' src='" + data.result[i].p_headImg + "' width='50px' height='50px'/>"
                        + "</div>"
                        + "</div>"
                        + "<div class='talk_body'>"
                        + "<div class='talk_head'>"
                        + "<a href='PersonInfomation.jsp'>" +
                        data.result[i].p_sendor + "</a>&nbsp;&nbsp;&nbsp;回复于:" + data.result[i].p_createDate
                        + "</div>"
                        + "<div class='talk_center'>"
                        + data.result[i].content
                        + "</div>"
                        + "</div>"
                        + "</div>"
                    );
                    answerDiv.appendTo("div.answers");
                }
            }
        })
    },
    MySubmit: function () {
        if (!$("form#nff").form('validate')) {
            $.messager.alert("系统提示", "检查信息是否输入有误", "info");
            return;
        }

        $.ajax({
            url: ctx + "/msg/saveAnswer.do",
            data: $("form#nff").serialize(),
            dataType: 'json',
            success: function (data) {
                if (data.success) {
                    $.messager.alert("系统提示", "回复成功", "info");
                    CtChanOnloadMethod.queryList();
                    document.nff.reset();
                } else {
                    $.messager.alert("系统提示", data.msg, "info");
                }
            }
        })

    }

}