$(function () {
    if (!CtGlobal.isTeacher(root)) {
        $.messager.alert("系统提示", "用户参数异常,请选择有效的身份,重新登录系统!!");
        return;
    }
    ;

    $('div#grid_search_div a').eq(0).click(CtChanOnloadMethod.QueryGrid);
    $('div#grid_search_div a').eq(1).click(CtChanOnloadMethod.ClearQuery);
    // var yon_obj = {
    //     url: ctx + '/user/test.do',
    //     valueField: 'ID',
    //     textField: 'TEXT',
    //     queryParams: {
    //         condition: has_broadband_chcode
    //     }
    // };
    // $('#has_car').combobox(yon_obj);
    // $('#has_iphone').combobox(yon_obj);
    // $('#has_broadband').combobox(yon_obj);


    var query_obj = {
        MSG_TYPE_ID: CtChanOnloadMethod.MSG_TYPE
    };
    if (!CtGlobal.isAdmin(root)) {
        query_obj.SENDOR = loginUserId;
    }
    var grid_obj = {
        url: ctx + "/msg/queryMsg.do",
        // url: ctx + "/functionmodule/ctchanmanage/js/a.json",
        singleSelect: true,
        pagination: true,
        rownumbers: true,
        fit: true,
        border: false,
        queryParams: query_obj,
        toolbar: [{
            iconCls: 'dynamic-tbar-icon-add',
            text: '添加',
            handler: function () {
                CtChanOnloadMethod.INSERT();
            }
        }, {
            iconCls: 'dynamic-tbar-icon-see',
            text: "查看",
            handler: function () {
                CtChanOnloadMethod.SEE();
            }
        }, {
            iconCls: 'dynamic-tbar-icon-edit',
            text: "修改",
            handler: function () {
                CtChanOnloadMethod.UPDATE();
            }
        }, {
            iconCls: 'dynamic-tbar-icon-delete',
            text: "删除",
            handler: function () {
                CtChanOnloadMethod.Delete();
            }
        }, {
            iconCls: 'dynamic-tbar-icon-down',
            text: "下载文件",
            handler: function () {
                CtChanOnloadMethod.DownloadFile();

            }
        }],
        columns: [[
            {field: 'ck', checkbox: true},
            {field: 'msgId', title: '课件编号', width: 100},
            {field: 'msgTitle', title: '课件标题', width: 100},
            {field: 'msgTypeId', title: '信息类型', width: 100, hidden: true},
            {field: 'p_msgTypeId', title: '信息类型', width: 100, hidden: true},
            {field: 'content', title: '信息正文', width: 100, hidden: true},
            {field: 'createDate', title: '信息发布时间', width: 100, hidden: true},
            {field: 'p_createDate', title: '课件发布时间', width: 100},
            {field: 'sendor', title: '信息发布人', width: 100, hidden: true},
            {field: 'p_sendor', title: '课件发布人', width: 100},
            {field: 'status', title: '信息状态', width: 100, hidden: true},
            {field: 'p_status', title: '课件状态', width: 100},
            {field: 'isReceivor', title: '是否存在收件人', width: 100, hidden: true},
            {field: 'p_file', title: '附件名', width: 100}
        ]]
    };
    $.ajax({
        url: ctx + "/msg/getTitle.do?msg_type_id=" + CtChanOnloadMethod.MSG_TYPE,
        type: 'GET',
        success: function (data) {
            $("form#MsgInfo label").each(function () {
                var title = $(this).attr("for");
                var tName = eval("data.data.t" + title);
                $(this).html(tName + ":");
            })

        }
    });
    $('div#win a.easyui-linkbutton').eq(1).click(function () {
        document.getElementById("MsgInfo").reset();
    });
    $("#courseware_grid").datagrid(grid_obj);
    $("#msgTypeId").val(CtChanOnloadMethod.MSG_TYPE);


});
var CtChanOnloadMethod = {
    MSG_TYPE: 3,
    /**
     * 装在查询列表所有的下拉列
     */
    LoadQuerySelectedValuesList: function () {

    },
    /**
     * 查询操作，重新载入条件相符的信息
     */

    QueryGrid: function () {
        // var queryParams = $("#courseware_grid").datagrid("options").queryParams;
        var obj = {
            MSG_ID: $('#msg_id').textbox('getText'),
            MSG_TITLE: $('#msg_title').textbox('getText'),
            MSG_TYPE_ID: CtChanOnloadMethod.MSG_TYPE
        }
        if (!CtGlobal.isAdmin(root)) {
            obj.SENDOR = loginUserId;
        }
        $('#courseware_grid').datagrid('load', obj);
    },
    ClearQuery: function () {
        $('#msg_id').textbox('clear');
        $('#msg_title').textbox('clear');
    },
    /**
     * 打开需要的窗口
     * @param address
     * @param values
     * @constructor
     */
    OpenNewWindow: function () {
        $('div#win').window('open');
    },
    INSERT: function () {
        $('div#win a.easyui-linkbutton').eq(0).unbind("click");
        $('div#win a.easyui-linkbutton').eq(0).click(CtChanOnloadMethod.InsertMsg);
        $("#msgId").val("");
        CtChanOnloadMethod.HideSomeDiv(true);
        document.getElementById("MsgInfo").reset();
        window.editor.html("");
        $('div#win a.easyui-linkbutton').eq(1).show();
        $('div#win a.easyui-linkbutton').eq(0).show();
        CtChanOnloadMethod.OpenNewWindow();
    },
    UPDATE: function () {
        if ($("#courseware_grid").datagrid("getSelected") == null) {
            $.messager.alert("提示", "请选中一行数据");
            return;
        }
        $('div#win a.easyui-linkbutton').eq(0).unbind("click");
        $('div#win a.easyui-linkbutton').eq(0).click(CtChanOnloadMethod.UpdateMsg);
        CtChanOnloadMethod.HideSomeDiv(false);
        var item = $("#courseware_grid").datagrid("getSelected");
        $("#id").val(item.msgId);
        $("#msgId").val(item.msgId);
        $("#msgTitle").val(item.msgTitle);
        // $("#content").val(item.content);
        window.editor.html(item.content);
        $("#createDate").val(item.p_createDate);
        $("#p_sendor").val(item.p_sendor);
        $("#p_status").val(item.p_status);
        $("#fileName").val(item.p_file);
        $('div#win a.easyui-linkbutton').eq(1).hide();
        $('div#win a.easyui-linkbutton').eq(0).show();
        CtChanOnloadMethod.OpenNewWindow();
    },
    /**
     * 删除任务
     * @constructor
     */
    Delete: function () {
        if ($("#courseware_grid").datagrid("getSelected") == null) {
            $.messager.alert("提示", "请选中一行数据");
            return;
        }
        $.messager.confirm('Confirm', '是否要删除该数据', function (flag) {
            if (flag) {
                var item = $("#courseware_grid").datagrid("getSelected");
                var obj = {};
                obj.msgId = item.msgId;

                $.ajax({
                    url: ctx + "/msg/delMsg.do",
                    data: obj,
                    dataType: 'json',
                    success: function (data) {
                        if (data.success) {
                            $.messager.alert("系统提示", "删除成功", "info");
                            CtChanOnloadMethod.QueryGrid();
                        } else {
                            $.messager.alert("系统提示", data.msg, 'info');
                        }

                    }
                })
            }
        });

    },
    SEE: function () {
        if ($("#courseware_grid").datagrid("getSelected") == null) {
            $.messager.alert("提示", "请选中一行数据");
            return;
        }
        CtChanOnloadMethod.HideSomeDiv(false);
        var item = $("#courseware_grid").datagrid("getSelected");
        $("#fileName").val(item.p_file);
        $("#id").val(item.msgId);
        $("#msgId").val(item.msgId);
        $("#msgTitle").val(item.msgTitle);
        // $("#content").val(item.content);
        window.editor.html(item.content);
        $("#createDate").val(item.p_createDate);
        $("#p_sendor").val(item.p_sendor);
        $("#p_status").val(item.p_status);
        $('div#win a.easyui-linkbutton').eq(1).hide();
        $('div#win a.easyui-linkbutton').eq(0).hide();
        CtChanOnloadMethod.OpenNewWindow();
    },
    InsertMsg: function () {
        window.editor.sync();
        var form = document.getElementById("MsgInfo");
        var formData = new FormData(form);
        formData.msgTypeId = CtChanOnloadMethod.MSG_TYPE;
        // var obj = CtGlobal.fromToJson('MsgInfo');
        // obj.msgTypeId = CtChanOnloadMethod.MSG_TYPE;
        $.ajax({
            url: ctx + '/msg/saveMsg.do',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            success: function (data) {
                if (data.success) {
                    $('#win').window('close');
                    CtChanOnloadMethod.QueryGrid();
                } else {
                    $.messager.alert("系统提示", data.msg, 'info');
                }

            }
        })
    },
    UpdateMsg: function () {
        window.editor.sync();
        var form = document.getElementById("MsgInfo");
        var formData = new FormData(form);
        formData.msgTypeId = CtChanOnloadMethod.MSG_TYPE;
        // var obj = CtGlobal.fromToJson('MsgInfo');
        // obj.msgTypeId = CtChanOnloadMethod.MSG_TYPE;
        $.ajax({
            url: ctx + '/msg/updateMsg.do',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            success: function (data) {
                if (data.success) {
                    $('#win').window('close');
                    CtChanOnloadMethod.QueryGrid();
                } else {
                    $.messager.alert("系统提示", data.msg, 'info');
                }

            }
        })
    },
    DownloadFile: function () {
        if ($("#courseware_grid").datagrid("getSelected") == null) {
            $.messager.alert("提示", "请选中一行数据");
            return;
        }
        var item = $("#courseware_grid").datagrid("getSelected");
        window.location.href = ctx + "/msg/downFile.do?msgId=" + item.msgId;

    },
    HideSomeDiv(flag){
        $("div.someshow").each(function () {
            if (flag == true)
                $(this).css('display', 'none');
            else if (flag == false)
                $(this).css('display', 'block');
        })
    }
};