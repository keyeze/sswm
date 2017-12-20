// 计算字符串的长度
function checkStrLength(value) {
    var StrTrueLength = value.replace(/[^\x00-\xff]/g, "~~").length;
    return StrTrueLength;
}
/* 判断是否为数字 */
function isNumber(str) {
    var Letters = "1234567890";
    for (var i = 0; i < str.length; i = i + 1) {
        var CheckChar = str.charAt(i);
        if (Letters.indexOf(CheckChar) == -1) {
            return false;
        }
    }
    return true;
}
/* 判断是否为Email */
function isEmail(str) {
    var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
    if (myReg.test(str)) {
        return true;
    }
    return false;
}
/* 判断是否为空 */
function isEmpty(value) {
    return value;
}


function validateRegisterForm(form) {
    var username = form.username.value;
    var password = form.password.value;
    var passwords = form.passwords.value;
    var email = form.email.value;
    var validateQuestion = form.validateQuestion.value;
    var validateAnswer = form.validateAnswer.value;

    if (!isEmpty(username)) {
        alert("用户名不能为空");
        return false;
    }
    if (!isEmpty(password)) {
        alert("密码不能为空");
        return false;
    }
    if (!isEmpty(email)) {
        alert("邮件不能为空");
        return false;
    }
    if (!isEmpty(validateQuestion)) {
        alert("验证问题不能为空");
        return false;
    }
    if (!isEmpty(validateAnswer)) {
        alert("验证答案不能为空");
        return false;
    }
    if (checkStrLength(password) < 6) {
        alert("密码不能小于6位");
        return false;
    }
    if (checkStrLength(password) > 14) {
        alert("密码不能大于14位");
        return false;
    }
    if (password != passwords) {
        alert("两次密码输入不一致");
        return false;
    }
    if (checkStrLength(validateAnswer) < 6) {
        alert("验证答案不能小于6位");
        return false;
    }
    if (isEmail(email)) {
        alert("邮箱格式不正确");
        return false;
    }
}


