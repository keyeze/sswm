var has_iphone_chcode = 100003677;
var has_car_chcode = 100003677;
var has_broadband_chcode = 100003677;
$(function () {
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
        // // task: "searchCTChanUser",
        // // taskCName: "查询CTChan用户示例表",
        // NAME: $('#name').textbox('getText'),
        // AGE: $('#age').textbox('getText'),
        // ADDRESS: $('#address').textbox('getText'),
        // HAS_IPHONE: $('#has_iphone').combobox('getValue'),
        // HAS_CAR: $('#has_car').combobox('getValue'),
        // HAS_BROADBAND: $('#has_broadband').combobox('getValue'),
        // CTCH_HAS_IPHONE: has_iphone_chcode,
        // CTCH_HAS_CAR: has_car_chcode,
        // CTCH_HAS_BROADBAND: has_broadband_chcode
    };
    var grid_toolbar_obj = {};
    var grid_obj = {
        url: ctx + "/user/queryUser.do",
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
        }],
        columns: [[
            {field: 'ck', checkbox: true},
            {field: 'userId', title: 'ID', width: 100},
            {field: 'username', title: '用户名', width: 100},
            {field: 'password', title: '密码', width: 100},
            {field: 'name', title: '手机号码', width: 100},
            {field: 'address', title: '身份', width: 100},
            {field: 'email', title: '邮箱', width: 100},
            {field: 'phone', title: '验证问题', width: 100},
            {field: 'qq', title: '验证回答', width: 100},
            {field: 'age', title: '最后登录时间', width: 100},
            {field: 'sex', title: '注册时间', width: 100},
            {field: 'head_src', title: '是否在线', width: 100/*, hidden: true*/},
            {field: 'createDate', title: '用户状态', width: 100/*, hidden: true*/},
            {field: 'lastLoginDate', title: '用户状态', width: 100/*, hidden: true*/},
            {field: 'root', title: '用户状态', width: 100/*, hidden: true*/},
            {field: 'status', title: '用户状态', width: 100/*, hidden: true*/}
        ]]
    };
    $("#test_grid").datagrid(grid_obj);


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
        var queryParams = $("#test_grid").datagrid("options").queryParams;
        $('#test_grid').datagrid('load', {});


    },
    ClearQuery: function () {
        $('#name').textbox('clear');
        $('#age').textbox('clear');
        $('#address').textbox('clear');
        $('#has_broadband').textbox('clear');
        $('#has_car').textbox('clear');
        $('#has_iphone').textbox('clear');
    },
    /**
     * 打开需要的窗口
     * @param address
     * @param values
     * @constructor
     */
    OpenNewWindow: function (title, url) {
        var content = '<iframe src="' + url + '" width="100%" height="99%" frameborder="0" scrolling="no"></iframe>';
        var window = $("#win").dialog({
            content: content,
            width: 600,
            height: 400,
            title: title,
            onClose: function () {
                CtChanOnloadMethod.QueryGrid();
            }
        });
        window.dialog('open');
    },
    INSERT: function () {
        alert("I Add It!");
    },
    UPDATE: function () {
        if ($("#test_grid").datagrid("getSelected") == null) {
            $.messager.alert("提示", "请选中一行数据");
        }
        alert("I Update It!");
    },
    /**
     * 删除任务
     * @constructor
     */
    Delete: function () {
        alert("I Get It!");

    },
    SEE: function () {
        if ($("#test_grid").datagrid("getSelected") == null) {
            $.messager.alert("提示", "请选中一行数据");
        }
        alert("I See It!");
    }

};