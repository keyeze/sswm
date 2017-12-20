/**
 * Created by keyez on 2017/4/11.
 */
$(function () {
    var obj = {};
    /*    $.ajax({
     url: ctx + "",
     data: obj,
     dataType: 'json',
     success: function (data) {


     },
     error: function (data) {
     $.messager.alert('系统提示', '加载数据出错!', 'error');
     }
     });
     CtGuestBook.CreatePanel(null);*/
    CtGuestBook.CreatePanel(null);
    CtGuestBook.CreatePanel(null);
    CtGuestBook.CreatePanel(null);
    $('div.top').each(function () {
        $(this).find('a.easyui-linkbutton').eq(0).click(CtGuestBook.OpenMsg);
        $(this).find('a.easyui-linkbutton').eq(1).click(CtGuestBook.DeleteMsg);
    });
    $('div.center div.answer').each(function () {
            $(this).find('a.easyui-linkbutton').eq(0).click(CtGuestBook.SubAnswerMsg);
            $(this).find('a.easyui-linkbutton').eq(1).click(CtGuestBook.ResetMsg);
        }
    );
    $.parser.parse();
});
var CtGuestBook = {
    itemNum: 0,
    CreatePanel: function (data) {
        var panel = $('<div class="easyui-panel" style="width: 750px;"></div>');


        var msg_itemDiv = $('<div id="msg_item' + (CtGuestBook.itemNum++) + '" name="msg_item" class="easyui-panel msg_item"></div>');

        var hr = $('<hr/>');

        var topDiv = $(
            '<div class="top">' +
            '<div>' +
            '<laber><strong>标题:</strong>哈哈哈</laber>' +
            '<laber><strong>摘要:</strong>哈哈哈</laber>' +
            '<laber><strong>发件人:</strong>小明</laber>' +
            '<laber><strong>发送时间:</strong>2011-02-01 下午 3:15</laber>' +
            '</div>' +
            '<div class="show">' +
            '<a class="easyui-linkbutton" href="javascript:void(0)" onclick="">查看</a>' +
            '<a class="easyui-linkbutton" href="javascript:void(0)" onclick="">删除</a>' +
            '</div>' +
            '</div>');
        var centerDiv = $(
            '<div class="center"><hr/>' +
            '<div class="left">' +
            '<div><img src="../../image/1.jpg"/></div>' +
            '<span>小明</span>' +
            '</div>' +
            '<div class="right"><hr/>' +
            '<textarea readonly="readonly">我害怕你心碎没人帮你擦眼泪</textarea>' +
            '</div>' +
            '</div>');
        var br = $('<br/>');
        var answerDiv = $('<div class="answer">' +
            '<hr/>' +
            '<div>' +
            '<input type="text" class="easyui-validatebox" style="margin-left:50px;width: 500px;">' +
            '<a class="easyui-linkbutton" href="javascript:void(0)" onclick="">回复</a>' +
            '<a class="easyui-linkbutton" href="javascript:void(0)" onclick="">重置</a>' +
            '</div>' +
            '<br/>' +
            '</div>');
        var answer_itemsDiv = $('<div class="answer_items"></div>');
        //需要插入回复列

        CtGuestBook.AddAnswerMsg(null).appendTo(answer_itemsDiv);

        CtGuestBook.AddAnswerMsg(null).appendTo(answer_itemsDiv);

        CtGuestBook.AddAnswerMsg(null).appendTo(answer_itemsDiv);

        //装配所有DIV
        answer_itemsDiv.appendTo(answerDiv);
        br.appendTo(answerDiv);
        answerDiv.appendTo(centerDiv);
        topDiv.appendTo(msg_itemDiv);
        centerDiv.appendTo(msg_itemDiv);
        msg_itemDiv.appendTo(panel);
        panel.appendTo('body');
        hr.appendTo('body');


    }, /**/
    OpenMsg: function () {
        var flag = $(this).closest('div.msg_item').children('div.center').css('display');
        if (flag == 'block')
            $(this).closest('div.msg_item').children('div.center').css('display', 'none');
        else if (flag == 'none')
            $(this).closest('div.msg_item').children('div.center').css('display', 'block');
    },
    AddAnswerMsg: function (data) {
        var answerItem = $(
            '<div>' +
            '<div class="left">' +
            '<div>' +
            '<img src="../../image/1.jpg"/>' +
            '</div>' +
            '<span>小明</span>' +
            '</div>' +
            '<div class="right">' +
            '</div>' +
            '</div><br/>');
        return answerItem;

    },
    SubAnswerMsg: function () {
        alert("回复成功");
    },
    ResetMsg: function () {
        alert("重置成功");
    },
    DeleteMsg: function () {
        alert("删除成功");
    }
}
