/**
 * Created by keyez on 2017/5/1.
 */
$(function () {
    var obj = {
        MSG_TYPE_ID: CtChanOnloadMethod.MSG_TYPE_ID
    }
    $.ajax({
        url: ctx + "/msg/queryMsg.do",
        type: 'post',
        data: obj,
        dataType: 'json',
        success: function (data) {
            for (var i in data.rows) {
                var liitem = $("<li>"
                    + "<a href='javascript:changeVideo(" + i + ");'>" + data.rows[i].msgTitle + "</a>"
                    + "<div name='hid' style='display: none;'>" + data.rows[i].msgId + "</div>"
                    + "<div name='hid2' style='display: none;'>" + data.rows[i].content + "</div>"
                    + "</li>");
                liitem.appendTo("#course");
            }

        }
    });

})
function changeVideo(i) {
    var src = $("div[name='hid2']").eq(i).html();
    $("#movie").attr("src", src);
}
var CtChanOnloadMethod = {
    MSG_TYPE_ID: 13
}