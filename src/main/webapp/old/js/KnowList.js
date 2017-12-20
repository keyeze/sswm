/**
 * Created by keyez on 2017/4/24.
 */

$(function () {
    CtChanOnloadMethod.queryList(1);
});
var MSG_TYPE = 2;
var CtChanOnloadMethod = {
    MSG_TYPE: 2,
    ROWS: 15,
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
            MSG_TYPE_ID: MSG_TYPE,
            page: page,
            rows: CtChanOnloadMethod.ROWS
        };
        $.ajax({
                url: ctx + "/msg/queryMsg.do",
                data: obj,
                dataType: 'json',
                type: 'GET',
                success: function (data) {

                    //处理 正文 部分
                    $("div.centinfo").empty();
                    var ul = $("<ul></ul>");
                    for (var i in data.rows) {
                        var item = data.rows[i];
                        var itemShow = $("<li><div style='width:80%'><span><a href='" + ctx + "/old/KnowShow.jsp?msgId=" + item.msgId + "' target='_blank'><span>" + item.msgTitle + "</span></a></span><hr/></div>" +
                            "<div><span>" + item.p_createDate + "</span><hr/></div>")
                        itemShow.appendTo(ul);
                    }
                    ul.appendTo('.centinfo');
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
                }
            }
        )
    },
    ChangeType: function (TypeId) {
        MSG_TYPE = TypeId;
        CtChanOnloadMethod.queryList(1);

    }
}