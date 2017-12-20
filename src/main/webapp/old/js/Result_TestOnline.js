var max = 10;
var i = 1;
var j = 1;
function next() {
    if (i >= max) {
        alert('已经是最后一个,');
        return;
    }
    go(i + 1);

}
function pervious() {
    if (i <= 1) {
        alert('已经是第一个');
        return;
    }
    go(i - 1);
}

function go(num) {
    i = num;
    var str = $(".qbtn").eq(num - 1).find(".hid").val();
    var vi = $(".qbtn").eq(num - 1).find(".hid2").val();
    if (vi == 'true') {
        document.getElementById('isRight').style = "background:#0F0";
        document.getElementById('isRight').innerText = "√正确";
    }
    else {
        document.getElementById('isRight').style = "background:#F00";
        document.getElementById('isRight').innerText = "×错误";
    }
    document.getElementById('span_process').innerText = num + "/10";
    document.getElementById('Progress_bar_block').style.width = num * 10 + '%';
    document.getElementById("item_number").innerText = '第' + num + '题';
    CtChanOnloadMethod.showAnswer(num - 1);
}

$(function () {
    for (var i in data) {
        var numItem = $(
            "<div id='s_btn' class='btn qbtn' style='background:" + (data[i].isRight == 'false' ? "#F00" : "#0F0" ) + ";width:60px;' align='center'>"
            + "<a name='kk' class='btn' style='width:60px;' href='javascript:go(" + (eval(i) + 1) + ");'>" + (eval(i) + 1) + "</a>"
            + "<input type='hidden' class='hid' value='" + data[i].testId + "'>"
            + "<input type='hidden' class='hid2' value='" + data[i].isRight + "'>"
            + "</div>");
        numItem.appendTo(".numbar");
    }
    go(1);
});
var CtChanOnloadMethod = {
    showAnswer: function (item) {
        var obj = {
            TEST_ID: $("input.hid").eq(item).val()
        }
        $.ajax({
            url: ctx + "/test/queryTest.do",
            data: obj,
            dataType: 'json',
            success: function (data) {
                $("div#item_body").empty();
                var showQAS = $(
                    "<div name='question'>"
                    + "<strong><p id='question'>" + data.rows[0].title + "</p></strong>"
                    + "<blockquote>"
                    + "<div class='item'>正确选项、&nbsp;" + data.rows[0].rightselect + "</div>"
                    + "<div class='item'>其他选项、&nbsp;" + data.rows[0].errorselect1 + "</div>"
                    + "<div class='item'>其他选项、&nbsp;" + data.rows[0].errorselect2 + "</div>"
                    + "<div class='item'>其他选项、&nbsp;" + data.rows[0].errorselect3 + "</div>"
                    + "</blockquote>"
                    + "<br/>"
                    + "</div>"
                );
                showQAS.appendTo("div#item_body");
                $("div#runJsp blockquote div.text").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data.rows[0].answer);
/*                $("iframe").attr("src", ctx + "/old/Talk.jsp?p_msgId=" + data.rows[0].p_msgId);
                $("iframe").load(function () {
                    var mainheight = $(this).contents().find("body").height() + 30;
                    $(this).height(mainheight);
                    // document.getElementById("talk_room").style.maxHeight = mainheight + 20;
                });*/
            }
        })

    }

};


