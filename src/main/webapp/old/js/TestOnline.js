/**
 * Created by keyez on 2017/4/29.
 */
var max = 10;
var i = 0;
$(function () {
    document.getElementById('span_process').innerText = (i + 1) + "/" + max;
    var obj = {
        num: max
    }
    $.ajax({
        url: ctx + "/test/randomTest.do",
        data: obj,
        dataType: 'json',
        success: function (data) {
            if (data.success) {
                for (var i in data.result) {
                    var item = $(
                        "<div name='question' style='display: none'>"
                        + "<strong><p id='title'>" + (eval(i) + 1) + "、 " + data.result[i].title + "</p></strong>"
                        + "<input type='hidden' name='testId_" + i + "' value='" + data.result[i].testId + "'/>"
                        + "<blockquote>"
                        + "<div class='item' style='display: none;'><input name='selected' type='radio' value='' checked='checked'/></div>"
                        + "<div class='item' onclick='myselect(this)'><input class='selectMy' name='selected_" + i + "' type='radio' value='" + data.result[i].answers[0] + "'/><span>A.</span>" + data.result[i].answers[0] + "</div>"
                        + "<div class='item' onclick='myselect(this)'><input class='selectMy' name='selected_" + i + "' type='radio' value='" + data.result[i].answers[1] + "'/><span>B.</span>" + data.result[i].answers[1] + "</div>"
                        + "<div class='item' onclick='myselect(this)'><input class='selectMy' name='selected_" + i + "' type='radio' value='" + data.result[i].answers[2] + "'/><span>C.</span>" + data.result[i].answers[2] + "</div>"
                        + "<div class='item' onclick='myselect(this)'><input class='selectMy' name='selected_" + i + "' type='radio' value='" + data.result[i].answers[3] + "'/><span>D.</span>" + data.result[i].answers[3] + "</div>"
                        + "</blockquote>"
                        + "<br/>"
                        + "</div>")
                    item.appendTo("div.item_body form");
                }
                document.getElementsByName('question').item(0).style.display = "block";
            } else {
                $.messager.alert("系统信息", data.msg, "info");
            }
        }
    });
    $("#questNum").val(max);
    /*    $("div.item").click(function () {
     alert('OK');
     /!*$(this).find('input').attr("selected", true);*!/
     });*/
});
function myselect(item) {
    item.getElementsByClassName('selectMy')[0].checked = 'checked';
}
function mysumbit() {
    $.messager.confirm('系统提示', '是否要提交', function () {
        /*
         $.ajax({
         url: ctx + '/test/dealTest.do',
         data: $("form").serialize(),
         dataType: 'json',
         type: 'POST',
         success: function (data) {
         $.post(ctx + "/old/Result_TestOnline.jsp", data);
         }
         })
         */
        document.ff.submit();
    })

}
function next() {
    if (i >= max - 1) {
        $.messager.confirm('系统提示', '已经是最后一个,是否要提交', function () {
            mysumbit();
        })
        return false;
    }
    var item1 = document.getElementsByName('question').item(i).style;
    var item2 = document.getElementsByName('question').item(i + 1).style;
    item1.display = "none";
    item2.display = "block";
    i = i + 1;
    document.getElementById('span_process').innerText = (i + 1) + "/" + max;
    document.getElementById('Progress_bar_block').style.width = (i + 1) * max + '%';
    document.getElementById("item_number").innerText = '第' + (i + 1) + '题';
    return true;


}
function pervious() {
    if (i <= 0) {
        $.messager.alert('系统提示', '已经是第一个', 'info');
        return false;
    }
    var item1 = document.getElementsByName('question').item(i).style;
    var item2 = document.getElementsByName('question').item(i - 1).style;
    item1.display = "none";
    item2.display = "block";
    i = i - 1;
    document.getElementById('span_process').innerText = (i + 1) + "/" + max;
    document.getElementById('Progress_bar_block').style.width = (i + 1) * max + '%';
    document.getElementById("item_number").innerText = '第' + (i + 1) + '题';
    return true;
}