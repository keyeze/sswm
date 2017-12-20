$(function () {
    var contents = [
        {
            itemTitle: '个人信息',
            items: [
                {
                    name: '个人资料',
                    url: ''
                }, {
                    name: '密码修改',
                    url: ''
                }, {
                    name: '课件下载',
                    url: ''
                }, {
                    name: '查看公告',
                    url: ''
                }, {
                    name: '留言板块',
                    url: ''
                }, {
                    name: '在线学习',
                    url: ''
                }
            ]
        },
        {
            itemTitle: '教学信息',
            items: [
                {
                    name: '个人资料',
                    url: ''
                }, {
                    name: '修改密码',
                    url: ''
                }, {
                    name: '上传课件',
                    url: ''
                }, {
                    name: '留言板块',
                    url: ''
                }, {
                    name: '试题库管理',
                    url: ''
                }
            ]
        },
        {
            itemTitle: '管理员权限',
            items: [
                {
                    name: '用户管理',
                    url: ''
                }, {
                    name: '留言管理',
                    url: ''
                }, {
                    name: '课件管理',
                    url: ''
                }, {
                    name: '试题管理',
                    url: ''
                }
            ]
        }
    ];
    var contentsDiv = $('<div id="contents" class="easyui-accordion" style="width:200px;height:400px;" border="false">');
    for (var i = 0; i < contents.length; i++) {
        var itemdiv = $('<div style="overflow:auto;padding:10px;"><ul></ul></div>');
        itemdiv.attr('title', contents[i].itemTitle);
        for (var j = 0; j < contents[i].items.length; j++) {
            var item = $("<li></li>");
            var link = $("<a href='javascript:void(0)'></a>");
            link.text(contents[i].items[j].name);
            link.attr('onclick', 'mainControl.openTab(' + contents[i].items[j].url + ')');
            item.append(link);
            itemdiv.append(item);
        }
        contentsDiv.append(itemdiv);
    }
    contentsDiv.appendTo('body');
    $.parser.parse();
});

