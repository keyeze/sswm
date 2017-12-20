$(function () {
    if (!CtGlobal.isTeacher(root)) {
        $.messager.alert("系统提示", "用户参数异常,请选择有效的身份,重新登录系统!!");
        return;
    }
    ;

    $("#upFile").on("change", function () {
        var file = $("#upFile").prop("files")[0];
        var formData = new FormData();
        formData.append("upFile", file);
        $.ajax({
            url: ctx + '/test/importTest.do',
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json',
            success: function (result) {
                if (result.success) {

                    $.messager.alert("系统提示", result.msg);
                    CtChanOnloadMethod.QueryGrid();
                } else {
                    $.messager.alert("系统提示", result.msg);
                }
            },
            error: function () {
                $.messager.alert("系统提示", '网络异常');
            }
        });
        $("#upFile").val("");
    });

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


    var query_obj = {};
    if (!CtGlobal.isAdmin(root)) {
        query_obj.SENDOR = loginUserId;
    }
    var grid_obj = {
        url: ctx + "/test/queryTest.do",
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
            iconCls: 'dynamic-tbar-icon-export',
            text: "导入",
            handler: function () {
                CtChanOnloadMethod.Import();
            }
        }, {
            iconCls: 'dynamic-tbar-icon-excel',
            text: "下载导入模板",
            handler: function () {
                CtChanOnloadMethod.Download();
            }
        }],
        columns: [[
            {field: 'ck', checkbox: true},
            {field: 'testId', title: '试题编号', width: 100},
            {field: 'title', title: '问题', width: 100},
            {field: 'answer', title: '正确的解释', width: 100},
            {field: 'rightselect', title: '正确答案', width: 100},
            {field: 'errorselect1', title: '错误答案1', width: 100},
            {field: 'errorselect2', title: '错误答案2', width: 100},
            {field: 'errorselect3', title: '错误答案3', width: 100},
            {field: 'createDate', title: '信息发布时间', width: 100, hidden: true},
            {field: 'p_createDate', title: '信息发布时间', width: 100},
            {field: 'sendor', title: '信息发布人', width: 100, hidden: true},
            {field: 'p_sendor', title: '信息发布人', width: 100}
        ]]
    };
    $('div#win a.easyui-linkbutton').eq(1).click(function () {
        document.getElementById("TestInfo").reset();
    });
    $("#testbank_grid").datagrid(grid_obj);
});
var CtChanOnloadMethod = {
    /**
     * 装在查询列表所有的下拉列
     */
    LoadQuerySelectedValuesList: function () {

    },
    /**
     * 查询操作，重新载入条件相符的信息
     */

    QueryGrid: function () {
        var obj = {
            TEST_ID: $('#F_TEST_ID').textbox('getText'),
            TITLE: $('#F_TITLE').textbox('getText')
        };
        if (!CtGlobal.isAdmin(root)) {
            obj.SENDOR = loginUserId;
        }
        $('#testbank_grid').datagrid('load', obj);
    },
    ClearQuery: function () {
        $('#F_TEST_ID').textbox('clear');
        $('#F_TITLE').textbox('clear');
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
        CtChanOnloadMethod.HideSomeDiv(true);
        document.getElementById("TestInfo").reset();
        $("#testId").val("");
        $('div#win a.easyui-linkbutton').eq(1).show();
        $('div#win a.easyui-linkbutton').eq(0).show();
        CtChanOnloadMethod.OpenNewWindow();
    },
    Import: function () {
        $("#upFile").click();
    },
    Download: function () {
        window.location.href = ctx + "/test/downloadTestModel.do";
    },
    UPDATE: function () {
        if ($("#testbank_grid").datagrid("getSelected") == null) {
            $.messager.alert("提示", "请选中一行数据");
            return;
        }
        $('div#win a.easyui-linkbutton').eq(0).click(CtChanOnloadMethod.UpdateMsg);
        CtChanOnloadMethod.HideSomeDiv(false);
        var item = $("#testbank_grid").datagrid("getSelected");
        $("#id").val(item.testId);
        $("#testId").val(item.testId);
        $("#title").val(item.title);
        $("answer").val(item.answer);
        $("#rightselect").val(item.rightselect);
        $("#errorselect1").val(item.errorselect1);
        $("#errorselect2").val(item.errorselect2);
        $("#errorselect3").val(item.errorselect3);
        $("#createDate").val(item.p_createDate);
        $("#p_sendor").val(item.p_sendor);
        $('div#win a.easyui-linkbutton').eq(1).hide();
        $('div#win a.easyui-linkbutton').eq(0).show();
        CtChanOnloadMethod.OpenNewWindow();
    },
    /**
     * 删除任务
     * @constructor
     */
    Delete: function () {
        if ($("#testbank_grid").datagrid("getSelected") == null) {
            $.messager.alert("提示", "请选中一行数据");
            return;
        }
        $.messager.confirm('Confirm', '是否要删除该数据', function (flag) {
            if (flag) {
                var item = $("#testbank_grid").datagrid("getSelected");
                var obj = {};
                obj.testId = item.testId;

                $.ajax({
                    url: ctx + "/test/delTest.do",
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
        if ($("#testbank_grid").datagrid("getSelected") == null) {
            $.messager.alert("提示", "请选中一行数据");
            return;
        }
        CtChanOnloadMethod.HideSomeDiv(false);
        var item = $("#testbank_grid").datagrid("getSelected");
        $("#id").val(item.testId);
        $("#testId").val(item.testId);
        $("#title").val(item.title);
        $("#rightselect").val(item.rightselect);
        $("#errorselect1").val(item.errorselect1);
        $("#errorselect2").val(item.errorselect2);
        $("#errorselect3").val(item.errorselect3);
        $("#createDate").val(item.p_createDate);
        $("answer").val(item.answer);
        $("#p_sendor").val(item.p_sendor);
        $('div#win a.easyui-linkbutton').eq(1).hide();
        $('div#win a.easyui-linkbutton').eq(0).hide();
        CtChanOnloadMethod.OpenNewWindow();
    },
    InsertMsg: function () {
        $.ajax({
            url: ctx + '/test/saveTest.do',
            data: $("#TestInfo").serialize(),
            dataType: 'json',
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
        $.ajax({
            url: ctx + '/test/updateTest.do',
            data: $("#TestInfo").serialize(),
            dataType: 'json',
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
    HideSomeDiv(flag){
        $("div.someshow").each(function () {
            if (flag == true)
                $(this).css('display', 'none');
            else if (flag == false)
                $(this).css('display', 'block');
        })
    }

};