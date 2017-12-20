function dosomething() {
    for (var i = 0; i < document.getElementsByClassName('circle').length; i++) {
        var num = document.getElementsByClassName('circle').item(i).getElementsByTagName('span').item(0).innerHTML * 3.6;
        if (num <= 180) {
            document.getElementsByClassName("right").item(i).style.transform = ("rotate(" + num + "deg)");
        } else {
            document.getElementsByClassName("left").item(i).style.transform = ("rotate(" + (num - 180) + "deg)");
            document.getElementsByClassName("right").item(i).style.transform = ("rotate(180deg)");
        }
    }
};
// window.onload = dosomething;
function show(n, aaa) {
    document.getElementsByClassName(aaa).item(0).style.display = 'block';
    document.getElementsByName('bb').item(n).href = "javascript:hide(" + n + ",'" + aaa + "')";


};
function hide(n, aaa) {
    document.getElementsByClassName(aaa).item(0).style.display = 'none';
    document.getElementsByName('bb').item(n).href = "javascript:show(" + n + ",'" + aaa + "')";

}
function ccccc(url, name) {
    window.open(url, name, 'height=600,width=450,top=10,left=10, toolbar=no, menubar=no,scrollbars=no, resizable=no,location=no, status=no');
};


$(function () {
    var obj = {};
    /* $.ajax({
     url: ctx + "",
     async: false,
     data: obj,
     dataType: 'json',
     success: function (data) {
     $('#head_username').text = data.name;
     $('#username').text += data.username;
     $('#name').text += data.name;
     $('#sex').text += data.sex;
     $('#age').text += data.age;
     $('#phone').text += data.phone;
     $('#email').text += data.email;
     $('#qq').text += data.email;
     $('#address').text += data.address;
     $('#last_login_date').text += data.last_login_date;
     $('#create_date').text += data.create_date;
     $('#head').src = data.head_src;
     },
     error: function (data) {
     $.messager.alert('系统提示', '加载数据出错!', 'error');
     }
     });*/
    $('#personWin').window({
        width: 380,
        height: 420,
        modal: true,
        iconCls: 'icon-save',
        closable: true,
        closed: true
    });
    $('#personWin').window('close');
    $('p#title1 font button').click(CtPerson.openPersionWin);
    $('blockquote a').eq(0).click(CtPerson.savePinfoWin);
    $('blockquote a').eq(1).click(CtPerson.reset);

    $('#pwdWin').window({
        width: 350,
        height: 200,
        modal: true,
        iconCls: 'icon-save',
        closable: true,
        closed: true
    });
    $('#pwdWin').window('close');
    $('.person_card div button').eq(1).click(CtPerson.openPwdWin);
    $('#pwd a').eq(0).click(CtPerson.savePwdWin);
    $('#pwd a').eq(1).click(CtPerson.reset);

    $('#up_head_file').on('change', function (e) {
        var upFile = this.files[0];
        var name = upFile.name;
        var size = upFile.size;
        if (size > 1024 * 1024 * 1) {
            alert("图片不能大于1M");
            return;
        }
        var formData = new FormData();
        formData.append("upFile", upFile);
        $.ajax({
            url: ctx + '/user/uploadHeadFile.do',
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json',
            success: function (result) {
                if (result.success) {
                    window.location.reload();
                } else {
                    alert(result.msg);
                }
            },
            error: function () {
                alert('网络异常');
            }
        });
    });
});
var CtPerson = {
    openPwdWin: function () {
        $('#pwdWin').window('open');
    },
    openPersionWin: function () {
        $('#personWin').window('open');
    },
    savePinfoWin: function () {
        var obj = $('form#pinInfo').serialize();
        $.ajax({
            url: ctx + "/user/savePinInfo.do",
            type: "post",
            dataType: 'json',
            data: obj,
            success: function (data) {
                if (data.success == true) {
                    $('#personWin').window('close');
                    $.messager.alert('系统提示', '修改成功', 'info');
                    window.location.reload();

                } else {
                    $.messager.alert('系统提示', data.msg, 'info');
                }
            }

        })

    },
    savePwdWin: function () {
        var newPwd = $("#newPwd").val();
        var againPwd = $("#againPwd").val();
        if (newPwd != againPwd) {
            $.messager.alert("再次确认与密码不一致！");
            return;
        }
        var obj = $("#pwd").serialize();
        $.ajax({
            url: ctx + "/user/editPwd.do",
            type: "post",
            dataType: 'json',
            data: obj,
            success: function (data) {
                if (data.success) {
                    $('#pwdWin').window('close');
                    $.messager.alert('系统提示', '修改成功', 'info');
                    document.getElementById("pwd").reset();
                } else {
                    $.messager.alert('系统提示', data.msg, 'info');
                }
            }

        })
    },
    reset: function () {

    }
}