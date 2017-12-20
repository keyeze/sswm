/*是否选中*/
function isChecked(name) {
	var temp = document.getElementsByName(name);
	for (i = 0; i < temp.length; i = i + 1) {
		if (temp[i].checked) {
			return true;
		}
	}
}



/* 全选、取消全选 */
function checkedAll(allCheckboxName, checkboxName) {
	o = document.getElementsByName(allCheckboxName);
	if (o[0].checked == true) {
		selAllCheckbox(checkboxName);
	} else {
		unselAllCheckbox(checkboxName);
	}
}
/* 全选 */
function selAllCheckbox(checkboxName) {
	o = document.getElementsByName(checkboxName);
	for (i = 0; i < o.length; i++) {
		o[i].checked = true;
	}
}
/* 取消全选 */
function unselAllCheckbox(checkboxName) {
	o = document.getElementsByName(checkboxName);
	for (i = 0; i < o.length; i++) {
		o[i].checked = false;
	}
}
/* 取消全选 */
function reAllCheckbox(checkboxName) {
	o = document.getElementsByName(checkboxName);
	for (i = 0; i < o.length; i++) {
		if (o[i].checked == false) {
			o[i].checked = true;
		} else {
			o[i].checked = false;
		}
	}
}
/* 返回check选中数 */
function getCheckedCount(checkboxName) {
	o = document.getElementsByName(checkboxName);
	var c = 0;
	for (i = 0; i < o.length; i++) {
		if (o[i].checked == true) {
			c++;
		}
	}
	return c;
}

/* 判断身份证是否正确 */
function JustifyIdCard(theField) {
	var reg = /(^(\d{15}|\d{17}[\dx])$)/;
	if (reg.test(theField)) {
		return true;
	} else {
		return false;
	}
}
/* 判断用户名是否正确 */
function JustifyUserName(theField) {
	var reg = /^(\w+)|([\u0391-\uFFE5]+)$/;
	if (reg.test(theField)) {
		return true;
	} else {
		return false;
	}
}

/* 比较两个时间的大小 */
function CompareDate(d1, d2) {
	return ((new Date(d1.replace(/-/g, "\/"))) > (new Date(d2.replace(/-/g,
			"\/"))));
}

// 根据身份证生成生日
function addBirthday() {
	var str = document.getElementById('idCard').value;// 身份证编码
	var birthday = document.getElementById('birthday');
	var len = str.length;// 身份证编码长度
	if (len == 18) {
		birthday.value = str.substr(6, 4) + '-' + str.substr(10, 2) + '-'
				+ str.substr(12, 2);
	}
	if (len == 15) {
		birthday.value = "19" + str.substr(6, 2) + '-' + str.substr(8, 2) + '-'
				+ str.substr(10, 2);
	}
}