/**
 * Created by keyez on 2017/4/24.
 */

$(function () {
    $('p.postBtn a').eq(0).click(CtChanOnloadMethod.InsertMsg);
    $('p.postBtn a').eq(1).click(CtChanOnloadMethod.ClearQuery);
    CtChanOnloadMethod.queryList(1);
});
var CtChanOnloadMethod = {
    MSG_TYPE: 11,
    ROWS: 10,
    SHOW_PAGE_SIZE: 9,
    addPageItem: function (title, value) {
        var li = $("<li></li>");
        var item = $("<a>" + title + "</a>");
        if (value != 0) {
            item.attr("href", "javascript:CtChanOnloadMethod.queryList(" + value + ")");
        }
        item.appendTo(li);
        li.appendTo("div.foot ul");
    },
    queryList: function (page) {

        var obj = {
            MSG_TYPE_ID: CtChanOnloadMethod.MSG_TYPE,
            page: page,
            rows: CtChanOnloadMethod.ROWS
        };
        $.ajax({
                url: ctx + "/msg/queryMsg.do",
                data: obj,
                dataType: 'json',
                type: 'POST',
                success: function (data) {
                    $(".talk_place").empty();
                    //处理 正文 部分
                    for (var i in data.rows) {
                        var theNumOfTheMsg = data.total - (page - 1) * CtChanOnloadMethod.ROWS - i;
                        var div = $("<div id='" + data.rows[i].msgId + "' class='item_taking'>" +
                            "<div style='display: table-row'>" +
                            "<div class='person'>" +
                            "<p class='talkNum'></p>" +
                            "<a href='PersonInfomation.jsp'>" +
                            "<img class='p_headImg' width='200px' height='200px' style='padding-bottom: 10px;'>" +
                            "<span style='display: block' class='p_sendor'></span>" +
                            "</a>" +
                            "</div>" +
                            "<div class='talk_box'>" +
                            "<div class='talk_top'>" +
                            "<p > 发布于:<span class='p_createDate'></span>&nbsp;" +
                            "<a class='answer_btn easyui-linkbutton' href='javascript:void(0)' onclick=''>回复</a></p>" +
                            "</div>" +
                            "<div class='talk'>" +
                            "<p style='padding: 2% 4% 2% 4%' class='content'>" +
                            "</p> " +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "<div class='answerDiv'>" +
                            "</div>" +
                            "</div>");

                        div.appendTo(".talk_place");
                        div.find(".item_taking").attr('id', data.rows[i].msgId);
                        div.find(".talkNum").html("第 " + theNumOfTheMsg + " 楼");
                        div.find(".p_headImg").attr("src", data.rows[i].p_headImg);
                        div.find(".p_sendor").html(data.rows[i].p_sendor);
                        div.find(".p_createDate").html(data.rows[i].p_createDate);
                        // div.find(".answer_btn").attr("name", data.rows[i].msgId);
                        div.find(".answer_btn").click(function () {

                            var flag = $(this).closest('div.item_taking').find('div.answerDiv').css('display');
                            if (flag == 'block') {
                                $(this).closest('div.item_taking').find('div.answerDiv').css('display', 'none');
                                $(this).closest('div.item_taking').find('div.answerDiv').empty();
                            }
                            else if (flag == 'none') {
                                $(this).closest('div.item_taking').find('div.answerDiv').css('display', 'block');
                                $(this).closest('div.item_taking').find('div.answerDiv').append("<iframe src='Talk_And_Answer.jsp?msgId=" + $(this).closest('div.item_taking').attr('id') + "' class='answer' width='100%' style='width: 90%;height:300px;border: none;margin-left: 10%;'/>");
                            }
                        });
                        div.find(".content").html(data.rows[i].content);


                    }


                    //处理 分页 部分
                    $("div.foot").empty();
                    $("<ul></ul>").appendTo('div.foot');
                    var pageSize = Math.ceil(data.total / CtChanOnloadMethod.ROWS);
                    var currentPage = page;
                    var showPageSize = CtChanOnloadMethod.SHOW_PAGE_SIZE < pageSize ? CtChanOnloadMethod.SHOW_PAGE_SIZE : pageSize;
                    var centerPage = parseInt(showPageSize / 2) < currentPage ? parseInt(showPageSize / 2) : currentPage;
                    var outPage = pageSize - showPageSize + parseInt(showPageSize / 2);
                    centerPage = outPage > currentPage ? centerPage : showPageSize + currentPage - pageSize;
                    //之前的页面
                    CtChanOnloadMethod.addPageItem('首页', 1);
                    CtChanOnloadMethod.addPageItem('上一页', (currentPage - 1 <= 0 ? 0 : currentPage - 1));
                    for (var i = centerPage - 1; i > 0; i--) {
                        CtChanOnloadMethod.addPageItem("[" + (currentPage - i) + "]", currentPage - i);
                    }
                    CtChanOnloadMethod.addPageItem("[" + currentPage + "]", 0);
                    //之后的页面
                    for (var i = 1; i <= showPageSize - centerPage; i++) {
                        CtChanOnloadMethod.addPageItem("[" + (i + currentPage) + "]", i + currentPage);
                    }

                    CtChanOnloadMethod.addPageItem('下一页', (currentPage + 1 > pageSize ? 0 : currentPage + 1));
                    CtChanOnloadMethod.addPageItem('尾页', pageSize);
                    $("<span>" + currentPage + "/" + pageSize + " 页,共 " + data.total + " 条记录</span>").appendTo(".foot");
                    /* */
                    $.parser.parse();
                }
            }
        )
    },
    InsertMsg: function () {
        window.editor.sync();
        var obj = {
            msgTypeId: CtChanOnloadMethod.MSG_TYPE,
            msgTitle: "留言",
            content: $("#msgContent").val()
        }
        // var obj = CtGlobal.fromToJson('MsgInfo');
        // obj.msgTypeId = CtChanOnloadMethod.MSG_TYPE;
        $.ajax({
            url: ctx + '/msg/saveMsg.do',
            data: obj,
            type: 'GET',
            success: function (data) {
                if (data.success) {
                    CtChanOnloadMethod.ClearQuery();
                    CtChanOnloadMethod.queryList(1);
                    window.editor.html("");
                    $.messager.alert("系统提示", "留言成功", 'info');
                } else {
                    $.messager.alert("系统提示", data.msg, 'info');
                }

            }
        })
    },
    ClearQuery: function () {
        $('textarea#msgContent').val("");
    }
}